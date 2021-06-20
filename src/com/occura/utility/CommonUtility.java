package com.occura.utility;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.StringTokenizer;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

public class CommonUtility {


	public static String currant_aca_year;
	public static String senderid;
	public static String menupath;
	public static String label_Path;
	public static String jasper_Path = null;
	
	
	public static boolean checkString(String s){
		boolean bError=true;
		if(s != null && !"".equalsIgnoreCase(s)){
			bError=false;
		}
		return bError;
	}
	
	
	public static String getFilePathFromcommonConfigVariable(String commonConfigVariable){
		ResourceBundle resourceBundle = null;
		resourceBundle = ResourceBundle.getBundle("conf.CommonConfig");
		String ImagePath=null;
		
		ImagePath = resourceBundle.getString(commonConfigVariable+".windows");
			
		return ImagePath;
	}
	
	public static String getFileExtensionFromFileName(String fileName) {
		
		if(fileName != null && !("").equals(fileName)) {
			
			return fileName.substring(fileName.lastIndexOf(".")+1);
			
		}else {
			return null;
		}
	}
	
	public static String getFileNameWithoutExtension(String fileName) {
		
		if(fileName != null && !("").equals(fileName)) {
			
			return fileName.split("\\.")[0];
			
		}else {
			return null;
		}
	}
	public static byte[] readFileToByteArray(File file){
        FileInputStream fis = null;
        // Creating a byte array using the length of the file
        // file.length returns long which is cast to int
        byte[] bArray = new byte[(int) file.length()];
        try{
            fis = new FileInputStream(file);
            fis.read(bArray);
            fis.close();        
            
        }catch(IOException ioExp){
            ioExp.printStackTrace();
        }
        return bArray;
    }
	
	public static boolean writeDocument(byte[] byteData,String filePath,String fileName,String fileExtension){
			
			boolean flag=true;
			try{
				
				File file = new File(filePath+fileName);
				OutputStream os = new FileOutputStream(file); 
				os.write(byteData); 
				os.close(); 
				
//				BufferedOutputStream outStream  = new BufferedOutputStream( new FileOutputStream(file));
				
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
				
			}
			return flag;
		}

	@SuppressWarnings("unused")
	public static String getSatsUrl(HttpServletRequest request) throws IOException{
		Properties p = new Properties();
		String version = System.getProperty("java.version");
		String path;
		
			path =	request.getSession().getServletContext().getRealPath("\\")+"WEB-INF/classes/conf/";
			if(version.equals("1.8.0_121") || version.equals("1.8.0_131")){
				path =	 request.getSession().getServletContext().getRealPath("\\")+"/WEB-INF/classes/conf/";
			}else{
				path =	request.getSession().getServletContext().getRealPath("\\")+"WEB-INF/classes/conf/";
			}
		
		FileInputStream fileInput1 = new FileInputStream(path+"PublicAPIConfiguration.properties");
		p.load(fileInput1);
		String uri=p.getProperty("stsurl");
		return uri;
	}

	 
	 public static String getClientIpAddress(HttpServletRequest request) {
		    String xForwardedForHeader = request.getHeader("X-Forwarded-For");
		    if (xForwardedForHeader == null) {
		        return request.getRemoteAddr();
		    } else {
		        // As of https://en.wikipedia.org/wiki/X-Forwarded-For
		        // The general format of the field is: X-Forwarded-For: client, proxy1, proxy2 ...
		        // we only want the client
		        return new StringTokenizer(xForwardedForHeader, ",").nextToken().trim();
		    }
		}
	 
	 public static int getNoOfDaysBetweenDates(Date d1, Date d2) {
		    int daysdiff = 0;
		    long diff = d2.getTime() - d1.getTime();
		    long diffDays = diff / (24 * 60 * 60 * 1000) + 1;
		    daysdiff = (int) diffDays;
		    return daysdiff;
		}
	 
	 public static String getFinancialYear(Date date){
			String f_year="";
			Calendar cal=Calendar.getInstance();
			cal.setTime(date);
			int month=cal.get(Calendar.MONTH)+1;
			if(month > 3){
				f_year=cal.get(Calendar.YEAR) +"-"+(cal.get(Calendar.YEAR)%100+1);
			}else{
				f_year=(cal.get(Calendar.YEAR)-1) +"-"+(cal.get(Calendar.YEAR)%100);
			}
			return f_year;
		}
	 
	 
	 public static boolean uploadBase64WithDocumentNameAndMachineNumber(Map<Integer, Object> mapObj) throws Exception{

			String imagefile=null,folderName=null,documentName=null,hwuniquenos=null,currentdate=null,tag_no=null;
			if(mapObj!=null) {
				imagefile = (String) mapObj.get(1);
				folderName = (String) mapObj.get(2);
				documentName = (String) mapObj.get(3);
			}
			boolean flag = false;
			Map<String, Object> map = new HashMap<>();
			String filePath = getAnyFilePathWithFolder(folderName);
		try {
			BufferedImage image = null;
			byte[] imageBytes = javax.xml.bind.DatatypeConverter.parseBase64Binary(imagefile);
			ByteArrayInputStream bis = new ByteArrayInputStream(imageBytes);
			image = ImageIO.read(bis);
			if(image != null)
			{
				File f = new File(filePath + documentName);
				try {
				if(!f.exists()){
				ImageIO.write(image, "png", f);
				       if(f.exists() && f.length() > 0){
				        flag = true;
				       }
				}
				}catch (IOException e) {
				e.printStackTrace();
				flag = false;
				f.delete();
				}finally{
				bis.close();
				}
			}
		} catch (IOException e) {
		e.printStackTrace();
		flag = false;
		}
		return flag;
		}
		

		public static String getAnyFilePathWithFolder(String folderName)
		{
			String filePath = "";
			ResourceBundle rb = ResourceBundle.getBundle("conf/CommonConfig");
			filePath = rb.getString(folderName+".windows");
			File f=new File(filePath);
			if(!f.exists()){
				f.mkdirs();
			}
			return filePath;
		}
		
	 
}