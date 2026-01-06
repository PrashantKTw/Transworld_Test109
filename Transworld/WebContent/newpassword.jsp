
<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>


<%@ include file="header.jsp"%>
<html>

<head>
<script language="javascript">

function validate()
{ 
   v1=document.changepass.curpass.value;
   v2=document.changepass.newpass.value;
   v3=document.changepass.confpass.value;
   v4=document.changepass.curpasschk.value;

   if(v1.length==0)
   {
      alert("Please enter your current password");
      return false;
   }
   if(v1!=v4)
   {
      alert("Entered current Password doesn't match with our records ");
      return false;
   }
   
   if(v2.length==0)
   {
      alert("Please enter new password");
      return false;
   }

   if(v3.length==0)
   {
      alert("Please confirm your password");
      return false;
   }
 
   if(v2!=v3)
   {
      alert("Text in New password and confirm password doesn't match");
      return false;
   }
      return true;
}

</script>
</head>
<body>




	<form name="changepass" method="get" action="editpass.jsp"
		onSubmit="return validate()">



		<table border="0" width="30%">
			<tr>
				<td>
					<div align="left">
						<a href="javascript:history.go(-1)"> <img
							src="images/arrow.bmp" width="20px" height="20px" border="0">
							</img>
						</a>
					</div>
				</td>
			</tr>
		</table>
		<br> <br> <br>
		<center>
			<table border="0" width="30%">
				<tr>
					<td align="center"><b><font size="4" color="#151B54">Change
								Password</font></b></td>
				</tr>
			</table>

			<%
try {
//Class.forName(MM_dbConn_DRIVER);
//con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=conn.createStatement();
ResultSet rs1=null;
String sql1="";
String user="";
String curpass="";

user=session.getAttribute("email").toString();
//out.println("user"+user);
sql1="select * from t_leaveadmin where UName='"+user+"' ";
rs1=stmt1.executeQuery(sql1);
while(rs1.next())
{
  curpass=rs1.getString("pass");
}
%>

			<input type="hidden" name="curpasschk" value="<%=curpass %>" />
			<table border="0" width="30%" bgcolor="white">
				<tr>
					<td></td>
				</tr>
				<tr>
					<td><B> Current Password </B></td>
					<td><input type="password" name="curpass" class="formElement" />
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td><B> New Password </B></td>
					<td><input type="password" name="newpass" class="formElement" />
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td><B> Confirm Password </B></td>
					<td><input type="password" name="confpass" class="formElement" />
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center">
							<input type="submit" name="submit" value="Submit"
								class="formElement" />
						</div>
					</td>
				</tr>
			</table>
		</center>

		<%
} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
conn.close();
}
%>

	</form>
</body>
</html>
