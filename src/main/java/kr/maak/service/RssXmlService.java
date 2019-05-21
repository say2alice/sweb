package kr.maak.service;

import kr.maak.model.News;
import kr.maak.model.form.RssForm;
import kr.maak.util.DocumentConverter;
import kr.maak.util.FtpClient;
import lombok.extern.slf4j.Slf4j;
import org.jdom2.Attribute;
import org.jdom2.CDATA;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by lilly on 2016-07-07.
 */

@Service
@Slf4j
public class RssXmlService {

    @Autowired
    private NewsService newsService;

    @Autowired private ServletContext servletContext;


    @Transactional(readOnly = true)
    public void getRssXmlNews(HttpServletResponse response, String param, String start_date, String end_date) {
        response.setContentType("text/xml;charset=UTF-8");
        List<News> newss;

        if(start_date != null && end_date != null){
            SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
            GregorianCalendar cal = new GregorianCalendar();

            Date tempDate = null, tempDate2 = null;

            try {
                tempDate = df.parse(start_date);
                tempDate2 = df.parse(end_date);
            } catch (java.text.ParseException e) {
                e.printStackTrace();
            }
            cal.setTime(tempDate2);
            cal.add(cal.DATE, 1);
            tempDate2 = cal.getTime();

            newss = newsService.getRssNews(tempDate, tempDate2);

            if (newss.size() == 0){

                Date today = new Date();
                String date = df.format(today);
                try {
                    tempDate = df.parse(date);
                    tempDate2 = df.parse(date);
                } catch (java.text.ParseException e) {
                    e.printStackTrace();
                }
                cal.setTime(tempDate2);
                cal.add(cal.DATE,1);
                tempDate2 = cal.getTime();
                newss = newsService.getRssNews(tempDate, tempDate2);
            }

        }else {
           newss = newsService.getRssNews();
        }

        List<RssForm> listForm = new ArrayList<>();

        SimpleDateFormat df = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z", Locale.ENGLISH);

        for(News news : newss) {
            RssForm RssForm = new RssForm();
            RssForm.setTitle(news.getSubject());
            RssForm.setLink("http://www.maak.kr/view/" + news.getId() + param);
            RssForm.setDescription(news.getContent());
            RssForm.setAuthor("MaakIssue");
            RssForm.setCategory(news.getCategory());
            RssForm.setPubDate(df.format(news.getModiDate()));
            RssForm.setImageFile(news.getImage());

            listForm.add(RssForm);
        }

        Document doc = new Document(xmlCreate(listForm));
        XMLOutputter outputter = new XMLOutputter(Format.getPrettyFormat().setEncoding("utf-8"));

        try {
            outputter.output(doc, response.getWriter());

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Element xmlCreate(List<RssForm> listForm) {

        Element root = new Element("rss");
//        root.setAttribute(new Attribute("xmlns:dc", "http://purl.org/dc/elements/1.1/"));
//        root.setAttribute(new Attribute("xmlns:sy", "http://purl.org/rss/1.0/modules/syndication/"));
//        root.setAttribute(new Attribute("xmlns:admin", "http://webns.net/mvcb/"));
//        root.setAttribute(new Attribute("xmlns:rdf", "http://www.w3.org/1999/02/22-rdf-syntax-ns#"));
        root.setAttribute(new Attribute("version", "2.0"));
        Element channel = new Element("channel");
        root.addContent(channel);
        channel.addContent(new Element("title").addContent("막이슈"));
        channel.addContent(new Element("link").addContent("http://www.maak.kr"));
        channel.addContent(new Element("description").addContent("지금 막 올라온 이슈들"));
        channel.addContent(new Element("language").addContent("ko"));

        for(RssForm form : listForm) {
            Element item = new Element("item");
            channel.addContent(item);
            item.addContent(new Element("title").addContent("<![CDATA[ "+form.getTitle()+" ]]>"));
            item.addContent( new Element("description").addContent("<![CDATA[ "+form.getDescription()+" ]]>"));
            item.addContent(new Element("link").addContent(form.getLink()));
            item.addContent(new Element("image").addContent(form.getImageFile()));
            item.addContent(new Element("author").addContent(form.getAuthor()));
            item.addContent(new Element("category").addContent(form.getCategory()));
            item.addContent(new Element("pubDate").addContent(form.getPubDate()));
        }

        return root;
    }

    public JSONArray getJsonNews(int count) throws ParseException {

        List<News> newss;

        if (count == 0){
            newss = newsService.getRssNews();
        }else{
            newss = newsService.getRssNews().subList(0, count);
        }

        JSONArray jArray = new JSONArray();
        List<JSONObject> dataList = new ArrayList<>();
        for(News news : newss) {
            JSONObject data = new JSONObject();
            data.put("title", news.getSubject());
            data.put("link", "http://www.maak.kr/view/" + news.getId());
            data.put("description", news.getContent());
            data.put("author", "막이슈");
            data.put("category", news.getCategory());
            data.put("pubDate", news.getModiDate().toString());
            data.put("image", news.getOriginImage());
            dataList.add(data);
            jArray.add(data);
        }
        return jArray;
    }

    public JSONArray getJsonNews(String category, int count) throws ParseException {

        List<News> newss;

        if (count == 0){
            newss = newsService.getRssNews(category);
        }else{
            newss = newsService.getRssNews(category).subList(0, count);
        }

        JSONArray jArray = new JSONArray();
        List<JSONObject> dataList = new ArrayList<>();
        for(News news : newss) {
            JSONObject data = new JSONObject();
            data.put("title", news.getSubject());
            data.put("link", "http://www.maak.kr/view/" + news.getId());
            data.put("description", news.getContent());
            data.put("author", "막이슈");
            data.put("category", news.getCategory());
            data.put("pubDate", news.getModiDate().toString());
            data.put("image", news.getOriginImage());
            dataList.add(data);
            jArray.add(data);
        }
        return jArray;
    }

    @Transactional(readOnly = true)
    public void getRssFB(HttpServletResponse response) {
        response.setContentType("text/xml;charset=UTF-8");
        List<News> newss = newsService.getRssNews();
        List<RssForm> listForm = new ArrayList<>();

        for(News news : newss) {
            RssForm RssForm = new RssForm();
            RssForm.setTitle(news.getSubject());
            RssForm.setLink("http://www.maak.kr/view/" + news.getId());
            RssForm.setDescription(news.getContent());
            RssForm.setAuthor("MaakIssue");
            RssForm.setCategory(news.getCategory());
            RssForm.setPubDate(news.getModiDate().toString());
            RssForm.setImageFile(news.getImage());

            listForm.add(RssForm);
        }

        Document doc = new Document(xmlCreateFB(listForm));
        XMLOutputter outputter = new XMLOutputter(Format.getPrettyFormat().setEncoding("utf-8"));

        try {
            outputter.output(doc, response.getWriter());

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Element xmlCreateFB(List<RssForm> listForm) {

        List<News> newss = newsService.getRssNewsFB();

        Element root = new Element("rss");
        root.setAttribute(new Attribute("version", "2.0"));
        Element channel = new Element("channel");
        root.addContent(channel);
        channel.addContent(new Element("title").addContent("막이슈"));
        channel.addContent(new Element("link").addContent("http://www.maak.kr"));
        channel.addContent(new Element("description").addContent("지금 막 올라온 이슈들"));
        channel.addContent(new Element("language").addContent("ko"));

        for(RssForm form : listForm) {
            String rel_art = "";
            if (!newss.isEmpty() && newss.size() >= 6) {
                Collections.shuffle(newss);
                List<News> n = newss.subList(0, 6);
                rel_art = " <ul class=\"op-related-articles\">\n" +
                        "    <li><a href=\"http://slowpost.co.kr/view/"+n.get(4).getId()+"\"></a></li>\n" +
                        "    <li><a href=\"http://slowpost.co.kr/view/"+n.get(5).getId()+"\"></a></li>\n" +
                        "  </ul>" +
                        "<footer>\n" +
                        "  <ul class=\"op-related-articles\">\n" +
                        "    <li><a href=\"http://slowpost.co.kr/view/"+n.get(0).getId()+"\"></a></li>\n" +
                        "    <li><a href=\"http://slowpost.co.kr/view/"+n.get(1).getId()+"\"></a></li>\n" +
                        "    <li><a href=\"http://slowpost.co.kr/view/"+n.get(2).getId()+"\"></a></li>\n" +
                        "    <li><a href=\"http://slowpost.co.kr/view/"+n.get(3).getId()+"\"></a></li>\n" +
                        "  </ul>\n" +
                        "</footer>";
            }
            Element item = new Element("item");
            channel.addContent(item);
            item.addContent(new Element("title").addContent(form.getTitle()));
            item.addContent(new Element("link").addContent(form.getLink()));
            item.addContent(new Element("pubDate").addContent(form.getPubDate()));
            item.addContent(new Element("author").addContent(form.getAuthor()));
            item.addContent(new Element("description").addContent(form.getTitle()+"..."));
            String content = form.getDescription();
            String content_ = "<p>"+content.replace("<img", "</p><img")
                    .replace("<iframe", "</p><iframe").replace("</iframe>","</iframe><p>")
                    .replace("PNG\" />", "PNG\" /><p>").replace("JPG\" />", "JPG\" /><p>")
                    .replace("JPEG\" />", "JPEG\" /><p>").replace("png\" />", "png\" /><p>")
                    .replaceAll("jpg.*/>", "jpg\" /><p>").replace("jpeg\" />", "jpeg\" /><p>")
                    .replaceAll("style.*/>","/><p>").replaceAll("<br[^>]/>","</p> <p>")
                    +"</p>";
            item.addContent(new Element("content").addContent(new CDATA(
                    "<html lang=\"en\" prefix=\"op: http://media.facebook.com/op#\">\n" +
                            "<head><meta property=\"fb:use_automatic_ad_placement\" content=\"enable=true\">\n" +
                            "<meta property=\"op:markup_version\" content=\"v1.0\">\n" +
                            "<meta property=\"op:generator:application\" content=\"allfacebook-instant-articles\"/>\n" +
                            "<meta property=\"op:generator:application:version\" content=\"0.9.1\"/>\n" +
                            "<meta property=\"fb:likes_and_comments\" content=\"enable\">\n" +
                            "<body>\n" +
                            "<article>\n" +
                            "<header>\n" +
                            "<section class=\"op-ad-template\">\n" +
//                            "<iframe class=\"op-ad op-ad-default\"width=\"300\" height=\"250\" style=\"border:0; margin:0;\" src=\"https://www.facebook.com/adnw_request?placement=188480948568968_191649504918779&adtype=banner300x250\"></iframe>\n" +
//                            "<iframe class=\"column-width op-ad\" src=\"http://adv.imadrep.co.kr/2663_01.html\" width=\"360\" height=\"120\"></iframe>\n" +
//                            "<iframe class=\"column-width op-ad\" src=\"http://adv.imadrep.co.kr/2664_01.html\" width=\"360\" height=\"120\"></iframe>\n" +
//                            "<iframe class=\"column-width op-ad\" src=\"http://adv.imadrep.co.kr/2665_01.html\" width=\"360\" height=\"150\"></iframe>\n" +
                            "</section>\n" +
                            "</header>\n" +
                            content_.replace("<p></p>","")
                                    .replaceAll("(((<p>\\n)\\s)<\\/p>)","").replace(".<br />",".") +
                            rel_art +
                            "</article>" +
                            "</body>" +
                            "</html>"
            )));
        }

        return root;
    }


        public boolean getXmlFile(List<News> newss){

            List<RssForm> listForm = new ArrayList<>();

            Date today = new Date();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd", Locale.ENGLISH);

            SimpleDateFormat df = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z", Locale.ENGLISH);

            for(News news : newss) {
                RssForm RssForm = new RssForm();
                RssForm.setTitle(news.getSubject());
                RssForm.setLink("http://www.maak.kr/view/" + news.getId());
                RssForm.setDescription(news.getContent());
            RssForm.setAuthor("MaakIssue");
            RssForm.setCategory(news.getCategory());
            RssForm.setPubDate(df.format(today));
            RssForm.setImageFile(news.getImage());

            listForm.add(RssForm);
        }


        try {
            FileOutputStream fos = null;
            Document doc = new Document(xmlCreate(listForm));

            //for output to file, console
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            //for pretty print
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");

            DOMSource source = new DOMSource(new DocumentConverter().convertJDOMToDOM(doc));
            File xmlFile = new File(servletContext.getRealPath("/")+"temp.xml");

            //write to console or file
            StreamResult console = new StreamResult(System.out);
            StreamResult file = new StreamResult(xmlFile);

            //write data
//            transformer.transform(source, console);
            transformer.transform(source, file);
//            fos = new FileOutputStream(file.getOutputStream())

            FtpClient ftp_ivr = new FtpClient("221.143.48.145", "petaz","vpxkwm2018","");
            ftp_ivr.upload(xmlFile, "막이슈_"+sdf.format(today)+".xml");

            log.debug("Success Sending File");
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
