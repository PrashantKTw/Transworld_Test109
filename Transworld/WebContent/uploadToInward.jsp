<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.*"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="javax.mail.*" import="java.util.Properties"
	import="javax.mail.internet.InternetAddress"
	import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.servlet.http.HttpServletRequest"
	import="javax.mail.internet.MimeBodyPart"
	import="javax.mail.internet.MimeMultipart"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="javax.activation.*"%>
<%@ page import="org.jibble.simpleftp.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Transworld Inward Upload</title>
</head>
<body>


	<%
     String inrefno="",inno="",from="",prno="",to="", dept="", cat="", MyFile="", sub="",data="",completePath="", priority="", f123="";
   	 String itemName="",docPath="",fileName="",srNoStr="",manualref="",address="",remark="",blno="",blamt="",bldate="",blduedate="";
   	String agreementParty="",agreementDate="",agreementFrom="",agreementTo="",keywords="";
     int count1=0,count2=0,count3=0,count4=0,count5=0,cnt_1=0,cnt_2=0,cnt_3=0;
     Statement s1=null,st2=null,st3=null,st4=null,st5=null,st6=null;
     String msgSend="",searchby="";
 	String serverid="",usernm="",passwd="";	
	
 %>
	<%
 	System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^uploadToInward^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
   try
   {
	    s1=conn.createStatement();
	    st2=conn.createStatement();
	    st3=conn.createStatement();
	    st4=conn.createStatement();
	    st5=conn.createStatement();
	    st6=conn.createStatement();
   }
   catch(Exception e)
   {
	   
   }
    try
    {
    	
    	String sqlftp="select * from t_ftpconnection";
    	ResultSet rsftp=st2.executeQuery(sqlftp);
    	rsftp.next();
    	serverid=rsftp.getString("ServerID");
    	usernm=rsftp.getString("Username");
    	passwd=rsftp.getString("Password");	
    	
    	
 	inrefno=request.getParameter("inrefno");
	inno=request.getParameter("inno");
	from=request.getParameter("from");
	prno=request.getParameter("prno");
	to=request.getParameter("to");
	dept=request.getParameter("dept");
	cat=request.getParameter("cat");
//	rd=request.getParameter("rd");
	itemName=request.getParameter("itemName");
	sub=request.getParameter("sub");
	data=request.getParameter("data");
	priority=request.getParameter("priority");
	fileName=request.getParameter("fileName");						
	srNoStr=request.getParameter("srNoStr");
	
	agreementParty=request.getParameter("agreementParty");
	 agreementDate=request.getParameter("agreementDate");
	 agreementFrom=request.getParameter("agreementFrom");
	 agreementTo=request.getParameter("agreementTo");
	
	address=request.getParameter("address");
	keywords=request.getParameter("keywords");
	searchby=request.getParameter("searchby");
	//================================================================
	 System.out.println("\n search by -->>"+searchby);	 
	 System.out.println("\nremark-->>"+remark);
	 System.out.println("KEYWORDS  -->>"+keywords);
	 System.out.println("blno-->>"+blno);
	 System.out.println("blamt-->>"+blamt);
	 System.out.println("bldate-->>"+bldate);
	 System.out.println("blduedate-->>"+blduedate);
	 System.out.println("manualref-->>"+manualref);

	 
	// if(request.getParameter("manualref")!=null)
	 manualref=request.getParameter("manualref");
	// if(request.getParameter("remark")!=null)
	 remark=request.getParameter("remark");
	// if(request.getParameter("blno")!=null)
	 blno=request.getParameter("blno");
	// if(request.getParameter("blamt")!=null)
	 blamt=request.getParameter("blamt");
	// if(request.getParameter("bldate")!=null)
	 bldate=request.getParameter("bldate");
	// if(request.getParameter("blduedate")!=null)
	 blduedate=request.getParameter("blduedate");
	 
	 System.out.println("\n\nremark-->>"+remark);
	 System.out.println("blno-->>"+blno);
	 System.out.println("blamt-->>"+blamt);
	 System.out.println("bldate-->>"+bldate);
	 System.out.println("blduedate-->>"+blduedate);
	 System.out.println("manualref-->>"+manualref);
	//================================================================
	
	//docPath="ftp://202.38.172.58/../Uploaded/";
	docPath="ftp://"+serverid+"/test/";
	System.out.println(agreementParty+"_______"+agreementDate+"________"+agreementFrom+"______"+agreementTo);
	System.out.println("\n\nIERD insert->>>>vishal-->>>>>==="+inno+"=="+inrefno+"==="+from+"==="+prno+"==="+to+"==="+dept+"===="+cat+"===="+itemName+"===="+data+"==="+sub+"==="+completePath+"===="+priority+"==="+docPath+"==="+fileName+"====="+remark+"==="+blno+"==="+blamt+"==="+bldate+"==="+blduedate+"==="+manualref);
	//===Email ID of TO=========================================
	int cntg=0;
	String emailToId="";
//	to=to.substring(1,to.length());
    String delims12 = "[,]";
    String[] tokensName = to.split(delims12);
	for (String t : tokensName)
	{
		 	cntg++;
		 
		 	String sqlID="select Email from t_leaveadmin where Name='"+t+"'";
			Statement st1=conn.createStatement();
			ResultSet rs1=st1.executeQuery(sqlID);
			if(rs1.next())
			{
				String mailIdTo=rs1.getString("Email");
				emailToId=emailToId+""+mailIdTo+",";
			}
	}
	
	for(int n=0;n<=cntg-1;n++)
	{
		System.out.println("final mail,Name==="+cntg+"======>>"+emailToId+"==========="+tokensName[n]);
	}
//==========================================================
	
	
//====Send Mail if Link or Attch============================
		int ct=0;
		String[] tokensEmail = emailToId.split(delims12);
		for(String t : tokensEmail)
		{
			ct++;
		}
		
		for(int m=0;m<=ct-1;m++)
		{
			System.out.println("email======"+ct+"===="+tokensEmail[m]);
		}
		//====Insert nito Database========================================
		String storePath="ftp://"+serverid+"/test/"+itemName;
		//msg = "Record Successfully Inserted";
		String sqlInsert="",sqlInsert1="";
		java.util.Date today = new java.util.Date();
		String todaydate=new SimpleDateFormat("yyyy-MM-dd").format(today);
		String todaytime=new SimpleDateFormat("HH:mm:ss").format(today);
		DateFormat df1=new SimpleDateFormat("yyyy-MM-dd");
		DateFormat df2=new SimpleDateFormat("dd-MMM-yyyy");
		//**********insert into DB*************************************************************************
		String delim = "[,]";
		String[] tok = fileName.split(delim);
		out.println("==6===");
		int cnt=0;
		
			String ftpLoc="ftp://"+serverid+"/test/";
			String storeName="",storeEmpMail="";
			
			
			for(int k=0;k<=cntg-1;k++)
			{
				if(storeName=="" || storeEmpMail=="")
				{
					storeName=tokensName[k];
					storeEmpMail=tokensEmail[k];
				}
				else
				{
					storeName=storeName+","+tokensName[k];
					storeEmpMail=storeEmpMail+","+tokensEmail[k];
				}
			
			}
			// if(request.getParameter("bldate")!=null)
			bldate=df1.format(df2.parse(bldate));
			// if(request.getParameter("blduedate")!=null)
			blduedate=df1.format(df2.parse(blduedate));
			if(!(cat.equals("Bills")))
	   		   {
	   				bldate="0000-00-00";
	   				blduedate="0000-00-00";
	   				blamt="0.00";
	   		   }
			
			
			agreementDate=df1.format(df2.parse(agreementDate));
			agreementFrom=df1.format(df2.parse(agreementFrom));
			agreementTo=df1.format(df2.parse(agreementTo));
			if(!(cat.equals("Agreement")))
	   		   {
	   				agreementDate="0000-00-00";
	   				agreementFrom="0000-00-00";
	   				agreementTo="0000-00-00";
	   		   }
		
		double dblAmt=0;
		try
		{
			dblAmt= Double.parseDouble(blamt);
		}
		catch(Exception e)
		{
			System.out.println("Bill Amt Parse Exception On upload !!!::"+e);
			try{
				BufferedWriter writer = null;
				try{
					
							
			
				    writer = new BufferedWriter( new FileWriter( "/usr/share/tomcat7/webapps/Transworld/ExceptionInward.txt",true));
					///writer = new BufferedWriter( new FileWriter( "/home/v_abhang/Desktop/JDDownloadTime.txt",true));
					writer.write("----------------------------------------------------------------------------------------------------------------");
					writer.newLine();
					writer.write( "Exception at Time  : "+new java.util.Date());
					writer.newLine();
					writer.write(  "Exception in First Bill parsing is : "+e);
					writer.newLine();
					writer.write("----------------------------------------------------------------------------------------------------------------");
					writer.newLine(); 	
					writer.flush();
					System.out.println("write successful in CATCH block");
				}catch (Exception ee) {
					System.out.println("xx"+ee);
					//ee.printStackTrace();
				}
				finally
				{		try	{
								if ( writer != null)
									writer.close( );
							}
						catch ( IOException e1)	{	}
				}
			  }catch (Exception e2) { }
		}
		
		
		String iwrdDateTime=todaydate+" "+todaytime;
		
	
			try
			{
				try{
					sqlInsert="INSERT INTO db_leaveapplication.t_inwarddetails (InwardNo ,InwardRefNo ,ManualRef ,InwardDate ,InwardTime ,FromParty ,PartyRefNo ,Address ,ToEmploy ,ToEmailID ,Subject ,Dept ,Category,BillNo,BillAmt,BillDate,BillDueDate,agreementParty,agreementDate,agreementFrom,agreementTo,FileName ,FileLocation ,Enteredby, EnteredById ,EmailSend, ActionDate,senderRemark,InwrdPriority,InwardStatus,Keywords,Type)VALUES('"+inno+"', '"+inrefno+"', '"+manualref+"', '"+todaydate+"' , '"+todaytime+"' , '"+from+"', '"+prno+"', '"+address+"', '"+storeName+"', '"+storeEmpMail+"', '"+sub+"', '"+dept+"', '"+cat+"','"+blno+"','"+dblAmt+"','"+bldate+"','"+blduedate+"','"+agreementParty+"','"+agreementDate+"','"+agreementFrom+"','"+agreementTo+"','"+fileName+"','"+ftpLoc+"', '"+session.getAttribute("empname")+"', '"+session.getAttribute("empID").toString()+"' ,'No','"+data+"','"+remark+"','"+priority+"','inwarded','"+keywords+"','"+searchby+"')";
					System.out.println(sqlInsert);
					st2.executeUpdate(sqlInsert);	
					cnt_1=cnt_1+1;
				}
				catch(Exception e)
				{
					System.out.println(e);
					cnt_1=0;
					try{
						BufferedWriter writer = null;
						try{
							
									
					
						    writer = new BufferedWriter( new FileWriter( "/usr/share/tomcat7/webapps/Transworld/ExceptionInward.txt",true));
							///writer = new BufferedWriter( new FileWriter( "/home/v_abhang/Desktop/JDDownloadTime.txt",true));
							writer.write("----------------------------------------------------------------------------------------------------------------");
							writer.newLine();
							writer.write( "Exception at Time  : "+new java.util.Date());
							writer.newLine();
							writer.write(  "Exception is db_leaveapplication.t_inwarddetails: "+e);
							writer.newLine();
							writer.write("----------------------------------------------------------------------------------------------------------------");
							writer.newLine(); 	
							writer.flush();
							System.out.println("write successful in CATCH block");
						}catch (Exception ee) {
							System.out.println("xx"+ee);
							//ee.printStackTrace();
						}
						finally
						{		try	{
										if ( writer != null)
											writer.close( );
									}
								catch ( IOException e1)	{	}
						}
					  }catch (Exception e2) { }
				}
				if(cnt_1>0)
				{
					sqlInsert1="INSERT INTO db_leaveapplication.t_inwarddetailshistory (InwardNo ,InwardRefNo ,ManualRef ,InwardDate ,InwardTime ,FromParty ,PartyRefNo ,Address ,ToEmploy ,ToEmailID ,Subject ,Dept ,Category,BillNo,BillAmt,BillDate,BillDueDate,agreementParty,agreementDate,agreementFrom,agreementTo,FileName ,FileLocation ,Enteredby, EnteredById ,EmailSend, ActionDate,senderRemark,InwrdPriority,InwardStatus,Keywords,Type)VALUES('"+inno+"', '"+inrefno+"', '"+manualref+"', '"+todaydate+"' , '"+todaytime+"' , '"+from+"', '"+prno+"', '"+address+"', '"+storeName+"', '"+storeEmpMail+"', '"+sub+"', '"+dept+"', '"+cat+"','"+blno+"','"+blamt+"','"+bldate+"','"+blduedate+"','"+agreementParty+"','"+agreementDate+"','"+agreementFrom+"','"+agreementTo+"','"+fileName+"','"+ftpLoc+"', '"+session.getAttribute("empname")+"', '"+session.getAttribute("empID").toString()+"' ,'No','"+data+"','"+remark+"','"+priority+"','inwarded','"+keywords+"','"+searchby+"')";
					System.out.println(sqlInsert1);
					st3.executeUpdate(sqlInsert1);	
					cnt_2=cnt_2+1;
				}
				if(cnt_1>0 && cnt_2>0)
				{
					try
					{
						/*String SqlInward="Select * from db_leaveapplication.t_inwarddetails where InwardRefNo='"+inrefno+"'";
						ResultSet rsinwrd=st5.executeQuery(SqlInward);
						if(rsinwrd.next())
						{*/
							String sqlUdt="update t_uploadedFiles set FileStatus='inwarded',inwardedBy='"+session.getAttribute("empname").toString()+"',inwardDateTime='"+iwrdDateTime+"',InwardNo='"+inrefno+"' where SrNo in("+srNoStr+")";
							System.out.println(sqlUdt);
							s1.executeUpdate(sqlUdt);
							cnt_3=cnt_3+1;
						//}
						
					}
					catch(Exception e)
					{
						System.out.println(e);
						cnt_3=0;
						try{
							BufferedWriter writer = null;
							try{
								
										
						
							    writer = new BufferedWriter( new FileWriter( "/usr/share/tomcat7/webapps/Transworld/ExceptionInward.txt",true));
								///writer = new BufferedWriter( new FileWriter( "/home/v_abhang/Desktop/JDDownloadTime.txt",true));
								writer.write("----------------------------------------------------------------------------------------------------------------");
								writer.newLine();
								writer.write( "Exception at Time  : "+new java.util.Date());
								writer.newLine();
								writer.write(  "Exception is db_leaveapplication.t_uploadedFiles: "+e);
								writer.newLine();
								writer.write("----------------------------------------------------------------------------------------------------------------");
								writer.newLine(); 	
								writer.flush();
								System.out.println("write successful in CATCH block");
							}catch (Exception ee) {
								System.out.println("xx"+ee);
								//ee.printStackTrace();
							}
							finally
							{		try	{
											if ( writer != null)
												writer.close( );
										}
									catch ( IOException e1)	{	}
							}
						  }catch (Exception e2) { }
					}
					
				}
								
			}
			catch(Exception e)
			{
				System.out.println(e);
				try{
					BufferedWriter writer = null;
					try{
						
								
				
					    writer = new BufferedWriter( new FileWriter( "/usr/share/tomcat7/webapps/Transworld/ExceptionInward.txt",true));
						///writer = new BufferedWriter( new FileWriter( "/home/v_abhang/Desktop/JDDownloadTime.txt",true));
						writer.write("----------------------------------------------------------------------------------------------------------------");
						writer.newLine();
						writer.write( "Exception at Time  : "+new java.util.Date());
						writer.newLine();
						writer.write(  "Exception is db_leaveapplication.t_inwarddetails Main Catch: "+e);
						writer.newLine();
						writer.write("----------------------------------------------------------------------------------------------------------------");
						writer.newLine(); 	
						writer.flush();
						System.out.println("write successful in CATCH block");
					}catch (Exception ee) {
						System.out.println("xx"+ee);
						//ee.printStackTrace();
					}
					finally
					{		try	{
									if ( writer != null)
										writer.close( );
								}
							catch ( IOException e1)	{	}
					}
				  }catch (Exception e2) { }
			}


//*******insert to t_inwardfollowup tab**********************************************
			String d2 = "[,]";
		    String[] t2 = to.split(d2);
			for (String t : t2)
			{
				String inwrdFollowup="insert into db_leaveapplication.t_inwardfollowup(iwrefno,ManualRef,docReceiver, docSender,senderRemarks,actionondoc) values('"+inrefno+"','"+manualref+"','"+t+"','"+session.getAttribute("empname").toString()+"','"+remark+"','inward')";
				st4.executeUpdate(inwrdFollowup);
			}
//***********************************************************************************
//=================================================================
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                if(cnt_1>0 && cnt_2>0)
				{
                	try{					
    					//	if(rd.equals("link") || rd.equals("attch"))
    					//	{
    							//+++++Send Mail+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    							
           						 boolean flag=false;
    						        try
    						       {
    						        	//rd="link";
    						             String Data="";
    						             Data="There is a New Document For You \n Please find the details.\n\n";
    						             Properties props = new Properties();
    						       //      String host="smtp.transworld-compressor.com"; 
    						       		 String host="smtpout.secureserver.net";
    						             String protocol="smtp";
    						          // String user="inward@mobile-eye.in";
    						             String user="tripend@mobile-eye.in";
    						             String pass="transworld";
    						             props.put("mail.smtp.starttls.enable","true");
    						             props.put("mail.smtp.auth", "false");
    						             props.put("mail.smtp.user", "user");
    						             props.put("mail.smtp.password", "pass");  
    						             props.put("mail.store.protocol", protocol);
    						             props.put("mail.smtp.host", host);
    						         //	 props.put("mail.host", host);
    						             java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
    						             Session session1 = Session.getDefaultInstance(props,null);
    						             // Construct the message
    						              Message msg = new MimeMessage(session1);
    						       //     msg.setSubject("You Have A New Document. This is a " +"autogenerated mail please do not reply to it.");
    						       		  msg.setSubject(inrefno+" : "+sub+" From "+from);
    						              msg.setSentDate(new java.util.Date());
                 						out.println("==1===");
                                     		//  mail id-------------
                                    //========================================================================= 	
                                     		
    						            Address recipientAddrs[] = new InternetAddress[cntg];
                                     	for(int k=0; k<=cntg-1; k++)
                                     	{
                                     		recipientAddrs[k] = new InternetAddress(tokensEmail[k]);
                                     	}
                                     	out.println("==2===");
    						       //=========================================================================
    						              msg.addRecipients(Message.RecipientType.TO,recipientAddrs);
    						          
    						              Address fromAddress = new InternetAddress("avlsupport@mobile-eye.in","ERP TW Doc"); // in
    						         
    						              msg.setFrom(fromAddress);
    						              
    						              // ------------ code for sending attachment------------------
                  
    							           // Create the message part
    							              String urlFile=completePath;
    							              out.println("==3===");
    							              
    							              BodyPart messageBodyPart = new MimeBodyPart();
    							              
    						            	  out.println("==4===");
    						
    						              // Fill the message
    						              if(!(remark==null || remark==""))
    						              {
    						            	  if(manualref.equals("") || manualref.equalsIgnoreCase("NULL"))
    						            	  {
    						            	  	messageBodyPart.setText(Data+"\nInward Ref.No.:"+inrefno+"\nFrom:"+from+"\nParty Ref.No.:"+prno+"\nSubject:"+sub+"\nCategory:"+cat+"\nAction Date:"+data+"\nPriority:"+priority+"\nRemark:"+remark+"\n\n Thanks and Regards,\n Transworld Team");
    						            	  }
    						            	  messageBodyPart.setText(Data+"\nInward Ref.No.:"+inrefno+"\nManual Ref:"+manualref+"\nFrom:"+from+"\nParty Ref.No.:"+prno+"\nSubject:"+sub+"\nCategory:"+cat+"\nAction Date:"+data+"\nPriority:"+priority+"\nRemark:"+remark+"\n\n Thanks and Regards,\n Transworld Team");
    						              }
    						              else
    						              {
    						            	  if(manualref.equals("") || manualref.equalsIgnoreCase("NULL"))
    						            	  {
    						            		  messageBodyPart.setText(Data+"\nInward Ref.No.:"+inrefno+"\nFrom:"+from+"\nParty Ref.No.:"+prno+"\nSubject:"+sub+"\nCategory:"+cat+"\nAction Date:"+data+"\nPriority:"+priority+"\n\n Thanks and Regards,\n Transworld Team");
    						            	  }
    						            	  messageBodyPart.setText(Data+"\nInward Ref.No.:"+inrefno+"\nManual Ref:"+manualref+"\nFrom:"+from+"\nParty Ref.No.:"+prno+"\nSubject:"+sub+"\nCategory:"+cat+"\nAction Date:"+data+"\nPriority:"+priority+"\n\n Thanks and Regards,\n Transworld Team");  
    						              }
    						            		
    							              out.println("==5===");
    							              
    							              Multipart multipart = new MimeMultipart();
    							              multipart.addBodyPart(messageBodyPart);
    				
                  // Put parts in message
                  msg.setContent(multipart);
                  out.println("==8===");
                   //--------------------------- end of logic---------------------------------
                  // Send the message
                  
                  
                  Transport t = session1.getTransport("smtps");
                  msg.saveChanges(); // don't forget this
                  
                     
                  try
                  {
                     
                       t.connect(host, user, pass);
                       out.println("==9===");
                       t.sendMessage(msg, msg.getAllRecipients());
                       // t.sendMessage(msg1, msg1.getAllRecipients());
                       flag=true;
                       System.out.println("Your message has been sent");
                  }
                catch(Exception e)
                  {
                      System.out.print("Exception----->"+e);
                      try{
              			BufferedWriter writer = null;
              			try{
              				
              						
              		
              			    writer = new BufferedWriter( new FileWriter( "/usr/share/tomcat7/webapps/Transworld/ExceptionInward.txt",true));
              				///writer = new BufferedWriter( new FileWriter( "/home/v_abhang/Desktop/JDDownloadTime.txt",true));
              				writer.write("----------------------------------------------------------------------------------------------------------------");
              				writer.newLine();
              				writer.write( "Exception at Time  : "+new java.util.Date());
              				writer.newLine();
              				writer.write(  "Exception is Mail transporter Catch: "+e);
              				writer.newLine();
              				writer.write("----------------------------------------------------------------------------------------------------------------");
              				writer.newLine(); 	
              				writer.flush();
              				System.out.println("write successful in CATCH block");
              			}catch (Exception ee) {
              				System.out.println("xx"+ee);
              				//ee.printStackTrace();
              			}
              			finally
              			{		try	{
              							if ( writer != null)
              								writer.close( );
              						}
              					catch ( IOException e1)	{	}
              			}
              		  }catch (Exception e2) { }
                     
                  } 
                  finally 
                  {
                      t.close();
                      out.println("==10===");
                  } 
                           
                  Transport.send(msg);
                                                          
           }// end of inner try
           catch(Exception e)
           {
                   
                   System.out.println("Sorry, your mail cannot be sent due to Congestion");
                   try{
           			BufferedWriter writer = null;
           			try{
           				
           						
           		
           			    writer = new BufferedWriter( new FileWriter( "/usr/share/tomcat7/webapps/Transworld/ExceptionInward.txt",true));
           				///writer = new BufferedWriter( new FileWriter( "/home/v_abhang/Desktop/JDDownloadTime.txt",true));
           				writer.write("----------------------------------------------------------------------------------------------------------------");
           				writer.newLine();
           				writer.write( "Exception at Time  : "+new java.util.Date());
           				writer.newLine();
           				writer.write(  "Exception is Outer Mail Catch: "+e);
           				writer.newLine();
           				writer.write("----------------------------------------------------------------------------------------------------------------");
           				writer.newLine(); 	
           				writer.flush();
           				System.out.println("write successful in CATCH block");
           			}catch (Exception ee) {
           				System.out.println("xx"+ee);
           				//ee.printStackTrace();
           			}
           			finally
           			{		try	{
           							if ( writer != null)
           								writer.close( );
           						}
           					catch ( IOException e1)	{	}
           			}
           		  }catch (Exception e2) { }
                   

           }
        	//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    	//}
    //================================================================
    	 
    	
    	
       	msgSend="Documents inwarded successfully";
    }
    catch(Exception e12)
    {
    	//msgSend="Unable to inward Documents";
    	try{
			BufferedWriter writer = null;
			try{
				
						
		
			    writer = new BufferedWriter( new FileWriter( "/usr/share/tomcat7/webapps/Transworld/ExceptionInward.txt",true));
				///writer = new BufferedWriter( new FileWriter( "/home/v_abhang/Desktop/JDDownloadTime.txt",true));
				writer.write("----------------------------------------------------------------------------------------------------------------");
				writer.newLine();
				writer.write( "Exception at Time  : "+new java.util.Date());
				writer.newLine();
				writer.write(  "Exception is Mail Catch: "+e12);
				writer.newLine();
				writer.write("----------------------------------------------------------------------------------------------------------------");
				writer.newLine(); 	
				writer.flush();
				System.out.println("write successful in CATCH block");
			}catch (Exception ee) {
				System.out.println("xx"+ee);
				//ee.printStackTrace();
			}
			finally
			{		try	{
							if ( writer != null)
								writer.close( );
						}
					catch ( IOException e1)	{	}
			}
		  }catch (Exception e2) { }
    }
	
}        
else
{
    msgSend="Unable to inward Documents";
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	conn.close();
	//response.sendRedirect("IwrdScanReport.jsp?msgSend="+msgSend);
	response.sendRedirect("alertGoTo.jsp?msg="+msgSend+"&goto=IwrdScanReport.jsp");
    }
    catch(Exception e)
    {
    	 System.out.println(">>>>>>>>>>>>>>>>>>Exceptions in Main Try:"+e);
    	 try{
				BufferedWriter writer = null;
				try{
					
							
			
				    writer = new BufferedWriter( new FileWriter( "/usr/share/tomcat7/webapps/Transworld/ExceptionInward.txt",true));
					///writer = new BufferedWriter( new FileWriter( "/home/v_abhang/Desktop/JDDownloadTime.txt",true));
					writer.write("----------------------------------------------------------------------------------------------------------------");
					writer.newLine();
					writer.write( "Exception at Time  : "+new java.util.Date());
					writer.newLine();
					writer.write(  "Exception is Main Try Catch: "+e);
					writer.newLine();
					writer.write("----------------------------------------------------------------------------------------------------------------");
					writer.newLine(); 	
					writer.flush();
					System.out.println("write successful in CATCH block");
				}catch (Exception ee) {
					System.out.println("xx"+ee);
					//ee.printStackTrace();
				}
				finally
				{		try	{
								if ( writer != null)
									writer.close( );
							}
						catch ( IOException e1)	{	}
				}
			  }catch (Exception e2) { }
    }
 %>

</body>
</html>