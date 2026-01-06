<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="header.jsp" %>

<html>

<head>
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<style>

SPAN.searchword {
	background-color: cyan;
}

SPAN.super {
	text-decoration: blink;
	text-align: center;
}

.popup {
	background-color: #98AFC7;
	position: absolute;
	visibility: hidden; . popupnew { background-color : #98AFC7;
	position: absolute;
	visibility: visible; . popupx { background-color : #98AFC7;
	position: absolute;
	visibility: hidden;
}

BODY {
	bgcolor="#FFE4E1";
}

</style>
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<script src="js/sorttable.js" type="text/javascript"></script>


	<script type="text/javascript">
		function showPO(no,search){
		//alert(no);alert(search);
		//PODetails.jsp?transactionId=5557&condition=null
		window.open('PODetails.jsp?transactionId='+no+'&condition=null');
		
	}
	function showPI(no,search,supplier){
		//alert(no);alert(search);
		//PODetails.jsp?transactionId=5557&condition=null
		window.open('PEDetails.jsp?transactionId='+no+'&condition=null&supplier='+supplier);
		
	}
	function showPE(no,search,supplier){
		//alert(no);alert(search);
		//PQDetails.jsp?transactionId=2558&condition=null
		window.open('PQDetails.jsp?transactionId='+no+'&condition=null');
	}
	function showPurIn(no,search){
		//alert(no);alert(search);
		//PIDetails.jsp?transactionId=2556&condition=null
		window.open('PIDetails.jsp?transactionId='+no+'&condition=null');
	}
	function showSO(no,search){
		//alert(no);alert(search);
		//viewOrder.jsp?salesOrder=6717&condition=View
		window.open('viewOrder.jsp?salesOrder='+no+'&condition=View');
	}
	function showSQ(no,search){
		//alert(no);alert(search);
		//viewQuotation.jsp?salesQuotation=10631&condition=View
		window.open('viewQuotation.jsp?salesQuotation='+no+'&condition=View');
	}
	function showSE(no,search){
		//alert(no);alert(search);
		//SEDetails.jsp?company=&transactionId=SE300515001&condition=View
		window.open('SEDetails.jsp?company=&transactionId='+no+'&condition=View');
	}
	function showSI(no,no1,search){
		//alert(no);alert(search);
		//viewInvoice.jsp?InvoiceRefNo=SI260615001&Invoiceno=16365&condition=View
		window.open('viewInvoice.jsp?InvoiceRefNo='+no+'&Invoiceno='+no1+'&condition=View');
	}
	function showSPI(no,no1,search){
		//alert(no);alert(search);
		//detailForProInvoice.jsp?InvoiceRefNo=SP020615001&Invoiceno=2087&condition=View
		window.open('detailForProInvoice.jsp?InvoiceRefNo='+no+'&Invoiceno='+no1+'&condition=View');
	}
		
	
	
			
	function popUpSupplier(webadd,itemDesc,itemCode,tableToBeAccessed,makecode)
	{ 
		//alert("1");	
	
			window.open(webadd+'?itemDesc='+itemDesc+'&itemCode='+itemCode+'&tableToBeAccessed='+tableToBeAccessed+'&makecode='+makecode,'jav','width=870,height=500,top=150,left=250,resizable=yes');
	}

	function hideRows(){
		alert(document.getElementById("tr2"));
		document.getElementById("tr2").style.display="none";
		}
function showSupplier(supplierCode,supplierName)
{
	document.getElementById("visitingCard").style.visibility="visible";
	document.itemSearch.item.value=supplierName;
	document.getElementById("itemDescription").style.visibility="hidden";
	document.itemSearch.supplier.value=supplierCode;

	var searchBy;
	for (var i=0; i < document.itemSearch.supplierReport.length; i++)
	   {
	   if (document.itemSearch.supplierReport[i].checked)
	      {
		   searchBy = document.itemSearch.supplierReport[i].value;
	      }
	   }
	document.itemSearch.supplierData.value=searchBy;


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
            var mySplitResult = reslt.split("#");
            document.getElementById("supplierName").innerHTML=mySplitResult[0];
            document.getElementById("contactPerson").innerHTML=mySplitResult[1];
            document.getElementById("address").innerHTML=mySplitResult[2];
            document.getElementById("phoneNo").innerHTML=mySplitResult[3];
            document.getElementById("city").innerHTML=mySplitResult[4];
            document.getElementById("email").innerHTML=mySplitResult[5];
            document.getElementById("supplierProduct").innerHTML=mySplitResult[6];
            document.getElementById("supplierCategory").innerHTML=mySplitResult[7];
            document.getElementById("supplierFax").innerHTML=mySplitResult[8];
            document.getElementById("supplierWebsite").innerHTML=mySplitResult[9];
 
		} 
	}
	
	var queryString = "?supplierCode=" +supplierCode;
	ajaxRequest.open("GET", "AjaxGetSupplierVisitingCard.jsp" + queryString, true);
	ajaxRequest.send(null); 

	
	

}
 function showVisitingCard(supplierCode)
 {
	
		var v=document.getElementById("itemDescriptioncopy").value; 
		//alert(v);
		document.getElementById("itemDescription").innerHTML=v; 
	 if(supplierCode!='?')
	 {
	 document.getElementById("visitingCard").style.visibility="visible";
		var searchBy;
		for (var i=0; i < document.itemSearch.supplierReport.length; i++)
		   {
		   if (document.itemSearch.supplierReport[i].checked)
		      {
			   searchBy = document.itemSearch.supplierReport[i].value;
		      }
		   }
		document.itemSearch.supplierData.value=searchBy;

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
	            var mySplitResult = reslt.split("#");
	            document.getElementById("supplierName").innerHTML=mySplitResult[0];
	            document.getElementById("contactPerson").innerHTML=mySplitResult[1];
	            document.getElementById("address").innerHTML=mySplitResult[2];
	            document.getElementById("phoneNo").innerHTML=mySplitResult[3];
	            document.getElementById("city").innerHTML=mySplitResult[4];
	            document.getElementById("email").innerHTML=mySplitResult[5];
	            document.getElementById("supplierProduct").innerHTML=mySplitResult[6];
	            document.getElementById("supplierCategory").innerHTML=mySplitResult[7];
	            document.getElementById("supplierFax").innerHTML=mySplitResult[8];
	            document.getElementById("supplierWebsite").innerHTML=mySplitResult[9];
	 
			} 
		}
		
		var queryString = "?supplierCode=" +supplierCode;
		ajaxRequest.open("GET", "AjaxGetSupplierVisitingCard.jsp" + queryString, true);
		ajaxRequest.send(null); 
	 }	 
	 else
		 document.getElementById("visitingCard").style.visibility="hidden";
 }

function unCheckAll()
{
	document.itemSearch.all.checked=false;
	timer(1);
}


function frmSubmit(make,group,item,itemName,makeName,part)
{
	
	 var fromDate=document.itemSearch.fromdate.value;
	 var toDate=document.itemSearch.todate.value;
	 var all=null;
	 if(document.itemSearch.all.checked==true)
		 all="all";
	window.location='?all='+all+'&fromdate='+fromDate+'&todate='+toDate+'&purchaseDetails=purchaseDetails&make='+make+'&group='+group+'&itemCode='+item+'&itemName='+itemName+'&makeName='+makeName+'&part='+part;
}


function showOptions()
{
	document.getElementById("options").style.display="block";
	document.itemSearch.submit.style.visibility="visible";
}

function hideOptions()
{
	document.getElementById("options").style.display="none";
	document.itemSearch.submit.style.visibility="hidden";
	document.itemSearch.item.value="";
}


	 
function showItemDetails(item,searchBy)
{
	window.location="?item="+item+"&searchBy="+searchBy;
	
}
function timer1(count){
	//alert("KK--"+count);
	document.getElementById("wait1").style.display="";
	setTimeout("timer("+count+")", 10);
}
function timer(count){
	document.getElementById("wait").style.display="";
	setTimeout("fun("+count+")", 3000);
}	
 function fun(num){
// 	 document.getElementById("wait").style.display="";
// 	 document.getElementById("wait1").style.display="";

	 var item=document.itemSearch.item.value;
	/*  if(item==""){
		 document.getElementById("itemDescription").innerHTML="";
	 } */

	var searchBy;

	// alert("document.itemSearch.searchBy.length"+document.itemSearch.searchBy.length);
	 
	 for (var i=0; i < document.itemSearch.searchBy.length; i++)
	   {
	   if (document.itemSearch.searchBy[i].checked)
	      {
		   searchBy = document.itemSearch.searchBy[i].value;
		   
	      }
	   }
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

			
			document.getElementById("itemDescription").innerHTML=reslt;
			document.getElementById("itemDescriptioncopy").value=reslt;
			document.getElementById("wait").style.display="none";
			document.getElementById("wait1").style.display="none";
			ajaxRequest.abort();
			ajaxRequest.abort();
	//	alert("lklklk");
		} 
	}
	var counter=document.getElementById("counter").value;
	if(num==1)
	{
		counter=20;
	}
	else if(num==2)
	{
		counter=0;
	}
	
 	var fromdate=document.getElementById("fromdate").value;
 	var todate=document.getElementById("todate").value;
 	var rd=document.getElementById("rd").value;

 	var all=document.getElementById("all").checked;;
 	//alert(fromdate+"--"+todate+all);
	++num;
	//alert("nnnn"+num);
	var queryString = "?&limitcount="+num+"&item=" +item+"&rd="+rd+"&searchBy="+searchBy+"&fromdate="+fromdate+"&todate="+todate+"&all="+all;
	ajaxRequest.open("GET", "inwardglobalajax.jsp" + queryString, true);
	ajaxRequest.send(null); 

	document.getElementById("itemDescription").style.visibility="visible";


	}
	function getItems()
	{
		
		var item=document.itemSearch.item.value;

		var searchBy;
		for (var i=0; i < document.itemSearch.searchBy.length; i++)
		   {
		   if (document.itemSearch.searchBy[i].checked)
		      {
			   searchBy = document.itemSearch.searchBy[i].value;
		      }
		   }

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
				alert("krn");
				var reslt=ajaxRequest.responseText;
				document.getElementById("itemDescription").innerHTML=reslt;
				alert(reslt);
				ajaxRequest.abort();
				alert(ajaxRequest.abort());
			} 
		}
		
		var queryString = "?item=" +item+"&searchBy="+searchBy;
		ajaxRequest.open("GET", "AjaxGetItemList.jsp" + queryString, true);
		//ajaxRequest.send(null); 
		document.getElementById("itemDescription").style.visibility="visible";
	
	}
	 
	if (document.all || document.getElementById)
		document.body.style.background = "url('images/bg.jpg')  white top no-repeat ";
	


    function popUp(Address,id,type,companyName)
    { 
        if(type=="PO")
                    window.open(Address+'?companyName='+companyName+'&PONo='+id,'jav','width=870,height=700,top=150,left=250,resizable=yes,scrollbars=yes');
        else
            window.open(Address+'?companyName='+companyName+'&InvoiceNo='+id,'jav','width=870,height=700,top=150,left=250,resizable=yes');
    }



    function addSupplier()
    {
            //alert("asfagsdbdn");
       window.open("addNewSupplier.jsp",'jav');
            }
</script>
</head>

<%
String supp="?";
	if(request.getParameter("searchBy")!=null)
		if(request.getParameter("searchBy").equalsIgnoreCase("Supplier"))
		supp=request.getParameter("supplier");
%>
<body onload="showVisitingCard('<%=supp %>')">
	 
	<%
	%>
	<%
	java.text.DecimalFormat df = new java.text.DecimalFormat("0.00");
	
			Connection conn1 = null;
			Statement st_1 = null, st1_1 = null;
			Statement st2_1 = null;
			String selectedName;
			String FollowUpType = "";
	%>
	<%
		String fromDateCal_1 = "", toDateCal_1 = "",sql="";
			fromDateCal_1 = toDateCal_1 = new SimpleDateFormat("dd-MMM-yyyy")
					.format(new java.util.Date());
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.MONTH, -1);
			Date result = cal.getTime();
			fromDateCal_1 = new SimpleDateFormat("dd-MMM-yyyy").format(result);
			System.out.println("--<<>>"+fromDateCal_1);
			if(request.getParameter("fromdate")!=null)
			{
				fromDateCal_1=request.getParameter("fromdate");
				toDateCal_1=request.getParameter("todate");
				
			}
			System.out.println("--<<>>"+fromDateCal_1);
			
 
	%>
	<div
		style="font-size: 1.8em; text-align: center; " ><a> 

		 Inward Global Search</a>
 </div>

<form name='itemSearch' action="GlobalSearch_1.jsp" method="get" >



<table  align="center" border="1" cellspacing="0" style="border-color: rgb(74, 76, 219);"><tr><td>
<table  width="100%" >
<tr>
<td colspan="3" align="left">
<table>

<tr>
<td>Status :</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="searchBy" value="All"  checked="checked" onclick="hideOptions()" />All</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="searchBy" value="Checked"   onclick="hideOptions()" />Checked</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="searchBy" value="Unchecked"  onclick="hideOptions()" />UnChecked</td>
<!-- <td><input type="radio" name="searchBy" value="Forwarded"  onclick="hideOptions()" />Forwarded</td>
 -->
 
 
</tr>
<tr>
</tr>
<tr></tr>
<tr>
</tr>
<tr>

<td>Type :</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<select name="rd" id="rd" 
				style="width: 87px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
			 		<option value="all">All</option>
			 		<option value="bill">Bill</option>
			 		<option value="doc">Document</option>
			    </select>
				</td>

 
</tr>
<tr>
</tr>
<tr></tr>
<tr>
</tr>
<!-- <tr>
<td></td>
<td><input type="radio" name="searchBy" value="SO"  onclick="hideOptions()" />Sales Order</td>
<td><input type="radio" name="searchBy" value="SE"  onclick="hideOptions()" />Sales Enquiry</td>
<td><input type="radio" name="searchBy" value="SQ"  onclick="hideOptions()" />Sales Quotation</td>

</tr> -->
<tr><td></td>
<!-- <td colspan="6"><font style="color: red; font-size: small;">&nbsp;&nbsp;(Do not add text while searching for Sales/Purchase Number)</font></td>
 --></tr>
</table>



</td>
 
</tr>
<tr>
</tr>
<tr>
</tr>
		<tr>
			<td align="left" valign="top" >
		&nbsp;Search :</td>
			<td align="left" valign="top" >
			<div id="item" >
		 &nbsp;&nbsp;&nbsp;<input type="text" name="item" id="search-text" style="width: 235px;" value="" onkeyup="timer(1)"/></div>

			</td>
			<td align="left" style="width: 250px; overflow: auto;" rowspan="3">

			<!-- <div id='itemDescription' style="overflow: ">
			<div style="height: 90px; width: 400px; overflow: auto;">
			<table  style="display: none;">

			</table>

			</div>
			</div> -->
			</td>
			 

		</tr>
		 
</tr>
<tr>
</tr>
<tr></tr>
<tr>
</tr>

		<tr>

			<td align="left" valign="top" colspan="2">
 
			  <table border="0"><tr><td>
			<input type="checkbox" name="all" id="all" value="all" checked="checked" onchange="timer(1)"/></td><td>
			All </td><td>&nbsp;&nbsp;&nbsp;&nbsp;	</td>
			<td>
			 
			<input type="text" id="fromdate" onmousedown="unCheckAll();" onchange="timer(1)"
						name="fromdate" value="<%=fromDateCal_1 %>" size="15" readonly="readonly"
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
					
			<!--<input type="button" name="From Date" value="From Date" id="trigger">-->
			<script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "fromdate",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",     // the date format
			      button      : "fromdate"       // ID of the button
			    }
			  );
			</script>
 </td><td valign="middle">
			<b>To </b></td><td>
			 <input type="text" id="todate" onmousedown="unCheckAll()" onclick="timer(1)" onchange="timer(1)"
						name="todate" value="<%=toDateCal_1 %>" size="15" readonly="readonly"
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
					
			<script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "todate",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",    // the date format
			      button      : "todate"       // ID of the button
			    }
			  );
			</script>
			</td><td>
						
			<input type="hidden" name="supplier" id="supplier" value="supplier" />
			<input type="hidden" name="supplierData" id="supplierData" value="supplierData" />
			 
			
	 <input type="submit" name="submit" id="submit" style="border: outset; visibility: hidden;"
				value="GO"></input></td>
				  </tr>
				 
				  </table>
				 </td>
		</tr>
		 
				 
		 <tr><td>
		 
		 </td></tr>
		  
	</table>
	</td>

	</tr></table>
	<input type="hidden" name="counter" id="counter" value="10" />
	 </form>
	 <br><br>
	 <center><span id="wait" style="display: none;"><font color="red">Please Wait...</font> </span></center>
	 
	 <input type="hidden" name="itemDescriptioncopy" id="itemDescriptioncopy" />
	 
	 <div id="itemDescription" style="overflow:auto;height: auto; width: 100%;background-color: white; ">
			<div style="height: 100%; width: 100%; overflow: auto;">
			</div>
			
			</div>
			<br><br><center><span id="wait1" style="display: none;"><font color="red"> Please Wait... </font></span></center>
	 
		 <%
			
	
	%>
 
	</body>
	
	</html>


