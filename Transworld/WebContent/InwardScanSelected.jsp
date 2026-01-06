<%@ page language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<html>

<head>

<title>Transworld</title>
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<script src="sorttable.js" type="text/javascript"></script>
<script LANGUAGE="JavaScript" type="text/javascript">
var detailsWindowTimer;
var detailsWindow;
var crg=null;
 function abc()
 {
	 return validate();
	 
	document.formForAjx.action="http://www.myfleetview.com/FleetView-spring/tripstart1.jsp";	
	document.formForAjx.submit();
	 
 }
    

function toggleDetails(id,show)
{
//	alert("in togel");
    // alert(show);
var popup = document.getElementById("popup"+id);
if (show) {
//alert("in if  "+popup.value);
popup.style.visibility = "visible";

popup.setfocus();

} else {
popup.style.visibility = "hidden";

 }
}

var zoom1 = 0;

function getzoomimage(image,filename,show,id)
{
	//alert(show);
	/* var serverid=document.getElementById("serverid").value;
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value; */
   if(show=="true")
   {
	// alert("zoom..... in ");
	 //  var i=filename+" "+filename;
	 //  alert(filename);
							
	document.getElementById("myimage"+id).src="http://twtech.in/TWDOC/"+filename+"";
    //alert("serverid="+serverid+" password="+password+" username="+username);
    document.getElementById("myimage"+id).width="700";
    document.getElementById("myimage"+id).height="700";
    //  document.myimage1.width = "450";
    //  document.myimage1.height = "350";
   }
   else
   {
	 //alert("zoom..... out ");
     
	  document.getElementById("myimage"+id).src="http://twtech.in/TWDOC/"+filename+"";
      //alert(document.myimage.src);
      document.getElementById("myimage"+id).width="250";
      document.getElementById("myimage"+id).height="150";
    }
}

function selectoption()
{
	document.form1.to.focus();
}

function getAddContact()
{
	try
	{
		window.open('contactdetails.jsp','mywindow1','width=1200, height=550, location=0, status=0, menubar=0, resizable=0, scrollbars=yes');
		
	}
	catch(e)
	{
		alert(e);
	}
	//return false;
}
function showVisitingCardDetails(eName,empMail)
{
	document.getElementById("from1").value=eName;
	document.getElementById("SelectedEmpMail").value=empMail;
	document.getElementById("EmpList").style.display='none';
}
function getEmp123()
{
	//alert("============================>>"+crg);
	document.getElementById("EmpList").style.display='block';
	var emp=document.getElementById("from1").value;
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
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}

	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			var reslt=ajaxRequest.responseText;
			document.getElementById("EmpList").innerHTML=reslt;
		} 
	}
	var queryString = "?emp=" +emp+"&crg="+crg;
	ajaxRequest.open("GET", "SearchBoxForFromCategory.jsp" + queryString, true);
	ajaxRequest.send(null); 
	
}
function datevalidate()
{
	var date1=document.getElementById("data").value;
//	var date2=document.getElementById("data1").value;
  
	var dm1,dd1,dy1;//,dm2,dd2,dy2;
	dy1=date1.substring(0,4);
//	dy2=date2.substring(0,4);
	dm1=date1.substring(5,7);
//	dm2=date2.substring(5,7);
	dd1=date1.substring(8,10);
//	dd2=date2.substring(8,10);
//    var d2date=date2.substring(0,2);
    var d1date=date1.substring(0,2);
    var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var year=date.getFullYear();
	return true;
}

function getEmp(deptName)
{
	
	deptName=escape(deptName);
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
		  //alert(xmlhttp.responseText);
		  document.getElementById("to").innerHTML=xmlhttp.responseText;
		  }
		}
		xmlhttp.open("GET","getEmp.jsp?deptName="+deptName,true);
		xmlhttp.send(null);
		
}
function isDecimal(str){
	if(isNaN(str) || str.indexOf(".")<0){
	alert("Enter Decimal Number");
	}
	else{
	str=parseFloat(str);
	alert ("Entered number is decimal");
	}
	}
function validate()
{
	
	var val1 = document.getElementById("inno").value;
	var val2 = document.getElementById("inrefno").value;
	var val3 = document.getElementById("from").value;
	var frm = document.getElementById("from1").value;
	var val4 = document.getElementById("prno").value;
	var val8 = document.getElementById("dept").value;
	var val5 = document.getElementById("to").value;//document.to.value;
	var val7 = document.getElementById("sub").value;
	var val9 = document.getElementById("cat").value;
	var actDate= document.getElementById("data").value;
	var priority=document.getElementById("priority").value;
	//var val10 = document.getElementById("fileName").value.replace(/\s+/g,'');

	var bn= document.getElementById("blno").value;
	var bmt= document.getElementById("blamt").value;

	var billdate=document.getElementById("bldate").value;
	var billduedate=document.getElementById("blduedate").value;
	

	
//	var rdbtn=document.getElementsById("rd1").value;
	/*
	var rdbtn;
	if(document.registrationform.rd[0].checked==true)
	{
		rdbtn= document.getElementById("rd1").value;
	}
	if(document.registrationform.rd[1].checked==true)
	{
		rdbtn= document.getElementById("rd2").value;
	}
	if(document.registrationform.rd[2].checked==true)
	{
		rdbtn= document.getElementById("rd3").value;
	}
*/
//	alert(rdbtn);
	if(val9=="" || val9=="Select"){
		alert("Please Select Category");
		return false;
	}

	if(val9=="Bills")
	{
		if(bn=="")
		{
			alert("Please Enter Bill No.");
			return false;
		}
		if(bmt=="")
		{
			alert("Please Enter Bill Amt");
			return false;
		}
		else if(isNaN(bmt))
      	{
      		alert("Please Enter Numeric Value For Bill Amount");
      		return false;
      	}
      	/*
		if(billdate>billduedate)
		   {
			alert("Bill Due Date can not be less than Bill Date");
				return false;
			}*/	
	}
	
	if(val3=="" && frm==""){
		alert("Please Enter Inward From Party Name");
		return false;
	}
	if(val4==""){
		alert("Please Enter Party Ref. No");
		return false;
	}
	if(val8==""){
		alert("Please Enter Department");
		return false;
	}
	if(val5==""){
		alert("Please Select Employee Name");
		return false;
	}
	if(val7==""){
		alert("Please Enter Subject");
		return false;
	}
	
	if(priority=="" || priority=="Select"){
		alert("Please Select Priority");
		return false;
	}

	

	
	/*
	if(val10=="" || val10==","){
		alert("Please Select File for Upload");
		return false;
	}
	*/
/*
	if(rdbtn="" || rdbtn==null)
	{
		alert("Please Select Mail Type");
		return false;
	}
	*/
	return true;
}
function getCategory(catgry)
{
	var ct=catgry;
	crg=ct;

	if(crg=="Bills")
	{
		document.getElementById("frmParty1").style.display='none';
		document.getElementById("frmParty").style.display="";
		document.getElementById("custLink").style.display='none';
		document.getElementById("billno").style.display="";
		document.getElementById("billamt").style.display="";
		document.getElementById("billdate").style.display="";
		document.getElementById("billduedate").style.display="";
		document.getElementById("agrParty").style.display='none';
		document.getElementById("agrFrom").style.display='none';
		document.getElementById("agrFrmDt").style.display='none';
		document.getElementById("agrToDt").style.display='none';
	}
	else if(crg=="customer")
	{
		document.getElementById("frmParty1").style.display='none';
		document.getElementById("frmParty").style.display="";
		document.getElementById("custLink").style.display='none';
		document.getElementById("billno").style.display='none';
		document.getElementById("billamt").style.display='none';
		document.getElementById("billdate").style.display='none';
		document.getElementById("billduedate").style.display='none';
		document.getElementById("agrParty").style.display='none';
		document.getElementById("agrFrom").style.display='none';
		document.getElementById("agrFrmDt").style.display='none';
		document.getElementById("agrToDt").style.display='none';
	}
	else if(crg=="Visiting Card")
	{
		document.getElementById("frmParty1").style.display="";
		document.getElementById("frmParty").style.display='none';
		document.getElementById("custLink").style.display="";
		document.getElementById("billno").style.display='none';
		document.getElementById("billamt").style.display='none';
		document.getElementById("billdate").style.display='none';
		document.getElementById("billduedate").style.display='none';
		document.getElementById("agrParty").style.display='none';
		document.getElementById("agrFrom").style.display='none';
		document.getElementById("agrFrmDt").style.display='none';
		document.getElementById("agrToDt").style.display='none';
	}
	else if(crg=="Agreement")
	{
		document.getElementById("frmParty1").style.display="";
		document.getElementById("frmParty").style.display='none';
		document.getElementById("custLink").style.display='none';
		document.getElementById("billno").style.display='none';
		document.getElementById("billamt").style.display='none';
		document.getElementById("billdate").style.display='none';
		document.getElementById("billduedate").style.display='none';
		document.getElementById("agrParty").style.display="";
		document.getElementById("agrFrom").style.display="";
		document.getElementById("agrFrmDt").style.display="";
		document.getElementById("agrToDt").style.display="";
	}
	else
	{
		document.getElementById("frmParty1").style.display="";
		document.getElementById("frmParty").style.display='none';
		document.getElementById("custLink").style.display='none';
		document.getElementById("billno").style.display='none';
		document.getElementById("billamt").style.display='none';
		document.getElementById("billdate").style.display='none';
		document.getElementById("billduedate").style.display='none';
		document.getElementById("agrParty").style.display='none';
		document.getElementById("agrFrom").style.display='none';
		document.getElementById("agrFrmDt").style.display='none';
		document.getElementById("agrToDt").style.display='none';
	}
}

function getFTPImage(ftpFile)
{

	
	try
	{
		var serid=document.getElementById("serverid").value;
		var usrnm=document.getElementById("username").value;
		var paswd=document.getElementById("password").value;
		
	//	alert(escape(ftpFile));
	//	alert(ftpFile);
	//	window.open('showFTP.jsp?ftpFile='+escape(ftpFile)+'','mywindow','width=700, height=700, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
		//window.open('ftp://sumedh:789&*(medh@202.38.172.58/test/'+ftpFile+'','','location=0,menubar=1,resizable=1,width=650,height=750');
		window.open('ftp://'+usrnm+':'+paswd+'@'+serid+'/test/'+ftpFile+'','','location=0,menubar=1,resizable=1,width=650,height=750');

	}
	catch(e)
	{
		alert(e);
	}
} 

function arrangeFiles(name,id,chbx)
{
	try
	{
		detailsWindow = window.open('rearrangeLogic.jsp?id='+id+'&name='+name+'&chbx='+chbx,'mywindow2','width=400, height=400, location=0, status=0, menubar=0, resizable=0, scrollbars=yes');
	}
	catch(e)
	{
		alert(e);
	}
}
function moveup(movement, SerialList, srNo)
{
	//alert(movement+"^^^^^"+SerialList+"^^^^^"+srNo);
	
//	var chbx=document.getElementById("chbx12").value;
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
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}

	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			var reslt=ajaxRequest.responseText;
		//	alert(reslt);
		//	var mySplitResult = reslt.split("#");
		//	var chk=mySplitResult[0];
		//	var chbxAjx=mySplitResult[1];
			var chk=reslt;
			try
			{
			//	yourStrindocument.myimage.widthg = yourString.replaceAll("\\s+", " ");
			//	chk=chk.replaceAll("\\s+"," ");
			chk=chk.replace(/\s+/g, ' ');
			
				var len=chk.length-2;
				chk=chk.substring(2,len);
			//	alert(chk);
			}
			catch (e) 
			{
				alert(e);	
			}
	//		document.getElementById("id").value=chk;
	//		document.getElementById("chbx").value=chbxAjx;
	//		document.forms["frm1"].submit();
	//		chkAjx(chk,chbxAjx);
			chkAjx(chk);
		}
	}
	var queryString = "?movement="+movement+"&SerialList="+SerialList+"&srNo="+srNo;
	ajaxRequest.open("GET", "rearrangeAjax.jsp" + queryString, true);
	ajaxRequest.send(null); 
}
function chkAjx(v1)
{
//	alert(v1);
	document.getElementById("finalidlistAjx").value=v1;
	document.forms["formForAjx"].submit();
//	document.getElementById("chbx12").value=chbxAjx;
}

function test()
{
try{
	alert("In test functionn ");
	
	
}catch(e){alert(e);}
}
function display(file)
{
	//alert("hiii");
	var filename=file;

	window.open('http://twtech.in/TWDOC/'+filename+'','mywindow','width=400, height=500, resizable=yes, scrollbars=yes');

}
</script>
</head>

<body ONKEYDOWN="if (event.keyCode == 27){document.getElementById('EmpList').style.display = 'none';}" > 

<%
//System.out.println("[[[[[[[[[[[[[[[[[[["+request.getQueryString()+"]]]]]]]]]]]]]]]]]]");
String datenew1=request.getParameter("data");
System.out.println("DATE NEW   "+datenew1);
if(null==datenew1)
{
	datenew1=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
}
%>
<% 
	String sterm,sterm2;
	Statement stmt=null;
	Statement stmt1=null;
	Statement stftp=null;
	String sql=null;
	
	String chbx=request.getParameter("chbx");
	System.out.println("checked box      "+chbx);
	
%>

<form action="" name="formForAjx" id="formForAjx" method="get">
<input type="hidden" name="finalidlistAjx" id="finalidlistAjx">
<input type="hidden" name="chbx" id="chbx" value="<%=chbx%>">
</form>


<div id="iwrdScan"  style="margin-left:2%; margin-top:1%; height:90%;width:50%; overflow:auto; position:absolute; border-radius: 12px 12px 12px 12px;">
<%
try {
	stmt=conn.createStatement();
	stmt1=conn.createStatement();
	stftp=conn.createStatement();

	String emailid="";	
String fileIwrd="",srNoStr="";
String serverid="",usernm="",passwd="";	


String sqlftp="select * from t_ftpconnection";
ResultSet rsftp=stftp.executeQuery(sqlftp);
rsftp.next();
serverid=rsftp.getString("ServerID");
usernm=rsftp.getString("Username");
passwd=rsftp.getString("Password");

String category="",customer="";
%>



<%System.out.println(request.getParameter("chbx")+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+request.getParameter("finalidlist")); 
String finalListStr="";
if(null==request.getParameter("finalidlistAjx"))
{
	//finalListStr=request.getParameter("finalidlist");
	finalListStr=request.getParameter("serialSelected");
	System.out.println("1111111111   1111111111  "+finalListStr);
}
else
{
	finalListStr=request.getParameter("finalidlistAjx");
}


%>
<input type="hidden" name="srNoStr" id="srNoStr" value="<%=finalListStr%>"></input>


<%


System.out.println("!!!!!!!!!!"+chbx);
//int cnt=Integer.parseInt(cnt1);
int chb=Integer.parseInt(chbx);
String msg = (String)session.getAttribute("errormsg");

%>
<%
//======Get new iwno and iwrefno============================================================================
Statement st1=conn.createStatement();
		/*
		String srNo=request.getParameter("serialSelected");
		
		//******From Rearrange Page**************************************************
		String ss1=request.getParameter("finalidlist");
		if(ss1!=null && ss1!="")
		{
			//srNoStr=ss1;
			srNo=ss1;
		}
		
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$-------->>"+srNo);
		*/
		//***************************************************************************
		
			String sqlUpload="select * from t_uploadedFiles where SrNo in("+finalListStr+") ORDER BY FIELD(SrNo,"+finalListStr+")";
			System.out.println(sqlUpload);	
			ResultSet rs1=st1.executeQuery(sqlUpload);
			while(rs1.next())
			{
				if(fileIwrd==null || fileIwrd=="")
				{
					fileIwrd=rs1.getString("FileName");
					//srNoStr=srNo;
				}
				else
				{
					fileIwrd=fileIwrd+","+rs1.getString("FileName");
					//srNoStr=srNoStr+","+srNo;
				}
				category=rs1.getString("Category");
				customer=rs1.getString("CustomerName");
				System.out.println(fileIwrd+" -----   "+category+"    -----------   "+customer);
				
			}
	//	srNoStr=srNo;
	srNoStr=finalListStr;
			
			
			


System.out.println(fileIwrd+"}}}}}}}}>>"+srNoStr);

//int i=0,j=0,iwno=0;
//String refno="",dt="",a="";
String date=new SimpleDateFormat("ddMMyyyy").format(new java.util.Date());
java.text.DecimalFormat df = new java.text.DecimalFormat("00");
try
{
	System.out.println("hello");
	/*    refno="IW";
		//String sqlIwno="select rid, InwardNo, InwardDate from t_inwarddetails order by rid Desc limit 1";
        String sqlIwno="SELECT rid,InwardRefNo  from t_inwarddetails  where InwardRefNo like ('"+refno+""+date+"%') ORDER BY InwardRefNo DESC LIMIT 1";
		stmt=conn.createStatement();
		ResultSet rst=stmt.executeQuery(sqlIwno);
		if(rst.next())
		{
			String a1=rst.getString(2);
			System.out.println(">>>>>>>>  "+a1);
			iwno=rst.getInt("rid");
			refno=rst.getString(2).substring(0,rst.getString(2).length()-2)+df.format(Integer.parseInt(rst.getString(2).substring(rst.getString(2).length()-2, rst.getString(2).length()))+1);
*/
			/*java.util.Date d1=rst.getDate("InwardDate");
			java.util.Date d2=new SimpleDateFormat("yyyy-MM-dd").parse(new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));
		//	out.println("==="+d1.toString()+"====="+d2.toString()+"==");
			if(d1 != null)
			{
				j=d1.compareTo(d2);
				if(j<0)
				{
					i=1;
					a=new SimpleDateFormat("ddMMyyyy").format(new java.util.Date());
					refno="IW"+a+"00"+i;
				}
				else
				{
					i=rst.getInt("InwardNo")+1;
					if(i<10)
					{
						a=new SimpleDateFormat("ddMMyyyy").format(new java.util.Date());
						refno="IW"+a+"00"+i;
					}
					else if(i>10 && i<100)
					{
						a=new SimpleDateFormat("ddMMyyyy").format(new java.util.Date());
						refno="IW"+a+"0"+i;
					}
					else
					{
						a=new SimpleDateFormat("ddMMyyyy").format(new java.util.Date());
						refno="IW"+a+""+i;
					}
				}
			}*/
	//	}
	//	else
	//	{
			/*i=1;
			a=new SimpleDateFormat("ddMMyyyy").format(new java.util.Date());
			refno="IW"+a+"00"+i;*/
	//		refno+=date+"001";	
	//	}
}
catch(Exception e)
{
	out.println("Exception=================>>"+e);
}
//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>refno:"+refno); 
//==================================================================================
%>


<form action="testNew.jsp" method="get" name="form1" id="form1">
<input type="hidden" name="serverid" id="serverid" value="<%=serverid %>"/>
<input type="hidden" name="username" id="username" value="<%=usernm %>"/>
<input type="hidden" name="password" id="password" value="<%=passwd%>"/>
<%

%>
<input type="hidden" name="chbx" id="chbx" value="<%=request.getParameter("chbx")%>">
<table align="left">
<tr>
<td></td>
<td></td>
<td></td>
<td align="left">

<table border="0" height="500" width="500" align="left">
<tr><td align="center">
		<table align="center">
		<tr>
			<td align="center"><b><font size="4" color="#151B54">Inward Uploaded Document</font></b></td>
			</tr>		
		</table>
</td></tr>
<tr><td>
		<!--  <table bgcolor="white" border="0" height="600" width="500" align="center">-->
		<div >
			<input type="hidden" name="path" id="path" value="<%=request.getContextPath()%>">
			<tr><td>
				<!--*******************************************************************************************  -->
				<input type="hidden" name="srNoStr" id="srNoStr" value="<%=finalListStr%>"></input>
				<input type="hidden" name="fileName" id="fileName" value="<%=fileIwrd%>"></input>
				<!--*******************************************************************************************  -->
				
				<table  align="center">
				<tr><td><font  color="#990000">* Required</font></td></tr>
				
				<tr>
				<td><input type="radio" name="searchBy" value="Inward" checked="Checked" />Inward</td>
				<td><input type="radio" name="searchBy" value="Outward"  />Outward</td>
				</tr>
<!-- 				<tr> -->
<!-- 				<td><label id="custype"><b>Inward No<font  color="#990000"></font> :</b></label></td> -->
<%-- 				<td><label id="custype1"><%=iwno%></label> --%>
<%-- 					<input type="hidden" name="inno" id="inno" value="<%=iwno%>" readonly/> --%>
<!-- 				</td> -->
<!-- 				</tr> -->
				
<!-- 				<tr> -->
<!-- 				<td><label id="custype"><b>Inward Ref. No<font  color="#990000"></font> :</b></label></td> -->
<%-- 				<td><label id="custype1"><%=refno%></label> --%>
<%-- 					<input type="hidden" name="inrefno" id="inrefno" value="<%=refno%>" readonly/> --%>
<!--    				</td> -->
<!--    				</tr> -->
   				
  				<tr>
				<td><label id="custype"><b>Ref. No<font  color="#990000"></font> :</b></label></td>
				<td><input type="text" name="manualref" id="manualref" /></td>
   				</tr>
  				 
				<tr><td>
				<label id="custype"><b>Category<font  color="#990000">*</font>  :</b></label>
				</td><td>
				<select name="cat" id="cat" class="formElement" onchange="getCategory(this.value);">
				<% 
				try{
				String sqlCat="select distinct(InwrdCategory) from t_InwardCategory" ;
				   ResultSet rsCat=stmt1.executeQuery(sqlCat);
				    while(rsCat.next())
				    { %>
				     <option value="<%=rsCat.getString("InwrdCategory") %>"> <%=rsCat.getString("InwrdCategory") %> </option>
				<%  } 
				}
				catch(Exception e){System.out.println("Exception======>>"+e);}%>
		        </select>
				</td></tr>
				<tr id="custLink" style="display:none">
			<td>
			<a href="#" onclick="getAddContact()">Add Contact</a>
			</td>
			</tr>
			<tr><td>
			<label id="custype"><b>From<font  color="#990000">*</font>  :</b></label></td>
			<td id="frmParty" style="display:none">
				<input type="hidden" name="SelectedEmpMail" id="SelectedEmpMail" value=""/>
				<input type="text" name="from1" id="from1" autocomplete="off"  value="" size="30%"  onkeyup="if (event.keyCode == 27  || event.keyCode == 13){document.getElementById('EmpList').style.display = 'none';} else { getEmp123(); }" /> 
					&nbsp;&nbsp;&nbsp;<br>
					<div style="position: absolute;">
					  <table>
					  	<tr><td></td></tr>
						<tr><td>
							<div id='EmpList'></div>
						</td></tr>
				  	  </table>
				    </div>
			</td>
			
			
			<td id="frmParty1" style="display: ">
				<input type="text" name="from" id="from" size="30%"/>
			</td>
			</tr>
			
		
		
		<tr id="billno" style="display:none"> 
			<td><label id="custype"><b>Bill No.<font  color="#990000">*</font> :</b></label></td>
			<td><input type="text" name="blno" id="blno" /></td>
		</tr>
		<tr id="billamt" style="display:none">
			<td><label id="custype"><b>Bill Amt.<font  color="#990000">*</font> :</b></label></td>
			<td><input type="text" name="blamt" id="blamt" /></td>
		</tr>
		
		
		<tr id="billdate" style="display:none"><td>
			<label id="custype"><b>Bill Date<font  color="#990000">*</font> :</b></label>
			</td><td>
				<input type="text" id="bldate" name="bldate" size="12" value="<%=datenew1%>" readonly/>
						<script type="text/javascript">
						  Calendar.setup(
						    {
						      inputField  : "bldate",         // ID of the input field
						      ifFormat    : "%d-%b-%Y",    // the date format									
						      button      : "bldate"       // ID of the button
						    }
						  );
					</script>
			</td></tr>
		<tr id="billduedate" style="display:none">
		<td>
			<label id="custype"><b>Bill Due Date<font  color="#990000">*</font> :</b></label>
			</td><td>
				<input type="text" id="blduedate" name="blduedate" size="12" value="<%=datenew1%>" readonly/>
						<script type="text/javascript">
						  Calendar.setup(
						    {
						      inputField  : "blduedate",         // ID of the input field
						      ifFormat    : "%d-%b-%Y",    // the date format
						      button      : "blduedate"       // ID of the button
						    }
						  );
					</script>
			</td>
		</tr>
		
		
		<tr id="agrParty" style="display:none"> 
			<td><label id="custype"><b>Agreement Party<font  color="#990000">*</font> :</b></label></td>
			<td><input type="text" name="agreementParty" id="agreementParty" /></td>
		</tr>
		<tr id="agrFrom" style="display:none">
			<td><label id="custype"><b>Agreement Date<font  color="#990000">*</font> :</b></label></td>
			<td>
				<input type="text" id="agreementDate" name="agreementDate" size="12" value="<%=datenew1%>" readonly/>
						<script type="text/javascript">
						  Calendar.setup(
						    {
						      inputField  : "agreementDate",         // ID of the input field
						      ifFormat    : "%d-%b-%Y",    // the date format									
						      button      : "agreementDate"       // ID of the button
						    }
						  );
					</script>
			</td>
		</tr>
		
		
		<tr id="agrFrmDt" style="display:none"><td>
			<label id="custype"><b>Agreement From<font  color="#990000">*</font> :</b></label>
			</td><td>
				<input type="text" id="agreementFrom" name="agreementFrom" size="12" value="<%=datenew1%>" readonly/>
						<script type="text/javascript">
						  Calendar.setup(
						    {
						      inputField  : "agreementFrom",         // ID of the input field
						      ifFormat    : "%d-%b-%Y",    // the date format									
						      button      : "agreementFrom"       // ID of the button
						    }
						  );
					</script>
			</td></tr>
		<tr id="agrToDt" style="display:none">
		<td>
			<label id="custype"><b>Agreement To<font  color="#990000">*</font> :</b></label>
			</td><td>
				<input type="text" id="agreementTo" name="agreementTo" size="12" value="<%=datenew1%>" readonly/>
						<script type="text/javascript">
						  Calendar.setup(
						    {
						      inputField  : "agreementTo",         // ID of the input field
						      ifFormat    : "%d-%b-%Y",    // the date format
						      button      : "agreementTo"       // ID of the button
						    }
						  );
					</script>
			</td>
		</tr>
		
		
		<tr><td>
			<label id="custype"><b>Party Ref. No<font  color="#990000">*</font> :</b></label>
			</td><td>
			<input type="text" name="prno" id="prno" />
		</td></tr>
		
		<tr><td>
			<label id="custype"><b>Address<font  color="#990000"></font> :</b></label>
			</td><td>
			<textarea name="address" rows="2" id="address"></textarea>
		</td></tr>
		
		<tr><td>
		<label id="custype"><b>Department<font  color="#990000">*</font>  :</b></label>
		</td><td>
		<select name="dept" id="dept" class="formElement" onchange="getEmp(this.value);">
		<option value="Select">Select</option>
<% sql="select distinct(TypeValue) as Dept from t_leaveadmin order by Dept asc" ;
   ResultSet rst3=stmt.executeQuery(sql);
    while(rst3.next())
    { %>
     <option value="<%=rst3.getString("Dept") %>"> <%=rst3.getString("Dept") %> </option>
<%  } %>
        </select>
		</td></tr>
		
		
		
   		<tr><td>
		<label id="custype"><b>To<font  color="#990000">*</font>  :</b></label>
		</td><td>
			<select name="to" id="to" class="formElement" multiple="multiple" size="5" style="width: 200px;" onchange="selectoption();"></select>
	</td></tr>
		
		
		<tr><td>
			<label id="custype"><b>Subject<font  color="#990000">*</font> :</b></label>
		</td><td>
			<input type="text" name="sub" id="sub" />
		</td></tr>
		
		
	
		<tr><td>
			<label id="custype"><b>Action Date<font  color="#990000">*</font> :</b></label>
		</td><td>
			<input type="text" id="data" name="data" size="12" value="<%=datenew1%>" readonly/>
					<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data"       // ID of the button
					    }
					  );
				</script>
		</td><td></tr>
		
		<tr><td>
		<label id="custype"><b>Priority<font  color="#990000">*</font>  :</b></label>
		</td><td>
		<select name="priority" id="priority" class="formElement">
	        <option value="Low">Low</option>
	        <option value="Medium">Medium</option>
	        <option value="High">High</option>
        </select>
		</td></tr>
		
		<tr><td>
			<label id="keywords"><b>Keywords<font  color="#990000">*</font> :</b></label>
			</td><td>
			<input type="text" name="keywords" id="keywords" />
		</td></tr>
		
   		<tr><td>
		<label id="custype"><b>Remarks<font  color="#990000"></font>  :</b></label>
		</td><td>
		<textarea name="remark" rows="3" id="remark"></textarea>
		</td></tr>
		<!--  
		<tr>
		<td><font  color="#990000"></font>
				<input TYPE="radio" id="rd1" name="rd" VALUE="link" size="2" checked="checked"/>Send Intimation
				&nbsp;&nbsp;</td><td>
				<input TYPE="radio" id="rd3" name="rd" VALUE="save" size="2"/>Save File
		</td>
		</tr>
		-->
		
		
		<table align="center">
		<tr>
		<td align="center">
					<input type="button" value="Reset" onclick="this.form.reset()">
		</td>
		<td align="center"> 
		              <input  type="submit" id="submitButton1" value="Send" onclick="abc();">
		</td>
		</tr>
		</table>
		</td></tr>
				
				</table>
			</td></tr>
			<input type="hidden" name="flag" id="flag" value="false"></input>
			
			
	</div>	
	<!--  	</table>-->
</td></tr>
</table>

</td>
</tr>
</table>


</form>



</div>
<div id="showcontent1" style="margin-left:55%; margin-top:2%; height:10%;width:10%; overflow: auto; position:absolute;  border-radius: 12px 12px 12px 12px;" ><table>

</table></div>
<div id="showcontent" style="margin-left:55%; margin-top:4%;width:40%; overflow: auto; position:absolute;  border-radius: 12px 12px 12px 12px;" >

<table>
<%
int rwCnt=0,k=0;
String srCnt="";
String sql1="select * from t_uploadedFiles where SrNo in ("+srNoStr+") ORDER BY FIELD(SrNo,"+srNoStr+")";
System.out.println("))))))))))))))"+sql1);
ResultSet rsShow=stmt1.executeQuery(sql1);
while(rsShow.next())
	{
		rwCnt++;
		k++;
		System.out.println(rsShow.getString("FileName"));
   		String w=rsShow.getString("FileName").replace(" ","%");
   		srCnt=rsShow.getString("SrNo");
   		%>
   		
   		<tr>
   			<td>
   			<a href='#' onclick="javascript: try{moveup('up','<%=srNoStr.trim()%>','<%=srCnt.trim()%>');}catch(e){alert(e);}"><img src="images/up.png" height='10' width='10'></img></a>
			<a href='#' onclick="javascript: try{moveup('down','<%=srNoStr.trim()%>','<%=srCnt.trim()%>');}catch(e){alert(e);}"><img src="images/down.png" height='10' width='10'></img></a>
   				<!-- 
   			</td>
    		</tr>
   		
   		
   		
   		<tr>
   		   			
   			<td><div align="left"  >

 -->
<%-- <font ><img  name="myimage<%=k%>" id="myimage<%=k%>" src="http://twtech.in/TWDOC/<%=rsShow.getString("FileName")%>" height='150' width='250' ></img><a href="javascript:toggleDetails(<%=k%>,true);" title="Click To See the Details"><%=rsShow.getString("FileName")%></a> </font><br />
 --%>

<%-- <font ><iframe src="http://twtech.in/TWDOC/<%=rsShow.getString("FileName")%>" width="600" height="400"></iframe><a href="javascript:toggleDetails(<%=k%>,true);" title="Click To See the Details"><%=rsShow.getString("FileName")%></a> </font><br />
 --%>
 <font><embed name="myimage<%=k%>" id="myimage<%=k%>" src="http://twtech.in/TWDOC/<%=rsShow.getString("FileName")%>" 
       width="100%" height="400" type="application/pdf"><a href="javascript:toggleDetails(<%=k%>,true);" title="Click To See the Details"><%=rsShow.getString("FileName")%></a> </font><br />
 
<div class="popup" id="popup<%=k%>" style="visibility: hidden;">
<table border="1" bgcolor="white" cellpadding="0" cellspacing="0">

<tr>
<td>	<a href='#' onclick="display('<%=w%>')"><br>Open in Pop up Window</a></td>
      
</tr>
<tr>
<td><a href='#' onclick="getzoomimage('<%=w%>','<%=rsShow.getString("FileName")%>','true','<%=k%>');"><br>Zoom In</a></td>
</tr>
<tr>
<td><a href='#' onclick="getzoomimage('<%=w%>','<%=rsShow.getString("FileName")%>','false','<%=k%>');"><br>Zoom Out</a></td>
</tr>

<tr><td><a href="javascript:toggleDetails(<%=k%>,false);">Close</a></td></tr>
</table>
</div> 
</div></td>
   			
   			
   			
   			
   			
    		</tr>
    	<%
	} //end of while   
%>
</table>
</div>

<%
}catch(Exception e)
{
	out.print("Exception -->"+e);
}
finally
{
	conn.close();
}
%>
</body>

</html>
