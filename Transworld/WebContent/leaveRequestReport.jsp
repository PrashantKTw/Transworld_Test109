<%@page import="java.awt.Color"%>
<%@ page language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
      <%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<script src="js/sorttable.js" type="text/javascript"></script>


<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<title>Transworld - Leave Application</title>


<style type="text/css">
#example {
    
    border-collapse: collapse;
    width: 100%;
}

#example td, #example th {
    border: 1px solid ;
    padding: 8px;
}

#example tr:nth-child(even){}

#example tr:hover {background-color: #ddd;}

#example th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
   
    color: white;
}
</style>
<!-- <style type="text/css">

#example td, #example th {
    
    border-color: black;
    border-style:solid;
    padding: 6px;
}

</style> -->
<script type="text/javascript">
$(document).ready(function() {
	 $("#checkAll").click(function () {
	     $('input:checkbox').not(this).prop('checked', this.checked);
	 });
});
</script>
<!-- <script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    	"pagingType": "full_numbers",
	    	
	        dom: 'Bfrtip',
	        
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Request Report'
	                    },
	                    {
	                        extend: 'pdf',
	                        title: 'Request Report'
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Request Report'
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Request Report'
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Request Report'
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ]
	    	
	    } );
	} );

</script> -->


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

         
          //alert("HI>>>>leave>>");
    
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId); 
          oFld.value = obj.innerHTML;  
                   
        // alert("obj==@>"+obj);
         // alert("oFld==@>"+oFld);
          // alert("11111");

           try{
             document.leave.action ="excel.jsp";

           //alert("222222");
          document.forms["leave"].submit();
         // alert("33333");


           }catch(e){alert("exception>>>"+e);}

}
/*
function selectAll()
	{
       alert("HIIII");
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
		
		
		*/
		

function gotoExcel1(elemId, frmFldId)  
{  

         
        //  alert("HI>>>>>>");
    
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId); 
          oFld.value = obj.innerHTML;  


          //alert("obj==>"+obj);
          //alert("oFld==>"+oFld);
          
        //   alert("11111 leave 1 report  ");

           try{
             document.leave2.action ="excel.jsp";

         //  alert("222222");
          document.forms["leave2"].submit();
       //   alert("33333");


           }catch(e){alert("exception>>>"+e);}

}


function gotoExcel2(elemId, frmFldId)  
{  

         
         // alert("HI>>>>>>");
    
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId); 
          oFld.value = obj.innerHTML;  
         

        //  alert("obj==>"+obj);
       //   alert("oFld==>"+oFld);
          
           alert("11111 leave 1 report  ");

           try{
             document.leave1.action ="excel.jsp";

          // alert("222222");
          document.forms["leave1"].submit();
         // alert("33333");


           }catch(e){alert("exception>>>"+e);}

}
function selectAll()
{
	alert("in select all");
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

function checkAll()
{

	//alert("ok");
	var field = document.getElementById("checkedNumber").value;

//	var field=document.getElementsByName("chkbx");
//	alert("ok"+field);
	var i, chk=1;
	try{
	for (i = 0; i < field; i++)
	{
		 if(document.getElementById("cb"+chk).checked == false)
		 {
			 document.getElementById("cb"+chk).checked = true;
		 }

		 chk++;
		
	}
}catch(e){alert(e);}
}

function unCheckAll()
{

	//alert("ok");
var field = document.getElementById("checkedNumber").value;

//var field=document.getElementsByName("chkbx");
//alert("ok"+field);
var kj=1,i;
try{
for (i = 0; i < field; i++)
{
	
	 if(document.getElementById("cb"+kj).checked == true )
	 {
		 document.getElementById("cb"+kj).checked = false;
	 }
	 kj++;
}
}catch(e){alert(e);}
}
function selectAll1()
{
	alert("in select all 2nd loop  ");
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

var msg=confirm("To Revert,Please click on OK");


 if(msg==true)

 {

 location.assign("leaveapproved.jsp?rid="+rid+"&type=revert&index="+index+"");


 }

 else

 {

 return false;

 }

}

function submit()
{
	//alert("in submit function");
	alert(document.selection.name.value);
	//alert(index);
}

function fun()
{


	
	var chkf="";
	var chkt="";
	var objFromDate = document.getElementById("fromDate").value;
	
	//alert(objFromDate);
	var fdate=objFromDate.split("-");
	if(fdate[1]=="Jan")
	{
		chkf="01";
	}
	if(fdate[1]=="Feb")
	{
		chkf="02";
	}
	if(fdate[1]=="Mar")
	{
		chkf="03";
	}
	if(fdate[1]=="Apr")
	{
		chkf="04";
	}
	if(fdate[1]=="May")
	{
		chkf="05";
	}
	if(fdate[1]=="Jun")
	{
		chkf="06";
	}
	if(fdate[1]=="Jul")
	{
		chkf="07";
	}
	if(fdate[1]=="Aug")
	{
		chkf="08";
	}
	if(fdate[1]=="Sep")
	{
		chkf="09";
	}
	if(fdate[1]=="Oct")
	{
		chkf="10";
	}
	if(fdate[1]=="Nov")
	{
		chkf="11";
	}
	if(fdate[1]=="Dec")
	{
		chkf="12";
	}
	var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
    var objToDate = document.getElementById("toDate").value;
    //alert(objToDate);
    var tdate=objToDate.split("-");
    if(tdate[1]=="Jan")
	{
    	chkt="01";
	}
	if(tdate[1]=="Feb")
	{
		chkt="02";
	}
	if(tdate[1]=="Mar")
	{
		chkt="03";
	}
	if(tdate[1]=="Apr")
	{
		chkt="04";
	}
	if(tdate[1]=="May")
	{
		chkt="05";
	}
	if(tdate[1]=="Jun")
	{
		chkt="06";
	}
	if(tdate[1]=="Jul")
	{
		chkt="07";
	}
	if(tdate[1]=="Aug")
	{
		chkt="08";
	}
	if(tdate[1]=="Sep")
	{
		chkt="09";
	}
	if(tdate[1]=="Oct")
	{
		chkt="10";
	}
	if(tdate[1]=="Nov")
	{
		chkt="11";
	}
	if(tdate[1]=="Dec")
	{
		chkt="12";
	}
    var objToDate1=""+tdate[2].trim()+"-"+chkt+"-"+tdate[0]+"";
   //alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
     
    var date1 = new Date(objFromDate1);
    var date2 = new Date(objToDate1);
    
    //alert("from > "+date1+" Todate > "+date2);
    
    var date3 = new Date();
    var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
    var currentDate = new Date(date4);
     
        if(date1 > date2)
        {
            alert("From Date Should be Less Than To Date");
            return false; 
        }
//         else if(date1 > currentDate)
//         {
//             alert("From Date should be less than current date");
//             return false; 
//         }
//         else if(date2 > currentDate) 
//         {
//             alert("To Date should be less than current date");
//             return false; 
//         }


	return true;
}
</script>
</head>
<body>
<%
	System.out.println("Inside Leave Request!!!!!!");
	Calendar cal = Calendar.getInstance();
	cal.set(Calendar.DAY_OF_MONTH, 1);
	System.out.println("Inside Leave Request111111111111111");
	DateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
	DateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

	String uname = session.getAttribute("username").toString();
	System.out.println("Inside Leave Request22222222222" + uname);
	String ReportingtoHod = session.getAttribute("ReportingtoHod")
			.toString();
	System.out.println("Inside Leave Request33333" + ReportingtoHod);
	System.out.println("Inside Leave Reques---->" + ReportingtoHod);
	String empname = session.getAttribute("email").toString();

	String fromDate = request.getParameter("fromDate");
	String toDate = request.getParameter("toDate");
	String today1 = new SimpleDateFormat("dd-MMM-yyyy").format(cal
			.getTime());
	System.out.println("2dat1======>>" + today1);
	String today = new SimpleDateFormat("dd-MMM-yyyy")
			.format(new java.util.Date());
	System.out.println("======>>" + today);
	String data = request.getParameter("status");

	System.out.println("Inside Leave Reques-------12121--->" + data);
	System.out.println("====data==>>" + data);
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
	String exportFileName = "LeaveReport.xls";
%>

<td align="right"><font size="2" color="#16B836"><a href="leaveLink.jsp?st=Pending1" style="color: #16B836" onclick="getTypePending();">Pending </a></font>&nbsp &nbsp <font size="2" color="#491FE2"><a href="leaveLink.jsp?st=Approved1" style="color: #491FE2" onclick="getTypeApprvd();">Approved</a></font>&nbsp &nbsp <font size="2" color="#E21F25"><a href="leaveLink.jsp?st=NotApproved1" style="color: #E21F25" onclick="getTypeRejctd();">Rejected</a></font>&nbsp&nbsp <font size="2" color="#330000"><a href="leaveLink.jsp?st=cancel1" style="color:#FF9933" onclick="getTypeCancld();">Cancelled</a></font></td>                      
<%
                      	String strLeaveVal = request.getParameter("statLeave");
                      %>
</tr>
</table>
<table border="0" align="center" >

		<tr><td></td></tr>
		<tr><td></td></tr>

<tr></tr>
<tr><td align="center">

						
						<select name="status">
							
							
							<%
																						if (data != null) {

																							if (data.equalsIgnoreCase("Pending"))

																							{
																					%>	
								
									<option value="All1" >All</option>	
								<option value="Pending" selected="selected" >Pending</option>
								<option value="Approved">Approved</option>
							<option value="NotApproved">Rejected</option>
							<option value="Cancel">Canceled</option>		
								
						<%
																	} else if (data.equalsIgnoreCase("All1")) {
																%>	
							<option value="All1" selected="selected">All</option>	
							<option value="Pending" >Pending</option>
							<option value="Approved">Approved</option>
							<option value="NotApproved">Rejected</option>
							<option value="Cancel">Canceled</option>	
							
							
						
						<%
																												} else if (data.equalsIgnoreCase("Approved")) {
																											%>	
							<option value="All1" >All</option>	
							<option value="Pending" >Pending</option>
							<option value="Approved" selected="selected">Approved</option>
							<option value="NotApproved">Rejected</option>
							<option value="Cancel">Canceled</option>	
							
							
						
						<%
																												} else if (data.equalsIgnoreCase("NotApproved")) {
																											%>
							
						<option value="All1" >All</option>	
						<option value="Pending" >Pending</option>
						<option value="Approved" >Approved</option>
						<option value="NotApproved" selected="selected">Rejected</option>	
						<option value="Cancel">Canceled</option>	
							
							
					<%
																					} else {
																				%>
							
							<option value="All1" >All</option>	
								<option value="Pending" >Pending</option>
						<option value="Approved" >Approved</option>
						<option value="NotApproved" >Rejected</option>
							<option value="Cancel" selected="selected">Canceled</option>	
							
						<%
															}

															} else {
														%>
							
						
							<option value="All1">All</option>	
						<option value="Pending">Pending</option>		
							<option value="Approved">Approved</option>
							<option value="NotApproved">Rejected</option>
							<option value="Cancel">Canceled</option>	
							
						<%
															}
														%>
							
						</select>
						&nbsp&nbsp&nbsp&nbsp
						<font color="black" size="2" id=""><b>&nbsp;&nbsp;From </b> </font>
					<input type="text" id="fromDate" name="fromDate" size="13" value="<%if (fromDate != null) {%><%=fromDate%> <%} else {%><%=today1%>  <%}%>" readonly/>
            	    <script type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "fromDate",         // ID of the input field
			                 ifFormat    : "%d-%b-%Y",     // the date format
			                 button      : "trigger"       // ID of the button
			             }
			                           );
			        </script>
			        &nbsp;
					
&nbsp;
					
				<font color="black" size="2" ><b>To </b> </font>			        
          		    <input type="text" id="toDate" name="toDate" size="13" value="<%if (toDate != null) {%><%=toDate%> <%} else {%><%=today%>  <%}%>" readonly/>
            	    <script type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "toDate",         // ID of the input field
			                 ifFormat    : "%d-%b-%Y",     // the date format
			                 button      : "trigger1"       // ID of the button
			             }
			                           );
            		 </script>
            		
            		&nbsp;&nbsp;&nbsp;&nbsp; <input type="Submit" name="Submit" Value="Submit" onclick="return fun()" >
            	 </form>
            	 </td></tr>
            	 <tr><td>
			<%
				//String data=request.getParameter("status");
				//System.out.println("data==>"+data);
				String data_del = "";
				if (data != null) {
					fromDate = new SimpleDateFormat("yyyy-MM-dd")
							.format(new SimpleDateFormat("dd-MMM-yyyy")
									.parse(fromDate));
					toDate = new SimpleDateFormat("yyyy-MM-dd")
							.format(new SimpleDateFormat("dd-MMM-yyyy")
									.parse(toDate));

				} else {

					data = strLeaveVal;
					data_del = "loop";
				}

				//System.out.println(data);
				if (data_del.equalsIgnoreCase("loop")) {

					System.out.println("11111" + fromDate);
					if (fromDate != null) {
						fromDate = new SimpleDateFormat("yyyy-MM-dd")
								.format(new SimpleDateFormat("dd-MMM-yyyy")
										.parse(fromDate));
						toDate = new SimpleDateFormat("yyyy-MM-dd")
								.format(new SimpleDateFormat("dd-MMM-yyyy")
										.parse(toDate));
					}
					//	System.out.println("fromDate==>"+fromDate);
					//System.out.println("toDate==>"+toDate);
			%>
<form method="post" name="leave" action="leaveapproved.jsp" onsubmit="return validate();">
<p></p>

<%
	//String uroleofuser=session.getAttribute("urole").toString();
		String uroleofuser = session.getAttribute("emprole").toString();
		//String uname=session.getAttribute("username").toString();
		//System.out.println(">>>>>>>>>"+uroleofuser);
		Statement st, st1, st2, st3;

		st = conn.createStatement();
		st1 = conn.createStatement();
		st2 = conn.createStatement();
		st3 = conn.createStatement();

		String typevalue = session.getAttribute("empdept").toString();

		String username = session.getAttribute("email").toString();
		java.util.Date d = new java.util.Date();
		String datetoday = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(d);
		String sql = "";

		Date yesterday = new Date();
		//long minusaday=24*60*60*1000;
		//long todaymills=today.getTime();
		//long yestrdaymills=todaymills-minusaday;
		//yesterday.setTime(yestrdaymills);

		final Format frt1 = new SimpleDateFormat("yyyy-MM-dd");
		String now = frt1.format(yesterday);
		//System.out.println("Qry==data check==>>"+now);
		String abc111 = now.substring(0, 7);
		abc111 = abc111 + "-01";
		//System.out.println("abc111==>>"+abc111);

		java.util.Date dte = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		String today_td = formatter.format(dte);

		String current_day = new SimpleDateFormat("dd-MMM-yyyy")
				.format(new SimpleDateFormat("yyyy-MM-dd")
						.parse(abc111));
		String currentday1 = new SimpleDateFormat("dd-MMM-yyyy")
				.format(new SimpleDateFormat("yyyy-MM-dd")
						.parse(today_td));

		//System.out.println("Qry==data check==>>"+data);
		String check = "-", new_stataus = "-";
		if (data != null) {

			check = "status1";
			if (data.equalsIgnoreCase("Pending1")) {
				new_stataus = "Pending";

				data = "Pending";

			} else if (data.equalsIgnoreCase("Approved1")) {
				new_stataus = "Approved";
				data = "Approved";

			} else if (data.equalsIgnoreCase("All1")) {
				new_stataus = "NoStatus";

			} else if (data.equalsIgnoreCase("NotApproved1")) {
				new_stataus = "NotApproved";
				data = "Rejected";

			} else {

				new_stataus = "Cancel";
				data = "Cancelled";
			}

			//System.out.println("Qry==check==>>"+check);
			//System.out.println("Qry==new_stataus==>>"+new_stataus);
			//System.out.println("Qry==data==>>"+data);

		} else {

		}

		System.out.println("Qry==new_stataus=$$$$$$$$$$$$$$$=>>"
				+ check);
		System.out.println("Qry==new_stataus=&&&&&&&&&&&&&&&&&=>>"
				+ new_stataus);

		if ("emp".equalsIgnoreCase(uroleofuser)
				|| "contractor".equalsIgnoreCase(uroleofuser)) {
			sql = "select * from t_leaverequest where emailid='" + username
					+ "' and status='" + new_stataus
					+ "' order by firstdayofleave desc";

		} else if ("All".equalsIgnoreCase(typevalue)) {

			System.out.println("ELSEEEEEEEEEEEEEEEEEE==All @@@@=>>");
			sql = "select * from t_leaverequest where (hod='" + uname
					+ "' or  emailid='" + uname + "' or emailid like '%%' ) and status='"
					+ new_stataus + "' order by firstdayofleave desc";

			/*	
			 if(empname.equalsIgnoreCase("md@transworld-compressor.com"))
			 {
			 System.out.println("$$$$=>>");
			
			
			 sql="select * from t_leaverequest where   (hod='"+uname+"' or  emailid='"+uname+"')  and  firstdayofleave between '"+abc111+"' and '"+today_td+"'   UNION SELECT * FROM t_leaverequest WHERE emailid IN ( SELECT uname FROM t_leaveadmin 	WHERE ReportingtoHod ='"+ReportingtoHod+"'  ) and firstdayofleave  	BETWEEN '"+abc111+"' and '"+today_td+"'   order by firstdayofleave desc";
			 }else
			
			 {
			 sql="select * from t_leaverequest where   (hod='"+uname+"' or  emailid='"+uname+"')  and  firstdayofleave between '"+abc111+"' and '"+today_td+"'   UNION SELECT * FROM t_leaverequest WHERE emailid IN ( SELECT uname FROM t_leaveadmin 	WHERE ReportingtoHod ='"+ReportingtoHod+"'  and typevalue='"+typevalue+"' ) and firstdayofleave  	BETWEEN '"+abc111+"' and '"+today_td+"'   order by firstdayofleave desc";	
			 }
			 */

		} else if (check.equalsIgnoreCase("status1")) {

			System.out.println("ELSEEEEEEEEEEEEEEEEEE==IFFF @@@@=>>");
			if (new_stataus.equalsIgnoreCase("NoStatus")) {
				sql = "select * from t_leaverequest where URole in ('hod','HR')  order by firstdayofleave desc";

			} else if (new_stataus.equalsIgnoreCase("-")) {

				/*
				if(empname.equalsIgnoreCase("md@transworld-compressor.com"))
				{
					sql="select * from t_leaverequest where (hod='"+uname+"' or  emailid='"+uname+"') and status='"+new_stataus+"' order by firstdayofleave desc";//sql="select * from t_leaverequest where   (hod='"+uname+"' or  emailid='"+uname+"')  and  firstdayofleave between '"+abc111+"' and '"+today_td+"'   UNION SELECT * FROM t_leaverequest WHERE emailid IN ( SELECT uname FROM t_leaveadmin 	WHERE ReportingtoHod ='"+ReportingtoHod+"' ) and firstdayofleave  	BETWEEN '"+abc111+"' and '"+today_td+"'   order by firstdayofleave desc";	
				}else
					
				{
					
					sql="select * from t_leaverequest where (hod='"+uname+"' or  emailid='"+uname+"') and status='"+new_stataus+"' order by firstdayofleave desc";//sql="select * from t_leaverequest where   (hod='"+uname+"' or  emailid='"+uname+"')  and  firstdayofleave between '"+abc111+"' and '"+today_td+"'   UNION SELECT * FROM t_leaverequest WHERE emailid IN ( SELECT uname FROM t_leaveadmin 	WHERE ReportingtoHod ='"+ReportingtoHod+"' and typevalue='"+typevalue+"' ) and firstdayofleave  	BETWEEN '"+abc111+"' and '"+today_td+"'   order by firstdayofleave desc";
					
				}
				 */

			} else {
				sql = "select * from t_leaverequest where (hod='"
						+ uname + "' or  emailid='" + uname
						+ "') and status='" + new_stataus
						+ "' order by firstdayofleave desc";

			}

		} else {
			System.out.println("ELSEEEEEEEEEEEEEEEEEE===>>");

			/* sql = "select * from t_leaverequest where   (hod='" + uname
					+ "' or  emailid='" + uname
					+ "')  and  firstdayofleave between '" + abc111
					+ "' and '" + today_td
					+ "'  order by firstdayofleave desc";
			 */

////***********Logic to get Hodempid to get subordinates email and id**************///
String emailidofhod="";String Emailemp="";String empidofhod="";String EmployeesEmail="";
//String sql14="select  email,empid from db_leaveapplication.t_leaveadmin where Urole like '%hod%' and email like '"+uname+"'";
uname=uname.trim();
String sql14="select  email,empid from db_leaveapplication.t_leaveadmin where  email like '"+uname+"'";

ResultSet rs4 = st.executeQuery(sql14);
System.out.println("sql14 issssss>>" + sql14);
while(rs4.next())
{

emailidofhod=rs4.getString("email");
empidofhod=rs4.getString("empid");

}
empidofhod=empidofhod.trim();
///********Logic to get Employees from there Reportinghod************//
String sql16="select empid,Uname,name,Email from db_leaveapplication.t_leaveadmin where ReportingtoHod like '"+empidofhod+"'";
ResultSet rs6 = st.executeQuery(sql16);
System.out.println("sql16 issssss>>" + sql16);
while(rs6.next())

{
	Emailemp=rs6.getString("Email");
	EmployeesEmail=EmployeesEmail + Emailemp +",";
}
EmployeesEmail=EmployeesEmail.substring(0,EmployeesEmail.length()-1);
System.out.println("Employees Email issssss>>" + EmployeesEmail);


////**********Logic to display data***************************////

sql="select * from db_leaveapplication.t_leaverequest where (hod='"+uname+"' or  emailid IN('"+EmployeesEmail+"')) and firstdayofleave between '"+abc111+"' and '"+today_td+"'  order by firstdayofleave desc";


			//	String a="SELECT * 	FROM t_leaverequest WHERE emailid = 'md@transworld-compressor.com' 	AND firstdayofleave BETWEEN '2013-07-01' AND '2013-07-31' UNION SELECT * FROM t_leaverequest WHERE emailid IN ( SELECT uname FROM t_leaveadmin 	WHERE ReportingtoHod =1 ) AND firstdayofleave  	BETWEEN '2013-07-01'  AND '2013-07-31'";

			/*
			 if(empname.equalsIgnoreCase("md@transworld-compressor.com"))
			 {
			 sql="select * from t_leaverequest where (hod='"+uname+"' or  emailid='"+uname+"') and status='"+new_stataus+"' order by firstdayofleave desc";//sql="select * from t_leaverequest where   (hod='"+uname+"' or  emailid='"+uname+"')  and  firstdayofleave between '"+abc111+"' and '"+today_td+"'   UNION SELECT * FROM t_leaverequest WHERE emailid IN ( SELECT uname FROM t_leaveadmin 	WHERE ReportingtoHod ='"+ReportingtoHod+"'  ) and firstdayofleave  	BETWEEN '"+abc111+"' and '"+today_td+"'   order by firstdayofleave desc";
			 }else{
			
			 sql="select * from t_leaverequest where (hod='"+uname+"' or  emailid='"+uname+"') and status='"+new_stataus+"' order by firstdayofleave desc";//sql="select * from t_leaverequest where   (hod='"+uname+"' or  emailid='"+uname+"')  and  firstdayofleave between '"+abc111+"' and '"+today_td+"'   UNION SELECT * FROM t_leaverequest WHERE emailid IN ( SELECT uname FROM t_leaveadmin 	WHERE ReportingtoHod ='"+ReportingtoHod+"' and typevalue='"+typevalue+"' ) and firstdayofleave  	BETWEEN '"+abc111+"' and '"+today_td+"'   order by firstdayofleave desc";
			
			 }
			
			 */

		}
		ResultSet rs = st.executeQuery(sql);
		System.out.println("Qry====********=====111111===aLLL>>" + sql);

		System.out.println("Qry==new_stataus=&&&&&&&&&&&&&&&&&=>>"
				+ new_stataus);

		int i = 1;
		String srnum = "";
%>

	
	<div class="bodyText"  style="text-align: right;">
                           <input type="hidden" id="tableHTML" name="tableHTML" value="" />  
                           <input type="hidden" id="fileName" name="fileName" value="<%=exportFileName%>" /> 
     
                           </div>
	<div id="table1">
	<table  border="0" align="center" bgcolor="">
	<tr>
	
	<%
			//System.out.println("LOOp===data==>>"+data);
				if (data != null)

				{
		%>
		
	<th><font size="3" color="" > <%=data%>  Leave Report   </font>	
	<%
			} else {
		%>
		
		<th><font size="3" color="" >Leave Report  from <%=current_day%> to <%=currentday1%>   </font>
<%
	}
%>	
 		  
<!--		<a href="excel_reprovision.jsp?month=< %=data%>&year=< %=data1%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>-->
		
                           <div style="text-align:right;margin-left: 80em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
<%--                            <a href="Leavereportexcel.jsp?status=<%=data%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>" style="font-weight: bold; color: black; " onclick="Leavereportexcel.jsp?status=<%=data%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>"> --%>
                           
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a>
                           <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
								.format(new java.util.Date())%>
                           </div>
                           
		</th>
	</tr>	
	</table>




<div class="form">
<!-- class="sortable" -->
<table id="example" bgcolor="white"  border="1" align="center" >
	<tr>
		
		<%
			try {
					if ((!(uroleofuser.equalsIgnoreCase("emp")) || !(rs
							.getString("emailid").equalsIgnoreCase(username)))) {
		%>
						<td><div align="center"><input type="checkbox" id="checkAll"></div></td>
			<%
				}
					} catch (Exception e) {
						System.out.println("Exception----->" + e);
					}
			%>
		
		
	
		<td bgcolor=""><font size="2" color="black"><b>Sr.No.</b></font></td>
		<td><font size="2" color="black"> <b>Days</b></font></td>
		<td><font size="2" color="black"><b>From</b></font></td>
		<td><font size="2" color="black"><b>Type</b></font></td>
		<td><font size="2" color="black"><b>Reason</b></font></td>
		<td><font size="2" color="black"><b>Report on</b></font></td>
		<td><font size="2" color="black"><b>Name</b></font></td>
		<td><font size="2" color="black"><b>Status</b></font></td>
		<td><font size="2" color="black"><b>HOD</b></font></td>
		<%
			if (data != null) {
					if (data.equalsIgnoreCase("cancel1")) {
		%>
				
			
		<%
										} else {
									%>
			
			
			
		<td><font size="2" color="black"><b>Action</b></font></td>
		<%
			}

				} else {
		%>
			
			<td><font size="2" color="black"><b>Action</b></font></td>	
	<%
			}
		%>
		
		
		
		<td><font size="2" color="black"><b>Applied Date</b></font></td>
	
	</tr>
<%
	while (rs.next()) {
			srnum = rs.getString("srno");

			String color = "";
			//System.out.println("Qry=====SYTATAUS====111111===>>"+rs.getString("status"));
			if (rs.getString("status").equalsIgnoreCase("pending")) {
				color = "#AEF8B1";

			} else if (rs.getString("status").equalsIgnoreCase(
					"Approved")) {

				color = "#C7C1F7";
			} else if (rs.getString("status").equalsIgnoreCase(
					"NotApproved")) {
				color = "#FB9BA5";

			} else {

				color = "#FF9933";

				//data="Cancelled";
			}

			System.out.println("Qry=color=>>" + color);
			//if(rs.getString("status").equalsIgnoreCase("Pending")){

			//	System.out.println("LOOp===222222===>>"+username);
			//	System.out.println("@@@@@@@@@@22===>>"+rs.getString("emailid"));
			//System.out.println("Status============>>"+rs.getString("status"));
			//System.out.println("srno============>>"+rs.getString("srno"));
			//System.out.println("Qry====1111========>>"+rs.getString("firstdayofleave"));
			Date dt = rs.getDate("firstdayofleave");
%>
	<tr   bgcolor="<%=color%>"><input type="hidden" name="rid<%=i%>" id="rid<%=i%>" value="<%=rs.getString("srno")%>" ></input>
	<%
		//	}
	%>
	   
		<%
	   			if ((!(uroleofuser.equalsIgnoreCase("emp")) || !(rs
	   							.getString("emailid").equalsIgnoreCase(username)))) {
	   						if (rs.getString("emailid").equalsIgnoreCase(username)) {
	   		%>
			<td></td>
			<%
				} else if ((!new_stataus.equalsIgnoreCase("cancel")) && (!new_stataus.equalsIgnoreCase("NotApproved")) && (!new_stataus.equalsIgnoreCase("Approved")) ) {
			%>
			<td><input type="checkbox" name="cb<%=i%>" id="cb<%=i%>" value="<%=rs.getString("srno")%>"></input></td>
		
		<%
			}else
			{%>
				<td></td>
				<%
			}
				
					}
		%>
		<td align="right"><div align="right"><font size="2" color="black"><%=i%></font></div></td>
		<td align="right"><div align="right" style="overflow: auto;"><font size="2" color="black"><%=rs.getString("daysapplied")%></font></div></td>
		<td align="right"><div align="right"><font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy")
											.format(new SimpleDateFormat(
													"yyyy-MM-dd")
													.parse(rs
															.getString("firstdayofleave")))%></font></div></td>
		<td align="left"><div align="left"><font size="2" color="black"><%=(rs.getString("typeofleave")).substring(0, (rs
									.getString("typeofleave")).length() - 6)%></font></div></td>
		<td align="left"><div align="left" style="overflow: auto; width: 200px;"><font size="2" color="black"><%=rs.getString("reasonforleave")%></font></div></td>
		<td align="right"><div align="right"><font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy")
											.format(new SimpleDateFormat(
													"yyyy-MM-dd")
													.parse(rs
															.getString("dateofreporting")))%></font></div></td>
		<td align="left"><div align="left"><a href="" onmouseover="ajax_showTooltip(window.event,'showEmpDetails.jsp?empName=<%=rs.getString("name")%>',this);return false" onMouseOut="ajax_hideTooltip();"><font size="2" color="black"><%=rs.getString("name")%> </font></div></td>
		<%
			if ("Approved".equalsIgnoreCase(rs.getString("status"))) {
		%>
						<td align="left"><div align="left"><font size="2" color="black">Accepted</font></div></td>
						<%
							} else if ("NotApproved".equalsIgnoreCase(rs
											.getString("status"))) {
						%>
							<td align="left"><div align="left"><font size="2" color="black">Rejected</font></div></td>
							<%
								} else {
							%>
							<td align="left"><div align="left"><font size="2" color="black"><%=rs.getString("status")%></font></div></td>
							<%
								}

										String hodname = "select Name from t_leaveadmin where Email='"
												+ rs.getString("HOD") + "'";
										ResultSet rsHodname = st1.executeQuery(hodname);
										System.out.println(">>>>hodname>>>>>" + hodname);
										if (rsHodname.next()) {
							%>
			<td align="left"><div align="left" style="overflow: auto; width: 80px;"><font size="2" color="black"><%=rsHodname.getString("Name")%></font></div></td>
		<%
			} else {
		%>
			<td><font color="#AEF8B1">-</font> </td>
			<%
				}
			%>
		
		<%
					if (uroleofuser.equalsIgnoreCase("emp")
									|| rs.getString("emailid").equalsIgnoreCase(
											username)) {
								if ((rs.getString("status").equalsIgnoreCase("Pending"))
										&& (uroleofuser.equalsIgnoreCase("emp") || rs
												.getString("emailid").equalsIgnoreCase(
														username))) {
				%>
				<td align="left"><div align="left"><a href="#" onclick="return onSubmitForCancle('leave','<%=rs.getString("srno")%>','<%=i%>')"><font size="2" color="#09195B">Cancel</font></a></div></td>
			<%
				} else {
			%><td></td><%
				}
						} else {
							if (rs.getString("status").equalsIgnoreCase(
									"NotApproved")
									|| rs.getString("status").equalsIgnoreCase(
											"Approved")) {
			%>
								<td align="left"><div align="left"><br><a href="#" onclick="return onSubmitForRevert('<%=rs.getString("srno")%>','<%=i%>')"><font size="2" color="#09195B">Revert</font></a></div></td>
								<%
									} else if (rs.getString("status").equalsIgnoreCase(
														"Cancel")) {

													if (data != null) {
														if (data.equalsIgnoreCase("cancel1")) {

														} else {
								%>
									<td></td>
									<%
										}

														} else {
									%>
									<td></td>
									<%
										}
													} else {
									%>
								<td align="left"><div align="left"><a href="#" onclick="return onSubmit1('leave','<%=rs.getString("srno")%>','<%=i%>')"><font size="2" color="#09195B">Approve</font></a>
								<br><a href="#" onclick="return onSubmitForNot1('leave','<%=rs.getString("srno")%>','<%=i%>')"><font size="2" color="#09195B">Reject</font></a></div></td>
								<%
									}
											}
								%>
		<td align="right"><div align="right" style="width: 80px;"><font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm")
									.format(new SimpleDateFormat(
											"yyyy-MM-dd HH:mm:ss").parse(rs
											.getString("inserteddatetime")))%></font></div></td>
	</tr>
	
	<%
			i++;
				}
		%>
				</table>
				</div>
				<input type="hidden" name="cntr" value="<%=i%>" />
				<table align="center">
				<%
					if (!(uroleofuser.equalsIgnoreCase("emp"))) {
				%>
				<input type="Submit" name="Submit" Value="Approve" onclick="onSubmit(this.form,'<%=srnum%>','<%=i%>')">
				<input type="Submit" name="Submit" Value="Reject" onclick="return onSubmitForNot(this.form,'<%=srnum%>','<%=i%>');">
				<%
					}
				%> 
				
</table>


</div>
</form>

</td>



<!-- </form> -->
<%
	} else if (data.equals("Pending1") || data.equals("Approved1")
			|| data.equals("NotApproved1") || data.equals("cancel1")) {
		//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

		//System.out.println("LOOp=55555==3333333===>>");
		//System.out.println("========++++++++++++++++++++else if+++++++++++++++++++++++==========");
%>
				<!-- <form method="post" name="leave1" id="leave1" action="#" onsubmit="return validate();"> -->
				<form method="post" name="leave1" action="" onsubmit="return validate();">
				<p></p>
<div id="table1">	


<%
		String exportFileName1 = "LeaveREport.xls";
	%>
	
	<div class="bodyText"  style="text-align: right;">
                           <input type="hidden" id="tableHTML" name="tableHTML" value="" />  
                           <input type="hidden" id="fileName" name="fileName" value="<%=exportFileName1%>" /> 
     
                           </div>
	
	<table width="750px" border="0" align="center" bgcolor="#77D7D4">
	<tr>
	
		
		
<!--		<a href="excel_reprovision.jsp?month=< %=data%>&year=< %=data1%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>-->
		
                           <div style="text-align:right;margin-left: 50em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
<%--                            <a href="Leavereportexcel.jsp?status=<%=data%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>" style="font-weight: bold; color: black; " onclick="Leavereportexcel.jsp?status=<%=data%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>"> --%>
                          
                          <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel1('table1','tableHTML');">
                          
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a>
                           <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
								.format(new java.util.Date())%>
                           </div>
                           
		</th>
	</tr>	
	</table>

				<%
					//String uroleofuser=session.getAttribute("urole").toString();
						String uroleofuser = session.getAttribute("emprole").toString();
						//	System.out.println("========"+uroleofuser+"==========");

						Statement st, st1, st2, st3;
						st = conn.createStatement();
						st1 = conn.createStatement();
						st2 = conn.createStatement();
						st3 = conn.createStatement();

						String typevalue = session.getAttribute("empdept").toString();
						//System.out.println("typevalue=========>>"+typevalue);

						String username = session.getAttribute("email").toString();
						java.util.Date d = new java.util.Date();
						String datetoday = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
								.format(d);

						//============================
						int len = data.length();
						data = data.substring(0, len - 1);
						//============================
						String srnum = "";
						String sql = "";
						if ("emp".equalsIgnoreCase(uroleofuser)) {
							sql = "select * from db_leaveapplication.t_leaverequest where emailid='"
									+ username
									+ "' and Status='"
									+ data
									+ "' order by firstdayofleave desc";

						} else if ("All".equalsIgnoreCase(typevalue)) {
							sql = "select * from db_leaveapplication.t_leaverequest where URole='hod' and Status='"
									+ data + "' order by firstdayofleave desc";
						} else {
							sql = "select * from db_leaveapplication.t_leaverequest where Status='"
									+ data
									+ "' order by firstdayofleave desc";
						}
						ResultSet rs = st.executeQuery(sql);
						System.out.println(sql);
						int i = 1;
				%>
				<table bgcolor="white" border="1" align="center" id="example">
					<tr>
						<%
							try {
									if ((data.equals("Pending"))
											&& (!(uroleofuser.equalsIgnoreCase("emp")) || !(rs
													.getString("emailid")
													.equalsIgnoreCase(username)))) {
						%>
						<td><div align="center"><input type="checkbox" id="checkAll"></div></td>
						<%
							}
								} catch (Exception e) {
									System.out.println("Exception------->" + e);
								}
						%>
						<td><font size="2" color="black"><b>Sr.No.</b></font></td>
						<td><font size="2" color="black"> <b>Days</b></font></td>
						<td><font size="2" color="black"><b>From</b></font></td>
						<td><font size="2" color="black"><b>Type</b></font></td>
						<td><font size="2" color="black"><b>Reason</b></font></td>
						<td><font size="2" color="black"><b>Report on</b></font></td>
						<td><font size="2" color="black"><b>Name</b></font></td>
						<td><font size="2" color="black"><b>Status</b></font></td>
						<td><font size="2" color="black"><b>HOD</b></font></td>
						<td><font size="2" color="black"><b>Action</b></font></td>
						<td><font size="2" color="black"><b>Applied Date</b></font></td>
					</tr>
				<%
					while (rs.next()) {
							srnum = rs.getString("srno");
							if (rs.getString("status").equalsIgnoreCase("Pending")) {
				%>
					<tr bgcolor="#AEF8B1">
					<%
						} else if (rs.getString("status").equalsIgnoreCase(
										"Approved")) {
					%>
					<tr bgcolor="#C7C1F7">
					<%
						} else if (rs.getString("status").equalsIgnoreCase(
										"NotApproved")) {
					%>
						<tr bgcolor="#FB9BA5">
						<%
							} else {
						%>
							<tr bgcolor="#FF9933"> 
						<%
 							}
 						%>
						<%
							if ((data.equals("Pending"))
											&& (!(uroleofuser.equalsIgnoreCase("emp")) || !(rs
													.getString("emailid")
													.equalsIgnoreCase(username)))) {
										if (rs.getString("emailid").equalsIgnoreCase(username)) {
						%>
								<td></td>
								<%
									} else {
								%>
							<td><input type="checkbox" name="cb<%=i%>" id="cb<%=i%>" value="<%=rs.getString("srno")%>"></input></td>
							<%
								}
										}
							%>
						<td align="right"><input type="hidden" name="rid<%=i%>" id="rid<%=i%>" value="<%=rs.getString("srno")%>"/><div align="right"><font size="2" color="black"><%=i%></font></div></td>
						<td align="right"><div align="right" style="overflow: auto;"><font size="2" color="black"><%=rs.getString("daysapplied")%></font></div></td>
						<td align="right"><div align="right"><font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy")
											.format(new SimpleDateFormat(
													"yyyy-MM-dd")
													.parse(rs
															.getString("firstdayofleave")))%></font></div></td>
						<td align="left"><div align="left"><font size="2" color="black"><%=(rs.getString("typeofleave")).substring(0, (rs
									.getString("typeofleave")).length() - 6)%></font></div></td>
						<td align="left"><div align="left" style="overflow: auto; width: 200px;"><font size="2" color="black"><%=rs.getString("reasonforleave")%></font></div></td>
						<td align="right"><div align="right"><font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy")
											.format(new SimpleDateFormat(
													"yyyy-MM-dd")
													.parse(rs
															.getString("dateofreporting")))%></font></div></td>
						<td align="left"><div align="left"><a href="" onmouseover="ajax_showTooltip(window.event,'showEmpDetails.jsp?empName=<%=rs.getString("name")%>',this);return false" onMouseOut="ajax_hideTooltip();"><font size="2" color="black"><%=rs.getString("name")%> </font></div></td>
						<%
							if ("Approved".equalsIgnoreCase(rs.getString("status"))) {
						%>
							<td align="left"><div align="left"><font size="2" color="black">Accepted</font></div> </td>
							<%
								} else if ("NotApproved".equalsIgnoreCase(rs
												.getString("status"))) {
							%>
							<td align="left"><div align="left"><font size="2" color="black">Rejected</font></div></td>
							<%
								} else {
							%>
							<td align="left"><div align="left"><font size="2" color="black"><%=rs.getString("status")%></font></div></td>
							<%
								}

										String hodname = "select Name from t_leaveadmin where Email='"
												+ rs.getString("HOD") + "'";
										ResultSet rsHodname = st1.executeQuery(hodname);
										System.out.println(hodname);
										if (rsHodname.next()) {
							%>
								<td align="left"><div align="left"><font size="2" color="black"><%=rsHodname.getString("Name")%></font></div></td>
							<%
								} else {
							%>
							<td></td>
							<%
								}
							%>
						<%
							if (uroleofuser.equalsIgnoreCase("emp")
											|| rs.getString("emailid").equalsIgnoreCase(
													username)) {
										if ((rs.getString("status").equalsIgnoreCase("Pending"))
												&& (uroleofuser.equalsIgnoreCase("emp") || rs
														.getString("emailid").equalsIgnoreCase(
																username))) {
						%>
								<td align="left"><div align="left"><a href="#" onclick="onSubmitForCancle('leave1','<%=rs.getString("srno")%>','<%=i%>')"><font size="2" color="#09195B">Cancel</font></a></div></td>
							<%
								} else {
							%><td></td><%
								}
										} else {
											if (rs.getString("status").equalsIgnoreCase(
													"NotApproved")
													|| rs.getString("status").equalsIgnoreCase(
															"Approved")) {
							%>
								<td align="left"><div align="left"><br><a href="#" onclick="return onSubmitForRevert('<%=rs.getString("srno")%>','<%=i%>')"><font size="2" color="#09195B">Revert</font></a></div></td>
								<%
									} else if (rs.getString("status").equalsIgnoreCase(
														"Cancel")) {
								%>
								<td></td>
								<%
									} else {
								%>
								<td align="left"><div align="left"><a href="#" onclick="return onSubmit1('leave1','<%=rs.getString("srno")%>','<%=i%>')"><font size="2" color="#09195B">Approve</font></a>
								<br><a href="#" onclick="return onSubmitForNot1('leave1','<%=rs.getString("srno")%>','<%=i%>')"><font size="2" color="#09195B">Reject</font></a></div></td>
								<%
									}
											}
								%>
					<td align="right"><div align="right" style="width: 80px;"><font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm")
									.format(new SimpleDateFormat(
											"yyyy-MM-dd HH:mm:ss").parse(rs
											.getString("inserteddatetime")))%></font></div></td>
					</tr>
					
					<%
											i++;
												}
												//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>"+i);
										%>
				
				<input type="hidden" name="cntr" value="<%=i%>" />	
				</table>
				<%
					if ((data.equals("Pending"))
								&& (!(uroleofuser.equalsIgnoreCase("emp")))) {
				%>
				<table align="center">
				<input type="Submit" name="Submit" Value="Approve" onclick="onSubmit(this.form,'<%=srnum%>','<%=i%>')">
				<input type="Submit" name="Submit" Value="Reject" onclick="return onSubmitForNot(this.form,'<%=srnum%>','<%=i%>');"> 
				<%
 					}
 				%>
				</table>
				<!--</form>  -->
				
				</div>
				
				</form>
				<%
					//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
					} else {

						String frm = new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat("yyyy-MM-dd")
										.parse(fromDate));
						String tdt = new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat("yyyy-MM-dd")
										.parse(toDate));
						//System.out.println("LOOp=data==444===>>"+data);

						String color = "", nw_stts = "";
						if (data.equalsIgnoreCase("All1")) {
							//color="#AEF8B1";
							nw_stts = "NoSttaus";
							data = "ALL1Loop";
						} else if (data.equalsIgnoreCase("Approved")
								|| data.equalsIgnoreCase("pending")) {

							//color="#C7C1F7";
						} else if (data.equalsIgnoreCase("NotApproved")) {
							//color="#FB9BA5";
							data = "Rejected";

						} else {

							//color="#FF9933";

							data = "Cancelled";
						}
						//System.out.println("LOOp=nw_stts==444===>>"+nw_stts);
				%>
				<!-- <form method="post" name="leave2" action="leaveapproved.jsp" onsubmit="return validate();"> -->
				
				
				<form method="post" name="leave2" action="leaveapproved.jsp" onsubmit="return validate();">
				
				
				
				<p></p>
<div id="table1">	


<%
		String exportFileName2 = "LeaveRequestReport.xls";
	%>
	
	<div class="bodyText"  style="text-align: right;">
                           <input type="hidden" id="tableHTML" name="tableHTML" value="" />  
                           <input type="hidden" id="fileName" name="fileName" value="<%=exportFileName2%>" /> 
     
                           </div>
	
	<table width="" border="0" align="center" >
	<tr>
	<%
		if (data.equalsIgnoreCase("ALL1Loop")) {
	%>
				<th ><div align="center">  <font size="3" color="<%=color%>"" >Leave Report  from <%=frm%> to  <%=tdt%> </font> </div>
		
		
	<%
						} else {
					%>
				<th ><div align="center">  <font size="3" color="<%=color%>"" ><%=data%> Leave Report  from <%=frm%> to  <%=tdt%> </font> </div>
		
	<%
				}
			%>
		
<!--		<a href="excel_reprovision.jsp?month=< %=data%>&year=< %=data1%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>-->
<!-- 		       <div style="text-align:right;margin-left: 50em;"><input type="checkbox" name="maincb" value="maincb" onClick="selectAll1();"/> </div> -->
                           <div style="text-align:right;margin-left: 50em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
<%--                            <a href="Leavereportexcel.jsp?status=<%=data%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>" style="font-weight: bold; color: black; " onclick="Leavereportexcel.jsp?status=<%=data%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>"> --%>
                          
                          <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel1('table1','tableHTML');">
                          
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a>
                           <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
								.format(new java.util.Date())%>
                           </div>
                           
		</th>
	</tr>	
	</table>
				<%
					//System.out.println("last loop= data==> 121212121=>"+data);
						//	System.out.println("last loop= data==> =>"+typevalue);
						if (data.equalsIgnoreCase("Cancelled")) {

							data = "Cancel";

						}

						if (data.equalsIgnoreCase("Rejected")) {

							data = "NotApproved";

						}
						String uroleofuser = session.getAttribute("emprole").toString();

						Statement st, st1, st2, st3;
						st = conn.createStatement();
						st1 = conn.createStatement();
						st2 = conn.createStatement();
						st3 = conn.createStatement();

						String typevalue = session.getAttribute("empdept").toString();

						String username = session.getAttribute("email").toString();
						java.util.Date d = new java.util.Date();
						String datetoday = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
								.format(d);
						String sql = "";
						if ("emp".equalsIgnoreCase(uroleofuser)|| "contractor".equalsIgnoreCase(uroleofuser)) {

							if (nw_stts.equalsIgnoreCase("NoSttaus")) {
								sql = "select * from db_leaveapplication.t_leaverequest where emailid='"
										+ username
										+ "'  and firstdayofleave between '"
										+ fromDate
										+ "' and '" + toDate + "'  ";

							} else {

								sql = "select * from db_leaveapplication.t_leaverequest where emailid='"
										+ username
										+ "' and Status='"
										+ data
										+ "' and firstdayofleave between '"
										+ fromDate
										+ "' and '" + toDate + "'  ";
							}

						} else if ("All".equalsIgnoreCase(typevalue)) {

							System.out.println("elseIFFFFF1111=>" + nw_stts+"allll"+typevalue);
							if (nw_stts.equalsIgnoreCase("NoSttaus")) {

								System.out.println("******************=>");
								sql = "select * from db_leaveapplication.t_leaverequest where (hod='"
										+ uname
										+ "' or  emailid='"
										+ uname
										+ "' or  emailid like  '%%') and firstdayofleave between '"
										+ fromDate
										+ "' and '" + toDate + "'  ";
								
								System.out.println("*******emp***nnmm********=>" + empname);
								
							} else {

								
								System.out.println("elsemmmmmmmmmmm=mdmdmd=>");
								sql = "select * from db_leaveapplication.t_leaverequest where (hod='"
										+ uname
										+ "' or  emailid='"
										+ uname
										+ "' or  emailid like  '%%') and   Status='"
										+ data
										+ "' and  firstdayofleave between '"
										+ fromDate
										+ "' and '" + toDate + "'  ";
								

						}

						} else {
							if (nw_stts.equalsIgnoreCase("NoSttaus")) {
								System.out.println("ifffffffffffff==>");
								sql = "select * from db_leaveapplication.t_leaverequest where (hod='"
										+ uname
										+ "' or  emailid='"
										+ uname
										+ "')    and firstdayofleave between '"
										+ fromDate + "' and '" + toDate + "'  ";

							} else {
								System.out.println("elsemmmmmmmmmmm==>");
								sql = "select * from db_leaveapplication.t_leaverequest where (hod='"
										+ uname
										+ "' or  emailid='"
										+ uname
										+ "')  and   Status='"
										+ data
										+ "' and  firstdayofleave between '"
										+ fromDate
										+ "' and '" + toDate + "'  ";

							}
						}
						System.out.println("last loop==>" + sql);
						ResultSet rs = st.executeQuery(sql);
						System.out.println("last loop==>" + sql);
						int i = 1;
						String srnum = "";
				%>
				<table id="example" bgcolor="white"  border="1" align="center" >
					<tr>
						<%
							try {
									if ((data.equals("Pending"))
											&& (!(uroleofuser.equalsIgnoreCase("emp")) || !(rs
													.getString("emailid")
													.equalsIgnoreCase(username)))) {
						%>
						<td><div align="center"><input type="checkbox" id="checkAll"></div></td>
						<%
							}
								} catch (Exception e) {
									System.out.println("Exception-------->" + e);
								}
						%>
						<td><font size="2" color="black"><b>Sr.No.</b></font></td>
						<td><font size="2" color="black"> <b>Days</b></font></td>
						<td><font size="2" color="black"><b>From</b></font></td>
						<td><font size="2" color="black"><b>Type</b></font></td>
						<td><font size="2" color="black"><b>Reason</b></font></td>
						<td><font size="2" color="black"><b>Report on</b></font></td>
						<td><font size="2" color="black"><b>Name</b></font></td>
						<td><font size="2" color="black"><b>Status</b></font></td>
						<td><font size="2" color="black"><b>HOD</b></font></td>
						<%
							System.out.println("data=1111==>>>>>" + data);
								if (data.equalsIgnoreCase("cancel")) {
						%>
							
							 
					<%
														 						} else if (data.equalsIgnoreCase("ALL1Loop")) {
														 					%>		
						<td><font size="2" color="black"><b>Action</b></font></td>	
					<%
							} else {
						%>
						<td><font size="2" color="black"><b>Action</b></font></td>
						
				<%
											}
												//System.out.println("data=222222==>>>>>"+data);
										%>
						
						
						<td><font size="2" color="black"><b>Applied Date</b></font></td>						
					</tr>
				<%
					while (rs.next()) {
							srnum = rs.getString("srno");

							//System.out.println("LOOp==before=444==!!!=>>"+rs.getString("firstdayofleave"));

							//System.out.println("LOOp===444==!!!=>>"+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse((rs.getString("firstdayofleave")))));

							if (rs.getString("status").equalsIgnoreCase("Pending")) {
				%>
					<tr bgcolor="#AEF8B1"> <input type="hidden" name="rid<%=i%>" id="rid<%=i%>" value="<%=rs.getString("srno")%>" />
					<%
						} else if (rs.getString("status").equalsIgnoreCase(
										"Approved")) {
					%>
					<tr bgcolor="#C7C1F7"><input type="hidden" name="rid<%=i%>" id="rid<%=i%>" value="<%=rs.getString("srno")%>" />
					<%
						} else if (rs.getString("status").equalsIgnoreCase(
										"NotApproved")) {
					%>
						<tr bgcolor="#FB9BA5"> <input type="hidden" name="rid<%=i%>" id="rid<%=i%>" value="<%=rs.getString("srno")%>" />
						<%
							} else {
						%>
							<tr bgcolor="#FF9933"> <input type="hidden" name="rid<%=i%>" id="rid<%=i%>" value="<%=rs.getString("srno")%>"/>
						<%
							}
						%>
						<%
							if ((data.equals("Pending"))
											&& (!(uroleofuser.equalsIgnoreCase("emp")) || !(rs
													.getString("emailid")
													.equalsIgnoreCase(username)))) {
										if (rs.getString("emailid").equalsIgnoreCase(username)) {
						%>
							<td></td>
							<%
								} else {
							%>
						<td><input type="checkbox" name="cb<%=i%>" id="cb<%=i%>" value="<%=rs.getString("srno")%>"></input></td>
						<%
							}
									}

									//System.out.println("6%^%^%^%^reason>>>>"+rs.getString("reasonforleave"));
						%>
						<td align="right"><div align="right"><font size="2" color="black"><%=i%></font></div></td>
						<td align="right"><div align="right" style="overflow: auto; "><font size="2" color="black"><%=rs.getString("daysapplied")%></font></div></td>
						<td align="right"><div align="right"><font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy")
											.format(new SimpleDateFormat(
													"yyyy-MM-dd")
													.parse(rs
															.getString("firstdayofleave")))%></font></div></td>
						
<%-- 						<td align="right"><div align="right"><font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse((rs.getString("firstdayofleave")))))   %></font></div></td> --%>
						
						<td align="left"><div align="left"><font size="2" color="black"><%=(rs.getString("typeofleave")).substring(0, (rs
									.getString("typeofleave")).length() - 6)%></font></div></td>
						<td align="left"><div align="left" style="overflow: auto; width: 200px;"><font size="2" color="black"><%=rs.getString("reasonforleave")%></font></div></td>
						<td align="right"><div align="right"><font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy")
											.format(new SimpleDateFormat(
													"yyyy-MM-dd")
													.parse(rs
															.getString("dateofreporting")))%></font></div></td>
						<td align="left"><div align="left"><a href="" onmouseover="ajax_showTooltip(window.event,'showEmpDetails.jsp?empName=<%=rs.getString("name")%>',this);return false" onMouseOut="ajax_hideTooltip();"><font size="2" color="black"><%=rs.getString("name")%> </font></div></td>
						<%
							if ("Approved".equalsIgnoreCase(rs.getString("status"))) {
						%>
						<td align="right"><div align="right"><font size="2" color="black">Accepted</font></div></td>
						<%
							} else if ("NotApproved".equalsIgnoreCase(rs
											.getString("status"))) {
						%>
							<td align="left"><div align="left"><font size="2" color="black">Rejected</font></div></td>
							<%
								} else {
							%>
							<td align="left"><div align="left"><font size="2" color="black"><%=rs.getString("status")%></font></div></td>
							<%
								}

										String hodnm = "-";
										String hodname = "select Name from t_leaveadmin where Email='"
												+ rs.getString("HOD") + "'";
										ResultSet rsHodname = st1.executeQuery(hodname);
										//System.out.println("hodname==>"+hodname);
										if (rsHodname.next()) {
											//hodnm=rsHodname.getString("Name");
							%>
							<td align="left"><div align="left"><font size="2" color="black"><%=rsHodname.getString("Name")%></font></div></td>
						<%
							} else {
						%>
							<td>-</td>
							<%
								}
							%>
						
						<%
													//System.out.println("data=check val===>"+data);
															//System.out.println("data=check val===>"+rs.getString("status"));
															//System.out.println("username===>"+username);
															//System.out.println("emailid===>"+rs.getString("emailid"));

															if (uroleofuser.equalsIgnoreCase("emp")
																	|| rs.getString("emailid").equalsIgnoreCase(
																			username)) {
																if ((rs.getString("status").equalsIgnoreCase("Pending"))
																		&& (uroleofuser.equalsIgnoreCase("emp") || rs
																				.getString("emailid").equalsIgnoreCase(
																						username))) {

																	//System.out.println("if of @@@@@@@==>");
												%>
								<td align="left"><div align="left"><a href="#" onclick="return onSubmitForCancle('leave2','<%=rs.getString("srno")%>','<%=i%>')"><font size="2" color="#09195B">Cancel</font></a></div></td>
							<%
								} else if ((rs.getString("status")
													.equalsIgnoreCase("Cancel"))
													&& data.equalsIgnoreCase("ALL1Loop"))

											{
												//	System.out.println("lopop of cancel & allipoop if of of @@@@@@@==aks>");
							%>
									<td>-</td>
									
								<%
																		} else if ((rs.getString("status")
																							.equalsIgnoreCase("Cancel"))
																							&& (uroleofuser.equalsIgnoreCase("emp") || rs
																									.getString("emailid").equalsIgnoreCase(
																											username))) {

																					}

																					else {
																						//System.out.println("else of @@@@@@@==>");
																	%>
 								<td>-</td> 
								
								<%
 																	}
 																			} else {
 																				if (rs.getString("status").equalsIgnoreCase(
 																						"NotApproved")
 																						|| rs.getString("status").equalsIgnoreCase(
 																								"Approved")) {

 																					///System.out.println("if of else  of $$$$$$$$==>");
 																%>
								<td align="left"><div align="left"><br><a href="#" onclick="return onSubmitForRevert('<%=rs.getString("srno")%>','<%=i%>')"><font size="2" color="#09195B">Revert</font></a></div></td>
								<%
									} else if (data.equalsIgnoreCase("ALL1Loop")) {
													//System.out.println(" else if  else  of $$$$$$$4==>");
								%>
								
								<td> </td>
							<%
								}

											else if (rs.getString("status").equalsIgnoreCase(
													"Cancel")) {
												//System.out.println(" else if  else  of $$$$$$$3==>");
							%>
							
								<%
																} else {
																				//System.out.println(" else of last  $$$$$$$4==>");
															%>
								<td align="left"><div align="left"><a href="#" onclick="return onSubmit1('leave2','<%=rs.getString("srno")%>','<%=i%>')"><font size="2" color="#09195B">Approve</font></a>
								<br><a href="#" onclick="return onSubmitForNot1('leave2','<%=rs.getString("srno")%>','<%=i%>')"><font size="2" color="#09195B">Reject</font></a></div></td>
								<%
									}
											}
								%>
					<td align="right"><div align="right" style="width: 80px;"><font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm")
									.format(new SimpleDateFormat(
											"yyyy-MM-dd HH:mm:ss").parse(rs
											.getString("inserteddatetime")))%></font></div></td>
					</tr>
					
					<%
											i++;
												}
										%>
				<input type="hidden" name="cntr" value="<%=i%>" />
				
				<%
									if ((data.equals("Pending"))
												&& (!(uroleofuser.equalsIgnoreCase("emp")))) {
								%>
				<table align="center">
				<input type="Submit" name="Submit" Value="Approve" onclick="onSubmit(this.form,'<%=srnum%>','<%=i%>')">
				<input type="Submit" name="Submit" Value="Reject" onclick="return onSubmitForNot(this.form,'<%=srnum%>','<%=i%>');"> 
				<%
 					}
 				%>
				</table>
				
				</table>
				</div>
				</form>
				<%
					String dtanew = "-";
					}
				%>
</td></tr>

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
<%@ include file="footer.jsp" %>
</html>
