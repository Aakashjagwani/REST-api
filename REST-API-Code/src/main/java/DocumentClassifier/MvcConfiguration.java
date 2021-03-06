/** 
Developed by:
[Code Authors]
Mihir Parikh
Aakash Jagwani
Aman Goyal
**/
package DocumentClassifier;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
 
@Configuration
@EnableWebMvc
@ComponentScan

public class MvcConfiguration extends WebMvcConfigurerAdapter{
	 
	    public void configureViewResolvers(ViewResolverRegistry registry) {
	        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	        resolver.setPrefix("/WEB-INF/jsp/");
	        resolver.setSuffix(".jsp");
	        resolver.setViewClass(JstlView.class);
	        registry.viewResolver(resolver);
	        
	        
	        
	        
	        
	    }
	}

/** 
Developed by:
[Code Authors]
Mihir Parikh
Aakash Jagwani
Aman Goyal
**/