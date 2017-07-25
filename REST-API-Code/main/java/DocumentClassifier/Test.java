package DocumentClassifier;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
public class Test {
	private static final Logger log = LoggerFactory.getLogger(Test.class);
	  
	  protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	        return application.sources(Test.class);
	    }
	public static void main(String args[]) {
		SpringApplication.run(Test.class);
	}
	
	@Bean
	public RestTemplate restTemplate(RestTemplateBuilder builder) {
		return builder.build();
	}
	
	@Bean
	public CommandLineRunner run(RestTemplate restTemplate) throws Exception {
		return args -> {
//			Value v1 = restTemplate.getForObject("http://127.0.0.1:5000/document-classifier/api/v1/test", Value.class);
//			log.info(v1.toString()); 
		};
	}
}
