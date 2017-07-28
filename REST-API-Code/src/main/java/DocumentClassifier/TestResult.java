/** 
Developed by:
[Code Authors]
Mihir Parikh
Aakash Jagwani
Aman Goyal
**/
package DocumentClassifier;

public class TestResult {
String file;
String cat;
public String getFile() {
	return file;
}
public void setFile(String file) {
	this.file = file;
}
public String getCat() {
	return cat;
}
public void setCat(String cat) {
	this.cat = cat;
}
@Override
public String toString() {
	return "TestResult [file=" + file + ", cat=" + cat+"]";
}
public TestResult(String file, String cat, int len) {
	super();
	this.file = file;
	this.cat = cat;
}
public TestResult() {
	super();
}

}
/** 
Developed by:
[Code Authors]
Mihir Parikh
Aakash Jagwani
Aman Goyal
**/