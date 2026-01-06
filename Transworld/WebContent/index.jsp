<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="javascript">
function fun()
{
	//alert("in fun");
	window.open("TWApply.jsp");
}
	function validate()
	{
		if(document.getElementById("username").value=="")
		{
				alert("Please Enter User Name");
				return false;
		}
		if(document.getElementById("pass").value=="")
		{
				alert("Please Enter password");
				return false;
		}
		return true;
	}
</script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Transworld Technologies LTD.</title>
<link href="css/style.css" rel="stylesheet" type="text/css"
	media="screen" />

</head>
<body>
	<div id="wrapper">
		<div id="header-wrapper">
			<div id="header">
				<div id="logo">
					<img
						src="images/transworld.jpg"></img>
					
				</div>

			</div>
			<div align="right">
				<a href="#" onclick="fun();"
					style="background-color: white; margin-right: 50px; font-size: large;"><br></br>
				<br></br>
				<br></br>
				<br></br>Careers</a>
			</div>
		</div>
		<!-- end #header -->

		<!-- end #page -->
	</div>
	<table width="100%">
		<tr>
			<td><div align="center">
					<img src="images/homepage.jpg"></img>
				</div></td>

			<td><br>

				<table border="0" cellpadding="0" width="40%">
					<tr>
						<td width="100%">
							<form name="fleetviewlogin" action="loginChk.jsp" method="post"
								onsubmit="return validate();">
								<table border="0" width="50%" align="center">
									<tr>
										<td colspan="2">&nbsp; <%
						try{
						String msg=request.getParameter("err");
						if(msg.equals("err1"))
						{
							out.print("<font color='blue' size='2'>Please enter correct user name and password</font>");
						}		
						if(msg.equals("err2"))
						{
							out.print("<font color='blue' size='2'>Session expired, please login again.</font>");
						}	
							}catch(Exception a)
							{
							}			
						%>
										</td>
									</tr>
									<tr>
										<td bgcolor="#f5f5f5"><B><font size="2">User
													Name:</font></B></td>
									</tr>
									<tr>
										<td bgcolor="#f5f5f5"><input type="text" name="username"
											id="username"></td>
									</tr>
									<%System.out.println("==========on Index=============="); %>
									<tr>
										<td bgcolor="#f5f5f5"><B><font size="2">Password:</font></B></td>
									</tr>
									<tr>
										<td bgcolor="#f5f5f5"><input type="password" name="pass"
											id="pass"></td>
									</tr>
									<tr>
										<td colspan="2" bgcolor="990000" align="center"><input
											type="submit" name="Submit" value="Submit"></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table></td>
		</tr>
	</table>

	<div id="footer">
		<p>
			<a href="http://www.myfleetview.com"> Copyright &copy; 2009 by
				Transworld Compressor Technologies Ltd. All Rights Reserved.</a>
		</p>
	</div>
	<!-- end #footer -->
</body>
</html>
