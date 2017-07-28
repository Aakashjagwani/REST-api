/** 
Developed by:
[Code Authors]
Mihir Parikh
Aakash Jagwani
Aman Goyal
**/
package DocumentClassifier;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.regex.PatternSyntaxException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@RestController
@PropertySource("classpath:application.properties")
public class KhaliController {

	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	Environment env;

	String lastsplit(String data,String spliter){
		if(data==null)return data;
		String[] spl;
		try{spl=data.split(spliter);}
		catch(PatternSyntaxException e){return data;}
		return spl[spl.length-1];
	}
	
	@GetMapping("/train")
	public ModelAndView trainreq(){
		return new ModelAndView("train");
		
	}
	@PostMapping("/train")
	public String trainpost(@RequestParam(value="train_ratio") int tri,HttpSession sess){
		//call aman
		float tr=((float)(tri))/100.0f;
    	Model resp = restTemplate.getForObject(env.getProperty("sirflocal")+"/document-classifier/api/v1/train?train_ratio="+tr, Model.class);
		String downloadableModelFilePath=resp.getModelStoredAt();//from aman api
		//TODO: make path rel. (user shouldnt see whole path)
		if (downloadableModelFilePath=="") return "Train req. failed";
		sess.setAttribute("model", downloadableModelFilePath);
		return "success="+downloadableModelFilePath;
		
	}
	
	@GetMapping("/download")
	public void downloadModel(HttpServletRequest request, HttpServletResponse response){
		String model=request.getParameter("model");
		model=env.getProperty("modelbasepath")+model;
		try {
			InputStream myStream = new FileInputStream(new File(model));
			response.addHeader("Content-disposition", "attachment;filename="+lastsplit(model,"/"));
			response.setContentType("txt/plain");
			
			IOUtils.copy(myStream, response.getOutputStream());
			response.flushBuffer();
			return;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			try {
				e.printStackTrace(response.getWriter());
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
	
	@GetMapping("/stat")
	public ModelAndView statusReq(){
		return new ModelAndView("statusjson","status","-status-");
	}

	@GetMapping("/test")
	public ModelAndView testform(HttpSession sess,ModelAndView mod){
		String sessmod=(String) sess.getAttribute("model");
		System.out.println(sessmod);
		sess.setAttribute("sessionmodel",lastsplit(lastsplit(sessmod,"/"),"\\"));
		return new ModelAndView("tests");
	}
	
	   private int  saveUploadedFile(MultipartFile file, String filepath) throws IOException {
       
	            if (file.isEmpty()) {
	            	System.out.println("Haila: Empty file");
	                return 0; //next pls
	            }
	            byte[] bytes = file.getBytes();
				Path path =Paths.get(filepath);
	            Files.createDirectories(path.getParent());
				Files.write(path, bytes);
				return 1;
	   }
	   private int unZipIt(String zipFile, String outputFolder){
		   int z= 1;
		     byte[] buffer = new byte[1024];

		     try{

		    	//create output directory is not exists
		    	File folder = new File(outputFolder);
		    	if(!folder.exists()){
		    		folder.mkdir();
		    	}

		    	//get the zip file content
		    	ZipInputStream zis =
		    		new ZipInputStream(new FileInputStream(zipFile));
		    	//get the zipped file list entry
		    	ZipEntry ze = zis.getNextEntry();

		    	while(ze!=null){

		    	   String fileName = ze.getName();
		           if(!fileName.endsWith(".txt")) {
		        	   z=0; break;
		        	   
		           }
		           
		    	   File newFile = new File(outputFolder + File.separator + fileName);

		           System.out.println("file unzip : "+ newFile.getAbsoluteFile());

		            //create all non exists folders
		            //else you will hit FileNotFoundException for compressed folder
		            new File(newFile.getParent()).mkdirs();

		            FileOutputStream fos = new FileOutputStream(newFile);

		            int len;
		            while ((len = zis.read(buffer)) > 0) {
		       		fos.write(buffer, 0, len);
		            }

		            fos.close();
		            ze = zis.getNextEntry();
		            
		    	}
		    	
		        zis.closeEntry();
		    	zis.close();

		    	System.out.println("Done unzipping");

		    }catch(IOException ex){
		    	System.out.println("Unzipping failed:");
		    	
		       ex.printStackTrace();
		       return -1;
		    }
		     return z;
		   }
	@PostMapping("/test")
	public ModelAndView testreq(HttpSession sess,ModelAndView mod,HttpServletResponse response,
			@RequestParam("test_file") MultipartFile t_file,
			@RequestParam("model_file") MultipartFile m_file,
			@RequestParam("model_sess_path_flag") int flag){
//		String log="t_file:"+t_file+" m_file:"+m_file+" s_flag:"+flag;
//		System.out.println(log);
//		for(long i=0;i<5000000000L;i++);
		int notxt=0;
		//save given files and pass its path
		long rnd=System.currentTimeMillis();
		String basepath=env.getProperty("basepath");
		String tname=""+rnd+"-"+t_file.getOriginalFilename();
//		System.out.println(tname);
		int tnspli=tname.lastIndexOf('.');
//		System.out.println(tnspli);
		String tnspl=tname.substring(tnspli+1);
		System.out.println(tnspl);
		String tdname=basepath+"/testfiles"+rnd+"/";
		String tfname;
		if(tnspl.equals("zip"))	tfname=basepath+tname;
		else tfname=tdname+tname;
		if(!tnspl.equals("txt") && !tnspl.equals("zip")) 	notxt=1; 
//		System.out.println(tfname);
		String mfname=basepath+"modelfile"+rnd+"-"+m_file.getOriginalFilename();
		try {
			int x=saveUploadedFile(t_file, tfname),y=1;
			if(flag==1)mfname=env.getProperty("modelbasepath")+(String) sess.getAttribute("model");
			else y=saveUploadedFile(m_file, mfname);
			if(x+y!=2 || mfname==null){ 
//				System.out.println(""+x+"mfnae"+y);
//				System.out.println(tfname);
				response.setStatus(400);
				sess.setAttribute("msg","Empty file(s) given");
				return new ModelAndView("erroralert");
				
			} //case not all files were givn
			if(notxt==1){	
			response.setStatus(400);
			sess.setAttribute("msg","Only .txt and .zip files are allowed.");
			return new ModelAndView("erroralert");
		}
			if(tnspl.equals("zip")){
			//	extract zip (path=tfname) to dir (tdname)
				int z = unZipIt(tfname,tdname);
				String msg=null;
				if(z==-1) msg="Unzipping failed.";
				else if(z== 0) msg="ZIP file should contain .txt files only.";
				if (msg!=null){
					response.setStatus(400);
					sess.setAttribute("msg",msg);
				return new ModelAndView("erroralert");
				} //case not all files were givn
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Saving files locha:");
			e.printStackTrace();
		}
		//check if zip:extract else create unique dir
//		if(tname.substring(tname.lastIndexOf('.') + 1)=="zip")	{
		
		
		String apiurl=env.getProperty("sirflocal")+"/document-classifier/api/v1/test?test_document_path="+tdname+"&"+"saved_model_path="+mfname;
		//call aman api and get table data
		List<TestResult> trs=Arrays.asList(restTemplate.getForObject(apiurl, TestResult[].class));
				/*exchange(apiurl,
                HttpMethod.GET, null, new ParameterizedTypeReference<List<TestResult>>() {
        }).getBody();*/
		for(int i=0;i<trs.size();i++)System.out.println(trs.get(i));
		
		//set data in mod
		sess.setAttribute("list", trs);
		
		return new ModelAndView("Testresult");
	}

}
/** 
Developed by:
[Code Authors]
Mihir Parikh
Aakash Jagwani
Aman Goyal
**/
