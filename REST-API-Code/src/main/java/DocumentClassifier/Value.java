package DocumentClassifier;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Value {
    
	private String file;
    
	public Value() {
		
	}
	
    public Value(String f) {
    	
    	this.file = f;    	
    }
    
    public void setFile(String file1) {
        this.file = file1;
    }
    
    @Override
    public String toString() {
        return "Value{" +
                "file='" + file + '\'' +
                '}';
    }
}
