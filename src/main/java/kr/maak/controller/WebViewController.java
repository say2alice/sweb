package kr.maak.controller;
/**
 * Created by KIMKT on 2016-11-02.
 */

import kr.maak.service.RssXmlService;
import kr.maak.service.NewsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

import static org.springframework.mobile.device.DeviceUtils.getCurrentDevice;
@Slf4j
@Controller
public class WebViewController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private RssXmlService rssXmlService;

    @RequestMapping(value="/", method=RequestMethod.GET)
    public String index(Model model, HttpServletRequest request) {
        model.addAttribute("main", newsService.getMainNewsList());
        model.addAttribute("best", newsService.getBestNewsList().subList(0,1));
        model.addAttribute("recent", newsService.getRecentNewsList().subList(0,16));
        model.addAttribute("homeNews", newsService.getMainNews());
        model.addAttribute("recommend", newsService.getRecommendList().subList(0,6));

        return "index";
    }

    @RequestMapping(value="test")
    public String test(Model model){
        return "test";
    }



    @RequestMapping(value="/{category}/news")
    public String newsList(@PageableDefault Pageable pageable, @PathVariable String category, Model model,
                           HttpServletRequest request) {
        model.addAttribute("category", category);
        model.addAttribute("newsList", newsService.getNewsList(category, pageable));
        model.addAttribute("best", newsService.getBestNewsList().subList(0,6));
        model.addAttribute("recent", newsService.getRecentNewsList().subList(0,6));
        return "list";
    }

    @RequestMapping(value="/view/{id}")
    public String view(@PathVariable Long id, Model model,String cash, String tab, String aid, HttpServletRequest request){
        boolean isMobile = getCurrentDevice(request).isMobile();

        newsService.hitCountup(id);

        if(newsService.getNews(id) == null){
            return "redirect:/";
        }
//        if((cash == "") && isMobile) {
//            model.addAttribute("cash", "cash");
//        }
        model.addAttribute("news", newsService.getNews(id));
        model.addAttribute("recommend", newsService.getRecommendList().subList(0,9));
        model.addAttribute("best", newsService.getBestNewsList().subList(0,6));
        model.addAttribute("recent", newsService.getRecentNewsList().subList(0,6));
        model.addAttribute("view", "view");

//        if((tab == "") && isMobile){
//            model.addAttribute("tab", "tab");
//            return "viewCustom";
//        }
//        if(aid != null) {
//            if (aid.equals("dodol") && isMobile) {
//                model.addAttribute("aid", "dodol");
//                return "viewCustom";
//            }
//        }
        return "view";
    }

    @RequestMapping(value="/search")
    public String search(@PageableDefault Pageable pageable, String text, Model model){
        model.addAttribute("list",newsService.getListBySubject(text, pageable));
        model.addAttribute("recommend1", newsService.getRecommendList().subList(0,4));
        model.addAttribute("recommend2", newsService.getRecommendList().subList(5,9));
        model.addAttribute("recommend", newsService.getRecommendList().subList(0,6));
        model.addAttribute("best", newsService.getBestNewsList().subList(0,6));
        model.addAttribute("recent", newsService.getRecentNewsList().subList(0,6));

        return "search";
    }

    @RequestMapping(value="/navigation")
    public String navigation(){
        return "navigation";
    }

    @RequestMapping(value="/best")
    public String best(Model model){
        model.addAttribute("best", newsService.getBestNewsList().subList(0,10));
        model.addAttribute("recommend", newsService.getRecommendList().subList(0,6));
        return "best";
    }

    @RequestMapping(value="/recent")
    public String newIssue(Model model){
        model.addAttribute("recent", newsService.getRecentNewsList().subList(0,10));
        model.addAttribute("recommend", newsService.getRecommendList().subList(0,6));
        return "recent";
    }

    @RequestMapping(value="/policy/{param}")
    public String newIssue(Model model, @PathVariable String param){
        log.debug("{}",param);
        if(param.contains("privacy")){
            model.addAttribute("policy","privacy");
        } else if(param.contains("service")){
            model.addAttribute("policy","service");
        }
        return "policy";
    }

}