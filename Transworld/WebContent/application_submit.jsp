<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>application submit</title>
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />

<script type="text/javascript">
</script>
</head>
<body>
	<%
String emp_id=request.getParameter("emp_id");
System.out.println("the emp_id is** :"+emp_id);

%>
	<p>
		<b><center>Your information has been successfully saved.
				Thank You</center></b>
	</p>
</body>
</html>