package cvgentor.com.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

@Configuration
@ComponentScan(basePackages = {"cvgentor.com"})
public class AppConfig extends WebMvcConfigurationSupport {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
            registry.addResourceHandler("/resources/**")
            .addResourceLocations("classpath:/static/")
                    .setCachePeriod(31556926);
    }

    @Bean
    public FreeMarkerViewResolver freemarkerViewResolver() { 
        FreeMarkerViewResolver resolver = new FreeMarkerViewResolver(); 
        resolver.setCache(true); 
        resolver.setPrefix(""); 
        resolver.setSuffix(".html.ftl"); 
        resolver.setContentType("text/html; charset=utf-8");
        return resolver; 
    }
    
    @Bean 
    public FreeMarkerConfigurer freemarkerConfig() { 
        FreeMarkerConfigurer freeMarkerConfigurer = new FreeMarkerConfigurer(); 
        freeMarkerConfigurer.setTemplateLoaderPath("classpath:/template/ftl/");
        return freeMarkerConfigurer; 
    }
}
