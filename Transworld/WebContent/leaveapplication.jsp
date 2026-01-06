<!-- 
  Module Name : leave application
  Creator : sujata shinde
  Date of Creation : 2011/04/13
  Modifier :
  Date of Modification :
  Reason of Modification :
  Description : Through this page leave is applied-->
<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>

<%@ include file="header.jsp"%>

<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 -->
 <!DOCTYPE html>
 <html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<title>Transworld - Leave Application</title>
<style>
/* .container {
    margin-bottom: 20%; /* Ensure content above the footer isn't covered 
}
 */
 #mainpage {
     display: flex;
     flex-direction: column;
    min-height: 100vh; /* Ensure full viewport height */
    margin: 0;
}

.container-fluid {
    flex: 1; /* Flex grow to push footer to bottom */
/*     padding-bottom: 10px; /* Adjust as needed */
 */}


</style>
<script type="text/javascript">
function validate(){
	  //alert("in validate function");
	  var FirstDayOfLeave=document.leave.FirstDayOfLeave.value.replace(/\s/g,""); ;
	    if(FirstDayOfLeave.length==0){
	   	 alert("Please enter First day of leave");
			return false;
	        }
	 var DaysApplied=document.leave.DaysApplied.value.replace(/\s/g,"");;
	 if(DaysApplied.length==0){
       	 alert("Please enter Number of days requested");
    		return false;
            }
	 if(isNaN(DaysApplied)||DaysApplied.indexOf(" ")!=-1){
    	 alert("Enter numeric value for Days Applied");
         return false; 
         }
	 

     var reasonForLeave=document.leave.reasonForLeave.value.replace(/\s/g,"");;
  //  alert(reasonForLeave);
     if(reasonForLeave.length==0){
       	 alert("Please enter Reason for leave ");
    		return false;
            }
        
	 var name=document.leave.name.value.replace(/\s/g,"");;
	 //  alert(DaysApplied);
	 if(name.length==0){
       	 alert("Please enter your full name");
    		return false;
            }
	 
     var DateOfReporting= document.leave.DateOfReporting.value.replace(/\s/g,"");;
     
     if(DateOfReporting.length==0){
    	 alert("Please select Date when reporting / reported ");
 		return false;
         }
     try{FirstDayOfLeave=FirstDayOfLeave.replace('-','/');
         FirstDayOfLeave=FirstDayOfLeave.replace('-','/');
         var FirstDayOfLeave= new Date(FirstDayOfLeave);
          
         DateOfReporting=DateOfReporting.replace('-','/');
         DateOfReporting=DateOfReporting.replace('-','/');
         var DateOfReporting= new Date(DateOfReporting);
    
    	 var one_day=1000*60*60*24;
    	
        var date1_ms = FirstDayOfLeave.getTime();
        var date2_ms = DateOfReporting.getTime();
        var difference_ms = date2_ms - date1_ms;
        difference_ms=difference_ms/one_day;
        difference_ms= Math.floor(difference_ms);
       // alert("diff"+difference_ms);
        var dt=parseFloat(difference_ms-0.5);
        dt= Math.floor(dt);
       // alert("diff "+dt+""+difference_ms);
       // alert("dayss applied==>"+DaysApplied);

       /*
        if(DaysApplied<difference_ms)
        {   if(DaysApplied<dt)
	         alert("DaysApplied should be Differance of FirstDayOfLeave-DateOfReporting-1 ");
	         return false;
	        }
        */
        	
     }catch(e){alert(e);}
    //alert(DateOfReporting);
     
    
    var emailAdd= document.leave.emailAdd.value.replace(/\s/g,"");;  
    //alert(emailAdd);
    if(emailAdd.length==0) 
    {
		alert("Please enter your Email Id");
		return false;
	}
	else
	{
		var sss=validateEmail(emailAdd);
		if(!sss)
			{
				alert("Please enter valid Email Id");
				return false;
			} 
	}
	
    var HODemailAdd= document.leave.HODemailAdd.value.replace(/\s/g,"");;  
    //alert(HODemailAdd);
    if(HODemailAdd.length==0) 
    {
		alert("Please enter HOD's Email Id");
		return false;
	}
	else
	{
		var sss=validateEmailHOD(HODemailAdd);
		if(!sss)
			{
				alert("Please enter valid HOD's Email Id");
				return false;
			} 
	}

    if(emailAdd==HODemailAdd){
		alert("Please users emailid and HOD's email id should not be equal");
		return false;
		}
    
 

    
    
    
    var Details= document.leave.Details.value.replace(/\s/g,""); 
    
    
     if(Details.length==0){
    	 alert("Please enter phone number");
 		return false;
         }else if(Details.length<10)
		{
			alert('Mobile Number must be 10 digits');
		
			return false;
		} 
		else if (Details.length>10) 
		{ 
		   
		   alert("Invalid Mobile Number ");
		
	       return false;
		   
		}else if(isNaN(Details)||Details.indexOf(" ")!=-1){
			//var sss=validateMobile(Details);
			//if(!sss){
			//		alert("enter only numbers");
			//		return false;
			//	}
			alert("Enter numeric value for mobile number");
            return false; 
			}else{
			}
     
//     alert(Details);
     
     return datevalidate();
}
function validateEmail(emailAdd)
{
     var splitted = emailAdd.match("^(.+)@(.+)$");
    if(splitted == null) return false;
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }
return false;
}
function validateEmailHOD(HODemailAdd)
{
     var splitted = HODemailAdd.match("^(.+)@(.+)$");
    if(splitted == null) return false;
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }
return false;
}
function datevalidate()
{
	
	 var date1=document.leave.FirstDayOfLeave.value;
	// alert(date1);
	 var date2=document.leave.DateOfReporting.value;
	// alert(date2);
	var dm1,dd1,dy1,dm2,dd2,dy2;
	var dd11,yy11,mm1,mm2,dd22,yy22;
	var mon1,mon2;
	//yy11=date1.substring(0,4);
	//yy22=date2.substring(0,4);
	yy11=date1.substring(7,11);
	yy22=date2.substring(7,11);
	
	//alert("yy11-->"+yy11+"**yy22--->"+yy22);	
	//mm1=date1.substring(5,7);
	//mm2=date2.substring(5,7);
	mm1=date1.substring(3,6);
	mm2=date2.substring(3,6);
	
//	alert("mm1-->"+mm1+"mm2--->"+mm2);
		
	if(mm1=="Jan")
	{
		mon1=1;
	}
	else if(mm1=="Feb")
	{
		mon1=2;
	}
	else if(mm1=="Mar")
	{
		mon1=3;
	}
	else if(mm1=="Apr")
	{
		mon1=4;
	}
	else if(mm1=="May")
	{
		mon1=5;
	}else if(mm1=="Jun")
	{
		mon1=6;
	}else if(mm1=="Jul")
	{
		mon1=7;
	}else if(mm1=="Aug")
	{
		mon1=8;
	}else if(mm1=="Sep")
	{
		mon1=9;
	}else if(mm1=="Oct")
	{
		mon1=10;
	}else if(mm1=="Nov")
	{
		mon1=11;
	}
	else if(mm1=="Dec")
	{
		mon1=12;
	}
	////////////
	if(mm2=="Jan")
	{
		mon2=1;
	}
	else if(mm2=="Feb")
	{
		mon2=2;
	}
	else if(mm2=="Mar")
	{
		mon2=3;
	}
	else if(mm2=="Apr")
	{
		mon2=4;
	}
	else if(mm2=="May")
	{
		mon2=5;
	}else if(mm2=="Jun")
	{
		mon2=6;
	}else if(mm2=="Jul")
	{
		mon2=7;
	}else if(mm2=="Aug")
	{
		mon2=8;
	}else if(mm2=="Sep")
	{
		mon2=9;
	}else if(mm2=="Oct")
	{
		mon2=10;
	}else if(mm2=="Nov")
	{
		mon2=11;
	}
	else if(mm2=="Dec")
	{
		mon2=12;
	}
		
	//alert("monthfirst-->"+mon1+"month2nd-->"+mon2);
	//dd11=date1.substring(8,11);
	//dd22=date2.substring(8,11);
	dd11=date1.substring(0,2);
	dd22=date2.substring(0,2);
	//alert("dd11-->"+dd11+"dd22--->"+dd22);

	if(yy11>yy22)
	{
		return false;
	}else if( yy11 == yy22)
	{
		//alert("same year");
		if(mon1 == mon2)
		{
			//alert("same month");
			if(dd11 < dd22)
			{
				return true;
			}
		}else if( m1 < m2)
		{
			return true;
		}else
		{
			return false;
		}
	}else
	{
		return true;
	}	
	
/*	if(yy11 > yy22)
	{
		alert("First day of leave year should not be greater than to Date Of Reporting year");
		
		return false;
	}
	else if(yy11==yy22)
	{
		alert("same year");
		 if(mon1>mon2)
		{
			alert("First day of leave month should not be greater than Date Of Reporting month");
			return false;
		}else if(mon1==mon2) 
		{
			
			if(dd11 > dd22)
			{
				alert("First day of leave should not be greater than Date Of Reporting");
				
				return false;
			}
			
		}
	}else if(yy11<yy22)
		{
			return true;
		}else if(dd11 > dd22)
			{
				if(mm1<mm2)
				{	alert("true");
					return true;
				}
			
		//alert("First day of leave should not be greater than Date Of Reporting");
		
		return false;
	}
	
	return true;
	*/ 
}
function getTerms()
{
	alert("Please enter your request for leave here. "+
			"Please note that application for leave does not automatically "+ 
			"mean your request is granted. Provide a reason as detailed as possible."+ 
			"Please obtain confirmation in writing from your HOD or person authorised "+ 
			"to grant leave. In certain circumstances, leave may be revoked or cancelled "+
			"prematurely. Any holiday between two days of leave is counted as leave. "+
			"\n\tPlease refer to all the applicable rules, they are available on request "+ 
			"from the Accounts and Personnel department. All sick leave applications "+
			"require to be supported by medical certificates. It should require about "+
			"3 minutes to fill in this form.");
}
function checkin(){
	alert("now in check in function");
}

function AJAXFunc()
{
	
 // alert("in ajax function  of APPLY LEAVE PAGE **************   ");
  var v1=document.getElementById("empid").value;
 //alert("empid==>"+v1);
 
 
  //alert(v3);
  
 
  //alert(owner);

  var ajaxRequest;  // The variable that makes Ajax possible!

     try{
 	        // Opera 8.0+, Firefox, Safari
 	 	ajaxRequest = new XMLHttpRequest();
        }  
        catch (e)
        {
 	        // Internet Explorer Browsers
 	        try
                 {
 	             ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
 	        } 
                 catch (e)
                 {
 		    try
                     {
 		        ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
 		    } 
                     catch (e)
                     {
 		           //  Something went wrong
 	                   alert("Your browser broke!");
 			   return false;
 	            }
 	        }
          }
                
          // Create a function that will receive data sent from the server
            ajaxRequest.onreadystatechange = function()
            {
     	       if(ajaxRequest.readyState == 4)
                {
                      var reslt=ajaxRequest.responseText;
				//	alert(reslt);
                      var mySplitResult = reslt.split("#");
                      var mySplitResult1=  mySplitResult[0]; 
                      var mySplitResult2=  mySplitResult[1];

						// Results from Ajaxunitadd.jsp are put into fields
						mySplitResult[0] = mySplitResult[0].replace(/^\s+|\s+$/g,"");//email id of HOD
						

						        // alert("email of hodid----->"+mySplitResult[0])  ;     
						      //   alert("email of hodid----->"+mySplitResult[1]) ;   
                   // alert("ema il of hodid--2222--->"+ mySplitResult[2])    

                 document.getElementById("HODemailAdd").value=mySplitResult[0];
						
 	       } 
            }
            
  
           var queryString = "?empid=" +v1;
 	   ajaxRequest.open("GET", "AjaxGetHodID.jsp" + queryString, true);
 	 // ajaxRequest.open("GET", "AjaxGetHodemail.jsp" + queryString, true);
 	  
 	   ajaxRequest.send(null); 
}

function AJAXFunc1()
{
  //alert("in ajax function  of APPLY LEAVE PAGE **************   ");
  var v1=document.getElementById("DaysApplied").value;
 //alert("No of days applied==>"+v1);
 
 
 var v2=document.getElementById("FirstDayOfLeave").value;
  //alert("FirstDayOfLeave==>"+v2);
   
  //alert(owner);

  var ajaxRequest;  // The variable that makes Ajax possible!

     try{
 	        // Opera 8.0+, Firefox, Safari
 	 	ajaxRequest = new XMLHttpRequest();
        }  
        catch (e)
        {
 	        // Internet Explorer Browsers
 	        try
                 {
 	             ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
 	        } 
                 catch (e)
                 {
 		    try
                     {
 		        ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
 		    } 
                     catch (e)
                     {
 		           //  Something went wrong
 	                   alert("Your browser broke!");
 			   return false;
 	            }
 	        }
          }
                
          // Create a function that will receive data sent from the server
            ajaxRequest.onreadystatechange = function()
            {
     	       if(ajaxRequest.readyState == 4)
                {
                      var reslt=ajaxRequest.responseText;
					//alert(">>>>"+reslt);
                      var mySplitResult = reslt.split("#");
                     
                      var mySplitResult1=  mySplitResult[0]; 
                      var mySplitResult2=  mySplitResult[1];
                      
                    // alert("mySplitResult2 type=="+typeof(mySplitResult2));
                    // alert("0 date:"+mySplitResult[0]);
                     // alert ("1 reject value:"+mySplitResult[1]);

						// Results from Ajaxunitadd.jsp are put into fields
						mySplitResult[0] = mySplitResult[0].replace(/^\s+|\s+$/g,"");//email id of HOD
						//alert("result 0:"+mySplitResult[0]);
						             //alert("email of hodid---0000--   >"+mySplitResult[0]) ;      
						         //alert("email of hodid----1111->"+mySplitResult[1])    
                     

                 document.getElementById("DateOfReporting").value=mySplitResult[0];
                      
						try{
							 /*							 */ 
						    if(mySplitResult[1]=="yes")
							{
							
							//alert("Leave date  can not be  more than 3 days from current date");
							
							  alert("You must Apply Leave within 3 Days ");
							
							 document.getElementById("DaysApplied").value="";
							 document.getElementById("FirstDayOfLeave").value="";
							 document.getElementById("DateOfReporting").value="";
							
							}else {
								//alert("in else cond  "+mySplitResult2);
								
								if(mySplitResult2 == 1 && mySplitResult2 !=31){
									
									alert("Applied Days Not In Multiple Of 0.5");	
									document.getElementById("DaysApplied").value="";
									 document.getElementById("FirstDayOfLeave").value="";
									 document.getElementById("DateOfReporting").value="";
									}
								 if(mySplitResult2 >=31)
									{
									
									//alert("Leave date  can not be  more than 3 days from current date");
									
									alert("You can't apply Leave more  than 31 Day's ");
									
									 document.getElementById("DaysApplied").value="";
									 document.getElementById("FirstDayOfLeave").value="";
									 document.getElementById("DateOfReporting").value="";
									
									}

								}
						         
						}catch(e)
						{
						//alert(e);	
							
						}                  		 
 	       } 
            }
            
  
           var queryString = "?NoDaysApplied=" +v1+"&v2="+v2;
 	   ajaxRequest.open("GET", "AjaxGetHodID1.jsp" + queryString, true);
 	   ajaxRequest.send(null); 
}


</script>
</head>
<body>
	<p></p>
<div class="container-fluid" id="mainpage">
	<table bgcolor="#E0DDFE" border="0" height="450" width="600"
		align="center">
		<tr>
			<td align="center"><b><font size="4" color="#151B54">Transworld
						- Leave Application</font></b></td>
		</tr>
		<tr>
			<td align="left"><a href="leave application.jsp"
				onclick="getTerms();"><font size="2" color="#151B54"><b><u>Terms
								of Use</u></b></font></a></td>
		</tr>

		<%
String IP=request.getParameter("IP");
if(IP==null){
	
}else{
	%>
		<tr>
			<td align="center"><b><font size="3" color="blue"></font></b></td>
		</tr>
		<%
}

String updated="";
updated=request.getParameter("inserted");
System.out.println("updated-->"+updated);
if(updated==null){
	
}
else if(updated.equalsIgnoreCase("yes")){
	%>
		<tr>
			<td align="center"><b><font size="3" color="blue">Leave
						Added Successfully</font></b></td>
		</tr>

		<%
}else if(updated.equalsIgnoreCase("no")){
	%>
		<tr>
			<td align="center"><b><font size="3" color="blue">Leave
						is not added</font></b></td>
		</tr>

		<%
}
else if(updated.equalsIgnoreCase("present")){
	%>
		<tr>
			<td align="center"><b><font size="3" color="blue">Already
						Leave Applied !!</font></b></td>
		</tr>

		<%
}
// Connection conn,conn1;
Statement st,st1,st2,st3,st4;

// conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();
st4=conn.createStatement();

//String username=session.getValue("user").toString();
String username=session.getAttribute("username").toString();
String empid1=session.getAttribute("empID").toString();


System.out.println("empid1-******************************->"+empid1);
System.out.println("username-******************************->"+username);

System.out.println(username);
String sql="select * from t_leaveadmin where UName='"+username+"'";
ResultSet rs=st.executeQuery(sql);
if(rs.next()){
	

%>


		<tr>
			<td>
				<form method="post" name="leave" action="leaveApplicationInsert.jsp"
					onsubmit="return validate();">
					<p></p>

					<table bgcolor="white" border="0" height="400" width="600"
						align="center">
						<tr>
							<td><font color="#990000">* Required</font></td>
						</tr>
						<tr>
							<td>
								<table align="center">

									<tr>
										<td></td>
									</tr>
									<tr>
										<td><b>First day of leave <font color="#990000">*</font>:
										</b></td>
										<td><input type="text" id="FirstDayOfLeave"
											name="FirstDayOfLeave" size="13" class="formElement" value=""
											readonly class="formElement" onblur="AJAXFunc()" /> <script
												type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "FirstDayOfLeave",         // ID of the input field
                    ifFormat    : "%d-%b-%Y",     // the date format
                    button      : "trigger"       // ID of the button
               }
                             );
               </script></td>
									</tr>
									<tr>
										<td><b>Days applied <font color="#990000">*</font>:
										</b><br>(e.g.:0.5/1/1.5)</td>
										<td><input type="text" onchange="AJAXFunc1();"
											id="DaysApplied" name="DaysApplied" value="" /></td>
									</tr>




									<tr>
										<td></td>
									</tr>
									<!-- <tr>
	<td ><b>Type of leave required <font  color="#990000">*</font>:</b></td>
	<td align="left"><input type="radio"   name="reason" id="reason1" value="casual leave"/>Casual Half or 1 day
			   		<input type="radio"   name="reason" id="reason2" value="long leave"/>Long leave
					<input type="radio"  name="reason" id="reason3" value="sick leave"/>Sick leave
					<input type="radio"   name="reason" id="reason4" value="Office work"/>Office work</td>
	</tr> -->
									<tr>
										<td><b>Type of leave required <font color="#990000">*</font>:
										</b></td>
										<td><select name="reason" id="reason">
												<%
	     String reasone="select distinct(reason) as reason from db_leaveapplication.t_leavereason where status='Active' order by reason";
	       ResultSet rsReasone=st4.executeQuery(reasone);
	       while(rsReasone.next())
	       {
	    	   
	        %>
												<option value="<%=rsReasone.getString("reason") %>"><%=rsReasone.getString("reason") %></option>
												<%} %>
										</select></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td><b>Date when reporting / reported <font
												color="#990000"></font>:
										</b></td>
										<td><input type="text" id="DateOfReporting"
											name="DateOfReporting" size="13" class="formElement" value=""
											readonly="readonly" class="formElement" /></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td><b>Email address<font color="#990000">*</font>:
										</b></td>
										<%System.out.println("User email Idddd--->"+rs.getString("Email")); %>
										<td><input type="text" name="emailAdd"
											style="width: 250px" id="emailAdd"
											value="<%=session.getAttribute("email") %>" readonly /></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td><b>HOD's Email address<font color="#990000">*</font>:
										</b></td>
										<td align="left"><input type="text" name="HODemailAdd"
											style="width: 250px" id="HODemailAdd" readonly="readonly" /></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td><b>Reason for leave <font color="#990000">*</font>:
										</b></td>
										<td><textarea cols="50" rows="5" id="reasonForLeave" name="reasonForLeave"></textarea></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td><b>Your full name <font color="#990000">*</font>:
										</b></td>
										<%System.out.println("User name--->"+rs.getString("Name")); %>
										<td><input type="text" name="name" id="name"
											value="<%=session.getAttribute("empname") %>" readonly />
										</textarea></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td><b>Your phone number <font color="#990000">*</font>:
										</b></td>
										<td align="left"><input type="text" name="Details"
											id="Details" /></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td align="left"><input type="submit" value="Submit" /></td>
									</tr>
								</table> <input type="hidden" id="empid" name="empid"
								value="<%=empid1 %>">

							</td>

							<table>
							</table>
						</tr>

					</table>
				</form>
			</td>
			<%} %>
		</tr>

	</table>
	</div>
	<p></p>
		<%@ include file="footer.jsp"%>
	
</body>

</html>