package kr.maak.config;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.mobile.device.DeviceResolverRequestFilter;
import org.springframework.mobile.device.view.LiteDeviceDelegatingViewResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.BeanNameUrlHandlerMapping;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.servlet.Filter;

/**
 * Created by KIMKT on 2017-01-03.
 */
@Log4j
@Configuration
public class AppConfig extends WebMvcConfigurerAdapter {
    @Autowired
    InterceptorConfig interceptorConfig;

    @Bean
    public LiteDeviceDelegatingViewResolver setupViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        LiteDeviceDelegatingViewResolver viewResolver = new LiteDeviceDelegatingViewResolver(resolver);
        resolver.setSuffix(".jsp");
        viewResolver.setMobilePrefix("/WEB-INF/jsp/m/");
        viewResolver.setTabletPrefix("/WEB-INF/jsp/m/");
        viewResolver.setNormalPrefix("/WEB-INF/jsp/");
        return viewResolver;
    }

    @Bean
    public WebMvcConfigurerAdapter webMvcConfigurerAdapter() {
        return new WebMvcConfigurerAdapter() {
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                registry.addInterceptor(interceptorConfig);
            }
        };
    }

    @Bean
    public BeanNameUrlHandlerMapping beanNameUrlHandlerMapping() {
        BeanNameUrlHandlerMapping handlerMapping = new BeanNameUrlHandlerMapping();
        handlerMapping.setInterceptors(interceptorConfig);
        return handlerMapping;
    }

    @Bean(name = "deviceResolverRequestFilter")
    public Filter deviceResolverRequestFilter() {
        return new DeviceResolverRequestFilter();
    }

    @Bean
    public EmbeddedServletContainerCustomizer containerCustomizer() {
        return container -> {
            ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/WEB-INF/jsp/error/404.jsp");
            ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/errors/500");
            container.addErrorPages(error404Page, error500Page);
        };
    }

}