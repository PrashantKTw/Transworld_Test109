<%@ page
	import="java.util.Properties,javax.mail.*,javax.mail.internet.*"%>
<%@ include file="header.jsp"%>

<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%

String description=request.getParameter("desc").toString().replaceAll("'","");
String incidentDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("incidentDate")));
String dateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm").format( new Date());
String time=request.getParameter("hrs").toString()+":"+request.getParameter("mins").toString()+"";
String type=request.getParameter("type");
String category=request.getParameter("cat");
String location=request.getParameter("location");
String relTo=request.getParameter("relTo");
String assetId=request.getParameter("assetId");
String EmpNames=request.getParameter("EmpNames");
String SelectedEmpMail=request.getParameter("SelectedEmpMail");

Statement st,st1,st2,st3,stmt11;
st=conn.createStatement();
st1=conn.createStatement();
stmt11=conn.createStatement();
Statement stgp = conn.createStatement();
String CurrentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm")
.format(new java.util.Date());

int cmpId=0;
System.out.println("------------------------------"+EmpNames+"------------------"+SelectedEmpMail+"-------------------");

//int cmpId=0;
String complaintid="";
String s1="select max(complaintid) as complaintid from t_incidentdata ";
ResultSet rs1=st.executeQuery(s1);
if(rs1.next())
{
	complaintid=rs1.getString("complaintid");
}
/*
try
{
	
	if(!(complaintid.equals("") || complaintid==null))
	{
		cmpId=Integer.parseInt(complaintid);
		cmpId=cmpId+1;
		
		System.out.println("CmpID***********************************************>>"+cmpId);
	}
	else
	{
		cmpId=1;
	}
}
catch(Exception e)
{
	System.out.println("Exception----->>"+e);
}
*/
try
{
String sql="INSERT INTO  t_incidentdata (Description,TheDate,TheTime,Type,Category,spEscalation,location,relatedTo,assetId,EnteredBy,EnteredDateTime,Status) "+
		   " VALUES ('"+description+"','"+incidentDate+"','"+time+"','"+type+"','"+category+"','"+EmpNames+"','"+location+"','"+relTo+"','"+assetId+"','"+session.getAttribute("empname")+"','"+dateTime+"','Pending')  ";
System.out.println("============>>"+sql);
st.executeUpdate(sql);
//=====Insert into History================
String sqlCmpid="select max(complaintid) as complaintid from t_incidentdata";
	ResultSet rsCmp=st1.executeQuery(sqlCmpid);
	if(rsCmp.next())
	{
		cmpId=rsCmp.getInt("complaintid");
		System.out.println("*********"+cmpId);
	}
String sqlHistory="INSERT INTO  t_incidenthistory (Description,TheDateTime,Type,Category,complaintid,spEscalation,location,relatedTo,assetId,EnteredBy,EnteredDateTime,Status) "+
		   "VALUES('"+description+"','"+incidentDate+" "+time+"','"+type+"','"+category+"',"+cmpId+",'"+EmpNames+"','"+location+"','"+relTo+"','"+assetId+"','"+session.getAttribute("empname")+"','"+dateTime+"','Pending')";

System.out.println("============>>"+sqlHistory);
st.executeUpdate(sqlHistory); 
//========================================

System.out.println(description+" "+incidentDate +" "+time+"  "+type+"     "+category);

//******Send Mail********************************************************************************
DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
incidentDate=df123.format(df1234.parse(incidentDate));

Date d=new Date();
Format d2= new SimpleDateFormat("dd-MMM-yyyy HH:mm");
String incdReg=d2.format(d);

String sysAdmin="";
String hodMail="";
//====================================================================
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
		ResultSet rsMail=st.executeQuery(sqlMail);
		if(rsMail.next())
		{
			sysAdmin=rsMail.getString("systMail");
			hodMail=rsMail.getString("hodMail");
		}

//===================================================================
/*
String sqlSys="select * from t_incidentescalation where Category like '"+category+"'";
ResultSet rsCat=st.executeQuery(sqlSys);
if(rsCat.next())
{
	sysAdmin=rsCat.getString("EscSysAdmin");
	hodMail=rsCat.getString("EscHOD");
}
*/
String sql1="";
String Logo1="";
DateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
java.util.Date date = new java.util.Date();
String Website="http://myfleetview.com/Transworld";
String getEmailDetails="select * from db_gps.t_EmailReportSettings where `System`='ERP' ";
ResultSet rs=stmt11.executeQuery(getEmailDetails);
String q2 = "";
String tocc="r_maner@transworld-compressor.com";

while(rs.next())
{
	Logo1=rs.getString("Logo1");
}



	String Data="";		//+++++Send Mail+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// boolean flag=false;
			 try
				 {
						        	
						        
						        		
						        		Data = Data + "<html><head><body><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f1f8ee;}</style> </head>"+
										"<body><table    border=^18^  bordercolor=^#E6E6FA^ align=^center^ width=^80%^><tr align=^center^><td align=^left^ style=^border: 0px;^ width=^100%^>"+
										"<table  style=^margin-left: 1em;margin-right: 1em;width: 100%;height: 100%;^><tr><td width=^100%^><table width = ^97%^ ><tr><td><a href=^http://www.mobile-eye.in^ target=^_blank^>"+
										"<img src="+Logo1+" style=^height: 70px; width: 400px;^  title=^Mobile-eye^ id=^logo^ alt=^Logo^ /></a></td></tr></table><font style=^color: #D8D8D8^>"+
										"________________________________________________________________________________________________________________________________________________</font><br><div width = ^100%^><font size = ^3^ face = ^Arial^>"+
										" <u><a href="+Website+">"+Website+"</a></u>&nbsp;"+ df.format(date) +"<br>"+" Report No:-"+reportno+"</font><table><tr><td align = center style = ^margin-left:20px;^>";	
										Data= Data + "<tr><td><table align=left  cellpadding=0 cellspacing=0 width=170% border=0><tr><td align=left><font size=3 face=arial></br>New incident has been registered. </font></br></td></tr></table></td></tr>"+
										"<tr><td><table align=left  cellpadding=10 cellspacing=5 width=100% border=1 style=^border-collapse: collapse^>"+
									"<tr bgcolor=^#ADDFFF^><td align=center style=^width: 10%;^><font size=^2^ face=^arial^><b> Complaint ID  </b></font></td>"+
									"<td align=center style=^width: 8%;^><font size=^2^ face=^arial^><b>  Incident Time </b></font></td>"+
									"<td align=center style=^width: 8%;^><font size=^2^ face=^arial^><b> Incident Registered </b></font></td>"+
									"<td align=center style=^width: 10%;^><font size=^2^ face=^arial^><b> Incident Description  </b></font></td>"+
									"<td align=center style=^width: 10%;^><font size=^2^ face=^arial^><b> Incident Category  </b></font></td>"+
									"<td align=center style=^width: 10%;^><font size=^2^ face=^arial^><b> Location </b></font></td>"+
									"<td align=center style=^width: 10%;^><font size=^2^ face=^arial^><b> Type </b></font></td>"+
									"<td align=center style=^width: 10%;^><font size=^2^ face=^arial^><b> Related To </b></font></td>"+
									"<td align=center style=^width: 10%;^><font size=^2^ face=^arial^><b> Registered By </b></font></td>";
									
									Data= Data + "<tr><td align=right><font size=^2^ face=^arial^>"+cmpId+"</font></td>"+
									"<td align=right><font size=^2^ face=^arial^>"+incidentDate+"</font><br><font size=^2^ face=^arial^>"+time+"</font></td>"+
												"<td align=right><font size=^2^ face=^arial^>"+incdReg+"</font></td>"+
												"<td align=left><font size=^2^ face=^arial^>"+description +"</font></td>"+
								"<td align=left><font size=^2^ face=^arial^>"+category+"</font></td>"+
								"<td align=left><font size=^2^ face=^arial^>"+location+"</font></td>"+
								"<td align=left><font size=^2^ face=^arial^>"+type+"</font></td>"+
								"<td align=left><font size=^2^ face=^arial^>"+relTo+"</font></td>"+
								"<td align=left><font size=^2^ face=^arial^>"+session.getAttribute("empname")+"</font></td>";
								
								Data= Data + "</tr></table><br/></br>";
								
								
								Data= Data+"</br></br></br></br></br>";
								Data = Data + "<tr><td align = left><table align= left><br></br><tr><td><font size=^3^ face=^Arial^>Transworld Team</font></td></tr><tr><td><font size=^3^ face=^Arial^>Phone: +91-20-41214444  +91-9762007124 +91-9762007125</font></td></tr><tr><td><font size=^3^ face=^Arial^>Email: avlsupport@mobile-eye.in</font></td></tr><tr><td></td></tr><tr><td><font size=^3^ face=^Arial^>Copyright @2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</font></td></tr></table></td></tr></table></div></td></tr></table></td></tr></table></body></html>";
								
								String subject="Incident "+cmpId+" on "+df.format(date)+".";
								
								
							
								q2 = "insert into db_gps.t_allpendingmailtable(MailName,Description,MailBody,subjectline,Toid,Tocc,EntryDateTime,MailStatus,SenderName) values ('Incident Details','Mail for Incident Report','"
									+ Data
									+ "','"
									+ subject
									+ "','"
									+ session.getAttribute("email").toString()
									+ "','"
									+ tocc+","+SelectedEmpMail
									+ "','"
									+ CurrentDate + "','Pending','Transworld')";
								
								System.out.println("Tocc is"+ tocc+","+SelectedEmpMail);	
						        	
						        //	String vall = "Yes", vall11 = "Yes", vall22 = "Yes";
						        	

						/*			if (SelectedEmpMail != null
											&& !(SelectedEmpMail.equals(""))
											&& !(SelectedEmpMail.equals("-"))) {
										tocc = SelectedEmpMail;
										vall = "No";
									}
									
									if (SelectedEmpMail != null
											&& !(SelectedEmpMail.equals(""))
											&& !(SelectedEmpMail.equals("-"))) {
										if (vall.equalsIgnoreCase("No")) {
											tocc = tocc + "," + SelectedEmpMail;

										} else {
											tocc = SelectedEmpMail;

										}
										vall11 = "No";

									}   */
									
									

									
									
									System.out.println("q2All_PendingMail>>>> :" + q2);
									stgp.executeUpdate(q2);
									
									System.out
									.println("inserted in all pending mail >>> 1234");
									

						             
                 
              try
              {
                 
                 
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
                 
              } 
                       
             
                                                      
       }// end of inner try
       catch(Exception e)
       {
               System.out.println("Sorry, your mail cannot be sent due to Congestion----->"+e);
       }
    	//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

}
catch(Exception e1)
{
	System.out.println("Exception generateIncident.jsp------>>"+e1);
}
//***********************************************************************************************
response.sendRedirect("alertGoTo.jsp?msg=Incident saved and mail sent successfully  &goto=incidentDataReport.jsp");
%>
</body>
</html>