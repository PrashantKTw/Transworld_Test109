<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="header.jsp"%>
<html>

<head>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"></script>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css ">
		<script type="text/javascript" src="datatablejs/bootstrap.js"></script>
		<script
			src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js "></script>
		<script
			src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js "></script>
		<script
			src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js "></script>
		<script
			src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js "></script>
		<script
			src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js "></script>
		<script
			src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="datatablejs/buttons.colVis.min.js"></script>

		<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
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

BODY {bgcolor ="#FFE4E1";
	
}
</style>


		<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
		<script type="text/javascript"
			src="jscalendar-1.0/lang/calendar-en.js"></script>
		<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
		<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/ajax-tooltip.js"></script>
		<script src="js/sorttable.js" type="text/javascript"></script>


		<script language="JavaScript1.2" type="text/javascript">


function editInward(reference)
{
	testwindow=window.open('editInwardedEntry.jsp?refno='+reference,'mywindow1','width=400, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
}
	
</script>

		<script type="text/javascript">
$(document).ready(function() {
	    $('#example').DataTable( {
	    	"pagingType": "full_numbers",
	    	
	        dom: 'Blfrtip',
	        "bLengthChange" : false,
	        buttons: [
	        	{
	        		extend: 'collection',
	        		text: 'Export',  		//Export button
	        		buttons: [
	        			{ 			//different options under export
	                        extend: 'excel',
	                        title: 'Inward Report', 
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Inward Report', 
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Inward Report', 
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Inward Report', 
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Inward Report', 
	                    }
	                    
	            	]
	        	},
	        	
	            'colvis',                                    //column visibility
	            'pageLength'				   
	        ],
	        
	        
	        "oLanguage": {                                    //search functionality
	        	   "sSearch": "Search"
	        	 },
	        	 
	        	 "aoColumns" : [ null, null, null , null, null, null, null, null, null],
	         
	        lengthMenu: [                                      //how many rows to be shown
	            [ 10, 25, 50, -1 ], 
	            [ '10 Rows' , '25 Rows', '50 Rows', 'Show all' ],
	            
	        ]
	        	 	    	
	    } );
		var table = $('#example').DataTable();    //add this only for Highlight functionality
	     
	    $('#example tbody').on('mouseenter', 'td', function () {
	            var colIdx = table.cell(this).index().column;
	 
	            $( table.cells().nodes() ).removeClass( 'highlight' );
	            $( table.column( colIdx ).nodes() ).addClass( 'highlight' );
	        } );
	});  
	
	jQuery.extend( jQuery.fn.dataTableExt.oSort, {     //add this only for date sorting
	 "date-uk-pre": function ( a ) {
	    var ukDatea = a.split('/');
	    return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
	 },

	 "date-uk-asc": function ( a, b ) {
	    return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	 },

	 "date-uk-desc": function ( a, b ) {
	    return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	 }
	 } );

</script>
</head>

<body>
	<ul>
		<%
	//	Connection conn=null;
		try
		{
		//	Class.forName("com.mysql.cj.jdbc.Driver");
		//	conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_wbeipl","erp","1@erp");
		//	conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_wbeipl","erp","1@erp");
		}
		catch(Exception e)
		{
			System.out.println("Exception=========>>"+e);
		}
		
		String empname1=session.getAttribute("email").toString();
		
	//	Connection conn=null; 
		Statement stmt=null,st=null,stftp=null;
		String sql=null;
		ResultSet rst=null,rs=null;
		String msg="";//,role="";
	
		stmt=conn.createStatement();
		st=conn.createStatement();
		stftp=conn.createStatement();
		String user="",pass="";
		//	String sqlUP="select * from t_InwardLogin where username='"+empname+"'";
		String sqlUP="select * from t_leaveadmin where UName='"+empname1+"'";
			rs=stmt.executeQuery(sqlUP);
			if(rs.next())
			{
				user=rs.getString("UName");
				pass=rs.getString("pass");
			}
			
		
		%>
	</ul>
	<script language="JavaScript1.2" type="text/javascript">


function toggleDetails(refno,show,id,row) 
{
	//alert("11111");
//	alert(show);
//	alert("id   "+id);
	//alert("row  no  "+row);
	var popupx = document.getElementById("popup"+row);
	//alert(popupx+" +++++    "+row);
	if(show=="true") 
	{
		popupx.style.visibility = "visible";
		popupx.setfocus();
	} 
	else 
	{
		 if(id=="3")
		{
			//alert("in  3333");
		}
		popupx.style.visibility = "hidden";
	}
}

function allSelected(allVal)
{
	if(document.customdetail.extAll.checked) 
	{
		document.getElementById("data").style.display='none';
    	document.getElementById("data1").style.display='none';
    	document.getElementById("frmdt").style.display='none';
    	document.getElementById("todt").style.display='none';
    	
    	//document.getElementById("dispType").style.display='none';
    	
    }
	else 
	{
		document.getElementById("data").style.display="";
    	document.getElementById("data1").style.display="";
    	document.getElementById("frmdt").style.display="";
    	document.getElementById("todt").style.display="";
    	//document.getElementById("dispType").style.display="";
	}
}

function getFTPImage(t1,refNo,empname1)
{
	try
	{
	//	alert(escape(ftpFile));
	//	alert(ftpFile);
		window.open('inwardLink.jsp?filename='+t1+'&iwno='+refNo+'&empName='+empname1+'','mywindow','width=700, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
		//window.location.reload("inwardReport.jsp");
	}
	catch(e)
	{
		alert(e);
	}
} 

function showRecvrReport(refno) 
{
	testwindow=window.open('recvrsRemark.jsp?refno='+refno,'mywindow1','width=1000, height=400, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
} 

function sendIntimation(refno)
{
	testwindow=window.open('intimationWindow.jsp?refno='+refno,'mywindow2','width=600, height=250, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=no');
}

function datevalidate()
{
	var date1=document.getElementById("data").value;
	var date2=document.getElementById("data1").value;
  
	var dm1,dd1,dy1,dm2,dd2,dy2;
	dy1=date1.substring(0,4);
	dy2=date2.substring(0,4);
	dm1=date1.substring(5,7);
	dm2=date2.substring(5,7);
	dd1=date1.substring(8,10);
	dd2=date2.substring(8,10);
    var d2date=date2.substring(0,2);
    var d1date=date1.substring(0,2);
    var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var year=date.getFullYear();
	return true;
}

function getEmp(deptName)
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
		  //alert(xmlhttp.responseText);
		  document.getElementById("to").innerHTML=xmlhttp.responseText;
		  }
		}
		xmlhttp.open("GET","getEmp.jsp?deptName="+deptName,true);
		xmlhttp.send(null);
}

function chkForParam()
{
	var p=document.getElementById("rdcnt").value;
	if(p=="" || p==null || p=="0")
	{
		alert("No document selected to send intimation");
		return false;
	}
	var p1=document.getElementById("rd").value;
	var p2=document.getElementById("dept").value;
	var p3=document.getElementById("to").value;
	if(p1=="" || p1==null)
	{
		alert("Please select the document to send intimation");
		return false;
	}
	if(p2=='Select' || p3=="")
	{
		alert("Please select the employee to whom intimation to be sent");
		return false;
	}
	return true;
}

function validate()
{
	var val1 = document.forms['inwrdreport'].elements['rdcnt'].value;
	var rdbtn;
	var i=0;
	for (i=0;i<=val1;i++)
	{
		//alert(i);
		{
			rdbtn= document.getElementById("rd").value;
		}
		if(document.inwrdreport.rd[1].checked==true)
		{
			rdbtn= document.getElementById("rd").value;
		}
		if(document.inwrdreport.rd[2].checked==true)
		{
			rdbtn= document.getElementById("rd").value;
		}
	}

	var val2=document.forms['inwrdreport'].elements['dept'].value;
	var val3=document.forms['inwrdreport'].elements['to'].value;
//	alert(rdbtn);
	//return rdbtn;
	return true;
}

function gotoExcel(elemId, frmFldId)
{  
       // alert(elemId+"========"+frmFldId);
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId);  
          oFld.value = obj.innerHTML;
          document.inwrdreport.action ="excel.jsp";
          document.forms["inwrdreport"].submit();return
} 

</script>
	<%
String datenew1=request.getParameter("data");
String datenew2=request.getParameter("data1");
System.out.println("====="+datenew1+"========"+datenew2+"======");
String deptName=request.getParameter("dept");
String serverid="",usernm="",passwd="";
String checkstatus="";
String updatedatetime="";

if(null==datenew1)
{
	datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	
	Calendar cal = Calendar.getInstance();
    cal.setTime(new Date());
    cal.add(Calendar.DAY_OF_MONTH, -7);
    Date yesterday = cal.getTime();
    datenew1=new SimpleDateFormat("dd-MMM-yyyy").format(yesterday);
	
}
%>
	<% 
		//out.println("---------"+datenew1+"------------"+datenew2+"---------");

		DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		
		String dataDate1=df1234.format(df123.parse(datenew1));
		String dataDate2=df1234.format(df123.parse(datenew2));
	     
	    String sqlftp="select * from t_ftpconnection";
	    ResultSet rsftp=stftp.executeQuery(sqlftp);
	    rsftp.next();
	    serverid=rsftp.getString("ServerID");
	    usernm=rsftp.getString("Username");
	     passwd=rsftp.getString("Password");
	//	String empname="s_joshi@transworld-compressor.com";
%>
	<table align="center">
		<td align="center"><b><font size="4" color="#151B54">Inward
					Report <%
		if(request.getParameter("status")!=null){ %> <b><font size="3"
						color="blue">[<%=request.getParameter("status")  %>Files
							Report]
					</font></b> <%} %>
			</font></b></td>

		<tr>
			<% 
		String redirectMessage=".";
		try
		{
			redirectMessage=request.getParameter("redirectMsg");
		}
		catch(Exception e)
		{
			
		}
		%>
			<%
		if(!(redirectMessage==null))
		{
		%>
			<td align="center"><font color="red" size="2"><b><%=redirectMessage%></b></font></td>
			<%
		}
		%>

		</tr>
	</table>

	<form name="customdetail" method="get" action=""
		Onsubmit="return datevalidate()">
		<input type="hidden" name="empname" id="empname" value="<%=empname1%>"></input>

		<table align="center" border="0">
			<tr>
				<td id="statusType"><b>Status : </b> <select name="status"
					id="status"
					style="width: 87px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
						<option value="All">All</option>
						<option value="Checked">Checked</option>
						<option value="Unchecked">Unchecked</option>
						<option value="Forwarded">Forwarded</option>
				</select></td>
				<td></td>
				<td></td>
				<td></td>
				<td id="dispType"><b>Type :</b> <select name="rd" id="rd"
					style="width: 87px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
						<option value="all">All</option>
						<option value="bill">Bill</option>
						<option value="doc">Document</option>
				</select></td>
				<td></td>
				<td>All <input type="checkbox" name="extAll" id="extAll"
					value="yes" onclick="allSelected(this.value);"></input>
				</td>
				<td></td>
				<td id="frmdt" align="left"><b>From&nbsp;&nbsp;</b> <input
					type="text" id="data" name="data" size="12" value="<%=datenew1%>"
					readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data"       // ID of the button
					    }
					  );
				</script></td>

				<td id="todt" align="left"><b>To&nbsp;&nbsp;</b> <input
					type="text" id="data1" name="data1" size="12" value="<%=datenew2%>"
					readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data1",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger1"       // ID of the button
					    }
					  );
				</script></td>

				<td id="saerchbox"><input type="text" name="searchTxt"
					id="searchTxt"
					style="width: 450px; padding: 4px 5px 2px 5px; border: 2px solid #C6DEFF; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif;"
					title="Search Here " /></td>
				<td><input type="submit" name="submit" id="search-submit"
					onclick="return validate();" value="Go"></td>

				<td align="right"></td>
			</tr>

		</table>

	</form>
	<%String exportFileName="InwardReport_Details.xls"; %>
	<% 
		
		if(!(null==datenew1)&&!(null==datenew2))
		{
		try 
		{
		//	session.setAttribute("uname",user);
		//	session.setAttribute("pass",pass);
			System.out.println("========="+user+"======================="+pass+"============="+empname1+"========");
			%>

	<input type="hidden" name="pswd" id="pswd" value="<%=pass%>"></input>

	<form name="inwrdreport" method="post" action="sendIntimation.jsp"
		Onsubmit="return validate()">
		<table width=50% align="right">
			<tr>

				<%--  <td align="right"><input type="hidden" id="tableHTML"
                                        name="tableHTML" value="" /> <input type="hidden" id="fileName"
                                        name="fileName" value="<%= exportFileName%>" /> <a
                                        href="#" style="font-weight: bold; color: black;"
                                        onclick="gotoExcel('mytable', 'tableHTML');"> <img
                                        src="images/excel.jpg" width="15px" height="15px"
                                        style="border-style: none"></img> </a>
                               </td> --%>
			</tr>
		</table>
		<br></br> <br></br>

		<!-- <div id="mytable">
			<div style="overflow:scroll;height:500px;overflow:auto;">
 -->
		<table id="example" class="display"
			style="width: 100%; background: #1582AB;">
			<thead>
				<tr>
					<th width="4%"
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Sn.</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Inward
						Date</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Ref.No.</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Categ</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Subject</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">In/Out</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Files</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">UpdatedDate-Time</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Status</th>
				</tr>
			</thead>




			<%String rsbt="";
			try
			{
				rsbt=request.getParameter("rdbtn");
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		//	  out.println("====================="+rsbt+"============================");
			  %>
			<%
			int i = 1;
			String frm="", sub="", partyRef="", iwdate="",cat="",loc="",fname="",fileLink="",refNo="",stat="",dept="",toemp="",remark="";
			String blno="-",blamt="-",bldate="-",blduedate="-",rRemark="-",fromparty="",UpdatedDateTime;
		//	 String sqlData="select * from t_inwarddetails where ToEmailID like '"+empname+"' and InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"'";
			
			String empNameString="",enteredby = ""; 
			
			DateFormat df1=new SimpleDateFormat("yyyy-MM-dd");
			DateFormat df2=new SimpleDateFormat("dd-MMM-yyyy");				
			
			String entBy ="";	
			String cmpString ="";
			String statusdrp="";
			String selctAllChbx="";
			String drpDwn="";
			String searchKey="";
			
			statusdrp=request.getParameter("status");
			try
			{
				entBy=session.getAttribute("empname").toString();
				cmpString =session.getAttribute("email").toString();
				selctAllChbx=request.getParameter("extAll");
				drpDwn=request.getParameter("rd");
				
			//	System.out.println("STATUS VALUE IS   "+statusdrp);
				
				searchKey=request.getParameter("searchTxt");
			//	System.out.println("KEY VALUE   "+searchKey);
				
				if(selctAllChbx.equals("yes")){}
			}
			catch(Exception e)
			{
				selctAllChbx="No";
				System.out.println(e);
			}
			
			String sqlData="";
				
			try
			{	
				if(selctAllChbx.equals("yes"))
				{
					
					if(statusdrp.equals("All"))
					{
					System.out.println("IN YES and CHECKED  "+statusdrp);
						sqlData="select * from t_inwarddetails where  (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' or Category like '%"+searchKey+"%' or BillNo like '%"+searchKey+"%' or senderRemark like '%"+searchKey+"%' Or Subject like '%"+searchKey+"%' Or InwardDate like '%"+searchKey+"%' Or ManualRef like '%"+searchKey+"%' Or FromParty like '%"+searchKey+"%' Or Dept like '%"+searchKey+"%' Or Keywords like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%')  order by InwardDate asc";
					}
					
					else if(statusdrp.equals("Checked"))
					{
					System.out.println("IN YES and CHECKED  "+statusdrp);
						sqlData="select * from t_inwarddetails where  (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' or Category like '%"+searchKey+"%' or BillNo like '%"+searchKey+"%' or senderRemark like '%"+searchKey+"%' Or Subject like '%"+searchKey+"%' Or InwardDate like '%"+searchKey+"%' Or ManualRef like '%"+searchKey+"%' Or FromParty like '%"+searchKey+"%' Or Dept like '%"+searchKey+"%' Or Keywords like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') and CheckStatus='Checked' order by InwardDate asc";
					}
					else if(statusdrp.equals("Unchecked"))
					{
						System.out.println("IN YES and UNCHECKED  "+statusdrp);
						sqlData="select * from t_inwarddetails where CheckStatus ='Unchecked' and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' or Category like '%"+searchKey+"%' or BillNo like '%"+searchKey+"%' or senderRemark like '%"+searchKey+"%' Or Subject like '%"+searchKey+"%' Or InwardDate like '%"+searchKey+"%' Or ManualRef like '%"+searchKey+"%' Or FromParty like '%"+searchKey+"%' Or Dept like '%"+searchKey+"%' Or Keywords like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%')  order by InwardDate asc";
					}
					else if(statusdrp.equals("Forwarded"))
					{
						System.out.println("IN YES and FORWARDED "+statusdrp);
						sqlData="select * from t_inwarddetails where CheckStatus='Forwarded' and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' or Category like '%"+searchKey+"%' or BillNo like '%"+searchKey+"%' or senderRemark like '%"+searchKey+"%' Or Subject like '%"+searchKey+"%' Or InwardDate like '%"+searchKey+"%' Or ManualRef like '%"+searchKey+"%' Or FromParty like '%"+searchKey+"%' Or Dept like '%"+searchKey+"%' Or Keywords like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%')  order by InwardDate asc";
					}
					
				}
				else
				{
					System.out.println("IN NO NO NO  ");
					if(drpDwn.equals("doc"))
					{
						if(statusdrp.equals("All"))
						{
							System.out.println("IN DOC AND CHECKED  "+statusdrp);		
							sqlData="select * from t_inwarddetails where  (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') and BillAmt='0.00' and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' Or InwardDate like '%"+searchKey+"%' Or ManualRef like '%"+searchKey+"%' Or FromParty like '%"+searchKey+"%' Or Dept like '%"+searchKey+"%' Or Keywords like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') order by InwardDate asc";
						}
						else if(statusdrp.equals("Checked"))
						{
							System.out.println("IN DOC AND CHECKED  "+statusdrp);		
							sqlData="select * from t_inwarddetails where CheckStatus='Checked' and (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') and BillAmt='0.00' and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' Or InwardDate like '%"+searchKey+"%' Or ManualRef like '%"+searchKey+"%' Or FromParty like '%"+searchKey+"%' Or Dept like '%"+searchKey+"%' Or Keywords like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') order by InwardDate asc";
						}
						else if(statusdrp.equals("Unchecked"))
						{
							System.out.println("IN DOC AND UNCHECKED  "+statusdrp);
							sqlData="select * from t_inwarddetails where CheckStatus='Unchecked' and (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') and BillAmt='0.00' and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' Or InwardDate like '%"+searchKey+"%' Or ManualRef like '%"+searchKey+"%' Or FromParty like '%"+searchKey+"%' Or Dept like '%"+searchKey+"%' Or Keywords like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') order by InwardDate asc";
						}
						else if(statusdrp.equals("Forwarded"))
						{
							System.out.println("IN DOC AND FORWARDED  "+statusdrp);
							sqlData="select * from t_inwarddetails where CheckStatus='Forwarded' and (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') and BillAmt='0.00' and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' Or InwardDate like '%"+searchKey+"%' Or ManualRef like '%"+searchKey+"%' Or FromParty like '%"+searchKey+"%' Or Dept like '%"+searchKey+"%' Or Keywords like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') order by InwardDate asc";
						}
										
					}
					else if(drpDwn.equals("bill"))
					{
						if(statusdrp.equals("All"))
						{
							sqlData="select * from t_inwarddetails where (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') and BillAmt<>'0.00' and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' Or InwardDate like '%"+searchKey+"%' Or Subject like '%"+searchKey+"%' or Category like '%"+searchKey+"%' Or InwardDate like '%"+searchKey+"%' Or ManualRef like '%"+searchKey+"%' Or FromParty like '%"+searchKey+"%' Or Dept like '%"+searchKey+"%' Or Keywords like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') order by InwardDate asc";

						}

						else if(statusdrp.equals("Checked"))
						{
							sqlData="select * from t_inwarddetails where CheckStatus='Checked' and  (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') and BillAmt<>'0.00' and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' Or InwardDate like '%"+searchKey+"%' Or Subject like '%"+searchKey+"%' or Category like '%"+searchKey+"%' Or InwardDate like '%"+searchKey+"%' Or ManualRef like '%"+searchKey+"%' Or FromParty like '%"+searchKey+"%' Or Dept like '%"+searchKey+"%' Or Keywords like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') order by InwardDate asc";

						}
						else if(statusdrp.equals("Unchecked"))
						{
							sqlData="select * from t_inwarddetails where CheckStatus='Unchecked' and  (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') and BillAmt<>'0.00' and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and ( Subject like '%"+searchKey+"%' or Category like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') order by InwardDate asc";

						}
						else if(statusdrp.equals("Forwarded"))
						{
							sqlData="select * from t_inwarddetails where CheckStatus='Forwarded' and  (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') and BillAmt<>'0.00' and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (Subject like '%"+searchKey+"%' or Category like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') order by InwardDate asc";

						}
						
					}
					else
					{
						if(statusdrp.equals("All"))
						{
							sqlData="select * from t_inwarddetails where  (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' or Category like '%"+searchKey+"%' or BillNo like '%"+searchKey+"%' or senderRemark like '%"+searchKey+"%' Or Subject like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') order by InwardDate asc";
						}
						else if(statusdrp.equals("Checked"))
						{
							sqlData="select * from t_inwarddetails where CheckStatus='Checked' and (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' or Category like '%"+searchKey+"%' or BillNo like '%"+searchKey+"%' or senderRemark like '%"+searchKey+"%' Or Subject like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') order by InwardDate asc";
						}
						else if(statusdrp.equals("Unchecked"))
						{
							sqlData="select * from t_inwarddetails where CheckStatus='Unchecked' and (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' or Category like '%"+searchKey+"%' or BillNo like '%"+searchKey+"%' or senderRemark like '%"+searchKey+"%' Or Subject like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') order by InwardDate asc";
						}	
						else if(statusdrp.equals("Forwarded"))
						{
							sqlData="select * from t_inwarddetails where CheckStatus='Forwarded' and (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') and (FileName like '%"+searchKey+"%' or Category like '%"+searchKey+"%' or BillNo like '%"+searchKey+"%' or senderRemark like '%"+searchKey+"%' Or Subject like '%"+searchKey+"%' Or BillDate like '%"+searchKey+"%' Or  BillDueDate like '%"+searchKey+"%' Or ToEmploy like '%"+searchKey+"%' Or ToEmailID like '%"+searchKey+"%') order by InwardDate asc";
						}	
					
					}				
				}
			}                
			catch(Exception e)
			{
				System.out.println(e);
				System.out.println("IN CATCH ");
				sqlData="select * from t_inwarddetails where (InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"')  and (Enteredby like '"+session.getAttribute("empname")+"' or ToEmploy like '%"+session.getAttribute("empname")+"%') order by InwardDate asc";
				System.out.println(sqlData);
					}
			System.out.println(sqlData);
			rst=stmt.executeQuery(sqlData);
			while(rst.next())
			{
				
				System.out.println(""+rst.getString("CheckStatus"));
				
				boolean f1=false;
				boolean f2=false;
				empNameString=rst.getString("ToEmailID");
				enteredby=rst.getString("Enteredby");
				fromparty=rst.getString("FromParty");
				//ToEmailID
				//System.out.println(enteredby+"=========="+empNameString);
				//================================================
					String delims12 = "[,]";
    				String[] tokens1 = empNameString.split(delims12);
    				
				for (String t : tokens1)
				{
					System.out.println(t+"   11111   111   111111   "+cmpString);
						if(t.equals(cmpString))
						{
							f1=true;
						}
				}
				System.out.println(enteredby+"    333333333333    "+entBy);
				if(enteredby.equals(entBy))
				{
					//System.out.println("###################");
					f2=true;
				}
				//================================================
				
				
				if(f1==true || f2==true)
				{
				frm=rst.getString("FromParty");
				sub=rst.getString("Subject");
				partyRef=rst.getString("PartyRefNo");
				iwdate=df123.format(df1234.parse(rst.getString("InwardDate")));
				iwdate=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString("InwardDate")+" "+rst.getString("InwardTime")));
				cat=rst.getString("Category");
				if(cat.equals("Bills"))
				{
					blno=rst.getString("BillNo");
					blamt=rst.getString("BillAmt");
					bldate=df2.format(df1.parse(rst.getString("BillDate")));
					blduedate=df2.format(df1.parse(rst.getString("BillDueDate")));
				}
				else
				{
					blno="-";
					blamt="-";
					bldate="-";
					blduedate="-";
				}
				loc=rst.getString("FileLocation");
				fname=rst.getString("FileName");
				refNo=rst.getString("InwardRefNo");
				fileLink="ftp://203.199.134.131/test004/"+fname;
				//*****Status*************************************************************************
				Statement st1=conn.createStatement();
			
				
				//************************************************************************************
				toemp=rst.getString("ToEmploy");
				remark=rst.getString("senderRemark");
				rRemark=rst.getString("receiverRemark");
			
				String abc= "";
				//System.out.println("======"+fname+"====================================================");
				%>
			<tbody>
				<tr>
					<td style="font-size: 11px; face: san-serif; color: black"
						align="right"><%= i%></td>
					<%-- <td align="right" sorttable_customkey="20080211131900"><div><font size="2" color="black"><%= iwdate%></font></div></td> --%>
					<td style="font-size: 11px; face: san-serif; color: black"
						align="right"><%= iwdate%></td>
					<!--	<td align="right" ><div align="right"><font size="2" color="black"><a href="" onclick="showRecvrReport('<%= refNo%>')"/><%= refNo%></font></div>
				</td> -->

					<td style="font-size: 11px; face: san-serif; color: black"
						align="right"><a
						href="javascript:toggleDetails('<%=refNo %>','true','0','<%=i%>')" /><%= refNo%></div>
						<div align="right" class="popup" id="popup<%=i %>">

							<table width="50%" align="right" border=1 bgcolor="#C6DEFF"
								cellpadding="0" cellspacing="0" style="position: absolute;">
								<tr>
									<td><div align="center">
											<a href="Detailsofdoc.jsp?refno=<%=refNo %>" />View Details</a>
										</div></td>
								</tr>
								<tr>
									<td><div align="center">
											<a href="recvrsRemark.jsp?refno=<%=refNo %>" />Receiver's
											Report</a>
										</div></td>
								</tr>
								<!--  <tr><td><div align="center"><a href="addToFolder.jsp?refno=<%=refNo %>" />Add File To Folder</a></div></td></tr> -->
								<tr>
									<td><div align="center">
											<a href="" onclick="sendIntimation('<%= refNo%>')" />Foward</a>
										</div></td>
								</tr>
								<tr>
									<td><div align="center">
											<a href="" onclick="editInward('<%= refNo%>')" />Edit</a>
										</div></td>
								</tr>
								<tr>
									<td><div align="center">
											<a
												href="javascript:toggleDetails('<%= refNo%>','false','3','<%=i%>')" />close</a>
										</div></td>
								</tr>
							</table>
						</div></td>
					<td style="font-size: 11px; face: san-serif; color: black"
						align="right"><%= cat%></td>
					<td style="font-size: 11px; face: san-serif; color: black"
						align="right"><%= sub%></td>

					<%
			//	System.out.println(f1+"====="+f2);
				if(f1==true && f2==false)
				{
					//System.out.println("===1==");
				%>
					<td style="font-size: 11px; face: san-serif; color: black"
						align="left">In</td>
					<%
				}
				else if(f1==false && f2==true)
				{
					//System.out.println("===2==");
				%>
					<td style="font-size: 11px; face: san-serif; color: black"
						align="right">Out</td>
					<%
				}
				else if(f1==true && f2==true)
				{
					//System.out.println("===3==");
				%>
					<td style="font-size: 11px; face: san-serif; color: black"
						align="left">In & Out</td>
					<%
				}
				%>
					<td style="font-size: 11px; face: san-serif; color: black"
						align="left">
						<% 
				String[] tok = fname.split(delims12);
				
				for (String t1 : tok)
				{
					//System.out.println("=======================>>"+t1);
					
				
					
					%> <%-- <a href='#!'
						onclick="getFTPImage('<%=t1%>','<%=refNo%>','<%=empname1%>');">View
							File</a> --%>
							
							<a href="http://twtech.in/TWDOC/<%=t1%>">
                          View File
                        </a>	
							<br></br> <%	
					
				}
				%> <%
				
				//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>File:"+tok[0]);
				String Checkfile="Select * from t_uploadedFiles where FileName='"+tok[0]+"'";
				//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>Checkfile:"+Checkfile);
				ResultSet rscheck=st.executeQuery(Checkfile);
				System.out.println("queryt  "+Checkfile);
				%>
					</td>

					<%
				System.out.println(":::::::::::::::::::::::::::::::::::::::");
				if(rscheck.next())
				{
					
					updatedatetime=rscheck.getString("UpdatedDateTime");
					System.out.println(" update date time  1111  "+updatedatetime);
				%>
					<td style="font-size: 11px; face: san-serif; color: black"
						align="right"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rscheck.getString("UpdatedDateTime"))) %></td>
					<%
				}
				else
				{	
					
					System.out.println("******************************  ***************");
				//updatedatetime=rscheck.getString("UpdatedDateTime");
					System.out.println(" update date time 33333    "+updatedatetime);
				%>
					<td align="right"><div>
							<font size="2" color="black">NA</font>
						</div></td>
					<%
				}
				%>
					<% 
			String sqlstatus="select CheckStatus from t_inwarddetails WHERE InwardRefNo='"+refNo+"' ";
			ResultSet rsstatus=st.executeQuery(sqlstatus);
			System.out.println(sqlstatus);
			if(rsstatus.next())
			{
				checkstatus=rsstatus.getString(1);
				if(checkstatus.equalsIgnoreCase("Checked"))
					checkstatus="Checked";
				else
					checkstatus="Unchecked";
				
				System.out.println("CHECKED STATUS   "+checkstatus);
			%>
					<td style="font-size: 11px; face: san-serif; color: black"
						align="left"><%= checkstatus%></td>
					<%
			}
			%>


				</tr>
			</tbody>
			<input TYPE="hidden" id="rd" name="rd" VALUE="<%=refNo%>" />
			<%
				}
				 i++;
			}
			//System.out.println("==================>>##########"+i);
			%>

			<tfoot>
				<tr>
					<th width="4%"
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Sn.</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Inward
						Date</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Ref.No.</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Categ</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Subject</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">In/Out</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Files</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">UpdatedDate-Time</th>
					<th
						style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Status</th>
				</tr>
			</tfoot>
		</table>
		<!-- </div>  end of div of excel
			</div> -->


		<input type="hidden" name="rdcnt" id="rdcnt" value="<%=i%>"></input> <br><br>

				<%
			String rdBtn=request.getParameter("rd");
			//System.out.println("==================>>"+rdBtn);
			%> <br></br>
	</form>
	</br>
	<div id="footer">
		<p>
			<a href="http://www.myfleetview.com"> Copyright &copy; 2009 by
				Transworld Compressor Technologies Ltd. All Rights Reserved.</a>
		</p>
	</div>

</body>
<% 
	} 
	catch (Exception e) 
	{
			// TODO Auto-generated catch block
		e.printStackTrace();
	} 
	finally
	{
			try
			{
				conn.close();
			}
			catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 }
}
%>
