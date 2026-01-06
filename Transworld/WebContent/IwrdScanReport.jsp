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

<script>
var thumbnail="";
//var thumbnailn="";
function ShowPicture(event,help_id)
{	
	//alert(event+"===="+help_id);
		var mhelp_id=help_id;
		//alert(help_id);
		var ajaxRequest;  // The variable that makes Ajax possible!
		try
		{
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
				//alert(reslt);
	     		document.getElementById("showcontent").innerHTML=reslt;
				document.getElementById("showcontent").style.visibility="visible";
			} 
		}
		var queryString = "?help_id=" +mhelp_id;
		
		ajaxRequest.open("GET", "testTab.jsp" + queryString, true);
		ajaxRequest.send(null); 
}
function thumbNail(list,thumbnailn)
{
	//alert(list+"======"+thumbnailn);
	var mhelp_id=list;
	var ajaxRequest;  // The variable that makes Ajax possible!
	try
	{
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
				//alert(reslt);
				var mySplitResult = reslt.split("$");
				var ajxRes1=mySplitResult[0];
				var ajxRes2=mySplitResult[1];
				var ajxRes3=mySplitResult[2];

				//alert(ajxRes3);
				//alert(ajxRes3.trim() == "Inwarded");
				
				if(ajxRes3.trim() == "Inwarded")
				{
					alert("These documents already has been inwarded!");
					location = "IwrdScanReport.jsp";
					//assignAjxResult(ajxRes1,ajxRes2);	     		
					//document.getElementById("showcontent").style.visibility="visible";
					
				}if(ajxRes3.trim() == "Uploaded")
				{
					assignAjxResult(ajxRes1,ajxRes2);	     		
					document.getElementById("showcontent").style.visibility="visible";
				}	
				
		}
	}
	var queryString = "?list="+list+"&thumbnailn="+thumbnailn;
	try
	{
		ajaxRequest.open("GET", "testTab.jsp" + queryString, true);
		ajaxRequest.send(null);
	} 
	catch (e) 
	{
		alert(e);
	}
}
function assignAjxResult(res1,res2)
{
	thumbnail=res2;
	document.getElementById("showcontent").innerHTML=res1;
	document.getElementById("serialSelected").value=res2;
}
function GetFiles(file,i)
{
	//alert(i);
	var thumbnailn="";
	//alert("===get Files======");
	
	if((document.getElementById("cb"+i).checked)==true)
	{
		//alert("chkd");
		if(thumbnail=="")
		{
			thumbnail=file;
		}
		else
		{
			thumbnail=thumbnail+","+file;
		}
	}

	if((document.getElementById("cb"+i).checked)==false)
	{
		//alert("UNchkd");
		if(thumbnailn=="")
		{
			thumbnailn=file;
		}
		else
		{
			thumbnailn=thumbnailn+","+file;
		}
	}
	thumbNail(thumbnail,thumbnailn);
}
function validate(form)
{
	  var total=0;
	  var cnt=document.getElementById("chbxCnt").value;
	  for(var i=0; i < cnt; i++)
	  {
		 try
		 {
		    if((document.getElementById("cb"+i).checked)==true) 
			{
		      total++;
		    }
		 }
		 catch(e)
		 {
		 }
	  }
	  if( total == 0 ) 
	  {
		alert("Please Select Document For Inward");
	    return false;
	  } 
	  return true;
}
function getFTPImage(ftpFile)
{
	
	try
	{
	 window.open('showFTPNew.jsp?ftpFile='+escape(ftpFile)+'','mywindow','width=700, height=700, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes'); 
		
	} 
	catch(e)
	{
		alert(e);
	}
} 

function invalid(fname,id)
{
	//alert("IN ");
	//var mhelp_id=list;
	var filename=fname;
	//alert(filename);
	var idnew=id;
	//alert(idnew);
	var ajaxRequest;  // The variable that makes Ajax possible!
	try
	{
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
		alert("File Status Updated.");
		reload();
		} 
	}
	var queryString = "?fname="+filename+"&id="+id;
	try
	{
		ajaxRequest.open("GET", "ValidandDuplicateDocs.jsp" + queryString, true);
		ajaxRequest.send(null);
	} 
	catch (e) 
	{
		alert(e);
	}

}

function duplicate(fname,id)
{
	//alert("IN ");
	//var mhelp_id=list;
	var filename=fname;
	//alert(filename);
	var idnew=id;
	//alert(idnew);
	var ajaxRequest;  // The variable that makes Ajax possible!
	try
	{
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
			alert("File Status Updated.");
			reload();
		} 
	}
	var queryString = "?fname="+filename+"&id="+id;
	try
	{
		ajaxRequest.open("GET", "ValidandDuplicateDocs.jsp" + queryString, true);
		ajaxRequest.send(null);
	} 
	catch (e) 
	{
		alert(e);
	}
}



function reload()
{
	window.location.reload();
}

function invaliddocs()
{
	window.open('invaliddocsreport.jsp?validity=invalid','mywindow','width=400, height=500, resizable=yes, scrollbars=yes');
}

function duplicatedocs()
{
	window.open('invaliddocsreport.jsp?validity=duplicate','mywindow','width=400, height=500, resizable=yes, scrollbars=yes');

}
function display(file)
{
	//alert("hiii");
	var filename=file;

	window.open('http://twtech.in/TWDOC/'+filename+'','mywindow','width=400, height=500, resizable=yes, scrollbars=yes');

}
</script>
</head>

<body>
	<%
		Statement stmt=null,st1=null;
		String sql=null;
		ResultSet rst=null;
		stmt=conn.createStatement();
		st1=conn.createStatement();
		
		int cnt=0;
%>
	<%
String datenew1="";
String datenew2="";
if(request.getParameter("data")!=null)
{
  datenew1=request.getParameter("data");
  datenew2=request.getParameter("data1");
}
else
{
	datenew1=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date(System.currentTimeMillis()-7*24*60*60*1000));
	datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
}
%>
	<% 
		DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		String dataDate1="";
		String dataDate2="";
		String fname="";
		int srno=0;
		int sn=1;
		try
		{
			dataDate1=df1234.format(df123.parse(datenew1));
			dataDate2=df1234.format(df123.parse(datenew2));
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
%>

	<table align="center">
		<tr>
			<td align="center"><font size="3" color="#151B54"><b>Uploaded
						Documents </b></font></td>
		</tr>

	</table>
	<form name="customdetail" method="get" action="">
		<table align="center">
			<tr>
				<td id="frmDT" align="left" style="display: ''"><b>From&nbsp;&nbsp;</b>
					<input type="text" id="data" name="data" size="12"
					value="<%=datenew1%>"
					style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
					readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data"       // ID of the button
					    }
					  );
				</script></td>

				<td id="toDT" align="left" style="display: ''"><b>To&nbsp;&nbsp;</b>
					<input type="text" id="data1" name="data1" size="12"
					value="<%=datenew2%>"
					style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
					readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data1",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger1"       // ID of the button
					    }
					  );
				</script>&nbsp;&nbsp;&nbsp;</td>
				<td><input type="submit" name="submit" id="search-submit"
					onclick="" value="Go"></td>
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
				<td><a href="#" style="color: red;" onclick="invaliddocs();" />Invalid
					Doc Report</a></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="#" style="color: blue;" onclick="duplicatedocs();" />Duplicate
					Doc Report</a></td>
			</tr>
		</table>
	</form>

	<form action="InwardScanSelected.jsp" method="post">
		<input type="hidden" id="serialSelected" name="serialSelected"
			value="">
		<%
int i=0;
try
{
	//System.out.println(">>>>>>>>>>>>"+request.getQueryString().toString());
	System.out.println(dataDate1+"*******************"+dataDate2);
	String sql1="select count(*) as cnt1 from t_uploadedFiles where FileStatus='uploaded' ";
	ResultSet rs=st1.executeQuery(sql1);
	if(rs.next())
	{
		cnt=rs.getInt("cnt1");
	}
}
catch(Exception e)
{
	System.out.println("Thumbnail 1  Exception======>>"+e);
}
%>

		<div id="showlist"
			style="margin-left: 3%; margin-top: 3%; height: 90%; width: 55%; overflow: auto; position: absolute; border-radius: 12px 12px 12px 12px;">


			<table bgcolor="white" align="center" class="sortable"
				style="width: 50%;">
				<tr>
					<td style="width: 2px; background-color: #C6DEFF;" align="center"></td>
					<td style="width: 5px; background-color: #C6DEFF;" align="center"><font
						size="2" color="black"><b>Sr.</b></font></td>
					<td style="width: 5px; background-color: #C6DEFF;" align="center"><font
						size="2" color="black"><b>File Name</b></font></td>
					<td style="width: 5px; background-color: #C6DEFF;" align="center"><font
						size="2" color="black"><b>Upload Date</b></font></td>
					<td style="width: 5px; background-color: #C6DEFF;" align="center"><font
						size="2" color="black"><b>Uploaded By</b></font></td>
					<td style="width: 5px; background-color: #C6DEFF;" align="center"><font
						size="2" color="black"><b>Mark As</b></font></td>
				</tr>
				<%
int trcnt=0;

try
{
	System.out.println(dataDate1+"***********************************************"+dataDate2);
	DateFormat d1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	DateFormat d2=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
	
	String sqlData="";
	try
	{
		System.out.println(">>>>>>>>>>>>"+request.getQueryString().toString());
		sqlData="select * from t_uploadedFiles where FileStatus='uploaded' and UpdatedDateTime>='"+dataDate1+" 00:00:00' and UpdatedDateTime<='"+dataDate2+" 23:59:59' order by UpdatedDateTime asc";
	}
	catch(Exception e)
	{
		sqlData="select * from t_uploadedFiles where FileStatus='uploaded' and UpdatedDateTime>='"+dataDate1+" 00:00:00' and UpdatedDateTime<='"+dataDate2+" 23:59:59' order by UpdatedDateTime asc";
	}
		
	ResultSet rs1=st1.executeQuery(sqlData);
	while(rs1.next())
	{
		
		fname=rs1.getString("FileName");
		srno=rs1.getInt("SrNo");
		%>
				<tr>
					<td align="center"><input type="checkbox" name="cb<%=i%>"
						id="cb<%=i%>" value="<%=rs1.getInt("SrNo")%>"
						onclick="GetFiles('<%=rs1.getInt("SrNo")%>','<%=i %>');"></input></td>
					<td align="right"><div align="right">
							<font size="2" color="black"><%=sn++%></font>
						</div></td>
					<td align="left"><div align="left">
							<font size="2" color="black">
<%-- 							<a href="http://twtech.in/TWDOC/<%=rs1.getString("FileName")%>"><%=rs1.getString("FileName")%></a></font></a>
 --%>                      <a href="#" onclick="display('<%=rs1.getString("FileName")%>')"><%=rs1.getString("FileName")%></a></font>
						
						</div></td>


					<td align="right" sorttable_customkey="20080211131900"><div
							align="right">
							<font size="2" color="black"><%=d2.format(d1.parse(rs1.getString("UpdatedDateTime")))%></font>
						</div></td>
					<td align="left"><div align="left">
							<font size="2" color="black"><%=rs1.getString("UploadedBy").toString()%></font>
						</div></td>
					<td align="left"><a href="#"
						onclick="invalid('<%=fname %>','1')"><font color="red">Invalid</font></a>
						/ <a href="#" onclick="duplicate('<%=fname %>','2')"><font
							color="blue">Duplicate</a></td>


				</tr>
				<%
		i++;
	}
	%>

				<input type="hidden" name="chbxCnt" id="chbxCnt" value="<%=i %>" />
				<input type="hidden" name="filename" id="filename"
					value="<%=fname%>" />
				<%
}
catch(Exception e)
{
	System.out.println("Thumbnail Exception======>>"+e);	
}

%>

			</table>


		</div>
		<table align="left">
			<tr>
				<td align="left"><div style="margin-left: 2%;">
						<input type="submit" id="submitButton1" value="Send"
							onclick="return validate(this.form);">
					</div></td>

				<td align="right"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%
String pendCnt="";
String sqlPending="select count(*) as Pend from t_uploadedFiles where FileStatus='uploaded'";
ResultSet rsPending=st1.executeQuery(sqlPending);
if(rsPending.next())
{
	pendCnt=rsPending.getString("Pend");
}
%> Total Pending Document : <%= pendCnt%>
				</b></td>
				<td align="right"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%
String pendCnt1="";
String sqlPending1="select count(*) as Pend from t_uploadedFiles where FileStatus='uploaded' and UpdatedDateTime>='"+dataDate1+" 00:00:00' and UpdatedDateTime<='"+dataDate2+" 23:59:59'";
System.out.println(sqlPending1);
ResultSet rsPending1=st1.executeQuery(sqlPending1);
if(rsPending1.next())
{
	pendCnt1=rsPending1.getString("Pend");
}
%> Pending Document In Selected Date Range : <%= pendCnt1%>
				</b></td>
			</tr>
			<tr>




			</tr>

			<input type="hidden" name="chbx" id="chbx" value="<%=i%>"></input>
			<input type="hidden" name="recordCnt" id="recordCnt" value="<%=cnt%>"></input>
		</table>
		<div id="showcontent"
			style="margin-left: 50%; margin-top: 4%; height: 90%; width: 40%; overflow: auto; position: absolute; border-radius: 12px 12px 12px 12px;">
		</div>
		<script>document.getElementById("showcontent").style.visibility="hidden";</script>
	</form>
</body>
</html>
