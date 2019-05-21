package kr.maak.util;
//package kr.maak.util;
//
//import com.amazonaws.services.s3.AmazonS3;
//import com.amazonaws.services.s3.AmazonS3Client;
//import com.amazonaws.services.s3.model.*;
//import kr.maak.config.AwsS3Config;
//import lombok.Getter;
//import lombok.Setter;
//import lombok.extern.slf4j.Slf4j;
//import org.apache.commons.io.IOUtils;
//import org.apache.commons.lang3.RandomStringUtils;
//import org.joda.time.LocalDateTime;
//import org.joda.time.format.DateTimeFormat;
//import org.joda.time.format.DateTimeFormatter;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import org.springframework.web.multipart.MultipartFile;
//
//import javax.annotation.PostConstruct;
//import javax.imageio.IIOImage;
//import javax.imageio.ImageIO;
//import javax.imageio.ImageWriteParam;
//import javax.imageio.ImageWriter;
//import javax.imageio.stream.ImageOutputStream;
//import java.awt.image.BufferedImage;
//import java.io.ByteArrayInputStream;
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.util.Iterator;
//
///**
// * Created by lilly on 2016-04-12.
// */
//@Component
//@Slf4j
//public class CMSS3FileUpload {
//
//    private static String bucketFolder;
//
//    @Autowired
//    private AwsS3Config awsConfig;
//
//    @Autowired
//    private AmazonS3Client amazonS3Client;
//
//    @Autowired
//    private ImageResizer imageResizer;
//
//    private String bucket;
//
//    public static String getFileExt(String fileName) {
//        return fileName.substring(fileName.lastIndexOf(".") + 1);
//    }
//
//    // TODO: 2016-04-15 Exception -> rollback 처리
//
//    @PostConstruct
//    public void init() {
//        bucket = awsConfig.getBucket();
//    }
//
//    public static class Runner implements Runnable {
//
//        private ImageResizer imageResizer;
//
//        @Getter
//        @Setter
//        private int size;
//
//        @Getter
//        @Setter
//        private InputStream inputStream;
//
//        @Getter
//        @Setter
//        private String contentType;
//
//        public Runner(ImageResizer imageResizer, InputStream inputStream, String contentType, int size) {
//            this.imageResizer = imageResizer;
//            this.inputStream = inputStream;
//            this.contentType = contentType;
//            this.size = size;
//        }
//
//        @Override
//        public void run() {
//        }
//    }
//
//    public void settingBucketFolder(String folderName) {
//        S3Object object = null;
//        try {
//            object = amazonS3Client.getObject(bucket, folderName + "/");
//            bucketFolder = folderName;
//        } catch (Exception e) {
//            bucketFolder = createBucketFolder(folderName);
//            log.debug("create new bucket folder - {}", folderName);
//        } finally {
//            if (null != object)
//                try {
//                    object.close();
//                } catch (IOException e) {
//                    log.error("close s3 client object error - {}", e.getMessage());
//                }
//        }
//    }
//
//    public String createBucketFolder(String folderName) {
//        amazonS3Client.putObject(bucket, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
//        return folderName;
//    }
//
//    public String upload(final MultipartFile file, String type) {
//
//        if ("theme".equals(type)) {
//            settingBucketFolder("theme-upload");
//        } else {
//            settingBucketFolder("recipe-upload");
//        }
//
//        long start = System.currentTimeMillis();
//
//        String newFileName = getNewFileName(type);
//
//        String ext = "." + getFileExt(file.getOriginalFilename());
//
//        final String fileUrl = newFileName + ext;
//
//        String contentType = file.getContentType();
//
//        String extFromContentType = contentType.split("/")[1];
//        extFromContentType = extFromContentType.toLowerCase();
//
//        if (extFromContentType.equals("jpeg")) {
//            contentType = "jpg";
//
//        } else if (extFromContentType.equals("png") || extFromContentType.equals("x-png")) {
//            contentType = "png";
//
//        } else if (extFromContentType.equals("gif")) {
//            contentType = "gif";
//
//        } else {
//            log.error("Not Found Content Type Of Upload File - {}", extFromContentType);
//            throw new RuntimeException("잘못된 파일 형식입니다. - " + extFromContentType);
//        }
//
//        try {
//            InputStream fileInputStream = file.getInputStream();
//
//            BufferedImage origin = ImageIO.read(fileInputStream);
//
//            log.debug("buffered image succeed");
//
//            int width = origin.getWidth();
//            int height = origin.getHeight();
//
//            if ("b".equals(type)) {
//                if (720 != width || 1152 != height) {
//                    throw new RuntimeException("브랜드 레시피 이미지는 720X1152 사이즈만 가능합니다.");
//                }
//            } else if ("banner".equals(type)) {
//                if (640 != width && 100 != height) {
//                    throw new RuntimeException("배너 이미지는 640X100 사이즈만 가능합니다.");
//                }
//            }
//
//            InputStream is;
//
//            if ("jpg".equals(contentType)) {
//                is = setQuality(origin);
//            } else {
//                is = file.getInputStream();
//            }
//
//
//            if (width <= 720) {
//                s3Upload(is, fileUrl, contentType);
//            } else {
//                final int size = 720;
//
//                Thread thread = new Thread(new Runner(imageResizer, file.getInputStream(), contentType, size) {
//                    @Override
//                    public void run() {
//                        try {
//                            s3Upload(imageResizer.resize(file.getInputStream(), this.getContentType(), size), fileUrl, file.getContentType());
//                            log.debug("image resize succeed");
//                        } catch (IOException e) {
//                            log.error("image resize thread error - {}", e.getMessage());
//                        }
//                    }
//                });
//                thread.run();
//            }
//
//        } catch (IOException e) {
//            log.error("upload - getBufferedImage error");
//            throw new RuntimeException("getBufferedImage error");
//        }
//
//        log.debug("S3 Upload succeed");
//
//        long end = System.currentTimeMillis();
//
//        log.debug("Upload Time - {}", end - start);
//
//        return fileUrl;
//    }
//
//    private void s3Upload(InputStream inputStream, String fileName, String contentType) {
//        ObjectMetadata metadata = new ObjectMetadata();
//        metadata.setContentType(contentType);
//
//        PutObjectRequest request = new PutObjectRequest(bucket, bucketFolder + "/" + fileName, inputStream, metadata);
//
//        request.setCannedAcl(CannedAccessControlList.PublicRead);
//
//        amazonS3Client.putObject(request);
//
//        IOUtils.closeQuietly(inputStream);
//    }
//
//    public BufferedImage getBufferedImage(InputStream inputStream) {
//        BufferedImage img;
//        try {
//            img = ImageIO.read(inputStream);
//        } catch (IOException e) {
//            log.error("getBufferedImage error");
//            throw new RuntimeException("getBufferedImage error");
//        }
//        return img;
//    }
//
//    public InputStream setQuality(BufferedImage origin) {
//        ByteArrayOutputStream os = null;
//        ImageOutputStream ios = null;
//        ByteArrayInputStream is = null;
//        ByteArrayOutputStream os1 = null;
//
//        try {
//            Iterator iter = ImageIO.getImageWritersByFormatName("jpg");
//            ImageWriter writer = (ImageWriter)iter.next();
//
//            os = new ByteArrayOutputStream();
//            ios = ImageIO.createImageOutputStream(os);
//            writer.setOutput(ios);
//
//            ImageWriteParam iwp = writer.getDefaultWriteParam();
//
//            iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
//            float quality = 0.9f;
//            iwp.setCompressionQuality(quality);
//
//            IIOImage image = new IIOImage(origin, null, null);
//
//            writer.write(null, image, iwp);
//            writer.dispose();
//
//            is = new ByteArrayInputStream(os.toByteArray());
//            BufferedImage destImage = ImageIO.read(is);
//
//            os1 = new ByteArrayOutputStream();
//            ImageIO.write(destImage, "jpg", os1);
//            InputStream result = new ByteArrayInputStream(os1.toByteArray());
//
//            log.debug("image compress quality succeed");
//
//            return result;
//        } catch (IOException e) {
//            log.error("compress quality error");
//            throw new RuntimeException("compress quality error");
//        } finally {
//            try {
//                os.close();
//                ios.close();
//                is.close();
//                os1.close();
//            } catch(IOException e2) {
//                log.error("close io error - {}", e2.getMessage());
//                throw new RuntimeException("close io error");
//            }
//        }
//    }
//
//    synchronized private String getNewFileName(String type) {
//        LocalDateTime time = LocalDateTime.now();
//        DateTimeFormatter dtf = DateTimeFormat.forPattern("yyyyMMddHHmmss");
//        return type + "-" + time.toString(dtf) + "-" + RandomStringUtils.randomAlphanumeric(5);
//    }
//
//    public boolean deleteFile(String folder, String fileName) {
//
//        if (isExists(folder, fileName)) {
//            amazonS3Client.deleteObject(bucket, folder + "/" + fileName);
//            log.debug("Delete S3 Image - {}", fileName);
//            return true;
//        } else {
//            return false;
//        }
//    }
//
//    public boolean isExists(String folder, String fileName) {
//        AmazonS3 s3 = new AmazonS3Client();
//
//        try {
//            s3.getObjectMetadata(bucket, folder + "/" + fileName);
//            return true;
//        } catch (AmazonS3Exception e) {
//            log.error("invalid file - {}", fileName);
//            return false;
//        }
//    }
//
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
