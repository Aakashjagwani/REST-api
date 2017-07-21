package DocumentClassifier;

public class Model {
String modelStoredAt;

	@Override
public String toString() {
	return "Model [modelStoredAt=" + modelStoredAt + "]";
}
	public Model(String modelStoredAt) {
	super();
	this.modelStoredAt = modelStoredAt;
}
	public String getModelStoredAt() {
	return modelStoredAt;
}
public void setModelStoredAt(String modelStoredAt) {
	this.modelStoredAt = modelStoredAt;
}
	public Model() {
		super();
	}
	
}
