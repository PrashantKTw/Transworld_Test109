<%@ page import="java.util.List" %>
<%@ include file="headConn.jsp" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %> 
   <%@ page import="java.io.*"%>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
    <%@ page import="org.jibble.simpleftp.*" %>
    <%@ page import="java.net.URLConnection" %>
    <%@ page import="java.net.URL" %>
    <%@page import="org.apache.commons.net.ftp.FTPClient"%>
<%@page import="org.apache.commons.net.ftp.FTPReply"%>
    
   <%@ page language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/multifile.js"></script>
<title>Transworld Inward Upload</title>
</head>
<body>

        
   <%
     String f123="";
   	 String itemName="",docPath="";
   //	String fName="";
     int fileCount=0;
     String resendMsg="";
     ArrayList l1 =new ArrayList();
     String serverid="",usernm="",passwd="";	
     Statement st1=conn.createStatement();
     
     String sqlftp="select * from t_ftpconnection";
     System.out.println("sqlftp:-"+sqlftp);
     ResultSet rsftp=st1.executeQuery(sqlftp);
     rsftp.next();
     serverid=rsftp.getString("ServerID");
     usernm=rsftp.getString("Username");
     passwd=rsftp.getString("Password");
 %>
 <%
 
 String fName=request.getParameter("MyFile");
 System.out.println("--------MyFIle--------"+fName);
 
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart) 
 {
 } 
 else
 {
   FileItemFactory factory = new DiskFileItemFactory();
   ServletFileUpload upload = new ServletFileUpload(factory);
   List items = null;
   try {
   items = upload.parseRequest(request);
   System.out.println("items="+items);
   } catch (FileUploadException e) {
   e.printStackTrace();
   }
   Iterator itr = items.iterator();
   
//   String a[]=request.getParameter("");
   String a="";
   int i=0;
   while (itr.hasNext()) 
           {
	   //System.out.println
   FileItem item = (FileItem) itr.next();
   if (item.isFormField())
           {
              String name = item.getFieldName();
                  String value = item.getString();
                 
                   if(name.equals("fileName"))
                   {
                	   f123=value;
                   }
                   if(name.equals("MyFile"))
                   {
                	   fName=value;
                   }
                   System.out.println("fName Files fName============>>"+fName);
                   System.out.println("attched Files============>>"+f123);
                   out.println("attched Files============>>"+f123);
          } 
    	  else
		  {    
						try 
						{
				           itemName = item.getName();
				           if(itemName=="null" || itemName.equals(""))
			        		{
			        			System.out.println("itemName in if loop===========================================================>"+itemName);
			        			itemName="-";
			        		}else{
						  /*  File savedFile = new File(config.getServletContext().getRealPath("/")+itemName);
						   itemName=itemName.replaceAll(" ","_"); */
						   
						   String fpath=config.getServletContext().getRealPath("/");
						   //fpath=fpath.replace("TransworldTest", "TWDOC");
						   fpath=fpath.replace("Transworld", "TWDOC");
						   
						    File savedFile = new File(fpath+"/"+itemName);
						    itemName=itemName.replaceAll(" ","_");
						    
						   System.out.println("savedfile:- "+savedFile);
						   
						   // File savedFile1 = new File(config.getServletContext().getRealPath("/")+"/CommonLogin/"+itemName);
						    
						    File savedFile1 = new File(fpath+"/"+itemName);
						    
			        		item.write(savedFile1);
			        		System.out.println("savedFile:-"+savedFile1);
						   
						 // docPath=(config.getServletContext().getRealPath("/")+"CommonLogin/").toString();
						 
						 docPath=""+fpath;
						 
						  System.out.println("docPath:-"+docPath);
						   item.write(savedFile);
			        		}
					      
					   } 
			    	   catch (Exception e) 
			    	   {
			    		   System.out.println("exception is :-"+e);
					   		e.printStackTrace();
					   }
			    	   
				   }
		   }
   
   			
 //=====Copy 2 FTP===============================================================================================
		 System.out.println("here:-");
   try
  	{
	
	 FTPClient ftp = new FTPClient();
	 FileInputStream inputStream = null;
	 try {
		  
	      int reply;
	      String server = "serverid";
	      ftp.connect(serverid);
	      
	  		ftp.login(usernm,passwd);
	      ftp.connect(server);
	      System.out.println("Connected to " + server + ".");
	      System.out.print(ftp.getReplyString());

	      // After connection attempt, you should check the reply code to verify
	      // success.
	      reply = ftp.getReplyCode();

	      if(!FTPReply.isPositiveCompletion(reply)) {
	        ftp.disconnect();
	        System.err.println("FTP server refused connection.");
	        System.exit(1);
	      }
	     
	      ftp.logout();
	    
	   		try
		   	{
	   			System.out.println("In try FTP connection");
	 		ftp.connect(serverid);
	   		ftp.login(usernm,passwd);
			
	
		    System.out.println("In FTP connection 1");
		   	}
		   	catch(Exception e)
		   	{
		   		
		   		ftp.connect(serverid);
		  		ftp.login(usernm,passwd);
		   		
			    System.out.println("In FTP connection 2");
		   	}
	   	}
	   	catch(Exception e)
	   	{
	   		ftp.connect(serverid);
	   		ftp.login(usernm,passwd);
	   		System.out.println("In 2nd FTP connection");
	   
		    System.out.println("In FTP connection 3");
		    
	   	}
				
	    		
	    		boolean flg=false;
	   			out.println("values for FTP*********************"+f123);
			    String delims12 = "[,]";
			    String[] tokens12 = itemName.split(delims12);
				for (String t : tokens12)
				
				{
					flg=false;
	
				System.out.println("In for loop");
			 inputStream = new FileInputStream(new File( docPath + "" + t ));
			 System.out.println("In store ftp");
			 ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
				ftp.storeFile("/test/"+ t + "", inputStream);
				System.out.println("Below ftp store");
				
				
				//System.out.println("9999999999999999999999"+inputStream);
				
							
					
				System.out.println("path----------->>"+docPath+""+ t);
					fileCount++;
					
				
				    try 
			        {
			        	URLConnection m_client=null;
			        	try
			        	{
			        		System.out.println("In URL part");
			       
					      flg=true;
			        	}
			        	
			        	catch (Exception e) 
			        	{
			        		System.out.println("Exception------>>"+e);
			        		l1.add(t);
						}  
			        	
						  if(flg==true)
						  {
									try
									{
										 java.util.Date today = new java.util.Date();
										 String todaydate=new SimpleDateFormat("yyyy-MM-dd").format(today);
										 String todaytime=new SimpleDateFormat("HH:mm:ss").format(today);
						                        	String  sqlInsert="INSERT INTO db_leaveapplication.t_uploadedFiles (FileName,UploadedBy,FileStatus,inwardedBy,inwardDateTime)VALUES('"+t+"','"+session.getAttribute("empname").toString()+"','uploaded','-','-')";
						                        	Statement stmt=conn.createStatement();
						                        	System.out.println(sqlInsert);
													stmt.executeUpdate(sqlInsert);
										resendMsg="Files uploaded successfully";
			                        	  
									}
									catch(Exception e)
									{
											System.out.println("Exception===========>>"+e);
											l1.add(t);
									}
						  }
						
						  
			        } 
			        catch (Exception e) 
			        {
			        	System.out.println("Outer Exception ------>>"+e);
			        } 	
				
				}
				if(l1.size()!=0)
				  {
					resendMsg="Unable To Upload Files "+l1;  
					System.out.println("resendMsg" +resendMsg);
				  }
				else
				  {
					resendMsg="Files Uploaded Successfully !";
					System.out.println("resendMsg" +resendMsg);
				  }
				response.sendRedirect("IwrdScan.jsp?resendMsg="+resendMsg);
  	}
  	catch(Exception e)
  	{
  		
  		System.out.println("Exception Copy File to FTP----------->>"+e);
  		resendMsg="Unable To Upload File Due Connection Breakup!!!";
  		System.out.println("resendMsg" +resendMsg);
  		response.sendRedirect("IwrdScan.jsp?resendMsg="+resendMsg);
  	}
 
	 

		   }
		   conn.close();
		   
		   %>
    
</body>
</html>