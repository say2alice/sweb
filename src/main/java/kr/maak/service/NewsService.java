package kr.maak.service;

import kr.maak.model.News;
import kr.maak.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by KIMKT on 2016-11-03.
 */
@Service
@Transactional
public class NewsService {

    @Autowired
    private NewsRepository newsRepository;

    public Page<News> getNewsList(String category, Pageable pageable){
        return newsRepository.findByCategory(category, pageable);
    }

    @Cacheable(value = "newsList",  key = "#root.methodName")
    public List<News> getBestNewsList(){
        return newsRepository.findAll(new Sort(Sort.Direction.DESC, "hit"));
    }

    @Cacheable(value = "newsList",  key = "#root.methodName")
    public List<News> getRecentNewsList(){
        return newsRepository.findAll(new Sort(Sort.Direction.DESC, "id"));
    }

    public Page<News> getListBySubject(String subject, Pageable pageable){
        return newsRepository.findAllBySubject(subject, pageable);
    }

    @Cacheable(value = "newsList",  key = "#root.methodName")
    public HashMap<String, News> getMainNews(){
        HashMap newsMap = new HashMap<String, News>();
        newsMap.put("issue",newsRepository.findByCategory("issue").subList(0,4));
        newsMap.put("gag",newsRepository.findByCategory("gag").subList(0,4));
        newsMap.put("video",newsRepository.findByCategory("video").subList(0,4));
        newsMap.put("hot",newsRepository.findByCategory("hot").subList(0,4));
        return newsMap;
    }

    @Cacheable(value="news", key="#id")
    public News getNews(Long id){
        return newsRepository.findOne(id);
    }

    @Cacheable(value="news", key="#id")
    public News getNewsForFacebook(Long id){
        return newsRepository.findByIdAndIsFacebook(id, true, true);
    }

    @Cacheable(value = "newsList",  key = "#root.methodName")
    public List<News> getRecommendList(){
        List<News> news = newsRepository.findAll();
        Collections.shuffle(news);

        return news;
    }

    public List<News> getMainNewsList() {
        return newsRepository.findByIsMainAndIsClosedOrderByModiDateDesc(true, false);
    }

    public void hitCountup(Long id){
        newsRepository.updateHit(id);
    }

    public List<News> getRssNews(){
       return newsRepository.findByIsSendrssAndIsClosedOrderByModiDateDesc(true, false);
    }
    public News getRssNews(Long id){
        return newsRepository.findByIdAndIsSendrssAndIsClosedOrderByModiDateDesc(id,true, false);
    }
    public List<News> getHNSRssNews() {
        return newsRepository.findByIsClosedAndIsDchoOrderByModiDateAsc( false, false);
    }


    public List<News> getRssNews(Date startDate, Date endDate){
        return newsRepository.findByIsSendrssAndIsClosedAndModiDateGreaterThanEqualAndModiDateLessThanEqualOrderByModiDateDesc(true, false, startDate, endDate);
    }

    public List<News> getRssNews(String category){
        return newsRepository.findByIsSendrssAndCategoryOrderByModiDateDesc(true, false, category);
    }

    public List<News> getRssNewsFB(){
        return newsRepository.findByIsInstantOrderByModiDateDesc(true);
    }

    public List<News> updateNews(List<News> newss){
        for(News news : newss){
            news.setDcho(true);
        }
        return newsRepository.save(newss);
    }


}
