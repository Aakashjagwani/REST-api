package DocumentClassifier;

public class RespText {
String resptext;

public String getResptext() {
	return resptext;
}

public void setResptext(String resptext) {
	this.resptext = resptext;
}

@Override
public String toString() {
	return "RespText [resptext=" + resptext + "]";
}

public RespText(String resptext) {
	super();
	this.resptext = resptext;
}

public RespText() {
	super();
}

}
