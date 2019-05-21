package kr.maak.config;

import lombok.extern.log4j.Log4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by KIMKT on 2017-01-04.
 */
@Log4j
@Configuration
@Component
public class InterceptorConfig extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(request.getHeader("referer") != null){
            if(request.getHeader("referer").contains("pc")){
                request.setAttribute("currentDevice", null);
            }
        }
        return true;
    }
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {

        if(request.getParameter("pc") != null){
            request.setAttribute("currentDevice",null);
        }
        super.postHandle(request, response, handler, modelAndView);
    }

}
