package kr.maak.controller;

import kr.maak.model.News;
import kr.maak.service.NewsService;
import kr.maak.service.RssXmlService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by KIMKT on 2017-04-26.
 */
@EnableScheduling
@Slf4j
@Controller
public class ApiController {
    @Autowired
    private RssXmlService rssXmlService;
    @Autowired
    private NewsService newsService;

//    @Autowired
//    private FtpClient ftpClient;

    @RequestMapping(value = "/rss")
    @ResponseBody
    public void getRss(HttpServletResponse response, String tab, String start_date, String end_date, String bz) {
        String param = "";
        if (bz != null && bz == "") {
            param = "?bz";
        }
        if (tab != null && tab == "") {
            param = "?tab";
        }
        rssXmlService.getRssXmlNews(response, param, start_date, end_date);
    }

    @RequestMapping(value = "/json")
    public ResponseEntity<?> getJson(String category, @RequestParam(defaultValue = "0") int count) throws ParseException {
        if (category == null || category == "total") {
            return new ResponseEntity<>(rssXmlService.getJsonNews(count), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(rssXmlService.getJsonNews(category, count), HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/facebook")
    public void getRssFB(HttpServletResponse response) {
        rssXmlService.getRssFB(response);
    }

    @Scheduled(cron = "0 0 1 * * *")
    @RequestMapping("/ftphns")
    @ResponseBody
    public void ftpHNS() throws Exception {
        log.debug("Scheduled for Sending FIle");

        boolean sendResult;
        List<News> newss = newsService.getHNSRssNews().subList(0,10);
        sendResult = rssXmlService.getXmlFile(newss);

        if(sendResult){
            newsService.updateNews(newss);
        }
    }
}
