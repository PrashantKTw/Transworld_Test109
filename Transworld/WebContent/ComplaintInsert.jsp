<%@ include file="headConn.jsp"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%@ page
	import="java.util.Properties,javax.mail.*,javax.mail.internet.*"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import=" java.io.IOException"%>
<%@ page import="javax.activation.*"%>

<%
  	String fname=(String)session.getAttribute("empname");
  	String email=(String)session.getAttribute("email");
  	%>

<%!

Connection conn,con;
static int html=1;
static int saveflag=1;
 int count=1;
%>

<html>
<head></head>

<script type="text/javascript">

function closewindow()
{
	window.close();
}

</script>
<body style="background-color: #F5F5F5">

	<%
int Msg=1;
String ReportName="-",Description="-",Entby="-",Name="-",EmailID="-",Email1="-",FileName="-",Category="-";
String Priority="-",ClosingComments="-",ClosedBy="-",Status="-",PageName="-",Email2="-";
String ComplaintDateTime,UpadteDateTime;
String ContactNumber="-";
Boolean innerflag=false;
Boolean flag=false;
Writer output = null;
String issue = "", report = "";
String randomnumber="";
File savedFile;
int count1 = 0, count2 = 0, filecount = 0, count4 = 0, count5 = 0,complaintID=0;

String savefilestring="";
String[] filepath =new String[10];
String[] filename =new String[10];



System.out.println("\n\n on complaint insert page");
PageName=request.getParameter("PageName");
System.out.println("@@@@@@@@@@ "+PageName);
ReportName=request.getParameter("ReportName");
Description=request.getParameter("desc");
Entby="-";
System.out.println("@@@@@@@@@@ 71");
Name=fname;
EmailID="avlsupport@mobile-eye.in";
Email1=request.getParameter("EmailID");

ContactNumber=request.getParameter("Number");

System.out.println("@@@@@@@@@@ 78");

FileName=request.getParameter("Filename");
System.out.println("@@@@@@@@@@ 81");

String usertypevalue=session.getAttribute("empdept").toString();
System.out.println("@@@@@@@@@@ 84");
Category=request.getParameter("Category");
Priority=request.getParameter("Priority");
 ComplaintDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
 UpadteDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
ClosingComments="-";
ClosedBy="-";
Status="Pending";
String query="";
System.out.println("@@@@@@@@@@ 93");
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
System.out.println("\n\n ismultipart-->>"+isMultipart);
	if (!isMultipart) {
		System.out.println("\n\nin multipart..");
	} else {
		System.out.println("\n\n in else with  multipart..");
		FileItemFactory factory = new DiskFileItemFactory();
		//System.out.print("\n\nfactory==>"+factory);
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try {
			items = upload.parseRequest(request);
		//	System.out.print("\n\n items==>"+items);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Iterator itr = items.iterator();
	
	while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			if(item.isFormField()) 
			{
				String name = item.getFieldName();
				System.out.print("\n name==>"+name);
				String value = item.getString();
				System.out.print("\n value==>"+value);
				if(name.equals("ReportName")) 
				{
					ReportName = value;
					System.out.print("\nReport name==>"+ReportName);
					count1 = 1;
				}
				if(name.equals("desc")) 
				{
					Description = value;
					System.out.print("\n Description name==>"+Description);
					count1 = 1;
				}
				if(name.equals("Entby")) 
				{
					Entby = value;
					System.out.print("\n Entby name==>"+Entby);
					count1 = 1;
				}
				if(name.equals("UserName")) 
				{
					Name = value;
					//System.out.print("\n Name==>"+Name);
					count1 = 1;
				}
				if(name.equals("EmailID")) 
				{
					Email1 = value;
					//System.out.print("\nEmailID 1==>"+Email1);
					count1 = 1;
				}
				
				if(name.equals("Number")) 
				{
					ContactNumber = value;
					//System.out.print("\n ContactNumber==>"+ContactNumber);
					count1 = 1;
				}
				if(name.equals("Category")) 
				{
					Category = value;
					//System.out.print("\n Category==>"+Category);
					count1 = 1;
				}
				if(name.equals("Priority")) 
				{
					Priority = value;
					//System.out.print("\n ContactNumber==>"+Priority);
					count1 = 1;
				}
				if(name.equals("PageName"))
				{
					PageName=value;
					count1=1;
				}
				
				System.out.println("\n $$$$$$$$$$$$$ "+PageName);

			} else {
						try {

								String itemName = item.getName();
								System.out.print("\n\nitemName==>"+itemName);
								if(itemName.equalsIgnoreCase(""))
								{
								}
								else
								{
								 savedFile = new File(config.getServletContext().getRealPath("/")+"Complaints/"+itemName);
								System.out.print("\n\nsavedFile==>"+savedFile);
								item.write(savedFile);
								filepath[filecount]=""+savedFile;
								
								filename[filecount]=itemName;
								filecount++;
								if(saveflag==1)
								{
								 savefilestring=""+savedFile;
								 saveflag++;
								}
								else
									savefilestring=savefilestring+","+savedFile;
								 //out.print("successfully saved the file");
								//File file = new File(savedFile);
								String screenshot=savedFile.getAbsolutePath();
							System.out.println("\n\nscreenshot--->>>"+screenshot);
								}
						    	
  							
					} catch (Exception e) {
	      					e.printStackTrace();
	      				}
  			}
  		}
	
  	}
	
	System.out.println("***************   216");
	if(null!=Description || null!=Category || null!=Priority)
	{
   try {
	  	    System.out.println("Hii");
			
			Statement stmt=conn.createStatement();
			Statement st=conn.createStatement();
			if(null == ContactNumber || ContactNumber.length()==0)
			{
				System.out.println(ContactNumber);
				ContactNumber="-";
			}
			
			if(null == Email1 || Email1.length()==0)
			{
				System.out.println(Email1);
				Email1="-";
			}
			
			
			if(Email1.length()>1)
			{
		         Email2=email+","+Email1;
		         Email2=Email2.replace(",",", ");
			}
			else
			{
		  	     Email2=email;
			}

			
		    String sqlinsert="insert into db_gps.t_ComplaintDetail(ReportName,Description,EntBy,Name,EmailID,Email1,ContactNumber,FileName,Category,Priority,ComplaintDateTime,ClosingComment,ClosedBy,Status,Website,PageName) "+
			" values('"+ReportName+"','"+Description+"','"+Name+"','"+Name+"','"+EmailID+"','"+Email2+"','"+ContactNumber+"','"+savefilestring+"','"+Category+"','"+Priority+"','"+ComplaintDateTime+"','"+ClosingComments+"','"+ClosedBy+"','"+Status+"','Transworld','"+PageName+"')";	
			
			System.out.println("\n\nquery sqlinsert-->>"+sqlinsert);
			
			
		  
			int i=stmt.executeUpdate(sqlinsert);
			System.out.println("Successfully inserted");
			//System.out.println("\ni=>"+i);
			
			String sqlinsert1="insert into db_gps.t_historyComplaintDetail(ReportName,Description,EntBy,Name,EmailID,Email1,ContactNumber,FileName,Category,Priority,ComplaintDateTime,ClosingComment,ClosedBy,Status,Website,PageName) "+
			" values('"+ReportName+"','"+Description+"','"+Name+"','"+Name+"','"+EmailID+"','"+Email2+"','"+ContactNumber+"','"+savefilestring+"','"+Category+"','"+Priority+"','"+ComplaintDateTime+"','"+ClosingComments+"','"+ClosedBy+"','"+Status+"','Transworld','"+PageName+"')";	
			
			System.out.println("\n\nquery sqlinsert-->>"+sqlinsert1);
			//System.out.println("\n\nquery sqlinsert history table-->>"+sqlinsert1);
			
			
		  
			int k=stmt.executeUpdate(sqlinsert1);
			System.out.println("Successfully inserted");
			//System.out.println("\nk=>"+k);
			
			String datetimemail=new SimpleDateFormat("dd-MMM-yyyy HH:MM:SS").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ComplaintDateTime));
			
			if(i>0)
			{
				//System.out.println("\n\n i-->>"+i);
				innerflag=true;
			}
			String compid="select ComplaintID from db_gps.t_ComplaintDetail where ReportName='"+ReportName+"' AND Description='"+Description+"' AND EntBy='"+Name+"' AND Email1='"+Email2+"' AND ComplaintDateTime='"+ComplaintDateTime+"' AND ContactNumber='"+ContactNumber+"'";
			System.out.println(compid);
			ResultSet rss=stmt.executeQuery(compid);
			if(rss.next())
			{
				complaintID=rss.getInt("ComplaintID");
				//System.out.println("\n\n complaintID-->>"+complaintID);
			}
			//System.out.println("\n\n Complaint ID-->>"+complaintID);
			
			
			
	
			String comdate=new SimpleDateFormat("dd-MMM-yyyy HH:MM:SS").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ComplaintDateTime));
		
			String Data="<html><head></head><body>"+Name+",<br><br>Thank you for contacting us. This is an automated response confirming the receipt of your complaint. One of our team members will get back to you as soon as possible. "
						 +"<br>For your records, the details of the complaint are listed below. When replying, please make sure that the complaint ID is copied in the subject line to ensure that your replies are tracked appropriately."
			 			 +"<br></br><div style='width:40%; margin-left: 5%;'><table align='left' border='0' cellpadding='0' cellspacing='0' width='30%' style='background: white;'><tr><td width='40%' valign='top'><font size='3' face='Arial'><b>Complaint ID: </b></td><td width = '60%'>"+""
                         +complaintID+"</font></td></tr><tr><td width='40%' valign='top'><font size='3' face='Arial'><b>Description: </b></td><td width='60%'>"+""
                         +Description+"</font></td></tr><tr><td width='40%' valign='top'><font size='3' face='Arial'><b>Report Name: </b></td><td width='60%'>"+""
                         +ReportName+"</font></td></tr><tr><td width='40%' valign='top'><font size='3' face='Arial'><b>Category: </b></td><td width='60%'>"+""
                         +Category+"</font></td></tr><tr><td width='40%' valign='top'><font size='3' face='Arial'><b>Status: </b></td><td width='60%'>"+""
                         +"Pending </font></td></tr><tr><td width='40%' valign='top'><font size='3' face='Arial'><b>Priority: </b></td><td width='60%'>"+""
                         +Priority+"</font></td></tr><tr><td width='40%' valign='top'><font size='3' face='Arial'><b>Call Me Back: </b></td><td width='60%'>"+""
                         +ContactNumber+"</font></td></tr></table></div><br><br></div>"
                         +"<div style='width:100%; float:left;'>Regards,<br>Transworld Support Team.<br>"
                         +"Phone: 9120 41214444 <br>Email:  avlsupport@Mobile-Eye.in </div></body></html>";
						
			if(i>0){
				
				try{
					//innerflag=true;
					// flag=false;
					 if(innerflag==true)
					 {
								//System.out.println("in mail =>");
								
								Properties props = new Properties();
								 //String host="host.transworld.com";
				            	 String host="smtp.transworld-compressor.com";
				            	 String protocol = "smtp";
				            	// String user1 = "test";
				             	String user1 = "complaints@mobile-eye.in";
				             	  String pass = "transworld";
				             		props.put("mail.smtp.starttls.enable", "true");
				             		//props.put("mail.smtp.auth", "false");
				     				props.put("mail.smtp.auth", "true");
				     				props.put("mail.smtp.user", user1);
				     				props.put("mail.smtp.password", pass);
				     				props.put("mail.store.protocol", protocol);
				     				props.put("mail.smtps.host", host);
				            		 props.put("mail.smtps.host", host);
						       	       java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
						       	  Session session1 = Session.getDefaultInstance(props, null);
					               // Construct the message
					               Message msg = new MimeMessage(session1);
						              // Construct the message
					              	  String subjectstr="Transworld Complaint ID: "+complaintID+" , Received from  "+Name+""; 
						              //String subjectstr="Test mail please Ignore."; 
					               		msg.setSubject(subjectstr);
					               	msg.setSentDate(new java.util.Date());
					                 	String[] tokens1=Email1.split(",");
					            	   Address recipientAddrs[] = new InternetAddress[1];
					            	   Address recipientAddrs1[];
					            	   System.out.println(Email1.length());
					            	   if(Email1.length()>1)
						             	{
					            		   System.out.println("-");
					            		   recipientAddrs1 = new InternetAddress[tokens1.length+2];
						             	}
					            	   else
					            	   {
					            		   System.out.println("not -");
					             	  recipientAddrs1 = new InternetAddress[2];
					            	   }
					            	   
					             	recipientAddrs[0] = new InternetAddress(email);
					              
					             	recipientAddrs1[0] = new InternetAddress("avlsupport@mobile-eye.in");
					               recipientAddrs1[1] = new InternetAddress("p_khedkar@transworld-compressor.com");
					             	
					               if(Email1.length()>1)
					             	{
					             		
					             		int a1=2;
					             		 for (int a=0;a<tokens1.length;a++)
					                     {
					             			 //System.out.println("Hii");
					             			 try{
					             			recipientAddrs1[a1] = new InternetAddress(tokens1[a]);
					             			//System.out.println("in Email "+recipientAddrs1[a1]);
					             			a1++;
					             			 }catch(Exception e)
					             			 {
					             				// System.out.println(e);
					             				 e.printStackTrace();
					             			 }
					                     }
					             	}
					           
					               msg.addRecipients(Message.RecipientType.TO,recipientAddrs);
					               msg.addRecipients(Message.RecipientType.CC,recipientAddrs1);
					               Address fromAddress=new InternetAddress("avlsupport@mobile-eye.in","Transworld"); // in second "", it is short name
					             
					               msg.setFrom(fromAddress);
					          // Create the message part 
					              BodyPart messageBodyPart = new MimeBodyPart();

					              // Fill the message
					              messageBodyPart.setText(Data); 
					              messageBodyPart.setContent(Data,"text/html");

					              Multipart multipart = new MimeMultipart();
					              multipart.addBodyPart(messageBodyPart);
                                //  System.out.println("\n\n html--->>"+Data);
					                if(filecount==0)
					                {
					                	
							              messageBodyPart.setContent(Data,"text/html");
								        
								msg.setContent(multipart);
								
								//--------------------------- end of logic---------------------------------
								
								
								
						
								msg.saveChanges(); // don't forget this
														    				
					                }
					                else  // file present
					                {
					              
					               for (int j=0;j<filecount; j++)
					               {
					                 messageBodyPart = new MimeBodyPart();
					                 DataSource source = new FileDataSource(filepath[j]);
					                 messageBodyPart.setDataHandler(new DataHandler(source));
					                 messageBodyPart.setFileName(filename[j]);
					                  multipart.addBodyPart(messageBodyPart);
					                 msg.setContent(multipart);
					                 msg.saveChanges();
					                    
			                          }         
					               
					             //  System.out.println("attached data ");
					           }
					               Transport t = session1.getTransport("smtps");
					           
					      
				               try
				               {
				            	  
				                    t.connect(host, user1, pass);
				                    t.sendMessage(msg, msg.getAllRecipients());
				                    flag=true;
				                    System.out.println("Your message has been sent");
				               }
				               catch(Exception e)
				               {
				                   //System.out.print("Exception----->"+e);
				                  
				               } 
				               finally 
				               {
				                   t.close();
				               } 
				          		
				               Transport.send(msg);
				          	               
						}
				}
				catch(Exception e){
							
						}        		              
				 }
					       
			
				


	

								%>
	<div
		style="background: #E6E6E6; font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em; color: red; width: 45%; margin-left: 25%">
		<blink> Thank You for your support request.</blink>
	</div>
	<br>
	<form name="incident" style="background: #F5F5F5;" method="get">
		<br></br>
		<table align="center" border="0" cellpadding=0 cellspacing=0
			width="40%" style="background: #F5F5F5; margin-left: 25%;">
			<tr>
				<td><div align="center">
						<font size="3"><b> Your Complaint ID :<%=complaintID %>
						</b></font>
					</div></td>
			</tr>
			<tr>
		</table>
		<br></br>
		<table align="center" border="1" cellpadding=0 cellspacing=0
			width="40%" style="background: #F5F5F5; margin-left: 25%;">
			<tr>
				<td width="15%"><font size="2" face="Arial"><b> User
							Name </b></font></td>
				<td width="25%"><font size="2" face="Arial"><%=Name %></font></td>
			</tr>
			<tr>
				<td width="15%"><font size="2" face="Arial"> <b>Email
							Id </b></font></td>
				<td width="25%"><font size="2"><%=Email1 %></font></td>
			</tr>

			<tr>
				<td width="15%"><font size="2" face="Arial"> <b>Category
					</b></font></td>
				<td width="25%"><font size="2" face="Arial"><%=Category %></font></td>
			</tr>
			<tr>
				<td width="15%"><font size="2" face="Arial"> <b>Website</b></font></td>
				<td width="25%"><font size="2" face="Arial"> Transworld</font></td>
			</tr>
			<tr>
				<td width="15%"><font size="2" face="Arial"><b>
							Priority </b></font></td>
				<td width="25%"><font size="2" face="Arial"><%=Priority %></font></td>
			</tr>
			<tr>
				<td width="15%"><font size="2" face="Arial"> <b>Report
							Name </b></font></td>
				<td width="25%"><font size="2" face="Arial"><%=ReportName %></font></td>
			</tr>
			<tr>
				<td width="15%"><font size="2" face="Arial"><b>Call
							me back</b></font></td>
				<td width="25%"><font size="2" face="Arial"><%=ContactNumber %></font></td>
			</tr>
			<tr>
				<td width="15%" valign="top"><font size="2" face="Arial">
						<b>Description </b>
				</font></td>
				<td width="25%"><font size="2" face="Arial"><%=Description %></font></td>
			</tr>

		</table>
		<br>
		<table align="center" border="0" cellpadding=0 cellspacing=0
			width="40%" style="background: #F5F5F5; margin-left: 25%;">
			<tr>
				<td align="center">
					<div align="justify">
						<font size="2" color="green" face="Arial"><br></br>
						<p>
								We will revert to you within 2 working days.<br>In case you
								need urgent assistance, <b>please note down your Complaint
									ID </b>and contact us on 020-41214444 or mail us on
								avlsupport@mobile-eye.in
							</p></font>
					</div>
				</td>
			</tr>
		</table>
		<br>

		<table align="center" border="0" cellpadding=0 cellspacing=0
			width="40%" style="background: #F5F5F5; margin-left: 25%;">
			<tr>
				<td valign="bottom" align="center" colspan="2">
					<div>
						<input type="submit" id="OK" name="OK" value="OK"
							onclick="window.close();" />
					</div>
				</td>
			</tr>
		</table>
		<br>
	</form>
	<%
	//count++;
   }
   catch(Exception e)
   {
	  
            e.printStackTrace();
            response.sendRedirect("RegisterComplaint.jsp?desc="+Description+"&email="+Email1+"&Msg="+Msg+"&PageName1="+PageName+"&Number="+ContactNumber+"&Category="+Category+"&Priority="+Priority);
            
   }
	}
		%>
</body>
</html>
