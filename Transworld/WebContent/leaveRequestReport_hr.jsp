<%@page import="java.awt.Color"%>
<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>
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
<title>Transworld - Leave Application</title>


<script type="text/javascript">
function gotoPrint(divName)  
{  
	  
	  var printContents = document.getElementById(divName).innerHTML; 
	  var originalContents = document.body.innerHTML; 
	  document.body.innerHTML = printContents;  
	  window.print();
	  document.body.innerHTML = originalContents;  
}


function gotoExcel(elemId, frmFldId)  
{  

         
          //alert("HI>>>gotoExcel>  leave>>");
    
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId); 
          oFld.value = obj.innerHTML;  
                   
         //alert("obj==@>"+obj);
         //alert("oFld==@>"+oFld);
         // alert("11111");

           try{
             document.leave.action ="excel.jsp";

           //alert("222222");
          document.forms["leave"].submit();
         // alert("33333");


           }catch(e){alert("exception>>>"+e);}

}
function selectAll()
	{
      // alert("HIIII");
  try{
		var cntr=document.fullfleet1.cntr.value;

			//alert("HIIII11111   ");
		cntr=cntr-1;
	  // alert(document.getElementById("cb1"+j).value)
		if(document.fullfleet1.maincb.checked==true)
		{
			//alert("unside>>>");
			for(var j=0;j<=cntr;j++)
			{	
				document.getElementById("cb1"+j).checked=true;
			}
		}
		else
		{
			
			for(var j=0;j<=cntr;j++)
			{	
				document.getElementById("cb1"+j).checked=false;
			}
		
		}
  }catch(e){
    // alert(e); 
		}
		  //alert("HIIII 2222");
		}
function gotoExcel1(elemId, frmFldId)  
{  

         
        //  alert("HI>>>>>>");
    
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId); 
          oFld.value = obj.innerHTML;  


          //alert("obj==>"+obj);
          //alert("oFld==>"+oFld);
          
           //alert("11111 leave 1 report  ");

           try{
             document.leave2.action ="excel.jsp";

           //alert("222222");
          document.forms["leave2"].submit();
          //alert("33333");


           }catch(e){
        	   //alert("exception>>>"+e);
        	   
           }

}


function gotoExcel2(elemId, frmFldId)  
{  

         
      //   alert("HI>>gotoExcel2>>>>");
    
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId); 
          oFld.value = obj.innerHTML;  
         

        //  alert("obj==>"+obj);
       //   alert("oFld==>"+oFld);
          
        //   alert("11111 leave 1 report  ");

           try{
             document.leave1.action ="excel.jsp";

          // alert("222222");
          document.forms["leave1"].submit();
         // alert("33333");


           }catch(e){
        	   //alert("exception>>>"+e);
        	   }

}
function selectAll()
{
	//alert("in select all");
	var cntr=document.leave.cntr.value;
	//alert(cntr);
	cntr=cntr-1;
	//alert(cntr);
	//alert(document.leave.maincb.checked);
	if(document.leave.maincb.checked==true)
	{
		//alert("true value appered");
		for(var j=1;j<=cntr;j++)
		{	
			document.getElementById("cb"+j).checked=true;
		//	alert(document.getElementById("cb"+j).checked);
		}
	}
	else
	{
		for(var j=1;j<=cntr;j++)
		{	
			document.getElementById("cb"+j).checked=false;
		}
	}
}

function selectAll1()
{
	//alert("in select all 2nd loop  ");
	var cntr=document.leave2.cntr.value;
	//alert(cntr);
	cntr=cntr-1;
	//alert(cntr);
	//alert(document.leave.maincb.checked);
	if(document.leave2.maincb.checked==true)
	{
		//alert("true value appered");
		for(var j=1;j<=cntr;j++)
		{	
			document.getElementById("cb"+j).checked=true;
		//	alert(document.getElementById("cb"+j).checked);
		}
	}
	else
	{
		for(var j=1;j<=cntr;j++)
		{	
			document.getElementById("cb"+j).checked=false;
		}
	}
}

function onSubmit1(form,rid,index)
{
	
	
	//alert("RID==11111>"+rid);
	if( form=="leave")
	{
		var cnt=document.leave.cntr.value;
	}
	else if( form=="leave1")
	{
		var cnt=document.leave1.cntr.value;
	}
	else
	{
		var cnt=document.leave2.cntr.value;
	}
	var srNo=rid;
	var msg=confirm("To confirm approval,Please click on OK");
	if(msg==true)
	{
		var url="leaveapproved.jsp";
		try
		{
			if( form=="leave")
			{
				document.leave.action=url+"?rid="+srNo+"&type=update&index="+index;
				document.leave.submit();
			}
			else if( form=="leave1")
			{
				document.leave1.action=url+"?rid="+srNo+"&type=update&index="+index;
				document.leave1.submit();
			}
			else
			{
				document.leave2.action=url+"?rid="+srNo+"&type=update&index="+index;
				document.leave2.submit();
			}
		}
		catch (e) 
		{
			//alert(e);
		}
		
	}
	else
	{
		return false;
	}
}
function onSubmitForNot1(form,rid,index)
{
	
	//alert("RID==22222>"+rid);
	
	if( form=="leave")
	{
		var cnt=document.leave.cntr.value;
	}
	else if( form=="leave1")
	{
		var cnt=document.leave1.cntr.value;
	}
	else
	{
		var cnt=document.leave2.cntr.value;
	}
	var srNo=rid;
	var msg=confirm("To disconfirm approval,Please click on OK");
	if(msg==true)
	{
		var url="leaveapproved.jsp";
		if( form=="leave")
		{
			document.leave.action=url+"?rid="+srNo+"&type=not&index="+index;
			document.leave.submit();
		}
		else if( form=="leave1")
		{
			document.leave1.action=url+"?rid="+srNo+"&type=not&index="+index;
			document.leave1.submit();
		}
		else
		{
			document.leave2.action=url+"?rid="+srNo+"&type=not&index="+index;
			document.leave2.submit();
		}
	}
	else
	{
		return false;
	}
}
function onSubmit(form,rid,index)//(rid,index)
{
	
	//alert("RID==33333>"+rid);
	
	var total=0;
	try
	{
		if( (form.name)=="leave")
		{
			var cnt=document.leave.cntr.value;
		}
		else if( (form.name)=="leave1")
		{
			var cnt=document.leave1.cntr.value;
		}
		else
		{
			var cnt=document.leave2.cntr.value;
		}
	}
	catch (e) 
	{
		//alert(e);
	}
	cnt=cnt-1;
	var srNo=null;
	for(var i=1; i <= cnt; i++)
	{
		 try
		 {
		    if((document.getElementById("cb"+i).checked)==true) 
			{
				if(srNo==null || srNo=="")
				{
					srNo=document.getElementById("cb"+i).value;	
				}
				else
				{
					srNo=srNo+","+document.getElementById("cb"+i).value;
				}
		        total++;
		    }
		 }
		 catch(e)
		 {
			// alert(e);
		 }
	}
   //alert("SR NO=="+srNo);
//	alert("RID==new>"+rid);
	
	var msg=confirm("To confirm approval,Please click on OK");
	if(msg==true)
	{
		var url="leaveapproved.jsp";
		
		try
		{
			if( (form.name)=="leave")
			{
				document.leave.action=url+"?rid="+srNo+"&type=update&index="+index;
				document.leave.submit();
			}
			else if( (form.name)=="leave1")
			{
				document.leave1.action=url+"?rid="+srNo+"&type=update&index="+index;
				document.leave1.submit();
			}
			else
			{
				document.leave2.action=url+"?rid="+srNo+"&type=update&index="+index;
				document.leave2.submit();
			}
		}
		catch (e) 
		{
			//alert(e);
		}
	}
	else
	{
		return false;
	}
}
function onSubmitForNot(form,rid,index)
{
	
	//alert("Hi===")
	var total=0;
	try
	{
		if( (form.name)=="leave")
		{
			var cnt=document.leave.cntr.value;
		}
		else if( (form.name)=="leave1")
		{
			var cnt=document.leave1.cntr.value;
		}
		else
		{
			var cnt=document.leave2.cntr.value;
		}
	}
	catch (e) 
	{
		//alert(e);
	}
	cnt=cnt-1;
	var srNo=null;
	for(var i=1; i <= cnt; i++)
	{
		 try
		 {
		    if((document.getElementById("cb"+i).checked)==true) 
			{
				if(srNo==null || srNo=="")
				{
					srNo=document.getElementById("cb"+i).value;	
				}
				else
				{
					srNo=srNo+","+document.getElementById("cb"+i).value;
				}
		        total++;
		    }
		 }
		 catch(e)
		 {
			// alert(e);
		 }
	}
	var msg=confirm("To disconfirm approval,Please click on OK");
	if(msg==true)
	{
		var url="leaveapproved.jsp";
		
		try
		{
			if( (form.name)=="leave")
			{
				document.leave.action=url+"?rid="+srNo+"&type=not&index="+index;
				document.leave.submit();
			}
			else if( (form.name)=="leave1")
			{
				document.leave1.action=url+"?rid="+srNo+"&type=not&index="+index;
				document.leave1.submit();
			}
			else
			{
				document.leave2.action=url+"?rid="+srNo+"&type=not&index="+index;
				document.leave2.submit();
			}
		}
		catch (e) 
		{
			//alert(e);
		}
	}
	else
	{
		return false;
	}
}
function onSubmitForCancle(form,rid,index)
{
	
	
	//alert("Hi===111")
	if( form=="leave")
	{
		var cnt=document.leave.cntr.value;
	}
	else if( form=="leave1")
	{
		var cnt=document.leave1.cntr.value;
	}
	else
	{
		var cnt=document.leave2.cntr.value;
	}
	var srNo=rid;
	var msg=confirm("To cancle leave,Please click on OK");
	if(msg==true)
	{
		var url="leaveapproved.jsp";
		try
		{
			if( form=="leave")
			{
				document.leave.action=url+"?rid="+srNo+"&type=cancel&index="+index;
				document.leave.submit();
			}
			else if( form=="leave1")
			{
				document.leave1.action=url+"?rid="+srNo+"&type=cancel&index="+index;
				document.leave1.submit();
			}
			else
			{
				document.leave2.action=url+"?rid="+srNo+"&type=cancel&index="+index;
				document.leave2.submit();
			}
		}
		catch (e) 
		{
			//alert(e);
		}
		
	}
	else
	{
		return false;
	}
	
}
function onSubmitForRevert(rid,index)
{
	alert(rid);
	alert(index);
	var msg=confirm("To Revert,Please click on OK");
	if(msg==true)
	{
		var url="leaveapproved.jsp";
		document.leave.action=url+"?rid="+rid+"&type=revert&index="+index;
		document.leave.submit();
	}
	else
	{
		return false;
	}
}
function submit()
{
	alert("in submit function");
	alert(document.selection.name.value);
	alert(index);
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
 
 
function datevalidate()
{	
//alert("Hi==control inside datevalidate function=>");
	var date1=document.getElementById("fromDate").value;
	var date2=document.getElementById("toDate").value;
	var dm1,dd1,dy1,dm2,dd2,dy2;

//alert(date1);
//alert(date2);
	dy1=date1.substring(7,11);
	dy2=date2.substring(7,11);
	dm1=date1.substring(3,6);
	dm2=date2.substring(3,6);
	dd1=date1.substring(0,2);
	dd2=date2.substring(0,2);

	//alert("dm1==>"+dm1);
    //alert("dm2==>"+dm2);
	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var year=date.getFullYear();
    var mnth1=dateformat(dm1);
    var mnth2=dateformat(dm2);


    
    
	//alert("mnth1==>"+mnth1);
//	alert("mnth2==>"+mnth2);
	
	//alert("dy1==>"+dy1);
	//alert("dy2==>"+dy2);

	//alert("dd1==>"+dd1);
	//alert("dd2==>"+dd2);
	if(dy1>year || dy2>year)
	{
		alert("selected date should not be greater than todays date");
		//document.getElementById("data").value="";
		//document.getElementById("data1").value="";
		document.getElementById("fromDate").focus;

		return false;
	
	}
	else if(year==dy1 && year==dy2){
	  if(mnth1>month || mnth2>month)
		{
			alert("selected date should not be greater than todays date");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			document.getElementById("fromDate").focus;

			return false;
	
		}
	}

	if(mnth1==month){
		if(dd1>day || dd2>day)
		{
		alert("selected date should not be greater than todays date");
	//	document.getElementById("data").value="";
		//document.getElementById("data1").value="";
		document.getElementById("fromDate").focus;

		return false;
	
		}
	}
	if(dy1>dy2)
	{
//alert("111");
		alert("From date year is should not be greater than to date year");
	//	document.getElementById("data").value="";
		//document.getElementById("data1").value="";
		document.getElementById("fromDate").focus;
		return false;
	}
	
	else if(year==dy1 && year==dy2) if(mnth1>mnth2)
	{
		alert("From date month is should not be greater than to date month 5");
		//document.getElementById("data").value="";
		//document.getElementById("data1").value="";
		document.getElementById("fromDate").focus;
		return false;
	}
	if(mnth1==mnth2) {
	if(dd1 > dd2)
	{
		alert("From date should not be greater than to date");
		//document.getElementById("data").value="";
		//document.getElementById("data1").value="";
		document.getElementById("fromDate").focus;
		return false;
	}
	}
//alert("end==>");
	return true;
}





</script>
</head>
<body>
	<%
Calendar cal = Calendar.getInstance();
cal.set(Calendar.DAY_OF_MONTH, 1);

DateFormat sdf1=new SimpleDateFormat("dd-MM-yyyy");
DateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
String uname=session.getAttribute("username").toString();

String fromDate=request.getParameter("fromDate");
String toDate=request.getParameter("toDate");


System.out.println("fromDate======>>"+fromDate);
System.out.println("toDate======>>"+toDate);

String today1=new SimpleDateFormat("dd-MMM-yyyy").format(cal.getTime());
System.out.println("2dat1======>>"+today1);
String today=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
System.out.println("======>>"+today);
String data=request.getParameter("status");

System.out.println("====data==>>"+data);
%>


	<table border="0" align="left" width="90%">
		<tr>

			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<!-- <td align="left"><b><font size="4" color="#151B54">Leave/OD Application Report</font></b></td> -->
			<form action="" name="form1" id="form1" method="post">



				<%
	
	 String exportFileName="LeaveReport.xls";  
	
	%>

				<!-- <td align="right"><font size="2" color="#16B836"><a href="leaveLink.jsp?st=Pending1" style="color: #16B836" onclick="getTypePending();">Pending </a></font>&nbsp &nbsp <font size="2" color="#491FE2"><a href="leaveLink.jsp?st=Approved1" style="color: #491FE2" onclick="getTypeApprvd();">Approved</a></font>&nbsp &nbsp <font size="2" color="#E21F25"><a href="leaveLink.jsp?st=NotApproved1" style="color: #E21F25" onclick="getTypeRejctd();">Rejected</a></font>&nbsp&nbsp <font size="2" color="#330000"><a href="leaveLink.jsp?st=cancel1" style="color:#FF9933" onclick="getTypeCancld();">Canceled</a></font></td>                       -->
				<%
String strLeaveVal=request.getParameter("statLeave");
%>
			
		</tr>
	</table>
	<table border="0" align="center">

		<tr>
			<td></td>
		</tr>
		<tr>
			<td></td>
		</tr>

		<tr></tr>
		<tr>

			<td align="center">
				<!-- 						<select name="status"> --> <%-- 							<% --%> <!-- // 							if(data!=null) -->
				<!-- // 							{ --> <!-- // 							if(data.equalsIgnoreCase("Pending"))	 -->

				<!-- // 							{ --> <%-- 								%>	 --%> <!-- 									<option value="All1" >All</option>	 -->
				<!-- 								<option value="Pending" selected="selected" >Pending</option> -->
				<!-- 								<option value="Approved">Approved</option> --> <!-- 							<option value="NotApproved">Rejected</option> -->
				<!-- 							<option value="Cancel">Canceled</option>		 --> <%-- 						<% --%>

				<!-- 							}else if(data.equalsIgnoreCase("All1"))			 --> <!-- 							{ -->
				<!-- 							%>	 --> <!-- 							<option value="All1" selected="selected">All</option>	 -->
				<!-- 							<option value="Pending" >Pending</option> --> <!-- 							<option value="Approved">Approved</option> -->
				<!-- 							<option value="NotApproved">Rejected</option> --> <!-- 							<option value="Cancel">Canceled</option>	 -->



				<%-- 						<%}else if(data.equalsIgnoreCase("Approved"))			 --%> <!-- // 							{ -->
				<!-- 							%>	 --> <!-- <!-- 							<option value="All1" >All</option>	 -->
				<!-- 							<option value="Pending" >Pending</option> --> <!-- 							<option value="Approved" selected="selected">Approved</option> -->
				<!-- 							<option value="NotApproved">Rejected</option> --> <!-- 							<option value="Cancel">Canceled</option>	 -->



				<%-- 						<%}else if(data.equalsIgnoreCase("NotApproved")) --%> <%-- 						{%> --%>

				<!-- 						<option value="All1" >All</option>	 --> <!-- 						<option value="Pending" >Pending</option> -->
				<!-- 						<option value="Approved" >Approved</option> --> <!-- 						<option value="NotApproved" selected="selected">Rejected</option>	 -->
				<!-- 						<option value="Cancel">Canceled</option>	 --> <%-- 					<%}else{ --%>
				<%-- 							%> --%> <!-- 							<option value="All1" >All</option>	 -->
				<!-- 								<option value="Pending" >Pending</option> --> <!-- 						<option value="Approved" >Approved</option> -->
				<!-- 						<option value="NotApproved" >Rejected</option> --> <!-- 							<option value="Cancel" selected="selected">Canceled</option>	 -->

				<%-- 						<%} --%> <%-- 							}else{%> --%> <!-- 							<option value="All1">All</option>	 -->
				<!-- 						<option value="Pending">Pending</option>		 --> <!-- 							<option value="Approved">Approved</option> -->
				<!-- 							<option value="NotApproved">Rejected</option> --> <!-- 							<option value="Cancel">Canceled</option>	 -->

				<%-- 						<% --%> <%-- 						}%> --%> <!-- 						</select> --> <font
				color="black" size="2" id=""><b>&nbsp;&nbsp;From :</b> </font> <input
				type="text" id="fromDate" name="fromDate" size="13"
				value="<%if(fromDate!=null){%><%=fromDate %> <% }else{%><%= today1%>  <% }%>"
				readonly /> <script type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "fromDate",         // ID of the input field
			                 ifFormat    : "%d-%b-%Y",     // the date format
			                 button      : "trigger"       // ID of the button
			             }
			                           );
			        </script> &nbsp; &nbsp; <font color="black" size="2"><b>To
						:</b> </font> <input type="text" id="toDate" name="toDate" size="13"
				value="<%if(toDate!=null){%><%=toDate %> <% }else{%><%= today%>  <% }%>"
				readonly /> <script type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "toDate",         // ID of the input field
			                 ifFormat    : "%d-%b-%Y",     // the date format
			                 button      : "trigger1"       // ID of the button
			             }
			                           );
            		 </script> <input type="Submit" name="Submit" Value="Submit"
				onclick="return datevalidate();">
				</form>
			</td>


		</tr>




		<tr>
			<td>
				<%
			
			//String data=request.getParameter("status");
			//System.out.println("data==>"+data);
			
			System.out.println("***********==>"+data);
			
			String data_del="";
 			if(fromDate!=null)
 			{
				fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(fromDate));	
				toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(toDate));	
				
				System.out.println("*********fromDate**==>"+fromDate);
				System.out.println("*****toDate******==>"+toDate);
				
				
 			}else{
				
 				System.out.println("*****Else LOOP******==>");
 				
 				fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(today1));	
				toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(today));	
 				
 				
 				//data=strLeaveVal;	
 				//data_del="loop";
 			}
			
			
			
			//System.out.println(data);
			//if(data_del.equalsIgnoreCase("loop")){
			
				System.out.println("11111"+fromDate);
			try{
				if(fromDate!=null)
			{
		fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(fromDate));	
		toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(toDate));	
			}
				
			}catch(Exception e22)
			{
				
				
				
			}
				
	//	System.out.println("fromDate==>"+fromDate);
		//System.out.println("toDate==>"+toDate);
		
		
			%>
				<form method="post" name="leave" action="" onsubmit="">
					<p></p>

					<%

System.out.println("11111********==>>");

//String uroleofuser=session.getAttribute("urole").toString();
String uroleofuser=session.getAttribute("emprole").toString();
//String uname=session.getAttribute("username").toString();
//System.out.println(">>>>>>>>>"+uroleofuser);
Statement st,st1,st2,st3;

st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();

String typevalue=session.getAttribute("empdept").toString();



String username=session.getAttribute("email").toString();
java.util.Date d= new java.util.Date();
String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
String sql="";

Date yesterday = new Date();
//long minusaday=24*60*60*1000;
//long todaymills=today.getTime();
//long yestrdaymills=todaymills-minusaday;
//yesterday.setTime(yestrdaymills);

final Format frt1=new SimpleDateFormat("yyyy-MM-dd");
String now= frt1.format(yesterday);
//System.out.println("Qry==data check==>>"+now);
String abc111=now.substring(0, 7);
abc111=abc111+"-01";
//System.out.println("abc111==>>"+abc111);

java.util.Date dte = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
String today_td=formatter.format(dte);
String  current_day="",currentday1="";

System.out.println("=@@@@@*********=>>");
try{
  current_day=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromDate));
  currentday1=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(toDate));
}catch(Exception e33)
{
	
	
	
}

System.out.println("=*********=>>");
//System.out.println("Qry==data check==>>"+data);
String check="-",new_stataus="-";
if(data!=null)
{
	
	//check="status1";
// 	if(data.equalsIgnoreCase("Pending1"))
// 	{
// 		new_stataus="Pending";	
		
// 		data="Pending";
		
// 	}else if(data.equalsIgnoreCase("Approved1"))
// 	{
// 		new_stataus="Approved";		
// 		data="Approved";
		
		
// 	}else if(data.equalsIgnoreCase("All1"))
// 	{
// 		new_stataus="NoStatus";	
		
// 	}else if(data.equalsIgnoreCase("NotApproved1"))
// 	{
// 		new_stataus="NotApproved";
// 		data="Rejected";
		
// 	}else {
		
// 		new_stataus="Cancel";
// 		data="cancelled";
// 	}

	System.out.println("data not null==>>");
	//System.out.println("Qry==new_stataus==>>"+new_stataus);
	//System.out.println("Qry==data==>>"+data);


}else{
	
	
}
//System.out.println("Qry==new_stataus=$$$$$$$$$$$$$$$=>>"+new_stataus);
// if("emp".equalsIgnoreCase(uroleofuser) || "contractor".equalsIgnoreCase(uroleofuser)){
// 	sql="select * from t_leaverequest where  TypeValue='"+typevalue+"' and emailid='"+username+"' and status='"+new_stataus+"' order by firstdayofleave desc";
	
// }else if("All".equalsIgnoreCase(typevalue)){
// 	sql="select * from t_leaverequest where (hod='"+uname+"' or  emailid='"+uname+"') and status='"+new_stataus+"' order by firstdayofleave desc";
// }else if (check.equalsIgnoreCase("status1"))
// {
// 	if(new_stataus.equalsIgnoreCase("NoStatus"))
// 	{
// 		sql="select * from t_leaverequest where URole in ('hod','HR')  order by firstdayofleave desc";
		
// 	}else{
// 		sql="select * from t_leaverequest where (hod='"+uname+"' or  emailid='"+uname+"') and status='"+new_stataus+"' order by firstdayofleave desc";
		
// 	}
		
	
	
// }
// else{
	//sql="select * from t_leaverequest where   (hod='"+uname+"' or  emailid='"+uname+"')  and  firstdayofleave between '"+abc111+"' and '"+today_td+"'  order by firstdayofleave desc";
System.out.println("Before Query ===>>");
	sql="select * from t_leaverequest where     firstdayofleave between '"+fromDate+"' and '"+toDate+"'  order by firstdayofleave asc";

//}
ResultSet rs=st.executeQuery(sql);
System.out.println("Qry=========111111===>>"+sql);

//System.out.println("Qry==new_stataus=&&&&&&&&&&&&&&&&&=>>"+new_stataus);


int i=1;
String srnum="";
%>


					<div class="bodyText" style="text-align: right;">
						<input type="hidden" id="tableHTML" name="tableHTML" value="" />
						<input type="hidden" id="fileName" name="fileName"
							value="<%= exportFileName%>" />

					</div>
					<div id="table1">
						<table border="0" align="center" bgcolor="">
							<tr>

								<%
	
	//System.out.println("LOOp===data==>>"+data);
	if(data!=null)
		
	{%>

								<th><font size="3" color=""> <%=data %> Leave
										Report
								</font> <%}else{
		%>
								<th><font size="3" color="">Leave Report from <%=current_day %>
										to <%=currentday1 %>
								</font> <%	}
	%> <!--		<a href="excel_reprovision.jsp?month=< %=data%>&year=< %=data1%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>-->

									<div style="text-align: right; margin-left: 50em;">
										<!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> -->

										<%--                            <a href="Leavereportexcel.jsp?status=<%=data%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>" style="font-weight: bold; color: black; " onclick="Leavereportexcel.jsp?status=<%=data%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>"> --%>

										<a href="#" style="font-weight: bold; color: black;"
											onclick="gotoExcel('table1','tableHTML');"> <img
											src="images/excel.jpg" width="15px" height="15px"
											style="border-style: none;"></img></a>
										<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
									</div></th>
							</tr>
						</table>





						<table bgcolor="white" border="1" align="center" class="sortable">
							<tr>
								<%-- 		<% --%>
								<!-- // 		try -->
								<!-- // 		{ -->
								<!-- // 			if( ( !(uroleofuser.equalsIgnoreCase("emp")) || !(rs.getString("emailid").equalsIgnoreCase(username))) ) -->
								<%-- 			{%> --%>
								<!-- 						<td></td> -->
								<%-- 			<%} --%>
								<%-- 		}catch(Exception e){System.out.println("Exception----->"+e);}%> --%>



								<td><font size="2" color="black"><b>Sr.No.</b></font></td>
								<td><font size="2" color="black"> <b>Days</b></font></td>
								<td><font size="2" color="black"><b>From</b></font></td>
								<td><font size="2" color="black"><b>Type</b></font></td>
								<td><font size="2" color="black"><b>Reason</b></font></td>
								<td><font size="2" color="black"><b>Report on</b></font></td>
								<td><font size="2" color="black"><b>Name</b></font></td>
								<td><font size="2" color="black"><b>Status</b></font></td>
								<td><font size="2" color="black"><b>HOD</b></font></td>
								<%-- 		<% --%>
								<!-- // 		 if(data!=null) -->
								<!-- // 		{ -->
								<!-- // 		if(data.equalsIgnoreCase("cancel1")) -->
								<%-- 		{%> --%>


								<%-- 		<%}else{ --%>
								<%-- 			%> --%>



								<!-- 		<td><font size="2" color="black"><b>Action</b></font></td> -->
								<%-- 		<%} --%>


								<!-- // 		}else{ -->
								<%-- 		%> --%>

								<!-- 			<td><font size="2" color="black"><b>Action</b></font></td>	 -->
								<%-- 	<%	} --%>
								<%-- 		%> --%>



								<td><font size="2" color="black"><b>Applied Date</b></font></td>

							</tr>
							<%
while(rs.next()){
	srnum=rs.getString("srno");
	 
	String color="";
	//System.out.println("Qry=====SYTATAUS====111111===>>"+rs.getString("status"));
 	//if(rs.getString("status").equalsIgnoreCase("pending"))
 //	{
 		//color="#AEF8B1";
		
		
 //	}else{
		
 		color="#FFFFFF";
		
// 		//data="Cancelled";
 //	}
	
	System.out.println("Qry=color=>>"+color);
	//if(rs.getString("status").equalsIgnoreCase("Pending")){
		
	//	System.out.println("LOOp===222222===>>"+username);
	//	System.out.println("@@@@@@@@@@22===>>"+rs.getString("emailid"));
		//System.out.println("Status============>>"+rs.getString("status"));
		//System.out.println("srno============>>"+rs.getString("srno"));
		//System.out.println("Qry====1111========>>"+rs.getString("firstdayofleave"));
		Date dt=rs.getDate("firstdayofleave");
		
	%>
							<tr bgcolor="<%=color%>">
								<input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
									value="<%=rs.getString("srno")%>"></input>
								<%
//	}
	%>

								<%-- 		<%if( ( !(uroleofuser.equalsIgnoreCase("emp")) || !(rs.getString("emailid").equalsIgnoreCase(username))) ) --%>
								<!-- // 						{ -->
								<!-- // 			if(rs.getString("emailid").equalsIgnoreCase(username)) -->
								<%-- 			{%> --%>
								<!-- 			<td></td> -->
								<%-- 			<%}  --%>
								<%-- 			else{%> --%>
								<%-- 		<td><input type="checkbox" name="cb<%=i%>" id="cb<%=i%>" value="<%=rs.getString("srno")%>"></input></td> --%>
								<%-- 		<%}  --%>
								<!-- // 						}  -->
								<%-- 						%> --%>
								<td align="right"><div align="right">
										<font size="2" color="black"><%=i %></font>
									</div></td>
								<td align="right"><div align="right"
										style="overflow: auto;">
										<font size="2" color="black"><%=rs.getString("daysapplied") %></font>
									</div></td>
								<td align="right"><div align="right">
										<font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("firstdayofleave"))) %></font>
									</div></td>
								<td align="left"><div align="left">
										<font size="2" color="black"><%=(rs.getString("typeofleave")).substring(0, (rs.getString("typeofleave")).length()-6) %></font>
									</div></td>
								<td align="left"><div align="left"
										style="overflow: auto; width: 200px;">
										<font size="2" color="black"><%=rs.getString("reasonforleave") %></font>
									</div></td>
								<td align="right"><div align="right">
										<font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("dateofreporting"))) %></font>
									</div></td>
								<td align="left"><div align="left">
										<a href=""
											onmouseover="ajax_showTooltip(window.event,'showEmpDetails.jsp?empName=<%=rs.getString("name")%>',this);return false"
											onMouseOut="ajax_hideTooltip();"><font size="2"
											color="black"><%=rs.getString("name")%> </font>
									</div></td>
								<%-- 		<%  --%>
								<!-- // 		if("Approved".equalsIgnoreCase(rs.getString("status"))){ -->
								<%-- 						%> --%>
								<!-- 						<td align="left"><div align="left"><font size="2" color="black">Accepted</font></div></td> -->
								<%-- 						<%}else if("NotApproved".equalsIgnoreCase(rs.getString("status"))){ --%>
								<%-- 							%> --%>
								<!-- 							<td align="left"><div align="left"><font size="2" color="black">Rejected</font></div></td> -->
								<%-- 							<% --%>
								<!-- // 						} -->
								<!-- // 						else{ -->
								<%-- 							%> --%>
								<td align="left"><div align="left">
										<font size="2" color="black"><%=rs.getString("status") %></font>
									</div></td>
								<%
						//}
	
		String hodname="select Name from t_leaveadmin where Email='"+rs.getString("HOD")+"'";
		ResultSet rsHodname=st1.executeQuery(hodname);
		System.out.println(hodname);
		if(rsHodname.next()){
		%>
								<td align="left"><div align="left"
										style="overflow: auto; width: 80px;">
										<font size="2" color="black"><%=rsHodname.getString("Name") %></font>
									</div></td>
								<%}else{
			%>
								<td><font color="#AEF8B1">-</font></td>
								<%
		}
		%>

								<%
		if(uroleofuser.equalsIgnoreCase("emp")||rs.getString("emailid").equalsIgnoreCase(username))
		{
			if((rs.getString("status").equalsIgnoreCase("Pending"))&&(uroleofuser.equalsIgnoreCase("emp") || rs.getString("emailid").equalsIgnoreCase(username)))
			{ 
			%>
								<%-- 				<td align="left"><div align="left"><a href="#" onclick="return onSubmitForCancle('leave','<%=rs.getString("srno") %>','<%=i%>')"><font size="2" color="#09195B">Cancel</font></a></div></td> --%>
								<%
			}
			else
			{
				%>
								<!-- 				<td></td> -->
								<%
			}
		}
		else
		{ 
							if(rs.getString("status").equalsIgnoreCase("NotApproved") || rs.getString("status").equalsIgnoreCase("Approved"))
							{
								%>
								<%-- 								<td align="left"><div align="left"><br><a href="#" onclick="return onSubmitForRevert('<%=rs.getString("srno") %>','<%=i%>')"><font size="2" color="#09195B">Revert</font></a></div></td> --%>
								<%
							}
							else if(rs.getString("status").equalsIgnoreCase("Cancel"))
							{
								
								if(data!=null)
								{
								if(data.equalsIgnoreCase("cancel1"))
								{
									
									
								}else{
									%>
								<!-- 									<td></td> -->
								<%	
									
									
								}
								
								}else{
									
									
									%>
								<!-- 									<td></td> -->
								<%		
									
								}
							}
							else
							{
								
								
								%>
								<%-- 								<td align="left"><div align="left"><a href="#" onclick="return onSubmit1('leave','<%=rs.getString("srno") %>','<%=i%>')"><font size="2" color="#09195B">Approve</font></a> --%>
								<%-- 								<br><a href="#" onclick="return onSubmitForNot1('leave','<%=rs.getString("srno") %>','<%=i%>')"><font size="2" color="#09195B">Reject</font></a></div></td> --%>
								<%
							}
	   } %>
								<td align="right"><div align="right" style="width: 80px;">
										<font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("inserteddatetime") ))%></font>
									</div></td>
							</tr>

							<%
i++;	
}
%>
						</table>
						<input type="hidden" name="cntr" value="<%=i%>" />
						<table align="center">
							<%if(!(uroleofuser.equalsIgnoreCase("emp"))){ %>
							<%-- 				<input type="Submit" name="Submit" Value="Approve" onclick="onSubmit(this.form,'<%=srnum%>','<%=i%>')"> --%>
							<%-- 				<input type="Submit" name="Submit" Value="Reject" onclick="return onSubmitForNot(this.form,'<%=srnum%>','<%=i%>');"> --%>
							<%} %>

						</table>


					</div>
				</form>

			</td>



			<!-- </form> -->
			<%
		//	}
			
%>
			</td>
		</tr>



	</table>
	</div>
	</form>
	<p></p>

	<br></br>
	<br></br>
	<br></br>
	<br></br>
	<br></br>


</body>
<%@ include file="footer.jsp"%>
</html>