package DocumentClassifier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class controller {
	@Autowired
	RestTemplate restTemplate;
    
	    @RequestMapping("/")
	    public ModelAndView home() {
	        return new ModelAndView("index");
	    }
	    

	}