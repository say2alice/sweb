package kr.maak.util;
//package kr.maak.util;
//
//import org.imgscalr.Scalr;
//import org.springframework.scheduling.annotation.Async;
//import org.springframework.stereotype.Component;
//import org.w3c.dom.NamedNodeMap;
//import org.w3c.dom.Node;
//import org.w3c.dom.NodeList;
//
//import javax.imageio.ImageIO;
//import javax.imageio.ImageReader;
//import javax.imageio.metadata.IIOMetadata;
//import javax.imageio.metadata.IIOMetadataNode;
//import javax.imageio.stream.ImageOutputStream;
//import java.awt.*;
//import java.awt.image.BufferedImage;
//import java.awt.image.ColorModel;
//import java.awt.image.WritableRaster;
//import java.io.ByteArrayInputStream;
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.util.ArrayList;
//
///**
// * Created by lilly on 2016-05-25.
// */
//
//@Component
//public class ImageResizer {
//
//    private ByteArrayInputStream outputToInputStream(ByteArrayOutputStream baos) throws IOException {
//        baos.flush();
//        byte[] scaledImageInByte = baos.toByteArray();
//        baos.close();
//        return new ByteArrayInputStream(scaledImageInByte);
//    }
//
//    @Async
//    public ByteArrayInputStream resize(InputStream inputStream, String contentType, int targetWidth) throws IOException {
//
//        boolean isGIF = false;
//
//        if ("gif".equals(contentType)) {
//            isGIF = true;
//        }
//
//        ByteArrayOutputStream baos = new ByteArrayOutputStream();
//
//        if (!isGIF) {
//            BufferedImage image = ImageIO.read(inputStream);
//            BufferedImage scaledImg = Scalr.resize(dropAlphaChannel(image, contentType), Scalr.Method.QUALITY, Scalr.Mode.FIT_TO_WIDTH, targetWidth, Scalr.OP_ANTIALIAS);
//            ImageIO.write(scaledImg, contentType, baos);
//
//            return outputToInputStream(baos);
//        }
//
//        ImageFrame[] frames = readGif(inputStream);
//
//        for (ImageFrame frame : frames) {
//            BufferedImage image = Scalr.resize(frame.getImage(), Scalr.Method.ULTRA_QUALITY, Scalr.Mode.FIT_TO_WIDTH, targetWidth, Scalr.OP_ANTIALIAS);
//            frame.setImage(image);
//        }
//
//        ImageOutputStream output = ImageIO.createImageOutputStream(baos);
//
//        GIFSequenceWriter writer = new GIFSequenceWriter(output, frames[0].getImage().getType(), frames[0].getDelay(), true);
//        writer.writeToSequence(frames[0].getImage());
//
//        for (int i = 1; i < frames.length; i++) {
//            BufferedImage nextImage = frames[i].getImage();
//            writer.writeToSequence(nextImage);
//        }
//
//        writer.close();
//        output.close();
//
//        return outputToInputStream(baos);
//    }
//
//    private BufferedImage dropAlphaChannel(BufferedImage src, String contentType) {
//        int imgType;
//
//        if (contentType.equals("png")) {
//            imgType = BufferedImage.TYPE_INT_ARGB;
//        } else {
//            imgType = BufferedImage.TYPE_INT_RGB;
//        }
//
//        BufferedImage convertedImg = new BufferedImage(src.getWidth(), src.getHeight(), imgType);
//
//        convertedImg.getGraphics().drawImage(src, 0, 0, null);
//
//        return convertedImg;
//    }
//
//
//    private ImageFrame[] readGif(InputStream stream) throws IOException {
//        ArrayList<ImageFrame> frames = new ArrayList<ImageFrame>(2);
//
//        ImageReader reader = ImageIO.getImageReadersByFormatName("gif").next();
//        reader.setInput(ImageIO.createImageInputStream(stream));
//
//        int lastx = 0;
//        int lasty = 0;
//
//        int width = -1;
//        int height = -1;
//
//        IIOMetadata metadata = reader.getStreamMetadata();
//
//        Color backgroundColor = null;
//
//        if (metadata != null) {
//            IIOMetadataNode globalRoot = (IIOMetadataNode) metadata.getAsTree(metadata.getNativeMetadataFormatName());
//
//            NodeList globalColorTable = globalRoot.getElementsByTagName("GlobalColorTable");
//            NodeList globalScreeDescriptor = globalRoot.getElementsByTagName("LogicalScreenDescriptor");
//
//            if (globalScreeDescriptor != null && globalScreeDescriptor.getLength() > 0) {
//                IIOMetadataNode screenDescriptor = (IIOMetadataNode) globalScreeDescriptor.item(0);
//
//                if (screenDescriptor != null) {
//                    width = Integer.parseInt(screenDescriptor.getAttribute("logicalScreenWidth"));
//                    height = Integer.parseInt(screenDescriptor.getAttribute("logicalScreenHeight"));
//                }
//            }
//
//            if (globalColorTable != null && globalColorTable.getLength() > 0) {
//                IIOMetadataNode colorTable = (IIOMetadataNode) globalColorTable.item(0);
//
//                if (colorTable != null) {
//                    String bgIndex = colorTable.getAttribute("backgroundColorIndex");
//
//                    IIOMetadataNode colorEntry = (IIOMetadataNode) colorTable.getFirstChild();
//                    while (colorEntry != null) {
//                        if (colorEntry.getAttribute("index").equals(bgIndex)) {
//                            int red = Integer.parseInt(colorEntry.getAttribute("red"));
//                            int green = Integer.parseInt(colorEntry.getAttribute("green"));
//                            int blue = Integer.parseInt(colorEntry.getAttribute("blue"));
//
//                            backgroundColor = new Color(red, green, blue);
//                            break;
//                        }
//
//                        colorEntry = (IIOMetadataNode) colorEntry.getNextSibling();
//                    }
//                }
//            }
//        }
//
//        BufferedImage master = null;
//        boolean hasBackround = false;
//
//        for (int frameIndex = 0; ; frameIndex++) {
//            BufferedImage image;
//            try {
//                image = reader.read(frameIndex);
//            } catch (IndexOutOfBoundsException io) {
//                break;
//            }
//
//            if (width == -1 || height == -1) {
//                width = image.getWidth();
//                height = image.getHeight();
//            }
//
//            IIOMetadataNode root = (IIOMetadataNode) reader.getImageMetadata(frameIndex).getAsTree("javax_imageio_gif_image_1.0");
//            IIOMetadataNode gce = (IIOMetadataNode) root.getElementsByTagName("GraphicControlExtension").item(0);
//            NodeList children = root.getChildNodes();
//
//            int delay = Integer.valueOf(gce.getAttribute("delayTime"));
//
//            String disposal = gce.getAttribute("disposalMethod");
//
//            if (master == null) {
//                master = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
//                master.createGraphics().setColor(backgroundColor);
//                master.createGraphics().fillRect(0, 0, master.getWidth(), master.getHeight());
//
//                hasBackround = image.getWidth() == width && image.getHeight() == height;
//
//                master.createGraphics().drawImage(image, 0, 0, null);
//            } else {
//                int x = 0;
//                int y = 0;
//
//                for (int nodeIndex = 0; nodeIndex < children.getLength(); nodeIndex++) {
//                    Node nodeItem = children.item(nodeIndex);
//
//                    if (nodeItem.getNodeName().equals("ImageDescriptor")) {
//                        NamedNodeMap map = nodeItem.getAttributes();
//
//                        x = Integer.valueOf(map.getNamedItem("imageLeftPosition").getNodeValue());
//                        y = Integer.valueOf(map.getNamedItem("imageTopPosition").getNodeValue());
//                    }
//                }
//
//                if (disposal.equals("restoreToPrevious")) {
//                    BufferedImage from = null;
//                    for (int i = frameIndex - 1; i >= 0; i--) {
//                        if (!frames.get(i).getDisposal().equals("restoreToPrevious") || frameIndex == 0) {
//                            from = frames.get(i).getImage();
//                            break;
//                        }
//                    }
//
//                    if (null == from)
//                        throw new NullPointerException("null 이면 안되는데 ....");
//
//                    {
//                        ColorModel model = from.getColorModel();
//                        boolean alpha = from.isAlphaPremultiplied();
//                        WritableRaster raster = from.copyData(null);
//                        master = new BufferedImage(model, raster, alpha, null);
//                    }
//                } else if (disposal.equals("restoreToBackgroundColor") && backgroundColor != null) {
//                    if (!hasBackround || frameIndex > 1) {
//                        master.createGraphics().fillRect(lastx, lasty, frames.get(frameIndex - 1).getWidth(), frames.get(frameIndex - 1).getHeight());
//                    }
//                }
//                master.createGraphics().drawImage(image, x, y, null);
//
//                lastx = x;
//                lasty = y;
//            }
//
//            {
//                BufferedImage copy;
//
//                {
//                    ColorModel model = master.getColorModel();
//                    boolean alpha = master.isAlphaPremultiplied();
//                    WritableRaster raster = master.copyData(null);
//                    copy = new BufferedImage(model, raster, alpha, null);
//                }
//                frames.add(new ImageFrame(copy, delay, disposal, image.getWidth(), image.getHeight()));
//            }
//
//            master.flush();
//        }
//        reader.dispose();
//
//        return frames.toArray(new ImageFrame[frames.size()]);
//    }
//}
