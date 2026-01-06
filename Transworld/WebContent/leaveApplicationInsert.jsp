<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*" %>
    <%@ include file="header.jsp" %>
    <%@ page language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<script>
function Redirect()
{
	alert("Leave Data Is Present In System ");
    window.location=" leaveapplication.jsp?inserted=no";
	
}
</script>
<body>
<%



String DaysApplied=request.getParameter("DaysApplied");
out.println("DaysApplied*********"+DaysApplied);

System.out.println("DaysApplied*********"+DaysApplied);

String FirstDayOfLeave=request.getParameter("FirstDayOfLeave");
String CurrentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm")
.format(new java.util.Date());

String FirstDayOfLeave1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(FirstDayOfLeave));
System.out.println("FirstDayOfLeave1*********"+FirstDayOfLeave1);


out.println("FirstDayOfLeave************"+FirstDayOfLeave);

System.out.println("FirstDayOfLeave*********"+FirstDayOfLeave);

String reason=request.getParameter("reason");
System.out.println("reason**********"+reason);
if(reason.equals("Local Travel") || reason.equals("Outstation Travel") || reason.equals("Work From Home") ){
	reason="Office Work";
}
System.out.println("reason after **********"+reason);
String reasonForLeave=request.getParameter("reasonForLeave");
out.println("reasonForLeave*********"+reasonForLeave);
reasonForLeave=reasonForLeave.replace("'",""); //reasonForLeave.replace("\'","'");//
System.out.println("TYPE OF LEAVE  "+reasonForLeave);
String DateOfReporting=request.getParameter("DateOfReporting");


String DateOfReporting1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(DateOfReporting));

System.out.println("DateOfReporting111111111*********"+DateOfReporting1);

out.println("DateOfReporting*********"+DateOfReporting);




String emailAdd=request.getParameter("emailAdd");
out.println("emailAdd**********"+emailAdd);
String Details=request.getParameter("Details");
out.println("Details************"+Details);
String name=request.getParameter("name");

String HODemailAdd=request.getParameter("HODemailAdd");
out.println("HODemailAdd>>>>>>"+HODemailAdd);

String empid=request.getParameter("empid");
String reason2=request.getParameter("reason2");
out.println("reason2>>>>>>>>"+reason2);
String reason3=request.getParameter("reason3");
out.println("reason3>>>>>>>>>"+reason3);
String typeofleave="";
//String URole=session.getAttribute("urole").toString();
String URole=session.getAttribute("emprole").toString();
System.out.println("URole-->"+URole);
String typevalue=session.getAttribute("empdept").toString();
System.out.println("typevalue-->"+typevalue);
Boolean innerflag=false;
// Class.forName(MM_dbConn_DRIVER);
//Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5,stmt11,stgp;

//conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();
st4=conn.createStatement();
st5=conn.createStatement();
stmt11=conn.createStatement();
stgp=conn.createStatement();
java.util.Date d= new java.util.Date();
out.println(d);
String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
out.println(datetoday);


System.out.println("DateOfReporting*********"+DateOfReporting);
String s="select *   from  t_leaveadmin  where empid='"+empid+"'  and status='Yes'  ";
ResultSet rss=st.executeQuery(s);
System.out.println("-------s->>"+s);
String name1="";
if(rss.next())
{
	name1=rss.getString("Name");
}

System.out.println("-------deptid->>"+name1);
String validleave="select * from t_leaverequest where firstdayofleave='"+FirstDayOfLeave1+"' and dateofreporting='"+DateOfReporting1+"' and name='"+name1+"' and (status='Approved' or status='Pending' )  ";
System.out.println("validleave *********"+validleave);
ResultSet rsvalidleave=st4.executeQuery(validleave);

if(!rsvalidleave.next())
{
	System.out.println("In Valid ");
	//response.sendRedirect("leave application.jsp?inserted=present");

String Logo1="";
DateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
java.util.Date date = new java.util.Date();
String Website="http://twtech.in/Transworld/";
String getEmailDetails="select * from db_gps.t_EmailReportSettings where `System`='ERP' ";
ResultSet rs11=stmt11.executeQuery(getEmailDetails);
String q2 = "";
while(rs11.next())
{
	Logo1=rs11.getString("Logo1");
}


String anotherdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(FirstDayOfLeave1));
String lastdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(DateOfReporting1));
System.out.println(FirstDayOfLeave+"    "+anotherdate);
System.out.println(lastdate);
Boolean flag=false;
int days=0;
String noOfDays="";
String sql1="select TO_DAYS('"+FirstDayOfLeave+"')-TO_DAYS('"+datetoday+"') as days";
ResultSet rs=st1.executeQuery(sql1);
if(rs.next()){
	days=rs.getInt("days");
	System.out.println(days);
	if(days>0){
		noOfDays="leave has been applied "+days +" days in advance";
	}else{
		noOfDays="";
	}
}
String sql="insert into t_leaverequest(daysapplied,firstdayofleave,typeofleave,reasonforleave,dateofreporting,emailid,details,status,HOD,name,inserteddatetime,TypeValue,URole) values ('"+DaysApplied+"','"+FirstDayOfLeave1+"','"+reason+"','"+reasonForLeave+"','"+DateOfReporting1+"','"+emailAdd+"','"+Details+"','Pending','"+HODemailAdd+"','"+name+"','"+datetoday+"','"+typevalue+"','"+URole+"')";
out.println("sql--->"+sql);
//String Data=name+", "+typevalue+" has applied for leave to be approved as follows: "+"<html><body>"+"<table border="+1+"><tr><td><b>Days applied</b></td><td>"+DaysApplied+"</td></tr><tr><td><b>First Day of leave</b></td><td>"+anotherdate+"</td></tr><tr><td><b>Type Of Leave</b></td><td>"+reason+"</td></tr><tr><td><b>Reason for leave </b></td><td>"+reasonForLeave+"</td></tr><tr><td><b>Date when reporting / reported</b></td><td>"+lastdate+"</td></tr></table>"+"\n"+noOfDays+""+ "\n<table><tr><td> <a href='http://www.myfleetview.com/Transworld'>www.myfleetview.com/Transworld</td></tr><table> ";
String Data="";
String subject="";
if(reason.contains("Office work"))
{
	Data = Data + "<html><head><body><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f1f8ee;}</style> </head>"+
	"<body><table    border=^18^  bordercolor=^#E6E6FA^ align=^center^ width=^80%^><tr align=^center^><td align=^left^ style=^border: 0px;^ width=^100%^>"+
	"<table  style=^margin-left: 1em;margin-right: 1em;width: 100%;height: 100%;^><tr><td width=^100%^><table width = ^97%^ ><tr><td><a href=^http://www.mobile-eye.in^ target=^_blank^>"+
	"<img src="+Logo1+" style=^height: 70px; width: 400px;^  title=^Mobile-eye^ id=^logo^ alt=^Logo^ /></a></td></tr></table><font style=^color: #D8D8D8^>"+
	"________________________________________________________________________________________________________________________________________________</font><br><div width = ^100%^><font size = ^3^ face = ^Arial^>"+
	" <u><a href="+Website+">"+Website+"</a></u>&nbsp;"+ df.format(date) +"<br>"+heading+"</font><table><tr><td align = center style = ^margin-left:20px;^>";
	Data= Data + "<tr><td><table align=left  cellpadding=0 cellspacing=0 width=170% border=0><tr><td align=left><font size=3 face=arial></br>"+name+", has applied for leave to be approved as follows: </font></br></td></tr></table></td></tr>"+
	"<tr><td><table align=left  cellpadding=10 cellspacing=5 width=90% border=1 style=^border-collapse: collapse^>"+
"<tr bgcolor=^#ADDFFF^><td align=center style=^width: 8%;^><font size=^2^ face=^arial^><b> Days Applied  </b></font></td>"+
"<td align=center style=^width: 8%;^><font size=^2^ face=^arial^><b>  First Day Of Travel </b></font></td>"+
"<td align=center style=^width: 10%;^><font size=^2^ face=^arial^><b> Type </b></font></td>"+
"<td align=center style=^overflow: auto; width: 25%;height: 50%^><font size=^2^ face=^arial^><b> Reason  </b></font></td>"+
"<td align=center style=^width: 8%;^><font size=^2^ face=^arial^><b> Reporting Date  </b></font></td>";

Data= Data + "<tr><td align=right><font size=^2^ face=^arial^>"+DaysApplied+"</font></td>"+
			"<td align=right><font size=^2^ face=^arial^>"+anotherdate+"</font></td>"+
			"<td align=left><font size=^2^ face=^arial^>"+reason+"</font></td>"+
			"<td align=left><font size=^2^ face=^arial^>"+reasonForLeave+"</font></td>"+ 
			"<td align=right><font size=^2^ face=^arial^>"+lastdate+"</font></td>";
Data= Data + "</tr></table><br/></br>";
Data= Data+"</br></br></br></br></br>";
Data = Data + "<tr><td align = left><table align= left><br></br><tr><td><font size=^3^ face=^Arial^>Transworld Team</font></td></tr><tr><td><font size=^3^ face=^Arial^>Phone: +91-20-41214444  +91-9762007124 +91-9762007125</font></td></tr><tr><td></td></tr><tr><td><font size=^3^ face=^Arial^>Copyright @2008 by Transworld Technologies Ltd. All Rights Reserved.</font></td></tr></table></td></tr></table></div></td></tr></table></td></tr></table></body></html>";
	
subject="Travel Application of "+name+" on "+df.format(date)+".";
//	Data=name+", "+typevalue+" has applied for leave to be approved as follows: "+"<html><body>"+"<table border='1' cellpadding='0' cellspacing='0'><tr><td><b>Days applied</b></td><td>"+DaysApplied+"</td></tr><tr><td><b>First Day of Travel</b></td><td>"+anotherdate+"</td></tr><tr><td><b>Type</b></td><td>"+reason+"</td></tr><tr><td><b>Reason</b></td><td>"+reasonForLeave+"</td></tr><tr><td><b>Date when reporting / reported</b></td><td>"+lastdate+"</td></tr></table>"+"\n"+noOfDays+""+ "\n<table><tr><td> <a href='http://www.myfleetview.com/Transworld'>www.myfleetview.com/Transworld</td></tr><table> ";
}
else
{
	Data = Data + "<html><head><body><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f1f8ee;}</style> </head>"+
	"<body><table    border=^18^  bordercolor=^#E6E6FA^ align=^center^ width=^80%^><tr align=^center^><td align=^left^ style=^border: 0px;^ width=^100%^>"+
	"<table  style=^margin-left: 1em;margin-right: 1em;width: 100%;height: 100%;^><tr><td width=^100%^><table width = ^97%^ ><tr><td><a href=^http://www.mobile-eye.in^ target=^_blank^>"+
	"<img src="+Logo1+" style=^height: 70px; width: 400px;^  title=^Mobile-eye^ id=^logo^ alt=^Logo^ /></a></td></tr></table><font style=^color: #D8D8D8^>"+
	"________________________________________________________________________________________________________________________________________________</font><br><div width = ^100%^><font size = ^3^ face = ^Arial^>"+
	" <u><a href="+Website+">"+Website+"</a></u>&nbsp;"+ df.format(date) +"<br>"+heading+"</font><table><tr><td align = center style = ^margin-left:20px;^>";
	Data= Data + "<tr><td><table align=left  cellpadding=0 cellspacing=0 width=170% border=0><tr><td align=left><font size=3 face=arial></br>"+name+", has applied for leave to be approved as follows: </font></br></td></tr></table></td></tr>"+
	"<tr><td><table align=left  cellpadding=10 cellspacing=5 width=90% border=1 style=^border-collapse: collapse^>"+
"<tr bgcolor=^#ADDFFF^><td align=center style=^width: 8%;^><font size=^2^ face=^arial^><b> Days Applied  </b></font></td>"+
"<td align=center style=^width: 8%;^><font size=^2^ face=^arial^><b> First Day Of Leave </b></font></td>"+
"<td align=center style=^width: 10%;^><font size=^2^ face=^arial^><b> Type Of Leave </b></font></td>"+
"<td align=center style=^overflow: auto; width: 25%;height: 50%^><font size=^2^ face=^arial^><b> Reason For Leave  </b></font></td>"+
"<td align=center style=^width: 8%;^><font size=^2^ face=^arial^><b> Reporting Date  </b></font></td>";

Data= Data + "<tr><td align=right><font size=^2^ face=^arial^>"+DaysApplied+"</font></td>"+
			"<td align=right><font size=^2^ face=^arial^>"+anotherdate+"</font></td>"+
			"<td align=left><font size=^2^ face=^arial^>"+reason+"</font></td>"+
			"<td align=left><font size=^2^ face=^arial^>"+reasonForLeave+"</font></td>"+
			"<td align=right><font size=^2^ face=^arial^>"+lastdate+"</font></td>";
Data= Data + "</tr></table><br/></br>";
Data= Data+"</br></br></br></br></br>";
Data = Data + "<tr><td align = left><table align= left><br></br><tr><td><font size=^3^ face=^Arial^>Transworld Team</font></td></tr><tr><td><font size=^3^ face=^Arial^>Phone: +91-20-41214444  +91-9762007124 +91-9762007125</font></td></tr><tr><td></td></tr><tr><td><font size=^3^ face=^Arial^>Copyright @2008 by Transworld Technologies Ltd. All Rights Reserved.</font></td></tr></table></td></tr></table></div></td></tr></table></td></tr></table></body></html>";

subject="Leave Application of "+name+" on "+df.format(date)+".";	
//	Data=name+", "+typevalue+" has applied for leave to be approved as follows: "+"<html><body>"+"<table border='1' cellpadding='0' cellspacing='0'><tr><td><b>Days applied</b></td><td>"+DaysApplied+"</td></tr><tr><td><b>First Day of leave</b></td><td>"+anotherdate+"</td></tr><tr><td><b>Type Of Leave</b></td><td>"+reason+"</td></tr><tr><td><b>Reason for leave </b></td><td>"+reasonForLeave+"</td></tr><tr><td><b>Date when reporting / reported</b></td><td>"+lastdate+"</td></tr></table>"+"\n"+noOfDays+""+ "\n<table><tr><td> <a href='http://www.myfleetview.com/Transworld'>www.myfleetview.com/Transworld</td></tr><table> ";

}

int i=0;
i=st.executeUpdate(sql);
if(i>0){
	out.println("leave added");
	innerflag=true;
	try{

		 flag=false;
		 if(innerflag==true)
		 {
			
		          //    Properties props = new Properties();
		           //   String host="smtp.transworld-compressor.com";
		           /* old code
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
		              Session session1 = Session.getDefaultInstance(props, null);
		              */
		              
		              
		              
		              
		              
		          /*    String host = "a.mobileeye.in";
		              
                      String protocol = "smtp";
 
                    final  String user = "9100";
                    final String pass = "transworld";
 
                      props.put("mail.smtp.starttls.enable", "true");
                      props.put("mail.smtp.auth", "true");
                      props.put("mail.smtp.user", user);
                      props.put("mail.smtp.password", pass);
                      props.put("mail.store.protocol", protocol);
                      props.put("mail.smtp.host", "a.mobileeye.in");
                      props.put("mail.smtp.port", "25"); */
                        
                        
                        
                   /*     java.security.Security.addProvider(new
 com.sun.net.ssl.internal.ssl.Provider());
                       Session session1 = Session.getDefaultInstance(props,
 null);
                               
                               session1 = Session.getInstance(props,
                                                 new javax.mail.Authenticator() {
 
                                                     protected PasswordAuthentication
 getPasswordAuthentication() {
                                                         return new PasswordAuthentication(user,
 pass);
                                                     }
                                                 });
 
                                       session1.setDebug(true);  */
		              
		              
		               // Construct the message
		         /*      Message msg = new MimeMessage(session1);
		               if(reason.contains("Office work"))
		               { 
		            	   msg.setSubject("Travel Application of "+name);
		               }
		               else 
		               {
		            	   msg.setSubject("Leave Application of "+name);
		               }
		               msg.setSentDate(new java.util.Date());
		               Address recipientAddrs[] = new InternetAddress[1];
		               Address recipientAddrs1[] = new InternetAddress[1];
		               recipientAddrs[0] = new InternetAddress(emailAdd);
		               recipientAddrs1[0] = new InternetAddress(HODemailAdd);
		               msg.addRecipients(Message.RecipientType.TO,recipientAddrs1);
		               msg.addRecipients(Message.RecipientType.CC,recipientAddrs);
		               Address fromAddress=new InternetAddress("noreply@transworld-compressor.com","Transworld"); // in second "", it is short name
		          
		               msg.setFrom(fromAddress);
		               msg.setContent(Data+"<br> Thanks and Regards" ,"text/html; charset=ISO-8859-1"); 
		               // Send the message
		               Transport t = session1.getTransport("smtps");
		               msg.saveChanges(); // don't forget this  */
		               try
		               {
		            	  //String toid="s_amol@transworld-compressor.com";
		            	  //String tocc="r_kunjir@transworld-compressor.com";
		            	  
		                 //   t.connect(host, user, pass);
		                  //  t.sendMessage(msg, msg.getAllRecipients());
		                  q2 = "insert into db_GlobalERP.t_allpendingmailtableERP(MailName,Description,MailBody,subjectline,Toid,Tocc,EntryDateTime,MailStatus,SenderName) values ('Transworld','Mail for Leave Application','"
									+ Data
									+ "','"
									+ subject
									+ "','"
									+ HODemailAdd
									+ "','"
									+ emailAdd
									+ "','"
									+ CurrentDate + "','Pending','Transworld')";
		                  
		                  System.out.println("q2All_PendingMail>>>> :" + q2);
							stgp.executeUpdate(q2);
							
							System.out
							.println("inserted in all pending mail >>> 1234");
		                    flag=true;
		                    System.out.println("Your message has been sent");
		               }/*catch(SMTPSendFailedException smp) 
		               {
		            	   System.out.print("Error:--"+smp.getCommand()+smp.getReturnCode());
		               }*/
		               catch(Exception e)
		               {
		                   System.out.print("Exception----->"+e);
		                  
		               } 
		               finally 
		               {
		                  // t.close();
		               } 
		          		
		              // Transport.send(msg);
		          				               
		              // Transport.send(msg1);
 
		              
		 }//if innerflag
		       
	}catch(Exception e){
		
	}
	response.sendRedirect("leaveapplication.jsp?inserted=yes");
}else{
	response.sendRedirect("leaveapplication.jsp?inserted=no");
}
}
else
{
	response.sendRedirect("leaveapplication.jsp?inserted=present");
}

%>
</body>
</html>
