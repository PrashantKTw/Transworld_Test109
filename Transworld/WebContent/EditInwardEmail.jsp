<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.*"%>
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

<%@page import="com.sun.activation.registries.MailcapParseException"%><html>
<head>
<title></title>
</head>
<body
	onload="window.opener.location.reload();setTimeout('self.close()',5);">
	<% 
String getMsg="";
try
{
	String inrefno=request.getParameter("inrefno");
	String inno=request.getParameter("inno");
	String from=request.getParameter("from");
	String prno=request.getParameter("prno");
	String to=request.getParameter("to");
	String dept=request.getParameter("dept");
	String cat=request.getParameter("cat");
	String rd=request.getParameter("rd");
	String itemName=request.getParameter("itemName");
	String sub=request.getParameter("sub");
	String data=request.getParameter("data");
	String completePath=request.getParameter("completePath");
	String priority=request.getParameter("priority");
	String docPath=request.getParameter("docPath");
	String AllFileNames=request.getParameter("AllFileNames");
	String address=request.getParameter("address");
	String manualref=request.getParameter("manualref");
	
	String frmMail=request.getParameter("frmMail");
	String senderMail="";
	Statement st=null;
	int recvrMailCnt=0;
	List <String> l1=new ArrayList();
	try
	{
		st=conn.createStatement();
		String sqlMail="select Email from t_leaveadmin where EmpID='"+frmMail+"'";
		ResultSet rsMail=st.executeQuery(sqlMail);
		if(rsMail.next())
		{
			senderMail=rsMail.getString("Email");
		}
		
		
		String delims12 = "[,]";
	    String[] tokens12 = to.split(delims12);
		for (String t : tokens12)
		{
			l1.add(t);
			recvrMailCnt++;
		}
	}
	catch(Exception e)
	{
		System.out.println("SenderMail-->"+e);
	}
	//================================================================
	String remark=request.getParameter("remark");
	String blno=request.getParameter("blno");
	String blamt=request.getParameter("blamt");
	String bldate=request.getParameter("bldate");
	String blduedate=request.getParameter("blduedate");
	//================================================================
	System.out.println(senderMail+"!!!!!!!!!!!!"+AllFileNames+"!!!!!!!"+recvrMailCnt+"!!!!!"+to);
	System.out.println("inwardEmail===>>>"+inno+"=="+inrefno+"==="+from+"==="+prno+"==="+to+"==="+dept+"===="+cat+"===="+rd+"===="+itemName+"===="+data+"==="+sub+"==="+completePath+"====="+priority+"==="+docPath+"==="+AllFileNames+"====="+remark+"==="+blno+"==="+blamt+"==="+bldate+"==="+blduedate);
	//===Store Values in DB=========================================
	String sqlInsert="",sqlInsert1="";
	/*java.util.Date today = new java.util.Date();
	String todaydate=new SimpleDateFormat("yyyy-MM-dd").format(today);
	String todaytime=new SimpleDateFormat("HH:mm:ss").format(today);
*/
DateFormat df1=new SimpleDateFormat("yyyy-MM-dd");
DateFormat df2=new SimpleDateFormat("dd-MMM-yyyy");

java.util.Date today = new java.util.Date();
String todaydate=new SimpleDateFormat("yyyy-MM-dd").format(today);
String todaytime=new SimpleDateFormat("HH:mm:ss").format(today);

			try
				{
						   if(!(cat.equals("Bills")))
				   		   {
				   				bldate="00-00-0000";
				   				blduedate="00-00-0000";
				   		   }
						   else
						   {
						   try
						   {
							   bldate=df1.format(df2.parse(bldate));
							   blduedate=df1.format(df2.parse(blduedate));
						   }
						   catch(Exception e)
						   {
							   System.out.println("Date Parse--->>"+e);
							   e.printStackTrace();
						   }
						   }
						
						   sqlInsert="update db_leaveapplication.t_inwarddetails set ManualRef='"+manualref+"', FromParty='"+from+"', PartyRefNo='"+prno+"', Address='"+address+"', Subject='"+sub+"', Category='"+cat+"', BillNo='"+blno+"', BillAmt='"+blamt+"', BillDate='"+bldate+"', BillDueDate='"+blduedate+"', ActionDate='"+data+"', senderRemark='"+remark+"', InwrdPriority='"+priority+"' where InwardRefNo='"+inrefno+"'";
						   int w=st.executeUpdate(sqlInsert);
						   System.out.println(sqlInsert);
						   sqlInsert1="INSERT INTO db_leaveapplication.t_inwarddetailshistory (InwardRefNo,ManualRef ,InwardDate ,InwardTime ,FromParty ,PartyRefNo ,Address,Subject ,Dept ,Category,BillNo,BillAmt,BillDate,BillDueDate,Enteredby, EnteredById ,EmailSend, ActionDate,senderRemark,InwrdPriority,InwardStatus)VALUES('"+inrefno+"','"+manualref+"' ,'"+todaydate+"' , '"+todaytime+"' , '"+from+"', '"+prno+"', '"+address+"','"+sub+"', '"+dept+"', '"+cat+"','"+blno+"','"+blamt+"','"+bldate+"','"+blduedate+"','"+session.getAttribute("empname").toString()+"', '"+session.getAttribute("empID").toString()+"' ,'Yes','"+data+"','"+remark+"','"+priority+"','inwarded')";
						   st.executeUpdate(sqlInsert1);
						   
						   String sqlUpdt="update db_leaveapplication.t_inwardfollowup set ManualRef='"+manualref+"', senderRemarks='"+remark+"' where iwrefno='"+inrefno+"'";
						   int r=st.executeUpdate(sqlUpdt);
						   System.out.println(sqlUpdt);
						   
						   getMsg="Records Updated Successfully";
				}
				catch(Exception e)
				{
					getMsg="Unable To Update Record";
					System.out.println("DB Insert--->>"+e);
					e.printStackTrace();
				}
	
	//====Send Mail if Link or Attch==================================
						        try
						       {
						             String Data="";
						             Data="Document "+inrefno+" is Updated.\n Please find the details.\n\n";
						             Properties props = new Properties();
						         //    String host="smtp.transworld-compressor.com";
						         String host="smtpout.secureserver.net";
						             String protocol="smtp";
						             String user="tripend@mobile-eye.in";
						     //     String user="jd@mobile-eye.in";
						             String pass="transworld";
						             props.put("mail.smtp.starttls.enable","true");
						             props.put("mail.smtp.auth", "true");
						             props.put("mail.smtp.user", "user");
						             props.put("mail.smtp.password", "pass");  
						             props.put("mail.store.protocol", protocol);
						           props.put("mail.smtps.host", host);
						    	//     props.put("mail.host", host);
						             java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
						             Session session1 = Session.getDefaultInstance(props,null);
						             // Construct the message
						              Message msg = new MimeMessage(session1);
						              msg.setSubject("New Document Subject:"+sub+"; From:"+from);
						              msg.setSentDate(new java.util.Date());
             						  out.println("==1===");
                                 		//  mail id-------------
                                //========================================================================= 	
                                	 Address recipientAddrs[] = new InternetAddress[1];
                                	 recipientAddrs[0] = new InternetAddress(senderMail);
                                	// System.out.println("recipientAddrs[0]-->>"+recipientAddrs[0]);
                                	 
						           Address recipientAddrs1[] = new InternetAddress[recvrMailCnt];
                                 	for(int k=0; k<recvrMailCnt; k++)
                                 	{
                                 		recipientAddrs1[k] = new InternetAddress(l1.get(k));
                                 		//System.out.println("recipientAddrs1[k]-->>"+recipientAddrs1[k]);
                                 	}
                                 //	Address recipientAddrs[] = new InternetAddress[1];
                                 	//recipientAddrs[0] = new InternetAddress("s_joshi@transworld-compressor.com");
                                 	
                                // 	Address recipientAddrs1[] = new InternetAddress[1];
                                 //	recipientAddrs1[0] = new InternetAddress("s_joshi@transworld-compressor.com");
						       //=========================================================================
						              msg.addRecipients(Message.RecipientType.TO,recipientAddrs);
						              msg.addRecipients(Message.RecipientType.CC,recipientAddrs1);
						          
						              Address fromAddress = new InternetAddress("noreply@transworld-compressor.com","ERP TW Doc"); // in
						         
						              msg.setFrom(fromAddress);
						              
						              // ------------ code for sending attachment------------------
              
							           // Create the message part
							              String urlFile=completePath;
							              BodyPart messageBodyPart = new MimeBodyPart();
						              // Fill the message
						              if(!(remark==null || remark==""))
						              {
						            	  if(manualref.equals("") || manualref.equalsIgnoreCase("NULL") || manualref=="" || manualref==null)
						            	  {
						            	  	messageBodyPart.setText(Data+"\nInward Ref.No.:"+inrefno+"\nFrom:"+from+"\nParty Ref.No.:"+prno+"\nSubject:"+sub+"\nCategory:"+cat+"\nAction Date:"+data+"\nPriority:"+priority+"\nRemark:"+remark+"\n\n Thanks and Regards,\n Transworld Team");
						            	  }
						            	  messageBodyPart.setText(Data+"\nInward Ref.No.:"+inrefno+"\nManual Ref:"+manualref+"\nFrom:"+from+"\nParty Ref.No.:"+prno+"\nSubject:"+sub+"\nCategory:"+cat+"\nAction Date:"+data+"\nPriority:"+priority+"\nRemark:"+remark+"\n\n Thanks and Regards,\n Transworld Team");
						              }
						              else
						              {
						            	  if(manualref.equals("") || manualref.equalsIgnoreCase("NULL") || manualref=="" || manualref==null)
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
    	   getMsg="Document Updated, but unable to send mail due to server side congetion";
       }
    	//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	//}
	//================================================================
	getMsg="Record Updated Successfully";
}
catch(Exception e)
{
	getMsg="Unable To Update Record";
	System.out.println("Exception=Inward Email======>>"+e);
}
finally
{
	conn.close();
	//response.sendRedirect("alertGoTo.jsp?msg="+getMsg+"&goto=inwardReport.jsp");
	//response.sendRedirect("alertGoTo.jsp?msg="+getMsg+"?  &goto=inwardReport.jsp");
	//response.sendRedirect("testIt.jsp?updateMsg="+getMsg);

%>
	<script language="JavaScript">
var a="<%=getMsg%>";
alert(a +"\n\n Please refresh Inward Report page to reflect changes.\n");


</script>
	<%
}
//response.sendRedirect("inwardReport.jsp");
//return;
%>
</body>
</html>