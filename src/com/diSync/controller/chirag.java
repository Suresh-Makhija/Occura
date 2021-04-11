package com.diSync.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileFilter;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.io.filefilter.FileFilterUtils;

public class chirag {

	
	//static String heiranchy = "";
	static List<String> str_ArayList = new ArrayList<String>();
	
	static void showDir(int indent, File file) throws IOException {
		String tmp=  "";
		
	    for (int i = 0; i < indent; i++)
	    {
	      System.out.print('-');
	      tmp += '-';
	    }
	    System.out.println(file.getName());
	    tmp += file.getName() + '\n';
	    
	    str_ArayList.add(tmp);
	    
	    if (file.isDirectory()) {
	      File[] files = file.listFiles();
	      for (int i = 0; i < files.length; i++)
	        showDir(indent + 4, files[i]);
	    }
	  }
	
	public static void main(String[] args) throws IOException {
		
		
		String dirPath = "D:/dataOfStl"; 
		String dirOut = "D://res//";
		
		showDir(1, new File(dirPath));
		
		String ext1=".txt";
		String ext2 = ".stl";
		
		for (int i=1;i<str_ArayList.size();i++) {
		
			String filesub = str_ArayList.get(i);
			
			String usel = filesub;
			
			if(filesub.charAt(5) != '-')
			{	
				try {
				      File myObj = new File(dirOut + filesub.substring(5, filesub.length()-1) + ".txt");
				      if (myObj.createNewFile()) {
				        //System.out.println("File created: " + myObj.getName());
				      } else {
				        //System.out.println("File already exists.");
				      }
				    } catch (IOException e) {
				      System.out.println("An error occurred.");
				      e.printStackTrace();
				    }
				
				File file = new File(dirOut + usel.substring(5, usel.length()-1) + ".txt");
				FileWriter fr = new FileWriter(file);
				BufferedWriter br = new BufferedWriter(fr);
				PrintWriter pr = new PrintWriter(br);
				
				for(i=i+1;i<str_ArayList.size();i++)
				{
					filesub = str_ArayList.get(i);
					
					if(filesub.charAt(5) != '-')
					{
						i--;
						System.out.println(filesub);
						break;
					}
					else
					{
						
						if(filesub.contains(ext1) || filesub.contains(ext2))
						{
							int lastdash = filesub.lastIndexOf('-');
							
							String Ofilen = filesub.substring(lastdash+1, filesub.length()-1);
							
							pr.println(Ofilen);
							
							System.out.println(Ofilen);
							System.out.println("here...\n\n\n\n");
						}
					}
				}
				
				pr.close();
				br.close();
				fr.close();
				
				//System.out.println(dirOut + filesub.substring(0, filesub.length()-1) + ".txt");
			}
			
			/*else
			{
				system.out.println(filesub);
			}*/
			
		}
		
	}
			
}