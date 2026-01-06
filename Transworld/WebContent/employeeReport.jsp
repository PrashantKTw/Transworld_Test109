<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" errorPage=""
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Department Report</title>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <script src="js/sorttable.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script> 
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#example')
								.DataTable(
										{
											"pagingType" : "full_numbers",

											dom : 'Blfrtip',
											scrollY : 450,
											scrollX : true,
											buttons : [

											{
												extend : 'collection',

												text : 'Export',
												buttons : [
														{
															extend : 'excel',
															title : 'New Joinee Report',
																	
														},
														{
															extend : 'pdf',
															orientation : 'Landscape',
															pageSize : 'LEGAL',
															title : 'New Joinee Report'
																	
														},
														{
															extend : 'csv',
															title : 'New Joinee Report'
																	
														},
														{
															extend : 'print',
															title : 'New Joinee Report'
																
														},
														{
															extend : 'copy',
															title : 'New Joinee Report'
																
														},

												/* 'copy', 'csv', 'excel', 'pdf', 'print' */
												]
											} ],
											lengthMenu : [
													[ -1, 10, 25, 50, 100 ],
													[ "All", 10, 25, 50, 100 ] ],

										});
					});
</script>

    <style>

th
{ 
background: #C6DEFF;
}
#filterform
{           position:relative;
            left: 30px; /* Adjust the left offset as needed */
            top: 30px; /* Adjust the top offset as needed */
            
}
h3{
margin-top:0%;
}
#thirddiv{
ms:5px;}
 #mainpage {
     display: flex;
     flex-direction: column;
    min-height: 100vh; /* Ensure full viewport height */
    margin: 0;
}

.container-fluid {
    flex: 1; /* Flex grow to push footer to bottom */
}

</style>
<script type="text/javascript">
function DeleteRow(id,Status)
{
	if(Status=="No")
	{
		alert("Employee Already Deactivated");
		return false;
	}
	else
	{
	
	var agree=confirm("Do You Want to Delete this Record?");
	    //alert(agree);
	    if(agree)
	    {
		 var ajaxRequest;  // The variable that makes Ajax possible!
		    try
		    {	// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
		    }  
			catch (e)
			{	// Internet Explorer Browsers
				try
				{	ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} 
				catch (e)
				{	try
					{
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} 
					catch (e)
					{	// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}
			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function()
			{	//alert("ddddddddddddddddddddddd");
				if(ajaxRequest.readyState == 4)
				{	var reslt=ajaxRequest.responseText;
				   //alert(">>>    "+reslt);
				  var data=reslt.trim();
					if(data="Yes")
					{					
                        alert("Data Deleted Successfully.");
				    	window.location.reload();
					}
					if(data="No")
					{					
                       // alert("Data Not Deleted Successfully.");
				    	window.location.reload();
					}
	           } 
			}
			var queryString = "?action=delete&id="+id;
			ajaxRequest.open("GET", "AjaxContractDelete1.jsp" + queryString, true);
			ajaxRequest.send(null); 
	    }
	    else
	    {return false;
	    }
	}//end of else
 }//


 function EditEmp(id,status,name)
 {
	// alert("st"+status);
	 if(status=="Yes")
	 {
 	    
 	//alert("Control inside deldte function");
 	
 	var agree=confirm("Do You Want to Edit this Record?");
 	    //alert(agree);
 	    
 	    if(agree)
 	    {


 	    	window.location.href="editEmp.jsp?EmpID="+id+"&status="+status+"&name="+name;
 		}
 	    else
 	    {
 	    	
 	    	return false;
 	    }

	 }
	 else
	 {
		 
		 alert(" Selected Employee is deactivated!!! ");
		 var conf=confirm("Still you want to edit this employee..");
		 if(conf)
		 {
			 // window.location.href="editEmp.jsp?EmpID="+id+"&status="+status;
			 window.location.href="editEmp.jsp?EmpID="+id+"&status="+status+"&name="+name;
		 }
		 else
	 	    {return false;
	 	    }
		 //editEmp.jsp?EmpID=&status=
	 }
  }
 
 function oncheck(id)
 {	
 	var state=id.checked;
 	var employee=id.value;
 //	alert("value-----"+employee);
 //	alert("State-----"+state);
 	
 	var ajaxRequest;  // The variable that makes Ajax possible!
     try
     {	// Opera 8.0+, Firefox, Safari
 		ajaxRequest = new XMLHttpRequest();
     }  
 	catch (e)
 	{	// Internet Explorer Browsers
 		try
 		{	ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
 		} 
 		catch (e)
 		{	try
 			{
 				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
 			} 
 			catch (e)
 			{	// Something went wrong
 				alert("Your browser broke!");
 				return false;
 			}
 		}
 	}
 	// Create a function that will receive data sent from the server
 	ajaxRequest.onreadystatechange = function()
 	{	
 		if(ajaxRequest.readyState == 4)
 		{	var reslt=ajaxRequest.responseText;
 		   
 		  var data=reslt.trim();
 		 if(data="Yes")
 			{	
 			 	alert("Apply Successfully");
                 window.location.reload();
 			}
 			if(data="No")
 			{					
               window.location.reload();
 			}
        } 
 	}
 	var queryString = "?state="+state+"&emp="+employee;
 //	alert("queryString isss----"+queryString);
 	ajaxRequest.open("GET", "AjaxWorkFromHome.jsp" + queryString, true);
 	ajaxRequest.send(null);
 }
 	
</script>
</head>

<body>
<div class="container-fluid" id="mainpage">
<form action="" method="post" name="employeeReport">
    
     <div class="row breadcrumbs-top">
          <h3 class="content-header-title text-center mb-0" style="color: #339CCB">New Joinee Report</h3>
    </div>

      <div class="row">
      
    <div class="col-md-4">
	<a href="addEmployee.jsp" style="font-size: 20px; margin: 20px;color: #339CCB"><b>Add</b></a>
    </div>
    
       
        
         <div id="thirddiv" class="col-md-4 text-right" style="text-align:center;">
          <label for="Status">Status</label>
        <select name="dropdown" id="dropdown">
      <%
      String bt=request.getParameter("submit");
      System.out.println(" dropdown :- " +bt);
      if(bt==null || bt==" " || bt==""){  //onload %>
      
                            <option value="All" selected>All</option>
					        <option value="Yes" >Active</option>
					        <option value="No">Deactive</option> 
					        
        <%}else{ 
        
        if(request.getParameter("dropdown").equals("Yes")){ %>
        	 
             <option value="Yes" selected>Active</option>
			 <option value="No">Deactive</option>
			 
 <%  }
        else{%> 
                 
                 <option value="No" selected>Deactive</option>
			     <option value="Yes">Active</option>
 
      
                       
        <%} 
        }%>
        
      </select> 
      <input name="submit" type="submit" value="Submit"></td>
 </div>
  
</div>
<br>
</form>
<table id="example" class="display" style="width: 100%; background: #1582AB;"> 
   <thead>
<tr>


		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Delete</th>
	    <th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Edit</th>
		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Contractor ID</th>
		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Name</th>
		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">User Name</th>
		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Email</th>
		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Type of user</th>
		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Type of Department</th>
		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Status</th>
		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Entered By</th>
		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Date</th>
		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Week Off</th>
		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Report Time</th>
		<th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Exit Time</th>
	   <th style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Work From Home</th>
					

</tr>
</thead>

<tbody>
<%

 Statement st=conn.createStatement();
 Statement st1=conn.createStatement();
 String date="";
 String status=request.getParameter("dropdown");
 
 String ssql="";
 
  if(status==null) //onload
 {
  ssql = "select * from  t_leaveadmin where Status like  '%%'  ORDER BY `EmpID` ASC ";
 }else
	 
 {
	 ssql = "select * from  t_leaveadmin where Status= '"+status+"'  ORDER BY `EmpID` ASC "; 
	 
	 
 }
 
 

 //String sql = "select * from  t_leaveadmin  where Status='Yes' ORDER BY `EmpID` ASC ";
 //String sql = "select * from  t_leaveadmin  ORDER BY `EmpID` ASC ";


 
 
System.out.println("ssql"+ssql);
ResultSet rs = st.executeQuery(ssql);
 String name="";

 
 
 
 while(rs.next())
 {  int weekOff=rs.getInt("weekOff");
	 String weekOff1="";
    switch(weekOff)
    {
    case 0:weekOff1="Sunday";
           	break;
    case 1:weekOff1="Monday";
    		break;
    case 2:weekOff1="Tuesday";
    		break;
    case 3:weekOff1="Wednesday";
    		break;
    case 4:weekOff1="Thursday";
    		break;
    case 5:weekOff1="Friday";
    		break;
    case 6:weekOff1="Saturday";
    		break;
    }
 try
   { 
	 date = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString("inserteddatetime")));
   }
 catch(Exception e){}
 String color="";
 if (rs.getString("Status").equalsIgnoreCase("No")) {
		color = "#FF8080";

	} else 
	{

		color = "#CCFF99";
	}
// System.out.println("colorrrrrrr"+color);
 %>
 
 <tr style="background: <%=color%>;">
 <td style="font-size: 11px; face: san-serif; color: black" align="center"><a href="#" style="font-weight: bold; color: black;" onclick="DeleteRow('<%=rs.getString("EmpID")%>','<%=rs.getString("Status")%>');"><img src="images/delete.jpeg" width="10px" height="18px" style="border-style: none;" ></img></a></td>
<td style="font-size: 11px; face: san-serif; color: black" align="center"><a href="#"  onclick="EditEmp('<%=rs.getString("EmpID")%>','<%=rs.getString("Status") %>','<%=rs.getString("Name") %>');"><img src="images/edit1.jpeg" width ="18px" height="18px"></a></td>
<td style="font-size: 11px; face: san-serif; color: black" align="right"><%=rs.getString("EmpID")%></td>
<td style="font-size: 11px; face: san-serif; color: black" align="left"><%=rs.getString("Name")%></td>
<td style="font-size: 11px; face: san-serif; color: black" align="left"><%=rs.getString("UName")%></td>
<td style="font-size: 11px; face: san-serif; color: black" align="left"><%=rs.getString("Email")%></td>
<td style="font-size: 11px; face: san-serif; color: black" align="left"><%=rs.getString("URole")%></td>
<td style="font-size: 11px; face: san-serif; color: black" align="left"><%=rs.getString("TypeValue")%></td>
<td style="font-size: 11px; face: san-serif; color: black" align="left"><%=rs.getString("Status")%></td>
<td style="font-size: 11px; face: san-serif; color: black" align="left"><%=rs.getString("ERPUser")%></td>
<td style="font-size: 11px; face: san-serif; color: black" align="left"><%=date%></td>
<td style="font-size: 11px; face: san-serif; color: black" align="left"><%=weekOff1%></td>
<td style="font-size: 11px; face: san-serif; color: black" align="right"><%=rs.getString("ReportTime")%></td>
<td style="font-size: 11px; face: san-serif; color: black" align="right"><%=rs.getString("exittime")%></td>
<td style="font-size: 11px; face: san-serif; color: black" align="center">
 <%if(rs.getString("IsWorkFromHome").contains("Yes")){
%>
<input type="checkbox" name="workhome" id="workhome" onclick="oncheck(this);" value="<%=rs.getString("Name") %>" checked></td>
<%}else{%>
<input type="checkbox" id="workhome" value="<%=rs.getString("Name") %>" onclick="oncheck(this);"> </td>
<%}%>
<%
//System.out.println("++++++++++++++"+rs.getString("IsWorkFromHome"));
%>

 </tr>
<% }conn.close();%>
</tbody>

</table></div></div>
</form></div>
		<%@ include file="footer.jsp"%>

</body>
</html>