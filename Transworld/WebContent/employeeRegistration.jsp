<%@ page language="java"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/ajax-tooltip.js"></script>
<script src="js/sorttable.js" type="text/javascript"></script>
<title>Transworld Employee Registration</title>
</head>
<script LANGUAGE="JavaScript" type="text/javascript">
function name()
{
	alert("In Fun");
}
function dateformat(days)
{
       if(days=='Jan')
              return(1);
       else
              if(days=='Feb')
                      return(2);
              else
                      if(days=='Mar')
                              return(3);
                      else
                              if(days=='Apr')
                                      return(4);
                              else
                                      if(days=='May')
                                              return(5);
                                      else
                                              if(days=='Jun')
                                                      return(6);
                                              else
                                                      if(days=='Jul')
                                                              return(7);
                                                      else
                                                              if(days=='Aug')
                                                                      return(8);
                                                              else
                                                                      if(days=='Sep')
                                                                              return(9);
                                                                      else
                                                                              if(days=='Oct')
                                                                                      return(10);
                                                                              else
                                                                                      if(days=='Nov')
                                                                                              return(11);
                                                                                      else
                                                                                              if(days=='Dec')
                                                                                                      return(12);
 }
function Change()
{
	var marial=document.getElementById("marial").value;
	//alert(marial);
	if(marial=="Married")
	{
		 document.getElementById("ani").style.display="";
		 //document.getElementById("kid").style.display="";
	}
	else
	{
		 document.getElementById("ani").style.display="none";
		 document.getElementById("bacche").style.display="none";
		 document.getElementById("bacche1").style.display="none";
	}
}
function Change1()
{
	var salary=document.getElementById("salary").value;
	//alert(marial);
	if(salary=="Yes")
	{
		 document.getElementById("sal").style.display="";
		 document.getElementById("sal1").style.display="";
		 //document.getElementById("kid").style.display="";
	}
	else
	{
		 document.getElementById("sal").style.display="none";
		 document.getElementById("sal1").style.display="none";
		 //document.getElementById("kid").style.display="none";
	}
	
}
function Change2()
{
	
	var kids=document.getElementById("kids").value;
	//alert(marial);
	if(kids=="Yes")
	{
		 document.getElementById("bacche").style.display="";
		 document.getElementById("bacche1").style.display="";
		 //document.getElementById("kid").style.display="";
	}
	else
	{
		 document.getElementById("bacche").style.display="none";
		 document.getElementById("bacche1").style.display="none";
		 document.getElementById("bacche2").style.display="none";
		 document.getElementById("bacche3").style.display="none";
		 //document.getElementById("kid").style.display="none";
	}
	
}
function Change3()
{
         document.getElementById("bacche2").style.display="";
		 document.getElementById("bacche3").style.display="";
		 document.getElementById("c1").style.display="none";
		 //document.getElementById("kid").style.display="";
}

function dateValidate(dt,today)
{   
	
	var dy1=dt.substring(7,11);
	var dy2=today.substring(0,4);
	//alert(todate);
	var dm1=dt.substring(3,6);
	//alert(dm1);
	dm1=dateformat(dm1);
	var dm2=today.substring(5,7);
	//alert(dm2);
	var dd1=dt.substring(0,2);
	var dd2=today.substring(8,10);
	//alert(dy1+"=="+dy2+"=="+dm1+"=="+dm2+"=="+dd1+"=="+dd2);
    //alert((dy1<dy2));
	
	if((dy1<dy2)||(dm1<dm2)||dd1<dd2)
	{
		alert("Please Select the valid Date");
		//document.getElementById("contractdate").value="";
		return false;
	}
	
	return true;
}

function validate()
{
	//alert("IN FUNc");
	var val2 = document.getElementById("cmpName").value;
	var deptName = document.getElementById("deptName").value;
	var val4 = document.getElementById("empDesg").value;
	var val5 = document.getElementById("fName").value;
	// var val6 = document.getElementById("mName").value;
	var val7 = document.getElementById("lName").value;
	var val8 = document.getElementById("email").value;
	var val9 = document.getElementById("empId").value;
	var contact = document.getElementById("contact").value;
	var dob = document.getElementById("dob").value;
	var marial = document.EmpReg.marial.value;
	var address = document.getElementById("address").value;
	var accno = document.getElementById("accno").value;
	var bank = document.getElementById("bank").value;
	var branch = document.getElementById("branch").value;
	var ifsc = document.getElementById("ifsc").value;
	var policy = document.getElementById("policy").value;
	var claimcmpny = document.getElementById("claimcmpny").value;
	var doe = document.getElementById("doe").value;
	var amount = document.getElementById("amount").value;
	var namecont = document.getElementById("namecont").value;
	var contactno = document.EmpReg.contno.value;
	var contaddress = document.getElementById("contaddress").value;
	var relation = document.getElementById("relation").value;
	var pan = document.getElementById("pan").value;
	var contractdate = document.getElementById("contractdate").value;
	var contractexpdate = document.getElementById("contractexpdate").value;
	ifsc=ifsc.replace(/\s/g,"");
	val2=val2.replace(/\s/g,"");
	val5=val5.replace(/\s/g,"");
	val8=val8.replace(/\s/g,"");
	val9=val9.replace(/\s/g,"");
	contact=contact.replace(/\s/g,"");
	address=address.replace(/\s/g,"");
	accno=accno.replace(/\s/g,"");
	bank=bank.replace(/\s/g,"");
	policy=policy.replace(/\s/g,"");
	namecont=namecont.replace(/\s/g,"");
	contactno=contactno.replace(/\s/g,"");
	contaddress=contaddress.replace(/\s/g,"");
	relation=relation.replace(/\s/g,"");
	pan=pan.replace(/\s/g,"");
	doe=doe.replace(/\s/g,"");
	var letters = /^[A-Za-z 1-9 ]+$/;  
	var val1 = document.getElementById("empName").value;
	document.getElementById("empName").value=val5+" "+val7;
	//alert("1");
	if(marial=="Married")
	{
	  var doa = document.getElementById("doa").value;
	  var kids = document.getElementById("kids").value;
	  if(kids=="Yes")
	  {
		 var child1= document.getElementById("child1").value;
		 var child2= document.getElementById("child2").value;
		 var doch1= document.getElementById("doch1").value;
		 var doch2= document.getElementById("doch2").value;
	  }
	}
	//alert("2");
//	if(salary=="Yes" )
//	{
	//	var basic=document.getElementById("basic").value;
	//	var tds=document.getElementById("tds").value;
	//	var net=document.getElementById("net").value;
	//	var allow=document.getElementById("allow").value;
//	}
	//alert("3");
	if(val9.length==0)
	{
		alert("Please Enter the Contractor ID ");
		return false;
	}
	if(isNaN(val9))
	{
	alert("Enter the Valid Contractor ID");
	return false;
	}
	
	if(val5.length==0)
	{
		alert("Please Enter the Contractor First Name");
		return false;
	}
	var letters2=letters.test(val5);
    if(letters2==false)
     {     
        alert('Contractor First Name must have characters only');    
       return false;  
      }  
	/*if(val6=="")
	{
		alert("Please Enter the Contractor Middle Name");
		return false;
	}
	var letters3=letters.test(val6);
    if(letters3==false)
     {     
        alert('Contractor Middle Name must have characters only');    
       return false;  
      }  
	if(val7=="")
	{
		alert("Please Enter the Contractor Last Name");
		return false;
	}
	var letters4=letters.test(val7);
    if(letters4==false)
     {     
        alert('Contractor Last Name must have characters only');    
       return false;  
      }  
	*/
	
	if(val2=="" || val2=="Select")
	{
		alert("Please select the Company Name");
		return false;
	}
	if(deptName=="" || deptName=="select")
	{
		alert("Please select the Department");
		return false;
	}
	if(val4=="" || val4=="Select")
	{
		alert("Please select the Contractor Designation");
		return false;
	}
	
	
	if(contact.length==0)
	{
	alert("Please Enter the Contact Number");
	return false;
	}
	if(isNaN(contact))
	{
	alert("Enter the Valid Contact Number(10 Digit Number)");
	return false;
	}
	if((contact.length<10)||(contact.length>10))
	{
	alert("Your Contact Number Should be Valid 10 Digit Number");
	return false;
	}
	if(val8.length==0)
	{
		alert("Please Enter the Contractor Email ID");
		return false;
	}
 	else
  	{	 var filter = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  		    if (!filter.test(val8)) {
  		    alert('Please provide a valid Contractor Email ID');
  		    return false;
  	} 
  	}
	var dd11=dob.substring(0,2);
    var mm1=dob.substring(3,6);
    var mm11=dateformat(mm1);///alert(mm11);
    var yy11=dob.substring(7,11);//alert(yy11);
    var date=new Date();
    var month=date.getMonth()+1;
    var day=date.getDate();
    var year=date.getFullYear();
    if(yy11>year)
    {
            alert("Date of Birth Should Not be Greater Than Todays Date");
            document.getElementById("dob").value="";
            document.getElementById("dob").focus;
            return false;
    }
    else if(year==yy11)
    {
            if(mm11>month)
            {
            	alert("Date of Birth Should Not be Greater Than Todays Date");
                document.getElementById("dob").value="";
                document.getElementById("dob").focus;
                return false;
            }
    }
    if(mm11==month && year==yy11)
    {
            if(dd11>day)
            {
            	alert("Date of Birth Should Not be Greater Than Todays Date");
                document.getElementById("dob").value="";
                document.getElementById("dob").focus;
                return false;
            }
    }
    if(dob=="")
    {
    	alert("Please Enter Date of Birth. ");
    	return false;
    }
    if(marial=="Select")
    {
    	alert("Please Select Marital Status. ");
    	return false;
    }
     if(marial=="Married")
     {
     var dd11e=doa.substring(0,2);
     var mm1e=doa.substring(3,6);
     var mm11e=dateformat(mm1e);///alert(mm11);
     var yy11e=doa.substring(7,11);//alert(yy11);
     if(yy11e>year)
     {
             alert("Date of Anniversary Should Not be Greater Than Todays Date");
             document.getElementById("doa").value="";
             document.getElementById("doa").focus;
             return false;
     }
     else if(year==yy11e)
     {
             if(mm11e>month)
             {
             	alert("Date of Anniversary Should Not be Greater Than Todays Date");
                 document.getElementById("doa").value="";
                 document.getElementById("doa").focus;
                 return false;
             }
     }
     if(mm11e==month && year==yy11e)
     {
             if(dd11e>day)
             {
             	alert("Date of Anniversary Should Not be Greater Than Todays Date");
                 document.getElementById("doa").value="";
                 document.getElementById("doa").focus;
                 return false;
             }
     }
     if(doa=="")
     {
     	alert("Please Enter Date of Anniversary. ");
     	return false;
     }
     if(kids=="Select")
     {
     	alert("Please Select Kids Details Yes/No. ");
     	return false;
     }
     /*if(kids=="Yes")
     {
        
     }*/
    
    }

    if(address.length==0)
    {
    	alert("Please Enter Address of Contractor. ");
    	return false;
    }
   // if(salary=="Select")
    
    //	alert("Please Select Salary Details Yes/No. ");
    //	return false;
    //} 
   /* if(salary=="Yes")
    {
    	if(basic==" ")
    	{
    	alert("Please Enter Basic Salary");
    	//documnet.AddNewUser.Mobno.focus();
    	return false;
    	}
    	if(isNaN(basic))
    	{
    	alert("Enter the Valid Basic Salary");
    	//document.AddNewUser.Mobno.focus();
    	return false;
    	}
    	if(tds==" ")
    	{
    	alert("Please Enter TDS");
    	//documnet.AddNewUser.Mobno.focus();
    	return false;
    	}
    	if(isNaN(tds))
    	{
    	alert("Enter the Valid TDS Value");
    	//document.AddNewUser.Mobno.focus();
    	return false;
    	}
    	if(net==" ")
    	{
    	alert("Please Enter Net Pay");
    	//documnet.AddNewUser.Mobno.focus();
    	return false;
    	}
    	if(isNaN(net))
    	{
    	alert("Enter the Valid Net Pay Value");
    	//document.AddNewUser.Mobno.focus();
    	return false;
    	}
    	if(allow==" ")
    	{
    	alert("Please Enter Other Allowance");
    	//documnet.AddNewUser.Mobno.focus();
    	return false;
    	}
    	if(isNaN(allow))
    	{
    	alert("Enter the Valid Other Allowance Value");
    	//document.AddNewUser.Mobno.focus();
    	return false;
    	}
        
    }   */
  /*  
	
    if(branch=="")
	{
		alert("Please Enter the Bank Name");
		return false;
	}
	var letters6=letters.test(branch);
    if(letters6==false)
    {     
        alert('Branch Name must have characters only');    
       return false;  
    } 
     if(ifsc.length==0)
	{
	alert("Please Enter the IFSC Code");
	//documnet.AddNewUser.Mobno.focus();
	return false;
	}*/
	 if(contractdate.length==0)
	    {
	    	alert("Please Enter Contract Date. ");
	    	return false;
	    }
	var dd11con=contractdate.substring(0,2);
    var mm1con=contractdate.substring(3,6);
    var mm11con=dateformat(mm1con);///alert(mm11);
    var yy11con=contractdate.substring(7,11);//alert(yy11);
   
    //if(yy11con<year || mm11con<month || dd11con<day)
    //{
      //      alert("Selected Contract Date Should be Future Date");
        //    document.getElementById("contractdate").value="";
         //   document.getElementById("contractdate").focus;
          //  return false;
    //}
   
  
    if(contractexpdate.length==0)
    {
    	alert("Please Enter Contract Expiry Date. ");
    	return false;
    }
		var dd11cone=contractexpdate.substring(0,2);
		var mm1cone=contractexpdate.substring(3,6);
		var mm11cone=dateformat(mm1cone);///alert(mm11);
		var yy11cone=contractexpdate.substring(7,11);//alert(yy11);
		mm11con=mm11con+2;
		
		if(yy11cone <yy11con)
		{
		        alert("Contract Expiry Date Should be 3 Month Grater then Contract Date");
		        document.getElementById("contractexpdate").value="";
		        document.getElementById("contractexpdate").focus;
		        return false;
		}else if(yy11cone==yy11con)
	     {
            if((mm11cone<mm11con|| dd11cone<dd11con))
            {
                alert("Contract Expiry Date Should be 3 Month Grater then Contract Date");
		        document.getElementById("contractexpdate").value="";
		        document.getElementById("contractexpdate").focus;
		        return false;
		}}
	
	if(accno.length==0)
	{
	alert("Please Enter Account Number");
	//documnet.AddNewUser.Mobno.focus();
	return false;
	}
	if(isNaN(accno))
	{
	alert("Enter the Valid Account Number");
	//document.AddNewUser.Mobno.focus();
	return false;
	}
	if((accno.length<10)||(accno.length>20))
	{
	alert("Your Account Number Should be Max 20 Digit Number");
	//document.AddNewUser.contact.select();
	return false;
	}
	if(bank.length==0)
	{
	 alert("Please Enter Bank Name");
	 return false;
	}
	
	if(ifsc.length==0)
	{
		alert("Please Enter IFCS No.");
		return false;
	}
	if(ifsc.length>=21)
	{
		alert("IFCS No. should not be more than 20 digit");
		return false;
	}
	//var letters16=letters.test(ifsc);
	//if(letters16==false)
	//{     
     //  alert('IFCS No must have Characters & Number only');    
      //  return false;  
     //}
	
	if(pan.length==0)
	{
		alert("Please Enter Pan Card No.");
		return false;
	}
	if(pan.length>=11)
	{
		alert("PAN No should not be more than 10 digit");
		return false;
	}
	var letters16=letters.test(pan);
	if(letters16==false)
	{     
       alert('Pan Card No must have Characters & Number only');    
        return false;  
     }
	
    if(policy.length==0)
	{
	alert("Please Enter the Policy Number");
	return false;
	}
    var lett=letters.test(policy);
    if(lett==false)
    {     
        alert('Policy Number must have Alphanumeric values');    
       return false;  
    } 
    if(policy.length>=15)
	{
		alert("policy No should not be more than 15 digit");
		return false;
	}
    if(doe.length==0)
    {
    	alert("Please Enter Mediclaim Expiry Date. ");
    	return false;
    }
	var dd11e=doe.substring(0,2);
    var mm1e=doe.substring(3,6);
    var mm11e=dateformat(mm1e);///alert(mm11);
    var yy11e=doe.substring(7,11);//alert(yy11);
    if(yy11e<year)
    {
            alert("Mediclaim Expiry Date Should be Greater Than Todays Date");
            document.getElementById("doe").value="";
            document.getElementById("doe").focus;
            return false;
    }
    else if(year==yy11e)
    {
            if(mm11e<month)
            {
            	alert("Mediclaim Expiry Date Should be Greater Than Todays Date");
                document.getElementById("doe").value="";
                document.getElementById("doe").focus;
                return false;
            }
    }
    if(mm11e==month && year==yy11e)
    {
            if(dd11e<day)
            {
            	alert("Mediclaim Expiry Date Should be Greater Than Todays Date");
                document.getElementById("doe").value="";
                document.getElementById("doe").focus;
                return false;
            }
    }
    
    if(namecont.length==0)
	{
		alert("Please Enter the Name of Immediate Contact ");
		return false;
	}
	var letters8=letters.test(namecont);
    if(letters8==false)
    {     
        alert('Name of Immediate Contact must have characters only');    
       return false;  
    } 
    
	if(contactno.length==0)
	{
	alert("Please Enter the Immediate Contact Number");
	return false;
	}
	if(isNaN(contactno))
	{
	alert("Enter the Valid Immediate Contact Number(10 Digit Number)");
	return false;
	}
	if((contactno.length<10)||(contactno.length>10))
	{
	alert("Your Immediate Contact Number Should be Valid 10 Digit Number");
	return false;
	}
	
	if(contaddress.length==0)
	{
		alert("Please Enter the Address of Immediate Contact ");
		return false;
	}
	//var letters9=letters.test(contaddress);
   // if(letters9==false)
    //{     
     //   alert('Address of Immediate Contact must have characters only');    
      // return false;  
    //} 
    if(relation.length==0)
	{
		alert("Please Enter the RelationShip");
		return false;
	}
	var letters19=letters.test(relation);
    if(letters19==false)
    {     
        alert('RelationShip must have characters only');    
       return false;  
    }
   return true;
}

function getDeptData(cmpCode)
{
		var xmlhttp;
		if (window.XMLHttpRequest)
		  {
		  // code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else if (window.ActiveXObject)
		  {
		  // code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		else
		  {
		  alert("Your browser does not support XMLHTTP!");
		  }
		xmlhttp.onreadystatechange=function()
		{
		if(xmlhttp.readyState==4)
		  {
	//	  alert(xmlhttp.responseText);
		  document.getElementById("deptName").innerHTML=xmlhttp.responseText;
		  }
		}
		xmlhttp.open("GET","AjxDeptData.jsp?cmpCode="+cmpCode,true);
		xmlhttp.send(null);
		
}
</script>
<body>
	<%
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st3=conn.createStatement();
String datenew1="",datenew2="";
datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
Date d=new Date();

Format df1= new SimpleDateFormat("yyyy-MM-dd");
String dtoday=df1.format(d);
System.out.println("665555555555555555555=");
%>
	<br>
	<br>
	<form name="EmpReg" id="EmpReg" action="empRegData.jsp" method="post"
		enctype="multipart/form-data" onsubmit="return validate();">
		<table bgcolor="#E0DDFE" align="center">
			<tr>
				<td align="center"><b><font size="4" color="#151B54">Contractor's
							Registration Form</font></b></td>
			</tr>
			<tr bgcolor="white">
				<td><b>Note: (*) Indicate Fields are Mandatory.</b></td>
			</tr>
			<tr bgcolor="white">
				<td>
					<table>
						<tr>
							<td></td>
						</tr>

						<tr>
							<td><b><font size="3" color="#151B54">Contractor's
										Details:</font></b></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Contractor ID : <font
										color="#990000">*</font>
								</b></label></td>
							<td><input type="text" name="empId" id="empId" class="input" />
							</td>
							<td><label id="custype"><b>Contractor Name : <font
										color="#990000">*</font></b></label></td>
							<td><select name="gender" id="gender" class="select"
								style="width: 45px">
									<option value="Mr.">Mr.</option>
									<option value="Ms.">Ms.</option>
							</select> <input type="text" name="empName" id="empName"
								style="border: 0px solid #000000;" value=""
								onclick="dodisable()" readonly="readonly" /></td>
						</tr>
						<tr>
							<td></td>
							<td><label id="custype"><b>First Name : <font
										color="#990000">*</font>
								</b></label></td>
							<td><label id="custype"><b>Middle Name : <font
										color="#990000"></font></b></label></td>
							<td><label id="custype"><b>Last Name :<font
										color="#990000"></font></b></label></td>

						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="text" name="fName" id="fName" class="input" />
							</td>
							<td><input type="text" name="mName" id="mName" class="input" />
							</td>
							<td><input type="text" name="lName" id="lName" class="input" />
							</td>
						</tr>

						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Company Name :<font
										color="#990000">*</font>
								</b></label></td>
							<td><select name="cmpName" id="cmpName" class="select"
								onchange="getDeptData(this.value);" style="width: 220px;">
									<option value="Select">Select</option>
									<% 
						try
						{
							String sqlCat="select CompanyCode,OurCompanyName from t_ourcompanydet";
						    ResultSet rsCat=st1.executeQuery(sqlCat);
						    while(rsCat.next())
						    { %>
									<option value="<%=rsCat.getString("CompanyCode") %>">
										<%=rsCat.getString("OurCompanyName") %>
									</option>
									<%  } 
						}
						catch(Exception e)
						{
							System.out.println("Exception======>>"+e);
						 }%>
							</select></td>
							<td id="frmDT" align="left" style="display: ''"><b>Date
									Of Joining : <font color="#990000">*</font>
							</b></td>
							<td><input type="text" id="doj" name="doj" size="12"
								value="<%=datenew1%>" class="input"
								style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
								readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "doj",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "doj"       // ID of the button
					    }
					  );
				</script></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Department Name : <font
										color="#990000">*</font></b></label></td>
							<td><select name="deptName" id="deptName" class="select"></select>
							</td>
							<td><label id="custype"><b>Contractor
										Designation :<font color="#990000">*</font>
								</b></label></td>
							<td><select name="empDesg" id="empDesg" class="select">
									<option value="Select">Select</option>
									<% 
						try
						{
							String sqlDesg="select designation from t_designation order by designation";
						    ResultSet rsDesg=st3.executeQuery(sqlDesg);
						    while(rsDesg.next())
						    { %>
									<option value="<%=rsDesg.getString("designation") %>">
										<%=rsDesg.getString("designation") %>
									</option>
									<%  } 
						}
						catch(Exception e)
						{
							System.out.println("Exception======>>"+e);
						 }%>
							</select></td>
						</tr>
						<tr>
							<td></td>
						</tr>

						<tr>
							<td></td>
						</tr>
						<tr>


						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Contact No : <font
										color="#990000">*</font></b></label></td>
							<td><input type="text" name="contact" id="contact"
								class="input" /></td>
							<td><label id="custype"><b>Email :<font
										color="#990000">*</font></b></label></td>
							<td><input type="text" name="email" id="email" class="input" />
							</td>

						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td id="frmDT" align="left" style="display: ''"><b>Date
									Of Birth :<font color="#990000">*</font>
							</b></td>
							<td><input type="text" id="dob" name="dob" size="12"
								value="<%=datenew1%>"
								style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
								readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "dob",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "dob"       // ID of the button
					    }
					  );
				</script></td>
							<td><label id="custype"><b>Marital Status : <font
										color="#990000">*</font></b></label></td>
							<td><select name="marial" id="marial" class="select"
								onchange="Change();">
									<option value="Select">Select</option>
									<option value="Single">Single</option>
									<option value="Married">Married</option>
							</select></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr style="display: none;" id="ani">
							<td id="frmDT" align="left"><b>Date Of Anniversary : <font
									color="#990000"></font></b></td>
							<td><input type="text" id="doa" name="doa" size="12"
								value="<%=datenew1%>"
								style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
								readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "doa",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "doa"       // ID of the button
					    }
					  );
				</script></td>
							<td id="frmDT" align="left"><b>Kids Details : <font
									color="#990000">*</font>
							</b></td>
							<td><select name="kids" id="kids" class="select"
								style="width: 70px" onchange="Change2();">
									<option value="Select">Select</option>
									<option value="Yes">Yes</option>
									<option value="No">No</option>
							</select></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr style="display: none;" id="bacche">
							<td><b>Children1 Sex:<font color="#990000"></font>
							</b></td>
							<td><select name="kidsex" id="kidsex" class="select"
								style="width: 72px">
									<option value="Male">Male</option>
									<option value="Female">Female</option>
							</select></td>
							<td><b>Name of Child1:<font color="#990000"></font>
							</b></td>
							<td><input type="text" name="child1" id="child1"
								class="input" /></td>
						</tr>
						<tr style="display: none;" id="bacche1">
							<td id="frmDT" align="left"><b>Date Of Birth Child1 <font
									color="#990000"></font> :
							</b></td>
							<td><input type="text" id="doch1" name="doch1" size="12"
								value="<%=datenew1%>"
								style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
								readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "doch1",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "doch1"       // ID of the button
					    }
					  );
				</script></td>
							<td id="c1"><input type="button" name="More" id="More"
								value="More Child" onclick="Change3();" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr style="display: none;" id="bacche2">
							<td><b>Children2 Sex : <font color="#990000"></font>
							</b></td>
							<td><select name="kidsex1" id="kidsex1" class="select"
								style="width: 72px">
									<option value="Male">Male</option>
									<option value="Female">Female</option>
							</select></td>
							<td><b>Name of Child2:<font color="#990000"></font> :
							</b></td>
							<td><input type="text" name="child2" id="child2" /></td>
						</tr>
						<tr style="display: none;" id="bacche3">
							<td id="frmDT" align="left"><b>Date Of Birth Child2 : <font
									color="#990000"></font></b></td>
							<td><input type="text" id="doch2" name="doch2" size="12"
								value="<%=datenew1%>"
								style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
								readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "doch2",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "doch2"       // ID of the button
					    }
					  );
				</script></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Address : <font
										color="#990000">*</font>
								</b></label></td>
							<td><textarea rows="2" cols="25" name="address" id="address"
									class="input"></textarea></td>


						</tr>
						<tr style="display: none;" id="sal">
							<td><label id="custype"><b>Basic Salary : <font
										color="#990000">*</font>
								</b></label></td>
							<td><input type="text" name="basic" id="basic" class="input" /></td>
							<td><label id="custype"><b>Tds : <font
										color="#990000">*</font>
								</b></label></td>
							<td><input type="text" name="tds" id="tds" class="input" /></td>

						</tr>
						<tr id="sal1" style="display: none;">
							<td><label id="custype"><b>Net Pay : <font
										color="#990000">*</font>
								</b></label></td>
							<td><input type="text" name="net" id="net" class="input" /></td>
							<td><label id="custype"><b>Other Allowance : <font
										color="#990000">*</font>
								</b></label></td>
							<td><input type="text" name="allow" id="allow" class="input" /></td>

						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><b><font size="3" color="#151B54">Contractor
										Registration:</font></b></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td id="contDate" align="left"><b>Contract Date:<font
									color="#990000">*</font>
							</b></td>
							<td><input type="text" id="contractdate" name="contractdate"
								size="12" value="<%=datenew1%>"
								style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
								readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "contractdate",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "contractdate"       // ID of the button
					    }
					  );
				</script></td>

							<td id="contexpirydate" align="left"><b>Contract Expiry
									Date : <font color="#990000">*</font>
							</b></td>
							<td><input type="text" id="contractexpdate"
								name="contractexpdate" size="12" value="<%=datenew1%>"
								style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
								readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "contractexpdate",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "contractexpdate"       // ID of the button
					    }
					  );
				</script></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label><b>Contract Document(file): <font
										color="#990000"></font>
								</b></label></td>
							<td><input type="file" name="myfile1" id="myfile1" /> <input
								type="hidden" name="fileName" id="fileName" value=""
								class="input"></input></td>
						</tr>

						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><b><font size="3" color="#151B54">Banking
										Details :</font></b></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Account Number :<font
										color="#990000">*</font>
								</b></label></td>
							<td><input type="text" name="accno" id="accno" class="input" />
							</td>
							<td><label id="custype"><b>Bank Name : <font
										color="#990000">*</font></b></label></td>
							<td><input type="text" name="bank" id="bank" class="input" />
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Branch Name : <font
										color="#990000"></font></b></label></td>
							<td><input type="text" name="branch" id="branch"
								class="input" /></td>
							<td><label id="custype"><b>IFSC Code :<font
										color="#990000">*</font>
								</b></label></td>
							<td><input type="text" name="ifsc" id="ifsc" class="input" />
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Pan Card No. : <font
										color="#990000">*</font>
								</b></label></td>
							<td><input type="text" name="pan" id="pan" class="input" />
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><b><font size="3" color="#151B54">MediClaim
										Details :</font></b></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Policy No : <font
										color="#990000">*</font>
								</b></label></td>
							<td><input type="text" name="policy" id="policy"
								class="input" /></td>
							<td><label id="custype"><b>Name Of Company : <font
										color="#990000"></font>
								</b></label></td>
							<td><input type="text" name="claimcmpny" id="claimcmpny"
								class="input" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Date Of Expiry : <font
										color="#990000">*</font>
								</b></label></td>
							<td><input type="text" id="doe" name="doe" size="12"
								value="<%=datenew1%>"
								style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
								readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "doe",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "doe"       // ID of the button
					    }
					  );
				</script></td>
							<td><label id="custype"><b>Amount For Claim : <font
										color="#990000"></font>
								</b></label></td>
							<td><input type="text" name="amount" id="amount"
								class="input" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label><b>Mediclaim(file) : <font
										color="#990000"></font>
								</b></label></td>
							<td><input type="file" name="myfile" id="myfile" /> <input
								type="hidden" name="fileName1" id="fileName1" value=""
								class="input"></input></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>

						<tr>
							<td><b><font size="3" color="#151B54">Immediate
										Contact Details :</font></b></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Name of Contact
										Person : <font color="#990000">*</font>
								</b></label></td>
							<td><input type="text" name="namecont" id="namecont"
								class="input" /></td>
							<td><label id="custype"><b>Contact No : <font
										color="#990000">*</font></b></label></td>
							<td><input type="text" name="contno" id="contno"
								class="input" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Address : <font
										color="#990000">*</font></b></label></td>
							<td><textarea rows="2" cols="25" name="contaddress"
									id="contaddress"></textarea></td>
							<td><label id="custype"><b>RelationShip : <font
										color="#990000">*</font></b></label></td>
							<td><input type="text" name="relation" id="relation"
								class="input" /></td>
						</tr>
						<tr>
							<td><input type="hidden" name="action" id="action"
								value="add"></input></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>

					</table>
					<table align="center">
						<tr>
							<td align="center"><input type="submit" id="submit1"
								value="Submit" class="button"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%
String dspData4=request.getParameter("sendMsg");
%>

	<input type="hidden" name="dspData4" id="dspData4"
		value="<%=dspData4 %>"></input>
	<%
if(!(dspData4==null))
 {
 	//System.out.println("==="+dspData1+"====="+dspData2+"======"+dspData3+"======="+dspData4+"=======");
 %>
	<script LANGUAGE="JavaScript" type="text/javascript"> -->
 	var d4=document.getElementById("dspData4").value;
 	alert(d4);
 	</script>
	<% 
 }
%>
	<%
conn.close();
%>
</body>
</html>