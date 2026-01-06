<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
</head>

<body
	onload="window.opener.location.reload();setTimeout('self.close()',5);">
	<%
System.out.println("==============");
out.println("==============");
String incidentDate=request.getParameter("incidentDate");
String complaintid=request.getParameter("complaintid");
String location=request.getParameter("location");
String relatedTo=request.getParameter("relatedTo");
String type=request.getParameter("type");
String category=request.getParameter("category");
String description=request.getParameter("description");
String incdtCmt=request.getParameter("incdtCmt").replace("'","");
String spEsc=request.getParameter("spEsc");
String assetId=request.getParameter("assetId");
String permanentSol=request.getParameter("permanentSol").replace("'","");
String incdntStat=request.getParameter("incdntStat");
String dateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format( new java.util.Date());
System.out.println(incdtCmt+"=============="+permanentSol);
//out.println(incdtCmt+"=============="+permanentSol);
try
{
	DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
	DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	incidentDate=df1234.format(df123.parse(incidentDate));	
	String dt1=incidentDate.substring(0, 10);
	String dt2=incidentDate.substring(11, incidentDate.length());
	
	String empName=session.getAttribute("empname").toString();
	
	Statement st=conn.createStatement();	
	
//	String sql="update t_incidentdata set updateComment='"+incdtCmt+"', permntSolution='"+permanentSol+"', Status='"+incdntStat+"' where complaintid='"+complaintid+"'";
	String sql="update t_incidentdata set updateComment='"+incdtCmt+"', permntSolution='"+permanentSol+"', Status='"+incdntStat+"', AttendedBy='"+empName+"' where complaintid='"+complaintid+"'";
	st.executeUpdate(sql);
	System.out.println("@@@@@@@@@@@@"+sql);
	//====Incident History=============================================
	String sqlHistory="INSERT INTO  t_incidenthistory (Description,TheDateTime,Type,Category,complaintid,spEscalation,location,relatedTo,assetId,EnteredBy,EnteredDateTime,updateComment,permntSolution,Status) "+
		   "VALUES('"+description+"','"+incidentDate+"','"+type+"','"+category+"','"+complaintid+"','"+spEsc+"','"+location+"','"+relatedTo+"','"+assetId+"','"+session.getAttribute("empname").toString()+"','"+dateTime+"','"+incdtCmt+"','"+permanentSol+"','"+incdntStat+"')";
	System.out.println("%%%%%%%%%%%"+sqlHistory);
	st.executeUpdate(sqlHistory);
	//=================================================================
	//*********************************************************************************
	try
	{
		String regMail="";
		String sqlReg="select a.Email, a.Name "+
			"from t_leaveadmin a "+
			"inner join( "+
			"select * from t_incidentdata "+ 
			"where complaintid='"+complaintid+"') b "+
			"on(a.Name=b.EnteredBy)";
		System.out.println(sqlReg);
		ResultSet rs1=st.executeQuery(sqlReg);
		if(rs1.next())
		{
			regMail=rs1.getString("Email");
		}
		
		
		String systAdmin="", systHod="";
		String sqlMail="select a.EscSysAdmin,a.Category,b.Empemail as systMail,a.EscHOD, c.Empemail as hodMail from "+ 
			"t_incidentescalation as a "+
			"inner join( "+
			"SELECT * FROM t_employee) b "+ 
			"on(b.EmpID=a.EscSysAdmin) "+
			"left outer join( "+
			"select * from t_employee)c "+
			"on(c.EmpID=a.EscHOD) "+
			"where a.Category='"+category+"'";
		System.out.println(sqlMail);
		ResultSet rsMail=st.executeQuery(sqlMail);
		if(rsMail.next())
		{
			systAdmin=rsMail.getString("systMail");
			systHod=rsMail.getString("hodMail");
		}
		System.out.println(systAdmin+"##################"+systHod+"#########"+regMail);
		String Data="";		//+++++Send Mail+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
								
	       						// boolean flag=false;
							        try
							       {
							             Data="Respected Sir/Madam,\n\nYour complaint has been "+incdntStat+".\n\nComplaint ID: "+complaintid+"\nIncident Time: "+incidentDate+"\n"+
							             "Incident Description: "+description+"\nIncident Category: "+category+"\nLocation: "+location+"\nType: "+type+"\nUpdate Comment: "+incdtCmt+"\nSolution: "+permanentSol+"\n\n";
							        	
							             Properties props = new Properties();
							           //  String host="smtp.transworld-compressor.com";
							           String host="smtpout.secureserver.net";
							             String protocol="smtp";
							             String user="tripend@mobile-eye.in";
							             String pass="transworld";
							             props.put("mail.smtp.starttls.enable","true");
							             props.put("mail.smtp.auth", "true");
							             props.put("mail.smtp.user", "user");
							             props.put("mail.smtp.password", "pass");  
							             props.put("mail.store.protocol", protocol);
							             props.put("mail.smtps.host", host);
							             java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
							             Session session1 = Session.getDefaultInstance(props,null);
							             // Construct the message
							              Message msg = new MimeMessage(session1);
							              msg.setSubject("Complaint Resolved . This is a autogenerated mail please do not reply to it.");
							              msg.setSentDate(new java.util.Date());
	             						out.println("==1===");
	                                 		//  mail id-------------
	                                //========================================================================= 
	                                	
	                                	System.out.println(systAdmin+"##################"+systHod);
	                                	
	                                 		Address recipientAddrs[] = new InternetAddress[1];
	                                     	//recipientAddrs[0] = new InternetAddress(session.getAttribute("email").toString());
	                                     	recipientAddrs[0] = new InternetAddress(regMail);
	                                     	msg.addRecipients(Message.RecipientType.TO,recipientAddrs);
	                                     	
	                                     		Address recipientAddrs1[] = new InternetAddress[2];
	                                         	recipientAddrs1[0] = new InternetAddress(systAdmin);//syst admin
	                                         	recipientAddrs1[1] = new InternetAddress(systHod);//his HOD
	                                         
	                                         	msg.addRecipients(Message.RecipientType.CC,recipientAddrs1);
	                                 	out.println("==2===");
							       //=========================================================================
							              
							              Address fromAddress = new InternetAddress("avlsupport@mobile-eye.in","AVL Support"); // in
							              msg.setFrom(fromAddress);
								              out.println("==3===");
								              BodyPart messageBodyPart = new MimeBodyPart();
							            	  out.println("==4===");
						            		  messageBodyPart.setText(Data+"\n Thanks and Regards,\n Transworld Team");
								              out.println("==5===");
								              Multipart multipart = new MimeMultipart();
								              multipart.addBodyPart(messageBodyPart);
					
									          // Part two is attachment
									   ///       messageBodyPart = new MimeBodyPart();
	              
	              	
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
	                //   flag=true; 
	                   System.out.println("Your message has been sent");
	              }
	            catch(Exception e)
	              {
	                  System.out.print("Exception----->"+e);
	                 
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
	               System.out.println("Sorry, your mail cannot be sent due to Congestion----->"+e);
	       }
	    	//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	}
	catch(Exception e)
	{
		System.out.println("Exception Mail Send=====>>"+e);
	} 
	//*********************************************************************************
}
catch(Exception e)
{
	System.out.println("Exception Incident DAta Insert=====>>"+e);
}
%>
</body>

</html>