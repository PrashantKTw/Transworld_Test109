<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="header.jsp"%>
<html>
<head>

<title>Transworld - Leave Application</title>
<script type="text/javascript">
function validate()
{
	  	alert("in validate function");
	 	var name=document.leave.name.value;
	 	alert(name);
		if(name=="")
		{
			alert("Please select employee name");
			return false;
		}
	
	
}


</script>
</head>
<body bgcolor="Silver">
	<%
//Class.forName(MM_dbConn_DRIVER);
//Connection conn,conn1;
Statement st,st1,st2,st3;

//conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
//String typevalue=session.getAttribute("typeval").toString();  empdept
String typevalue=session.getAttribute("empdept").toString();
%>
	<p></p>
	<p></p>
	<table border="0" height="100" width="400" align="center">
		<tr>
			<td align="center"><b><font size="4" color="#151B54">Remove
						Employee</font></b></td>
		</tr>
		<%
String updated="";
updated=request.getParameter("inserted");
System.out.println("updated-->"+updated);
if(updated==null){
	
}
else if(updated.equalsIgnoreCase("yes")){
	%>
		<tr>
			<td align="center"><b><font size="3" color="blue">Employee
						Removed Successfully</font></b></td>
		</tr>

		<%
}
%>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td></td>
		</tr>

		<tr></tr>
		<tr>
			<td>
				<form method="post" name="leave" action="removeEmployeeInsert.jsp"
					onsubmit="return validate();">
					<table bgcolor="white" border="0" height="100" width="400"
						align="center">
						<tr>
							<td align="center"><font color="#990000">* Required</font></td>
						</tr>
						<tr>
							<td><table>
									<tr>
										<td align="center"><b>Full Name<font color="#990000">*</font></b><br>
											<font color="blue">Please select the employee name</font></td>
									</tr>
								</table></td>

							<td><table>
									<tr>

										<td align="center"><select name="name" id="name"
											class="formElement">
												<option value="Select">Select</option>
												<%
					String name="";
					String sql="select Name from t_leaveadmin where Status='Yes' and TypeValue='"+typevalue+"' order by Name";
					System.out.println("remove========>>"+sql);
					ResultSet rst=st.executeQuery(sql);
					while(rst.next())
					{
						name=rst.getString("Name");
%>
												<option value="<%=rst.getString("Name")%>"><%=rst.getString("Name")%></option>
												<%
					}
					System.out.println("rmv selected==========>>"+name);
%>

										</select></td>
									</tr>
								</table></td>
						</tr>
					</table>


					<table align="center">
						<tr>
							<td align="center"><input type="submit" value="Submit" /></td>
						</tr>
					</table>

				</form>
			</td>
		</tr>

	</table>

	<p></p>
</body>
</html>