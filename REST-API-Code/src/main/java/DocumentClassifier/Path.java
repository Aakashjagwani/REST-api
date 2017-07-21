package DocumentClassifier;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Path {

    private String ModelPath;

    public Path() {
    }

    public String getModelPath() {
        return ModelPath;
    }

    public void setModelPath(String ModelPath1) {
        this.ModelPath = ModelPath1;
    }

    
    @Override
    public String toString() {
        return "ModelPath{" +
                "ModelPath='" + ModelPath+ '\'' +
                '}';
    }
}
