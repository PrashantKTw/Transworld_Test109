<%@ page language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bed Occupancy Management</title>
<link rel="stylesheet" type="text/css" href="css/view.css" media="all">
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<script src="js/sorttable.js" type="text/javascript"></script>
<script type="text/javascript">
function agree()
{try
{
	
	var ward=document.getElementById("ward").value;
	//alert(ward);
	if(ward=="Select")
	{
		alert("Please select ward Type");
		return false;
	}


 var available=0;
 available=document.getElementById("avail").value;
//	alert(available);
	available++;
	
//	alert(available);
	available--;
//	alert(available);
	//available--;
	
	if(available==""||available==null)
	{
		alert("Please fill the Available field");
		return false;
	}

	 

		var iChars = "!@#$%^&*()+=-[]\\\';./{}|\":<>?";

	for (var i = 0; i < available.length; i++) 
	{
		//alert("for loop");
			if (iChars.indexOf(available.charAt(i)) != -1) 
		{
		  	alert ("Special Characters are not allowed");
		  	return false;
			}
		}

	// var numericExpressionn = /^[.0-9]+$/;
	 if(isNaN(available))
	 	{
	 		alert("Only  Numeric value for available is Allowed");
	        return false;
	 	 }

        var occupy=0;
	    occupy=document.getElementById("occupy").value;
		//alert(occupy);	
	    occupy++;
		//alert(occupy);	
		occupy--;
		//alert(occupy);	
     if(occupy>available)
 	 {
 	 	 alert("Occupancy can't be greater than available");
 	 	 return false;
 	 }
 	// alert("_-------------------->");
	if(occupy==""||occupy==null)
	{
		alert("Please fill the Occupancy field");
		return false;
	}
	 if(isNaN(occupy))
	 	{
	 		alert("Only  Numeric value for Occupancy is Allowed");
	        return false;
	 	 }
	var iChars = "!@#$%^&*()+=-[]\\\';./{}|\":<>?";
	//occupy=occupy.replace(/\s/g, "");

	for (var i = 0; i < occupy.length; i++) 
	{
			if (iChars.indexOf(occupy.charAt(i)) != -1) 
		{
		  	alert ("Special Characters are not allowed");
		  	return false;
			}
		}

	// var numericExpressionn = /^[.0-9]+$/;
	

 	 
	 validate();		

}
catch(e)
{
	//alert(e);
}
}
	function validate()
	{ 
var agree=confirm("Do u want to continue");
if(agree)
{
	return true;
	
}
else
{
	return false;
}

	}

</script>
</head>
<%!Connection conn=null; %>
<%

try
{
Class.forName("com.mysql.cj.jdbc.Driver");
//conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","fleetview","F@5a<I86");
conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","erp","1@erp");
}
catch(Exception e)
{
	System.out.println("Exception=========>>"+e);
}
%>
<%


String data1,sql,sql1,data2,jcode,origin,destination,startdate;
Statement st=null,st1,st2,strno;
%>

<%

st=conn.createStatement();
strno=conn.createStatement();
String 	username="";


String nwfrmtdte = new SimpleDateFormat("dd-MMM-yyyy")
.format(new java.util.Date());
String message=request.getParameter("message");
System.out.println("message---->"+message);
if(message!=null)
{
	%>
	<script>
	alert("Record Saved Successfully");
	window.location="Bedoccupancy.jsp"
	</script>
	<% 
}
%>





<body>
<form id="Bedoccupy" name="Bedoccupy" action="Bedoccupancyinsert.jsp" method="post"  onsubmit="return agree();">
<img id="top" src="newimages/top.png" alt="" style="width: 550px;">
	<div id="form_container" style="width: 550px;"style=" margin-left: 100px;" >
	
		<h1 align="center">Bed Occupancy Entry</h1>
		<br>				
<div width="100%" align="center"  style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">

				<br>

			<table border="0" align="center" cellpadding="0" cellspacing="0" style=" margin-left: 100px;" >
					 <tr>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b><font size="2">Date:-</font></b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" id="data2" name="data2" class="element text medium" style="width: 175px" value="<%=nwfrmtdte %>" size="10" readonly/></td><td align="left">
<script type="text/javascript">
  Calendar.setup(
    {
      inputField  : "data2",         // ID of the input field
      ifFormat    : "%d-%b-%Y",    // the date format
      button      : "data2"       // ID of the button
    }  );
</script></td>
           </tr>
					 <tr>
           <td id="tdvh" align="left" style="display: " ><br></br>
	       <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2">Ward Type:-&nbsp;&nbsp;&nbsp;&nbsp;<select name="ward" id="ward" class="element select medium" style="width: 179px">
			<option value="Select">--Select--</option>
			<%
			try
			{
			String sqlnew="select * from  db_twetl.t_wards ";
			ResultSet rsnew=st.executeQuery(sqlnew);
			System.out.println("ward querry-------->"  +sqlnew);
			while(rsnew.next())
			{
				out.println(rsnew.getString("Ward"));
				%>
				<option value="<%=rsnew.getString("Ward")%>"><%=rsnew.getString("Ward")%></option>
				<% 
			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	            		
			%>	
         	</select></font></b></td>
           </tr>
	       
	       <tr>
           <td align="left"><br></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red" size="2"></font><font  size="2"><b>Availability:-</b></font>&nbsp;&nbsp;&nbsp;
          <input type="text" class="element text medium"  style="width: 180px;" name="avail" id="avail" value="" onchange="cktripid();"  />&nbsp;</td>
           </tr>
            <tr>
           <td align="left"><br></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red" size="2"></font><font  size="2"><b>Occupancy:-</b></font>&nbsp;&nbsp;
          <input type="text" class="element text medium"  style="width: 180px;" name="occupy" id="occupy" value=""  />&nbsp;</td>
           </tr>
         
	<tr align="center">
	<td  colspan="2" ><br></br><div  align="center">
	<input type="submit" name="Submit" value="Submit" style="border-style: outset; border-color: black"  class="formElement"></div></td>
	</tr>
	      
</table>

</div>
</div>

</form>





</body>
</html>

