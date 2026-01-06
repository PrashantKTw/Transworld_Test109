<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>application final</title>
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />

<script type="text/javascript">
</script>
</head>
<body>
	<%
String emp_id=request.getParameter("emp_id");
System.out.println("emp_id is **** :"+request.getParameter("emp_id"));

Connection conn=null;
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","erp","1@erp");
//conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","fleetview","F@5a<I86");
}
catch(Exception e)
{
	System.out.println("Exception=========>>"+e);
}

//for personal details*****************************************
String name=request.getParameter("name");
String add1=request.getParameter("add1");
String add2=request.getParameter("add2");
String add3=request.getParameter("add3");
String email=request.getParameter("email");
String gender=request.getParameter("gender");
String state=request.getParameter("state");
String city=request.getParameter("city");
String pin=request.getParameter("pin");
String contact=request.getParameter("contact");
String dd=request.getParameter("dd");
String mm=request.getParameter("mm");
String yyyy=request.getParameter("yyyy");
String occupation=request.getParameter("occupation");
String f_name=request.getParameter("f_name");
String dl_no=request.getParameter("dl_no");
String pass_no=request.getParameter("pass_no");
String pancard=request.getParameter("pancard");
try {  
	Statement st = conn.createStatement();
	System.out.println("query is:");
	String query = "update t_applicant_details SET Name='"+name+"',Address1='"+add1+"',Address2='"+add2+"',Address3='"+add3+"',EmailID='"+email+"',Gender='"+gender+"',State='"+state+"',City='"+city+"',Pincode='"+pin+"',ContactNo='"+contact+"',DateOfBirth='"+yyyy+"-"+mm+"-"+dd+"',FathersName='"+f_name+"',FathersOccupation='"+occupation+"',DriversLicenseNo='"+dl_no+"',PassportNo='"+pass_no+"',PanCard='"+pancard+"' where EmpID="+emp_id+"";
	st.executeUpdate(query);
	System.out.println("query is:"+query);

	
	//for educational qualiication*******************
String s_board=request.getParameter("s_board");
String s_year=request.getParameter("s_year");
String s_spe=request.getParameter("s_spe");
String s_marks=request.getParameter("s_marks");
String h_board=request.getParameter("h_board");
String h_year=request.getParameter("h_year");
String h_spe=request.getParameter("h_spe");
String h_marks=request.getParameter("h_marks");
String g_board=request.getParameter("g_board");
String g_year=request.getParameter("g_year");
String g_spe=request.getParameter("g_spe");
String g_marks=request.getParameter("g_marks");
String p_board=request.getParameter("p_board");
String p_year=request.getParameter("p_year");
String p_spe=request.getParameter("p_spe");
String p_marks=request.getParameter("p_marks");	

Statement st1 = conn.createStatement();
String query1 = "update t_empeduqualification SET Board='"+s_board+"',Year='"+s_year+"',Specialisation='"+s_spe+"',Marks_Percentage='"+s_marks+"' where EmpID="+emp_id+" AND Degree = 'S.S.C'";
st1.executeUpdate(query1);

Statement st2 = conn.createStatement();
String query2 = "update t_empeduqualification SET Board='"+h_board+"',Year='"+h_year+"',Specialisation='"+h_spe+"',Marks_Percentage='"+h_marks+"' where EmpID="+emp_id+" AND Degree = 'H.S.C'";
st2.executeUpdate(query2);

Statement st3 = conn.createStatement();
if(g_board!= null || g_board != "")
{
	String query3 = "update t_empeduqualification SET Board='"+g_board+"',Year='"+g_year+"',Specialisation='"+g_spe+"',Marks_Percentage='"+g_marks+"' where EmpID="+emp_id+" AND Degree = 'Graduation'";
	st3.executeUpdate(query3);
	System.out.println("in if");}
else {
	   
	System.out.println("in else");
}

Statement st4 = conn.createStatement();
if(p_board!= null || p_board != "")
{
	String query4 = "update t_empeduqualification SET Board='"+p_board+"',Year='"+p_year+"',Specialisation='"+p_spe+"',Marks_Percentage='"+p_marks+"' where EmpID="+emp_id+" AND Degree = 'Post Graduation'";
	st4.executeUpdate(query4);
}
else {
	
}

//for skills*************************************

String ms_office=request.getParameter("ms_office");
String windows=request.getParameter("windows");
String autocad=request.getParameter("autocad");
String tally=request.getParameter("tally");
String typing=request.getParameter("typing");
String shorthand=request.getParameter("shorthand");
String other=request.getParameter("other");
String english=request.getParameter("english");

Statement st5 = conn.createStatement();
String query5 = "update t_skills SET MSOffice='"+ms_office+"',Windows='"+windows+"',AutoCAD='"+autocad+"',Tally='"+tally+"',Typing='"+typing+"',Shorthand='"+shorthand+"',AnyOtherSkills='"+other+"',CommandOverEnglish='"+english+"' where EmpID="+emp_id+"";
st5.executeUpdate(query5);

String achievements=request.getParameter("achievements");
String seeafter5=request.getParameter("seeafter5");
String strengths=request.getParameter("strengths");
String curricular=request.getParameter("curricular");
String exp_sal=request.getParameter("exp_sal");
String benefit=request.getParameter("benefit");
String leaving_reason=request.getParameter("leaving_reason");
String health_prob=request.getParameter("health_prob");
String litigation=request.getParameter("litigation");
String police_record=request.getParameter("police_record");
String reference=request.getParameter("reference");

Statement st6 = conn.createStatement();
String query6 = "update t_otherdetails SET Achievements='"+achievements+"',Seeyourself5YearsFromNow='"+seeafter5+"',StrengthsWeakness='"+strengths+"',ExtraCurricular='"+curricular+"',ExpectedSalary='"+exp_sal+"',BenefitToCompany='"+benefit+"',whyYouWantToLeaveYourPresentJob='"+leaving_reason+"',HealthProblem='"+health_prob+"',AnyLitigation='"+litigation+"',AnyPoliceRecord='"+police_record+"',References1='"+reference+"' where EmpID="+emp_id+"";
st6.executeUpdate(query6);

//for additional information
	%>
	<%! int count=0;%>
	<%	
Statement st7=conn.createStatement();
String query7 = "select count(*) from t_empadditionalQualification where EmpID ="+emp_id+"";
ResultSet rs7 = st7.executeQuery(query7);
if(rs7.next())
{
	    count = rs7.getInt(1);
}
String[] inst = new String[10];
String[] year = new String[10];
String[] spe = new String[10];
String[] marks = new String[10];
String[] rid = new String[10];

for(int k=1;k<=count;k++) {	    
	   inst[k] =request.getParameter("inst"+k);
	   year[k]=request.getParameter("year"+k);
	    spe[k]=request.getParameter("spe"+k);
	  marks[k]=request.getParameter("marks"+k);
	  rid[k]=request.getParameter("rid"+k);
	  Statement st8=conn.createStatement();
	    String query8 = "update t_empadditionalQualification SET Institute='"+inst[k]+"',Year='"+year[k]+"',Specialisation='"+spe[k]+"',Marks_Percentage='"+marks[k]+"' where RId ="+rid[k]+"";
		st8.executeUpdate(query8);  
}



// for work experience
Statement st9=conn.createStatement();
String query9 = "select count(*) from t_workexperience where EmpID ="+emp_id+"";
ResultSet rs9 = st9.executeQuery(query9);
if(rs9.next())
{
	count = rs9.getInt(1);
}
String[] comp = new String[10];
String[] post = new String[10];
String[] sal = new String[10];
String[] reason = new String[10];
String[] from_date = new String[10];
String[] to_date = new String[10];
String[] r_id = new String[10];
for(int k=1;k<=count;k++) {
	comp[k]=request.getParameter("comp"+k);
	post[k]=request.getParameter("post"+k);
	sal[k]=request.getParameter("sal"+k);
	reason[k]=request.getParameter("reason"+k);
	from_date[k]=request.getParameter("from_date"+k);
	to_date[k]=request.getParameter("to_date"+k);
	r_id[k]=request.getParameter("r_id"+k);
	
	Statement st10=conn.createStatement();
	String query10 = "update t_workexperience SET Company='"+comp[k]+"',PositionHeld='"+post[k]+"',SalaryPA='"+sal[k]+"',ReasonforLeaving='"+reason[k]+"',FromDate='"+from_date[k]+"',Todate='"+to_date[k]+"' where RId ="+r_id[k]+""; 
	st10.executeUpdate(query10);
}

response.sendRedirect("application_submit.jsp?emp_id="+emp_id+"");

}catch(Exception e){
	
}


%>
</body>
</html>