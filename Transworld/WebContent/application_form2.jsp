<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" errorPage=""%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Personal Details</title>
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />
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

<script type="text/javascript">
function selecteducation()
{
	//alert("in education");
	var edu=document.application2.edu_level.value;
	  if(edu=="Select")
	    {
		  document.getElementById("tredu1").style.display="none";
	    	 document.getElementById("tredu2").style.display="none";
	    	 document.getElementById("tredu3").style.display="none";
	    	 document.getElementById("tredu4").style.display="none";
	    	 document.getElementById("tredu5").style.display="none";
	    	 document.getElementById("tredu6").style.display="none";
	    	 document.getElementById("tredu7").style.display="none";
	    	 document.getElementById("tredu8").style.display="none";
	 

		    
	    }else if(edu=="Under Graduate")
         {
    	 document.getElementById("tredu1").style.display="";
    	 document.getElementById("tredu2").style.display="";
    	 document.getElementById("tredu3").style.display="";
    	 document.getElementById("tredu4").style.display="";
    	 document.getElementById("tredu5").style.display="none";
    	 document.getElementById("tredu6").style.display="none";
    	 document.getElementById("tredu7").style.display="none";
    	 document.getElementById("tredu8").style.display="none";
      }
    else if(edu=="Graduate")
    {
    	 document.getElementById("tredu1").style.display="";
    	 document.getElementById("tredu2").style.display="";
    	 document.getElementById("tredu3").style.display="";
    	 document.getElementById("tredu4").style.display="";
    	 document.getElementById("tredu5").style.display="";
    	 document.getElementById("tredu6").style.display="";
    	 document.getElementById("tredu7").style.display="none";
    	 document.getElementById("tredu8").style.display="none";
      }
    else
    {
    	 document.getElementById("tredu1").style.display="";
    	 document.getElementById("tredu2").style.display="";
    	 document.getElementById("tredu3").style.display="";
    	 document.getElementById("tredu4").style.display="";
    	 document.getElementById("tredu5").style.display="";
    	 document.getElementById("tredu6").style.display="";
    	 document.getElementById("tredu7").style.display="";
    	 document.getElementById("tredu8").style.display="";
           
    }
	
	//alert(edu);
}

function selectqua(type)
{
	
	  if(type=="Yes")
	    {
		   // alert("yes........");

			  document.getElementById("tredu11").style.display="";
			  document.getElementById("tredu12").style.display="";
		    
	    }
	  if(type=="No")
	    {
		  document.getElementById("tredu11").style.display="none";
		  document.getElementById("tredu12").style.display="none";
		  
		  document.getElementById("tredu13").style.display="none";
		  document.getElementById("tredu14").style.display="none";

		  document.getElementById("tredu15").style.display="none";
		  document.getElementById("tredu16").style.display="none";

		  document.getElementById("tredu17").style.display="none";
		  document.getElementById("tredu18").style.display="none";

		  document.getElementById("tredu19").style.display="none";
		  document.getElementById("tredu20").style.display="none";

		  document.getElementById("tredu21").style.display="none";
		  document.getElementById("tredu22").style.display="none";
		  document.getElementById("tredu23").style.display="none";
		  document.getElementById("tredu24").style.display="none";

		  document.getElementById("tredu25").style.display="none";
		  document.getElementById("tredu26").style.display="none";

		  document.getElementById("tredu27").style.display="none";
		  document.getElementById("tredu28").style.display="none";

		  document.getElementById("tredu29").style.display="none";
		  document.getElementById("tredu30").style.display="none";
	    
	    
	    
	    }
	
}
function addmore1()
{
	document.getElementById("tredu12").style.display="none";
	  document.getElementById("tredu13").style.display="";
	  document.getElementById("tredu14").style.display="";

}
function addmore2()
{
	document.getElementById("tredu14").style.display="none";
	  document.getElementById("tredu15").style.display="";
	  document.getElementById("tredu16").style.display="";

}
function addmore3()
{
	document.getElementById("tredu16").style.display="none";
	  document.getElementById("tredu17").style.display="";
	  document.getElementById("tredu18").style.display="";

}
function addmore4()
{
	document.getElementById("tredu18").style.display="none";
	  document.getElementById("tredu19").style.display="";
	  document.getElementById("tredu20").style.display="";

}
function addmore5()
{
	document.getElementById("tredu20").style.display="none";
	  document.getElementById("tredu21").style.display="";
	  document.getElementById("tredu22").style.display="";

}
function addmore6()
{
	document.getElementById("tredu22").style.display="none";
	  document.getElementById("tredu23").style.display="";
	  document.getElementById("tredu24").style.display="";

}
function addmore7()
{
	document.getElementById("tredu24").style.display="none";
	  document.getElementById("tredu25").style.display="";
	  document.getElementById("tredu26").style.display="";

}
function addmore8()
{
	document.getElementById("tredu26").style.display="none";
	  document.getElementById("tredu27").style.display="";
	  document.getElementById("tredu28").style.display="";

}
function addmore9()
{
	document.getElementById("tredu28").style.display="none";
	  document.getElementById("tredu29").style.display="";
	  document.getElementById("tredu30").style.display="";

}

function selectwork(type)
{
	//alert(type);
	  if(type=="Yes")
	    {
		   // alert("yes........");

			  document.getElementById("trwork11").style.display="";
			  document.getElementById("trwork12").style.display="";
		    
	    }
	  if(type=="No")
	    {
		  document.getElementById("trwork11").style.display="none";
		  document.getElementById("trwork12").style.display="none";
		  
		  document.getElementById("trwork13").style.display="none";
		  document.getElementById("trwork14").style.display="none";

		  document.getElementById("trwork15").style.display="none";
		  document.getElementById("trwork16").style.display="none";

		  document.getElementById("trwork17").style.display="none";
		  document.getElementById("trwork18").style.display="none";

		  document.getElementById("trwork19").style.display="none";
		  document.getElementById("trwork20").style.display="none";

		  document.getElementById("trwork21").style.display="none";
		  document.getElementById("trwork22").style.display="none";
		  document.getElementById("trwork23").style.display="none";
		  document.getElementById("trwork24").style.display="none";

		  document.getElementById("trwork25").style.display="none";
		  document.getElementById("trwork26").style.display="none";

		  document.getElementById("trwork27").style.display="none";
		  document.getElementById("trwork28").style.display="none";

		  document.getElementById("trwork29").style.display="none";
		  document.getElementById("trwork30").style.display="none";
	    
	    
	    
	    }
	
}
function addmore11()
{
	document.getElementById("trwork12").style.display="none";
	  document.getElementById("trwork13").style.display="";
	  document.getElementById("trwork14").style.display="";

}
function addmore12()
{
	document.getElementById("trwork14").style.display="none";
	  document.getElementById("trwork15").style.display="";
	  document.getElementById("trwork16").style.display="";

}
function addmore13()
{
	document.getElementById("trwork16").style.display="none";
	  document.getElementById("trwork17").style.display="";
	  document.getElementById("trwork18").style.display="";

}
function addmore14()
{
	document.getElementById("trwork18").style.display="none";
	  document.getElementById("trwork19").style.display="";
	  document.getElementById("trwork20").style.display="";

}
function addmore15()
{
	document.getElementById("trwork20").style.display="none";
	  document.getElementById("trwork21").style.display="";
	  document.getElementById("trwork22").style.display="";

}
function addmore16()
{
	document.getElementById("trwork22").style.display="none";
	  document.getElementById("trwork23").style.display="";
	  document.getElementById("trwork24").style.display="";

}
function addmore17()
{
	document.getElementById("trwork24").style.display="none";
	  document.getElementById("trwork25").style.display="";
	  document.getElementById("trwork26").style.display="";

}
function addmore18()
{
	document.getElementById("trwork26").style.display="none";
	  document.getElementById("trwork27").style.display="";
	  document.getElementById("trwork28").style.display="";

}
function addmore19()
{
	document.getElementById("trwork28").style.display="none";
	  document.getElementById("trwork29").style.display="";
	  document.getElementById("trwork30").style.display="";
}

function validateForm() 
{	

var Qual= document.getElementById("edu_level").options[document.getElementById("edu_level").selectedIndex].value;
 		if(Qual=="Select")
 		{
 	 		alert("Please select an Education!");
 	 		return false;
 		}

 		else if(Qual=="Under Graduate")
 		{
 			var s_board = document.application2.s_board.value;
 			var invalid=/[^A-Za-z\s]/;
 			if(s_board=="") {
					alert("Enter your S.S.C Board!");
					return false;
 	 		}
	 		if(invalid.test(s_board)) {
					alert("Enter valid S.S.C Board Name!");
					return false;
		 	}
	 		var s_year = document.application2.s_year.value;
	 		var invalid = /[^0-9]/;
	 		if(s_year=="") {
				alert("Enter your S.S.C Year!");
				return false;
	 		}
	 		if(invalid.test(s_year)) {
				alert("Enter valid S.S.C Year!");
				return false;
	 		}
	 		if(s_year.length<4 || s_year.length>4){ 
	 			alert("Year must be in 4 digits !");
	 			return false;
	 		}
 			var s_marks = document.application2.s_marks.value;
				if(s_marks=="") {
				alert("Enter your S.S.C Percentage!");
				return false;
	 		}

		 		
				if(s_marks.indexOf(".") != -1)
	 			{
	 			if(!/\.[0-9]{1,2}$/.test(s_marks))
	 			{
	 			alert("S.S.C percentage should be two fractional positions required");
	 			return false;
	 			}
	 			} 
	 		//validation for hsc
 			var h_board = document.application2.h_board.value;
 			var invalid=/[^A-Za-z\s]/;
 			if(h_board=="") {
					alert("Enter your H.S.C Board!");
					return false;
 	 		}
	 		if(invalid.test(h_board)) {
					alert("Enter valid H.S.C Board Name!");
					return false;
		 	}
	 		var h_year = document.application2.h_year.value;
	 		var invalid = /[^0-9]/;
	 		if(h_year=="") {
				alert("Enter your H.S.C Year!");
				return false;
	 		}
	 		if(invalid.test(h_year)) {
				alert("Enter valid H.S.C Year!");
				return false;
	 		}
	 		if(h_year.length<4 || h_year.length>4){ 
	 			alert("Year must be in 4 digits !");
	 			return false;
	 		}
	 		var h_spe = document.application2.h_spe.value;
	 		var invalid=/[^A-Za-z\s]/;
 			if(h_spe=="") {
				alert("Enter your H.S.C Specialization!");
				return false;
	 			}
 			if(invalid.test(h_spe)) {
				alert("Enter valid H.S.C specialization!");
				return false;
	 		}
 			var h_marks = document.application2.h_marks.value;
 			if(h_marks=="") {
				alert("Enter your H.S.C Percentage!");
				return false;
	 		}
 			if(h_marks.indexOf(".") != -1)
 			{
 			if(!/\.[0-9]{1,2}$/.test(h_marks))
 			{
 			alert("H.S.C percentage should be two fractional positions required");
 			return false;
 			}
 			}
 		}
 		else if(Qual=="Graduate")
 		{
 			var s_board = document.application2.s_board.value;
 			var invalid=/[^A-Za-z\s]/;
 			if(s_board=="") {
					alert("Enter your S.S.C Board!");
					return false;
 	 		}
	 		if(invalid.test(s_board)) {
					alert("Enter valid S.S.C Board Name!");
					return false;
		 	}
	 		var s_year = document.application2.s_year.value;
	 		var invalid = /[^0-9]/;
	 		if(s_year=="") {
				alert("Enter your S.S.C Year!");
				return false;
	 		}
	 		if(invalid.test(s_year)) {
				alert("Enter valid S.S.C Year!");
				return false;
	 		}
	 		if(s_year.length<4 || s_year.length>4){ 
	 			alert("Year must be in 4 digits !");
	 			return false;
	 		}
 			var s_marks = document.application2.s_marks.value;
 			if(s_marks=="") {
				alert("Enter your S.S.C Percentage!");
				return false;
	 		}
 			if(s_marks.indexOf(".") != -1)
 			{
 			if(!/\.[0-9]{1,2}$/.test(s_marks))
 			{
 			alert("S.S.C percentage should be two fractional positions required");
 			return false;
 			}
 			}
	 		//validation for hsc
 			var h_board = document.application2.h_board.value;
 			var invalid=/[^A-Za-z\s]/;
 			if(h_board=="") {
					alert("Enter your Graduation Board!");
					return false;
 	 		}
	 		if(invalid.test(h_board)) {
					alert("Enter valid H.S.C Board Name!");
					return false;
		 	}
	 		var h_year = document.application2.h_year.value;
	 		var invalid = /[^0-9]/;
	 		if(h_year=="") {
				alert("Enter your H.S.C Year!");
				return false;
	 		}
	 		if(invalid.test(h_year)) {
				alert("Enter valid H.S.C Year!");
				return false;
	 		}
	 		if(h_year.length<4 || h_year.length>4){ 
	 			alert("Year must be in 4 digits !");
	 			return false;
	 		}
	 		var h_spe = document.application2.h_spe.value;
	 		var invalid=/[^A-Za-z\s]/;
 			if(h_spe=="") {
				alert("Enter your H.S.C Specialization!");
				return false;
	 			}
 			if(invalid.test(h_spe)) {
				alert("Enter valid H.S.C specialization!");
				return false;
	 		}
 			var h_marks = document.application2.h_marks.value;
 			if(h_marks=="") {
				alert("Enter your H.S.C Percentage!");
				return false;
	 		}
 			if(h_marks.indexOf(".") != -1)
 			{
 			if(!/\.[0-9]{1,2}$/.test(h_marks))
 			{
 			alert("H.S.C percentage should be two fractional positions required");
 			return false;
 			}
 			}

	 		//for graduation
 			var g_board = document.application2.g_board.value;
 			var invalid=/[^A-Za-z\s]/;
 			if(g_board=="") {
					alert("Enter your Graduation Board!");
					return false;
 	 		}
 			if(invalid.test(g_board)) {
				alert("Enter valid Graduation Board Name!");
				return false;
	 	}
 			var g_year = document.application2.g_year.value;
	 		var invalid = /[^0-9]/;
	 		if(g_year=="") {
				alert("Enter your Graduation Year!");
				return false;
	 		}
	 		if(invalid.test(g_year)) {
				alert("Enter valid Graduation Year!");
				return false;
	 		}
	 		if(g_year.length<4 || g_year.length>4){ 
	 			alert("Year must be in 4 digits !");
	 			return false;
	 		}
	 		var g_spe = document.application2.g_spe.value;
	 		var invalid=/[^A-Za-z\s]/;
 			if(g_spe=="") {
				alert("Enter your Graduation Specialization!");
				return false;
	 			}
 			if(invalid.test(g_spe)) {
				alert("Enter valid Graduation specialization!");
				return false;
	 		}
 			var g_marks = document.application2.g_marks.value;
 			if(g_marks=="") {
				alert("Enter your Graduation Percentage!");
				return false;
	 		}
 			if(g_marks.indexOf(".") != -1)
 			{
 			if(!/\.[0-9]{1,2}$/.test(g_marks))
 			{
 			alert("Graduation percentage should be two fractional positions required");
 			return false;
 			}
 			}
 			

 		}


 		//validation for post graduation
 		
 		else if(Qual=="Post Graduate")
 		{
 			var s_board = document.application2.s_board.value;
 			var invalid=/[^A-Za-z\s]/;
 			if(s_board=="") {
					alert("Enter your S.S.C Board!");
					return false;
 	 		}
	 		if(invalid.test(s_board)) {
					alert("Enter valid S.S.C Board Name!");
					return false;
		 	}
	 		var s_year = document.application2.s_year.value;
	 		var invalid = /[^0-9]/;
	 		if(s_year=="") {
				alert("Enter your S.S.C Year!");
				return false;
	 		}
	 		if(invalid.test(s_year)) {
				alert("Enter valid S.S.C Year!");
				return false;
	 		}
	 		if(s_year.length<4 || s_year.length>4){ 
	 			alert("Year must be in 4 digits !");
	 			return false;
	 		}
 			var s_marks = document.application2.s_marks.value;
 			if(s_marks=="") {
				alert("Enter your S.S.C Percentage!");
				return false;
	 		}
 			if(s_marks.indexOf(".") != -1)
 			{
 			if(!/\.[0-9]{1,2}$/.test(s_marks))
 			{
 			alert("S.S.C percentage should be two fractional positions required");
 			return false;
 			}
 			}
	 		//validation for hsc
 			var h_board = document.application2.h_board.value;
 			var invalid=/[^A-Za-z\s]/;
 			if(h_board=="") {
					alert("Enter your Graduation Board!");
					return false;
 	 		}
	 		if(invalid.test(h_board)) {
					alert("Enter valid H.S.C Board Name!");
					return false;
		 	}
	 		var h_year = document.application2.h_year.value;
	 		var invalid = /[^0-9]/;
	 		if(h_year=="") {
				alert("Enter your H.S.C Year!");
				return false;
	 		}
	 		if(invalid.test(h_year)) {
				alert("Enter valid H.S.C Year!");
				return false;
	 		}
	 		if(h_year.length<4 || h_year.length>4){ 
	 			alert("Year must be in 4 digits !");
	 			return false;
	 		}
	 		var h_spe = document.application2.h_spe.value;
	 		var invalid=/[^A-Za-z\s]/;
 			if(h_spe=="") {
				alert("Enter your H.S.C Specialization!");
				return false;
	 			}
 			if(invalid.test(h_spe)) {
				alert("Enter valid H.S.C specialization!");
				return false;
	 		}
 			var h_marks = document.application2.h_marks.value;
 			if(h_marks=="") {
				alert("Enter your H.S.C Percentage!");
				return false;
	 		}
 			if(h_marks.indexOf(".") != -1)
 			{
 			if(!/\.[0-9]{1,2}$/.test(h_marks))
 			{
 			alert("H.S.C percentage should be two fractional positions required");
 			return false;
 			}
 			}

	 		//for graduation
 			var g_board = document.application2.g_board.value;
 			var invalid=/[^A-Za-z\s]/;
 			if(g_board=="") {
					alert("Enter your Graduation Board!");
					return false;
 	 		}
 			var g_year = document.application2.g_year.value;
	 		var invalid = /[^0-9][^.][^0-9]{^2}$/;
	 		if(g_year=="") {
				alert("Enter your Graduation Year!");
				return false;
	 		}
	 		if(invalid.test(g_year)) {
				alert("Enter valid Graduation Year!");
				return false;
	 		}
	 		if(g_year.length<4 || g_year.length>4){ 
	 			alert("Year must be in 4 digits !");
	 			return false;
	 		}
	 		var g_spe = document.application2.g_spe.value;
	 		var invalid=/[^A-Za-z\s]/;
 			if(g_spe=="") {
				alert("Enter your Graduation Specialization!");
				return false;
	 			}
 			if(invalid.test(g_spe)) {
				alert("Enter valid Graduation specialization!");
				return false;
	 		}
 			var g_marks = document.application2.g_marks.value;
 			if(g_marks=="") {
				alert("Enter your Graduation Percentage!");
				return false;
	 		}
 			if(g_marks.indexOf(".") != -1)
 			{
 			if(!/\.[0-9]{1,2}$/.test(g_marks))
 			{
 			alert("Graduation percentage should be two fractional positions required");
 			return false;
 			}
 			}

 			//post graduation

 			var p_board = document.application2.p_board.value;
 			var invalid=/[^A-Za-z\s]/;
 			if(p_board=="") {
					alert("Enter your Post Graduation Board!");
					return false;
 	 		}
 			var p_year = document.application2.p_year.value;
	 		var invalid = /[^0-9]/;
	 		if(p_year=="") {
				alert("Enter your Post Graduation Year!");
				return false;
	 		}
	 		if(invalid.test(p_year)) {
				alert("Enter valid Post Graduation Year!");
				return false;
	 		}
	 		if(p_year.length<4 || p_year.length>4){ 
	 			alert("Year must be in 4 digits !");
	 			return false;
	 		}
	 		var p_spe = document.application2.p_spe.value;
	 		var invalid=/[^A-Za-z\s]/;
 			if(p_spe=="") {
				alert("Enter your Post Graduation Specialization!");
				return false;
	 			}
 			if(invalid.test(p_spe)) {
				alert("Enter valid Post Graduation specialization!");
				return false;
	 		}
 			var p_marks = document.application2.p_marks.value;
 			if(p_marks=="") {
				alert("Enter your Post Graduation Percentage!");
				return false;
	 		}
 			if(p_marks.indexOf(".") != -1)
 			{
 			if(!/\.[0-9]{1,2}$/.test(p_marks))
 			{
 			alert("{Post Graduation percentage should be two fractional positions required");
 			return false;
 			}
 			}
 		}
if(document.getElementById("tredu11").style.display=="") 
 {
 	var inst1 = document.application2.inst1.value;
 	if(inst1=="") {
	alert("Enter your Institute Name!");
	return false;
 	}
	var year1 = document.application2.year1.value;
	var invalid = /[^0-9]/;
	if(year1=="") {
	alert("Enter your Additional Qualification Year!");
	return false;
	}
	if(invalid.test(year1)) {
	alert("Enter valid Additional Qualification Year!");
	return false;
	 }
	if(year1.length<4 || year1.length>4){ 
	alert("Additional Qualification Year must be in 4 digits !");
	return false;
	}
	var spe1 = document.application2.spe1.value;
	var invalid=/[^A-Za-z\s]/;
	
	if(spe1=="") {
		alert("Enter your Specialisation!");
		return false;
	 	}
	if(invalid.test(spe1)) {
		alert("Enter valid Additional Qualification Specialisation!");
		return false;
		 }
	var marks1 = document.application2.marks1.value;
	if(marks1=="") {
	alert("Enter your Additional Qualification marks or grade!");
	return false;
	 }
}

if(document.getElementById("tredu13").style.display=="") 
{
	var inst2 = document.application2.inst2.value;
	if(inst2=="") {
	alert("Enter your 2nd Institute Name!");
	return false;
	}
	var year2 = document.application2.year2.value;
	var invalid = /[^0-9]/;
	if(year2=="") {
	alert("Enter your 2nd Additional Qualification Year!");
	return false;
	}
	if(invalid.test(year2)) {
	alert("Enter valid 2nd Additional Qualification Year!");
	return false;
	 }
	if(year2.length<4 || year2.length>4){ 
	alert("2nd Additional Qualification Year must be in 4 digits !");
	return false;
	}
	var spe2 = document.application2.spe2.value;
	var invalid=/[^A-Za-z\s]/;
	
	if(spe2=="") {
		alert("Enter your Specialisation of 2nd additional qualification!");
		return false;
	 	}
	if(invalid.test(spe2)) {
		alert("Enter valid 2nd Additional Qualification Specialisation!");
		return false;
		 }
	var marks2 = document.application2.marks2.value;
	if(marks2=="") {
	alert("Enter your 2nd Additional Qualification marks or grade!");
	return false;
	 }
}

if(document.getElementById("tredu15").style.display=="") 
{
	var inst3 = document.application2.inst3.value;
	if(inst3=="") {
	alert("Enter your 3rd Institute Name!");
	return false;
	}
	var year3 = document.application2.year3.value;
	var invalid = /[^0-9]/;
	if(year3=="") {
	alert("Enter your 3rd Additional Qualification Year!");
	return false;
	}
	if(invalid.test(year3)) {
	alert("Enter valid 3rd Additional Qualification Year!");
	return false;
	 }
	if(year3.length<4 || year3.length>4){ 
	alert("3rd Additional Qualification Year must be in 4 digits !");
	return false;
	}
	var spe3 = document.application2.spe3.value;
	var invalid=/[^A-Za-z\s]/;
	
	if(spe3=="") {
		alert("Enter your Specialisation of 3rd additional qualification!");
		return false;
	 	}
	if(invalid.test(spe3)) {
		alert("Enter valid 3rd Additional Qualification Specialisation!");
		return false;
		 }
	var marks3 = document.application2.marks3.value;
	if(marks3=="") {
	alert("Enter your 3rd Additional Qualification marks or grade!");
	return false;
	 }
}

if(document.getElementById("tredu17").style.display=="") 
{
	var inst4 = document.application2.inst4.value;
	if(inst4=="") {
	alert("Enter your 4th Institute Name!");
	return false;
	}
	var year4 = document.application2.year4.value;
	var invalid = /[^0-9]/;
	if(year4=="") {
	alert("Enter your 4th Additional Qualification Year!");
	return false;
	}
	if(invalid.test(year4)) {
	alert("Enter valid 4th Additional Qualification Year!");
	return false;
	 }
	if(year4.length<4 || year4.length>4){ 
	alert("4th Additional Qualification Year must be in 4 digits !");
	return false;
	}
	var spe4 = document.application2.spe4.value;
	var invalid=/[^A-Za-z\s]/;
	
	if(spe4=="") {
		alert("Enter your Specialisation of 4th additional qualification!");
		return false;
	 	}
	if(invalid.test(spe4)) {
		alert("Enter valid 4th Additional Qualification Specialisation!");
		return false;
		 }
	var marks4 = document.application2.marks4.value;
	if(marks4=="") {
	alert("Enter your 4th Additional Qualification marks or grade!");
	return false;
	 }
}

if(document.getElementById("tredu19").style.display=="") 
{
	var inst5 = document.application2.inst5.value;
	if(inst5=="") {
	alert("Enter your 5th Institute Name!");
	return false;
	}
	var year5 = document.application2.year5.value;
	var invalid = /[^0-9]/;
	if(year5=="") {
	alert("Enter your 5th Additional Qualification Year!");
	return false;
	}
	if(invalid.test(year5)) {
	alert("Enter valid 5th Additional Qualification Year!");
	return false;
	 }
	if(year5.length<4 || year5.length>4){ 
	alert("5th Additional Qualification Year must be in 4 digits !");
	return false;
	}
	var spe5 = document.application2.spe5.value;
	var invalid=/[^A-Za-z\s]/;
	
	if(spe5=="") {
		alert("Enter your Specialisation of 5th additional qualification!");
		return false;
	 	}
	if(invalid.test(spe5)) {
		alert("Enter valid 5th Additional Qualification Specialisation!");
		return false;
		 }
	var marks5 = document.application2.marks5.value;
	if(marks5=="") {
	alert("Enter your 5th Additional Qualification marks or grade!");
	return false;
	 }
}


if(document.getElementById("tredu21").style.display=="") 
{
	var inst6 = document.application2.inst6.value;
	if(inst6=="") {
	alert("Enter your 6th Institute Name!");
	return false;
	}
	var year6 = document.application2.year6.value;
	var invalid = /[^0-9]/;
	if(year6=="") {
	alert("Enter your 6th Additional Qualification Year!");
	return false;
	}
	if(invalid.test(year6)) {
	alert("Enter valid 6th Additional Qualification Year!");
	return false;
	 }
	if(year6.length<4 || year6.length>4){ 
	alert("6th Additional Qualification Year must be in 4 digits !");
	return false;
	}
	var spe6 = document.application2.spe6.value;
	var invalid=/[^A-Za-z\s]/;
	
	if(spe6=="") {
		alert("Enter your Specialisation of 6th additional qualification!");
		return false;
	 	}
	if(invalid.test(spe6)) {
		alert("Enter valid 6th Additional Qualification Specialisation!");
		return false;
		 }
	var marks6 = document.application2.marks6.value;
	if(marks6=="") {
	alert("Enter your 6th Additional Qualification marks or grade!");
	return false;
	 }
}

if(document.getElementById("tredu23").style.display=="") 
{
	var inst7 = document.application2.inst7.value;
	if(inst7=="") {
	alert("Enter your 7th Institute Name!");
	return false;
	}
	var year7 = document.application2.year7.value;
	var invalid = /[^0-9]/;
	if(year7=="") {
	alert("Enter your 7th Additional Qualification Year!");
	return false;
	}
	if(invalid.test(year7)) {
	alert("Enter valid 7th Additional Qualification Year!");
	return false;
	 }
	if(year7.length<4 || year7.length>4){ 
	alert("7th Additional Qualification Year must be in 4 digits !");
	return false;
	}
	var spe7 = document.application2.spe7.value;
	var invalid=/[^A-Za-z\s]/;
	
	if(spe7=="") {
		alert("Enter your Specialisation of 7th additional qualification!");
		return false;
	 	}
	if(invalid.test(spe7)) {
		alert("Enter valid 7th Additional Qualification Specialisation!");
		return false;
		 }
	var marks7 = document.application2.marks7.value;
	if(marks7=="") {
	alert("Enter your 7th Additional Qualification marks or grade!");
	return false;
	 }
}

if(document.getElementById("tredu25").style.display=="") 
{
	var inst8 = document.application2.inst8.value;
	if(inst8=="") {
	alert("Enter your 8th Institute Name!");
	return false;
	}
	var year8 = document.application2.year8.value;
	var invalid = /[^0-9]/;
	if(year8=="") {
	alert("Enter your 8th Additional Qualification Year!");
	return false;
	}
	if(invalid.test(year8)) {
	alert("Enter valid 8th Additional Qualification Year!");
	return false;
	 }
	if(year8.length<4 || year8.length>4){ 
	alert("8th Additional Qualification Year must be in 4 digits !");
	return false;
	}
	var spe8 = document.application2.spe8.value;
	var invalid=/[^A-Za-z\s]/;
	
	if(spe8=="") {
		alert("Enter your Specialisation of 8th additional qualification!");
		return false;
	 	}
	if(invalid.test(spe8)) {
		alert("Enter valid 8th Additional Qualification Specialisation!");
		return false;
		 }
	var marks8 = document.application2.marks8.value;
	if(marks8=="") {
	alert("Enter your 8th Additional Qualification marks or grade!");
	return false;
	 }
}

if(document.getElementById("tredu27").style.display=="") 
{
	var inst9 = document.application2.inst9.value;
	if(inst9=="") {
	alert("Enter your 9th Institute Name!");
	return false;
	}
	var year9 = document.application2.year9.value;
	var invalid = /[^0-9]/;
	if(year9=="") {
	alert("Enter your 9th Additional Qualification Year!");
	return false;
	}
	if(invalid.test(year9)) {
	alert("Enter valid 9th Additional Qualification Year!");
	return false;
	 }
	if(year9.length<4 || year9.length>4){ 
	alert("9th Additional Qualification Year must be in 4 digits !");
	return false;
	}
	var spe9 = document.application2.spe9.value;
	var invalid=/[^A-Za-z\s]/;
	
	if(spe9=="") {
		alert("Enter your Specialisation of 9th additional qualification!");
		return false;
	 	}
	if(invalid.test(spe9)) {
		alert("Enter valid 9th Additional Qualification Specialisation!");
		return false;
		 }
	var marks9 = document.application2.marks9.value;
	if(marks9=="") {
	alert("Enter your 9th Additional Qualification marks or grade!");
	return false;
	 }
}

if(document.getElementById("tredu29").style.display=="") 
{
	var inst10 = document.application2.inst10.value;
	if(inst10=="") {
	alert("Enter your 10th Institute Name!");
	return false;
	}
	var year10 = document.application2.year10.value;
	var invalid = /[^0-9]/;
	if(year10=="") {
	alert("Enter your 10th Additional Qualification Year!");
	return false;
	}
	if(invalid.test(year10)) {
	alert("Enter valid 10th Additional Qualification Year!");
	return false;
	 }
	if(year10.length<4 || year10.length>4){ 
	alert("10th Additional Qualification Year must be in 4 digits !");
	return false;
	}
	var spe10 = document.application2.spe10.value;
	var invalid=/[^A-Za-z\s]/;
	
	if(spe10=="") {
		alert("Enter your Specialisation of 10th additional qualification!");
		return false;
	 	}
	if(invalid.test(spe10)) {
		alert("Enter valid 10th Additional Qualification Specialisation!");
		return false;
		 }
	var marks10 = document.application2.marks10.value;
	if(marks10=="") {
	alert("Enter your 10th Additional Qualification marks or grade!");
	return false;
	 }
}

 		if(document.getElementById("trwork11").style.display=="") {
 	 		
 			var comp1 = document.application2.comp1.value;
 			if(comp1=="") {
					alert("Enter your company Name!");
					return false;
 	 		}
	 		
	 		var post1 = document.application2.post1.value;
	 		var invalid=/[^A-Za-z\s]/;
 			if(post1=="") {
					alert("Enter your Position Held!");
					return false;
 	 		}
	 		if(invalid.test(post1)) {
					alert("Enter valid position Held!");
					return false;
		 	}
	 		var sal1 = document.application2.sal1.value;
	 		var invalid = /[^0-9]/;
	 		if(sal1=="") {
				alert("Enter your Salary per Annum!");
				return false;
	 		}
	 		if(invalid.test(sal1)) {
				alert("Enter valid salary per annum!");
				return false;
	 		}
	 		var reason1 = document.application2.reason1.value;
 			if(reason1=="") {
					alert("Enter your leaving reason!");
					return false;
 	 		}
		 	}

if(document.getElementById("trwork13").style.display=="") {
 	 		
 			var comp2 = document.application2.comp2.value;
 			if(comp2=="") {
					alert("Enter your 2nd company Name!");
					return false;
 	 		}
	 		var post2 = document.application2.post2.value;
	 		var invalid=/[^A-Za-z\s]/;
 			if(post2=="") {
					alert("Enter your 2nd company Position Held!");
					return false;
 	 		}
	 		if(invalid.test(post2)) {
					alert("Enter valid position Held in 2nd company!");
					return false;
		 	}
	 		var sal2 = document.application2.sal2.value;
	 		var invalid = /[^0-9]/;
	 		if(sal2=="") {
				alert("Enter your Salary per Annum of 2nd company!");
				return false;
	 		}
	 		if(invalid.test(sal2)) {
				alert("Enter valid salary per annum of 2nd company!");
				return false;
	 		}
	 		var reason2 = document.application2.reason2.value;
 			if(reason2=="") {
					alert("Enter your leaving reason of 2nd company!");
					return false;
 	 		}
		 	}
if(document.getElementById("trwork15").style.display=="") {
		
		var comp3 = document.application2.comp3.value;
		if(comp3=="") {
			alert("Enter your 3rd company Name!");
			return false;
		}
		var post3 = document.application2.post3.value;
		var invalid=/[^A-Za-z\s]/;
		if(post3=="") {
			alert("Enter your 3rd company Position Held!");
			return false;
		}
		if(invalid.test(post3)) {
			alert("Enter valid position Held in 3rd company!");
			return false;
 	}
		var sal3 = document.application2.sal3.value;
		var invalid = /[^0-9]/;
		if(sal3=="") {
		alert("Enter your Salary per Annum of 3rd company!");
		return false;
		}
		if(invalid.test(sal3)) {
		alert("Enter valid salary per annum of 3rd company!");
		return false;
		}
		var reason3 = document.application2.reason3.value;
		if(reason3=="") {
			alert("Enter your leaving reason of 3rd company!");
			return false;
		}
 	}

if(document.getElementById("trwork17").style.display=="") {
	
	var comp4 = document.application2.comp4.value;
	
	if(comp4=="") {
		alert("Enter your 4th company Name!");
		return false;
	}
	var post4 = document.application2.post4.value;
	var invalid=/[^A-Za-z\s]/;
	if(post4=="") {
		alert("Enter your 4th company Position Held!");
		return false;
	}
	if(invalid.test(post4)) {
		alert("Enter valid position Held in 4th company!");
		return false;
	}
	var sal4 = document.application2.sal4.value;
	var invalid = /[^0-9]/;
	if(sal4=="") {
	alert("Enter your Salary per Annum of 4th company!");
	return false;
	}
	if(invalid.test(sal4)) {
	alert("Enter valid salary per annum of 4th company!");
	return false;
	}
	var reason4 = document.application2.reason4.value;
	if(reason4=="") {
		alert("Enter your leaving reason of 4th company!");
		return false;
	}
	}
if(document.getElementById("trwork19").style.display=="") {
	
	var comp5 = document.application2.comp5.value;
	if(comp5=="") {
		alert("Enter your 5th company Name!");
		return false;
	}
	var post5 = document.application2.post5.value;
	var invalid=/[^A-Za-z\s]/;
	if(post5=="") {
		alert("Enter your 5th company Position Held!");
		return false;
	}
	if(invalid.test(post5)) {
		alert("Enter valid position Held in 5th company!");
		return false;
	}
	var sal5 = document.application2.sal5.value;
	var invalid = /[^0-9]/;
	if(sal5=="") {
	alert("Enter your Salary per Annum of 5th company!");
	return false;
	}
	if(invalid.test(sal5)) {
	alert("Enter valid salary per annum of 5th company!");
	return false;
	}
	var reason5 = document.application2.reason5.value;
	if(reason5=="") {
		alert("Enter your leaving reason of 5th company!");
		return false;
	}
	}
if(document.getElementById("trwork21").style.display=="") {
	
	var comp6 = document.application2.comp6.value;
	if(comp6=="") {
		alert("Enter your 6th company Name!");
		return false;
	}
	var post6 = document.application2.post6.value;
	var invalid=/[^A-Za-z\s]/;
	if(post6=="") {
		alert("Enter your 6th company Position Held!");
		return false;
	}
	if(invalid.test(post6)) {
		alert("Enter valid position Held in 6th company!");
		return false;
	}
	var sal6 = document.application2.sal6.value;
	var invalid = /[^0-9]/;
	if(sal6=="") {
	alert("Enter your Salary per Annum of 6th company!");
	return false;
	}
	if(invalid.test(sal6)) {
	alert("Enter valid salary per annum of 6th company!");
	return false;
	}
	var reason6 = document.application2.reason6.value;
	if(reason6=="") {
		alert("Enter your leaving reason of 6th company!");
		return false;
	}
	}

if(document.getElementById("trwork23").style.display=="") {
	
	var comp7 = document.application2.comp7.value;
	if(comp7=="") {
		alert("Enter your 7th company Name!");
		return false;
	}
	var post7 = document.application2.post7.value;
	var invalid=/[^A-Za-z\s]/;
	if(post7=="") {
		alert("Enter your 7th company Position Held!");
		return false;
	}
	if(invalid.test(post7)) {
		alert("Enter valid position Held in 7th company!");
		return false;
	}
	var sal7 = document.application2.sal7.value;
	var invalid = /[^0-9]/;
	if(sal7=="") {
	alert("Enter your Salary per Annum of 7th company!");
	return false;
	}
	if(invalid.test(sal7)) {
	alert("Enter valid salary per annum of 7th company!");
	return false;
	}
	var reason7 = document.application2.reason7.value;
	if(reason7=="") {
		alert("Enter your leaving reason of 7th company!");
		return false;
	}
	}

if(document.getElementById("trwork25").style.display=="") {
	
	var comp8 = document.application2.comp8.value;
	if(comp8=="") {
		alert("Enter your 8th company Name!");
		return false;
	}
	var post8 = document.application2.post8.value;
	var invalid=/[^A-Za-z\s]/;
	if(post8=="") {
		alert("Enter your 8th company Position Held!");
		return false;
	}
	if(invalid.test(post8)) {
		alert("Enter valid position Held in 8th company!");
		return false;
	}
	var sal8 = document.application2.sal8.value;
	var invalid = /[^0-9]/;
	if(sal8=="") {
	alert("Enter your Salary per Annum of 8th company!");
	return false;
	}
	if(invalid.test(sal8)) {
	alert("Enter valid salary per annum of 8th company!");
	return false;
	}
	var reason8 = document.application2.reason8.value;
	if(reason8=="") {
		alert("Enter your leaving reason of 8th company!");
		return false;
	}
	}

if(document.getElementById("trwork27").style.display=="") {
	
	var comp9 = document.application2.comp9.value;
	if(comp9=="") {
		alert("Enter your 9th company Name!");
		return false;
	}
	var post9 = document.application2.post9.value;
	var invalid=/[^A-Za-z\s]/;
	if(post9=="") {
		alert("Enter your 9th company Position Held!");
		return false;
	}
	if(invalid.test(post9)) {
		alert("Enter valid position Held in 9th company!");
		return false;
	}
	var sal9 = document.application2.sal9.value;
	var invalid = /[^0-9]/;
	if(sal9=="") {
	alert("Enter your Salary per Annum of 9th company!");
	return false;
	}
	if(invalid.test(sal9)) {
	alert("Enter valid salary per annum of 9th company!");
	return false;
	}
	var reason9 = document.application2.reason9.value;
	if(reason9=="") {
		alert("Enter your leaving reason of 9th company!");
		return false;
	}
	}
if(document.getElementById("trwork29").style.display=="") {
	
	var comp10 = document.application2.comp10.value;
	if(comp10=="") {
		alert("Enter your 10th company Name!");
		return false;
	}
	var post10 = document.application2.post10.value;
	var invalid=/[^A-Za-z\s]/;
	if(post10=="") {
		alert("Enter your 10th company Position Held!");
		return false;
	}
	if(invalid.test(post10)) {
		alert("Enter valid position Held in 10th company!");
		return false;
	}
	var sal10 = document.application2.sal10.value;
	var invalid = /[^0-9]/;
	if(sal10=="") {
	alert("Enter your Salary per Annum of 10th company!");
	return false;
	}
	if(invalid.test(sal10)) {
	alert("Enter valid salary per annum of 10th company!");
	return false;
	}
	var reason10 = document.application2.reason10.value;
	if(reason10=="") {
		alert("Enter your leaving reason of 10th company!");
		return false;
	}
	}

//for file upload++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if(document.getElementById("sscDoc").style.display=="block") {
	var fup = document.application2.sscDoc.value;
	var ext = fup.substring(fup.lastIndexOf('.') + 1);
	
	if( ext == "jpg" || ext == "JPG" || ext == "pdf" || ext == "PDF")
	{}
		else {
			alert("Upload Documents in JPG AND PDF formats only!");
			return false;
			}
	
}
if(document.getElementById("hscDoc").style.display=="block") {
	var fup = document.application2.hscDoc.value;
	var ext = fup.substring(fup.lastIndexOf('.') + 1);
	if( ext == "jpg" || ext == "JPG" || ext == "pdf" || ext == "PDF")
	{}
		else {
			alert("Upload Documents in JPG AND PDF formats only!");
			return false;
			}
	
}
if(document.getElementById("gradDoc").style.display=="block") {
	var fup = document.application2.gradDoc.value;
	var ext = fup.substring(fup.lastIndexOf('.') + 1);
	if( ext == "jpg" || ext == "JPG" || ext == "pdf" || ext == "PDF")
	{}
		else {
			alert("Upload Documents in JPG AND PDF formats only!");
			return false;
			}
	
}
if(document.getElementById("postDoc").style.display=="block") {
	var fup = document.application2.postDoc.value;
	var ext = fup.substring(fup.lastIndexOf('.') + 1);
	if( ext == "jpg" || ext == "JPG" || ext == "pdf" || ext == "PDF")
	{}
		else {
			alert("Upload Documents in JPG AND PDF formats only!");
			return false;
			}
	
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
	//var agreeDocs = document.getElementById("tw");
	if(document.getElementById("tw").checked==true) {
	}else {
		alert ("Do you agree with agreement!");
		return false;

	}
	
	
return true;
}
//for multiple attachment

function AttachDoc1()
{
document.getElementById("attachDoc1").style.display="none";
document.getElementById("sscDoc").style.display="block";
document.getElementById("removeDoc1").style.display="block";
}
function RemoveDoc1()
{
document.getElementById("attachDoc1").style.display="block";
document.getElementById("sscDoc").style.display="none";
document.getElementById("removeDoc1").style.display="none";
}

function AttachDoc2()
{
document.getElementById("attachDoc2").style.display="none";
document.getElementById("hscDoc").style.display="block";
document.getElementById("removeDoc2").style.display="block";
}
function RemoveDoc2()
{
document.getElementById("attachDoc2").style.display="block";
document.getElementById("hscDoc").style.display="none";
document.getElementById("removeDoc2").style.display="none";
}
function AttachDoc3()
{
document.getElementById("attachDoc3").style.display="none";
document.getElementById("gradDoc").style.display="block";
document.getElementById("removeDoc3").style.display="block";
}
function RemoveDoc3()
{
document.getElementById("attachDoc3").style.display="block";
document.getElementById("gradDoc").style.display="none";
document.getElementById("removeDoc3").style.display="none";
}
function AttachDoc4()
{
document.getElementById("attachDoc4").style.display="none";
document.getElementById("postDoc").style.display="block";
document.getElementById("removeDoc4").style.display="block";
}
function RemoveDoc4()
{
document.getElementById("attachDoc4").style.display="block";
document.getElementById("postDoc").style.display="none";
document.getElementById("removeDoc4").style.display="none";
}

</script>
</head>
<body id="main_body">

	<img id="top" src="newimages/top.png" alt="" />

	<div id="form_container">

		<h1 align="center">
			<a>Application Form</a>
		</h1>
		<br />
		<form id="application_form2" name="application2" class="appnitro"
			enctype="multipart/form-data" method="post"
			action="application_conn2.jsp" onsubmit="return validateForm()">
			<%
			int emp_id=0;
try {

	Connection conn1=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn1=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","erp","1@erp");
	//conn1=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","fleetview","F@5a<I86");

	System.out.println("In Try");
Statement st1=conn1.createStatement();
String query1 ="SELECT MAX(EmpID) as EmpID FROM t_applicant_details";
System.out.println("query1:"+query1);
	ResultSet rs = st1.executeQuery(query1);
	
	
if(rs.next()) {
	emp_id = rs.getInt("EmpID");
	System.out.println("the emp_is is :"+emp_id);
	}
	


}catch(Exception e){
	System.out.println("excetion:"+e);
}
%>


			<%

String datenew1="";
String datenew2="";

if(request.getParameter("data")!=null)
{
  datenew1=request.getParameter("data");
  datenew2=request.getParameter("data1");
  }

else {
	datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
}

%>

			<% 
		DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		String dataDate1=df1234.format(df123.parse(datenew1));
		String dataDate2=df1234.format(df123.parse(datenew2));
		int counter=0;
		
%>

			<div class="form_container1"></div>

			<ul>
				<font size="3" style="margin-left: 0.4em;">Educational
					Details *</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">

						<tr>
							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_42" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_32"
										style="width: 150px;"><font size="2">Level</font></label>
									<div>
										<select class="element select medium" id="edu_level"
											name="edu_level" style="width: 150px; height: 20px;"
											onchange="selecteducation();">
											<option value="Select" selected="selected">Select</option>
											<option value="Under Graduate">Under Graduate</option>
											<option value="Graduate">Graduate</option>
											<option value="Post Graduate">Post Graduate</option>
										</select>
									</div>
								</div>
							</td>
						</tr>
						<tr id="tredu1" style="display: none;">

							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_42" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_33"
										style="width: 120px;"><b><font size="2">S.S.C</font></b></label>
								</div>
							</td>
						</tr>
						<tr id="tredu2" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_25" style="width: 150px;"><font
										size="2">Board </font></label>
									<div>
										<input id="element_25" name="s_board"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" /> <a
											href="javascript: showbox1(2);" onclick="AttachDoc1()"
											id="attachDoc1">Attach Document</a>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_26" name="s_year"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_27" name="s_spe"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td>
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Percentage </font></label>
									<div>
										<input id="element_28" name="s_marks"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 100px; height: 20px; text-align: right" />
									</div></li>
							</td>
						</tr>


						<tr>
							<td colspan="1">
								<li id="li_24" style="width: 170px;">
									<div>
										<input type="file" style="width: 20em; display: none"
											name="sscDoc" id="sscDoc" onchange="uploadDoc1();" value=""
											class="element text" /> <a href="javascript: showbox1(2);"
											onclick="RemoveDoc1()" style="display: none" id="removeDoc1">Remove
											Document</a>
									</div>
							</li>
							</td>
						</tr>


						<tr id="tredu3" style="display: none;">
							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_42" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_34"
										style="width: 120px;"><b><font size="2">H.S.C/Diploma</font></b></label>
								</div>
							</td>
						</tr>
						<tr id="tredu4" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_35" style="width: 150px;"><font
										size="2">Board/University </font></label>
									<div>
										<input id="element_35" name="h_board"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" /> <a
											href="javascript: showbox1(2);" onclick="AttachDoc2()"
											id="attachDoc2">Attach Document</a>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_36" name="h_year"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_37" name="h_spe"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td>
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Percentage </font></label>
									<div>
										<input id="element_38" name="h_marks"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 100px; height: 20px; text-align: right" />
									</div></li>
							</td>
						</tr>

						<tr>
							<td colspan="1">
								<li id="li_24" style="width: 170px;">
									<div>
										<input type="file" style="width: 20em; display: none"
											name="hscDoc" id="hscDoc" onchange="uploadDoc2();" value=""
											class="element text" /> <a href="javascript: showbox1(2);"
											onclick="RemoveDoc2()" style="display: none" id="removeDoc2">Remove
											Document</a>
									</div>
							</li>
							</td>
						</tr>


						<tr id="tredu5" style="display: none;">
							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_42" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_33"
										style="width: 120px;"><b><font size="2">Graduation</font></b></label>
								</div>
							</td>
						</tr>
						<tr id="tredu6" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Board/University </font></label>
									<div>
										<input id="element_45" name="g_board"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" /> <a
											href="javascript: showbox1(2);" onclick="AttachDoc3()"
											id="attachDoc3">Attach Document</a>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_46" name="g_year"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_47" name="g_spe"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td>
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Percentage </font></label>
									<div>
										<input id="element_48" name="g_marks"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 100px; height: 20px; text-align: right" />
									</div></li>
							</td>
						</tr>
						<tr>
							<td colspan="1">
								<li id="li_24" style="width: 170px;">
									<div>
										<input type="file" style="width: 20em; display: none"
											name="gradDoc" id="gradDoc" onchange="uploadDoc3();" value=""
											class="element text" /> <a href="javascript: showbox1(2);"
											onclick="RemoveDoc3()" style="display: none" id="removeDoc3">Remove
											Document</a>
									</div>
							</li>
							</td>
						</tr>

						<tr id="tredu7" style="display: none;">
							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_42" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_33"
										style="width: 120px;"><b><font size="2">Post
												Graduation</font></b></label>
								</div>
							</td>
						</tr>
						<tr id="tredu8" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_25" style="width: 150px;"><font
										size="2">Board/University </font></label>
									<div>
										<input id="element_55" name="p_board"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" /> <a
											href="javascript: showbox1(2);" onclick="AttachDoc4()"
											id="attachDoc4">Attach Document</a>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_56" name="p_year"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_57" name="p_spe"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td>
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Percentage </font></label>
									<div>
										<input id="element_58" name="p_marks"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 100px; height: 20px; text-align: right" />
									</div></li>
							</td>
						</tr>

						<tr>
							<td colspan="1">
								<li id="li_24" style="width: 170px;">
									<div>
										<input type="file" style="width: 20em; display: none"
											name="postDoc" id="postDoc" onchange="uploadDoc4();" value=""
											class="element text" /> <a href="javascript: showbox1(2);"
											onclick="RemoveDoc4()" style="display: none" id="removeDoc4">Remove
											Document</a>
									</div>
							</li>
							</td>
						</tr>

					</table>
				</div>
			</ul>
			<ul>
				<font size="3" style="margin-left: 0.4em;">Additional
					Qualifications</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">

						<tr>
							<li id="li_1"><span>
									<td align="left" colspan="2" style="width: 30%;"><input
										type="radio" value="DetailReport" id="trk" class="" name="trk"
										onclick="selectqua('No');" />No</td>
								<td align="left" colspan="3" style="width: 30%;"><input
										type="radio" value="Map" id="trk" class="" name="trk"
										onclick="selectqua('Yes');" />Yes</td>

							</span></li>
							</div>

						</tr>

						<tr id="tredu11" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Institute </font></label>
									<div>
										<input id="element_45" name="inst1"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25"><label class="description" for="element_26"
									style="width: 150px;"><font size="2">Year </font></label>
									<div>
										<input id="element_26" name="year1"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_27" name="spe1" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Grade </font></label>
									<div>
										<input id="marks1" name="marks1" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 100px; height: 20px; text-align: right" />
									</div></li>
							</td>

						</tr>
						<tr id="tredu12" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore1();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>

						<tr id="tredu13" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Institute </font></label>
									<div>
										<input id="element_45" name="inst2"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_46" name="year2"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" "/>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_47" name="spe2" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Grade </font></label>
									<div>
										<input id="element_48" name="marks2"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 100px; height: 20px;" />
									</div></li>
							</td>

						</tr>
						<tr id="tredu14" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore2();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>


						<tr id="tredu15" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Institute </font></label>
									<div>
										<input id="element_45" name="inst3"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_46" name="year3"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_47" name="spe3" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Grade </font></label>
									<div>
										<input id="element_48" name="marks3"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 100px; height: 20px;" />
									</div></li>
							</td>

						</tr>
						<tr id="tredu16" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore3();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>


						<tr id="tredu17" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Institute </font></label>
									<div>
										<input id="element_45" name="inst4"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_46" name="year4"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_47" name="spe4" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Grade </font></label>
									<div>
										<input id="element_48" name="marks4"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 100px; height: 20px;" />
									</div></li>
							</td>

						</tr>
						<tr id="tredu18" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore4();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>


						<tr id="tredu19" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Institute </font></label>
									<div>
										<input id="element_45" name="inst5"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_46" name="year5"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_47" name="spe5" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Grade </font></label>
									<div>
										<input id="element_48" name="marks5"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 100px; height: 20px;" />
									</div></li>
							</td>

						</tr>
						<tr id="tredu20" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore5();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>


						<tr id="tredu21" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Institute </font></label>
									<div>
										<input id="element_45" name="inst6"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_46" name="year6"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_47" name="spe6" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Grade </font></label>
									<div>
										<input id="element_48" name="marks6"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 100px; height: 20px;" />
									</div></li>
							</td>

						</tr>
						<tr id="tredu22" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore6();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>


						<tr id="tredu23" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Institute </font></label>
									<div>
										<input id="element_45" name="inst7"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_46" name="year7"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_47" name="spe7" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Grade </font></label>
									<div>
										<input id="element_48" name="marks7"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 100px; height: 20px;" />
									</div></li>
							</td>

						</tr>
						<tr id="tredu24" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore7();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>


						<tr id="tredu25" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Institute </font></label>
									<div>
										<input id="element_45" name="inst8"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_46" name="year8"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_47" name="spe8" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Grade </font></label>
									<div>
										<input id="element_48" name="marks8"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 100px; height: 20px;" />
									</div></li>
							</td>

						</tr>
						<tr id="tredu26" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore8();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>


						<tr id="tredu27" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Institute </font></label>
									<div>
										<input id="element_45" name="inst9"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_46" name="year9"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_47" name="spe9" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Grade </font></label>
									<div>
										<input id="element_48" name="marks9"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 100px; height: 20px;" />
									</div></li>
							</td>

						</tr>
						<tr id="tredu28" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore9();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>


						<tr id="tredu29" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Institute </font></label>
									<div>
										<input id="element_45" name="inst10"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_46" name="year10"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_47" name="spe10"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Grade </font></label>
									<div>
										<input id="element_48" name="marks10"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 100px; height: 20px;" />
									</div></li>
							</td>

						</tr>
						<tr id="tredu30" style="display: none;">
							<td colspan="4">
								<li id="li_27"><label class="description" for="element_28"><font
										size="2">You can add maximun 10 qualifications only</font></label></li>
							</td>
						</tr>
					</table>
				</div>
			</ul>

			<ul>
				<font size="3" style="margin-left: 0.4em;">Work Experience</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">

						<tr>
							<li id="li_1"><span>
									<td align="left" colspan="2" style="width: 30%;"><input
										type="radio" value="DetailReport" id="trk1" class=""
										name="trk1" onclick="selectwork('No');" />No</td>
								<td align="left" colspan="3" style="width: 30%;"><input
										type="radio" value="Map" id="trk1" class="" name="trk1"
										onclick="selectwork('Yes');" />Yes</td>

							</span></li>
							</div>

						</tr>

						<tr id="trwork11" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 95px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Company </font></label>
									<div>
										<input id="element_45" name="comp1"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 170px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 95px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Position </font></label>
									<div>
										<input id="element_46" name="post1"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 95px;"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Salary </font></label>
									<div>
										<input id="element_47" name="sal1" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 90px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 120px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Reason For Leaving </font></label>
									<div>
										<input id="element_48" name="reason1"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 120px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">From Date </font></label>
									<div>
										<input type="text" id="data" name="from_date1" size="12"
											value="<%=datenew1%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">To Date </font></label>
									<div>
										<input type="text" id="data1" name="to_date1" size="12"
											value="<%=datenew2%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data1",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger1"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>

						</tr>
						<tr id="trwork12" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore11();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>

						<tr id="trwork13" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 95px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Company </font></label>
									<div>
										<input id="element_45" name="comp2"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 170px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 95px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Position </font></label>
									<div>
										<input id="element_46" name="post2"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 95px;"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Salary </font></label>
									<div>
										<input id="element_47" name="sal2" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 90px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 120px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Reason For Leaving </font></label>
									<div>
										<input id="element_48" name="reason2"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 120px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">From Date </font></label>
									<div>
										<input type="text" id="data2" name="from_date2" size="12"
											value="<%=datenew1%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data2",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data2"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">To Date </font></label>
									<div>
										<input type="text" id="data3" name="to_date2" size="12"
											value="<%=datenew2%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data3",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger2"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>

						</tr>
						<tr id="trwork14" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore12();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>

						<tr id="trwork15" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 95px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Company </font></label>
									<div>
										<input id="element_45" name="comp3"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 170px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 95px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Position </font></label>
									<div>
										<input id="element_46" name="post3"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 95px;"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Salary </font></label>
									<div>
										<input id="element_47" name="sal3" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 90px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 120px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Reason For Leaving </font></label>
									<div>
										<input id="element_48" name="reason3"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 120px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">From Date </font></label>
									<div>
										<input type="text" id="data4" name="from_date3" size="12"
											value="<%=datenew1%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data4",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data4"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">To Date </font></label>
									<div>
										<input type="text" id="data5" name="to_date3" size="12"
											value="<%=datenew2%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data5",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger3"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
						</tr>
						<tr id="trwork16" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore13();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>

						<tr id="trwork17" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 95px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Company </font></label>
									<div>
										<input id="element_45" name="comp4"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 170px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 95px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Position </font></label>
									<div>
										<input id="element_46" name="post4"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 95px;"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Salary </font></label>
									<div>
										<input id="element_47" name="sal4" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 90px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 120px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Reason For Leaving </font></label>
									<div>
										<input id="element_48" name="reason4"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 120px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">From Date </font></label>
									<div>
										<input type="text" id="data6" name="from_date4" size="12"
											value="<%=datenew1%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data6",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data6"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">To Date </font></label>
									<div>
										<input type="text" id="data7" name="to_date4" size="12"
											value="<%=datenew2%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data7",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger4"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>

						</tr>
						<tr id="trwork18" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore14();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>

						<tr id="trwork19" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 95px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Company </font></label>
									<div>
										<input id="element_45" name="comp5"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 170px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 95px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Position </font></label>
									<div>
										<input id="element_46" name="post5"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 95px;"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Salary </font></label>
									<div>
										<input id="element_47" name="sal5" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 90px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 120px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Reason For Leaving </font></label>
									<div>
										<input id="element_48" name="reason5"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 120px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">From Date </font></label>
									<div>
										<input type="text" id="data8" name="from_date5" size="12"
											value="<%=datenew1%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data8",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data8"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">To Date </font></label>
									<div>
										<input type="text" id="data9" name="to_date5" size="12"
											value="<%=datenew2%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data9",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger5"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>

						</tr>
						<tr id="trwork20" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore15();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>

						<tr id="trwork21" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 95px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Company </font></label>
									<div>
										<input id="element_45" name="comp6"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 170px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 95px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Position </font></label>
									<div>
										<input id="element_46" name="post6"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 95px;"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Salary </font></label>
									<div>
										<input id="element_47" name="sal6" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 90px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 120px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Reason For Leaving </font></label>
									<div>
										<input id="element_48" name="reason6"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 120px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">From Date </font></label>
									<div>
										<input type="text" id="data10" name="from_date6" size="12"
											value="<%=datenew1%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data10",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data10"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">To Date </font></label>
									<div>
										<input type="text" id="data11" name="to_date6" size="12"
											value="<%=datenew2%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data11",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger6"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>

						</tr>
						<tr id="trwork22" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore16();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>

						<tr id="trwork23" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 95px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Company </font></label>
									<div>
										<input id="element_45" name="comp7"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 170px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 95px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Position </font></label>
									<div>
										<input id="element_46" name="post7"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 95px;"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Salary </font></label>
									<div>
										<input id="element_47" name="sal7" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 90px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 120px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Reason For Leaving </font></label>
									<div>
										<input id="element_48" name="reason7"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 120px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">From Date </font></label>
									<div>
										<input type="text" id="data12" name="from_date7" size="12"
											value="<%=datenew1%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data12",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data12"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">To Date </font></label>
									<div>
										<input type="text" id="data13" name="to_date7" size="12"
											value="<%=datenew2%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data13",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger7"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>

						</tr>
						<tr id="trwork24" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore17();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>

						<tr id="trwork25" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 95px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Company </font></label>
									<div>
										<input id="element_45" name="comp8"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 170px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 95px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Position </font></label>
									<div>
										<input id="element_46" name="post8"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 95px;"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Salary </font></label>
									<div>
										<input id="element_47" name="sal8" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 90px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 120px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Reason For Leaving </font></label>
									<div>
										<input id="element_48" name="reason8"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 120px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">From Date </font></label>
									<div>
										<input type="text" id="data14" name="from_date8" size="12"
											value="<%=datenew1%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data14",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data14"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">To Date </font></label>
									<div>
										<input type="text" id="data15" name="to_date8" size="12"
											value="<%=datenew2%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data15",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger8"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>

						</tr>
						<tr id="trwork26" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore18();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>

						<tr id="trwork27" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 95px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Company </font></label>
									<div>
										<input id="element_45" name="comp9"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 170px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 95px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Position </font></label>
									<div>
										<input id="element_46" name="post9"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 95px;"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Salary </font></label>
									<div>
										<input id="element_47" name="sal9" class="element text medium"
											type="text" maxlength="255" value=""
											style="width: 90px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 120px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Reason For Leaving </font></label>
									<div>
										<input id="element_48" name="reason9"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 120px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">From Date </font></label>
									<div>
										<input type="text" id="data16" name="from_date9" size="12"
											value="<%=datenew1%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data16",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data16"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">To Date </font></label>
									<div>
										<input type="text" id="data17" name="to_date9" size="12"
											value="<%=datenew2%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data17",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger9"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>

						</tr>
						<tr id="trwork28" style="display: none;">
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 50px;"><font
										size="2"></font></label>
									<div>
										<a href="#" onclick="addmore19();"><font size="2"
											face="Arial">Add More </font></a>
									</div></li>
							</td>
						</tr>

						<tr id="trwork29" style="display: none;">
							<td colspan="1">
								<li id="li_24" style="width: 95px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Company </font></label>
									<div>
										<input id="element_45" name="comp10"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 170px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 95px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Position </font></label>
									<div>
										<input id="element_46" name="post10"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 95px;"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Salary </font></label>
									<div>
										<input id="element_47" name="sal10"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 90px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 120px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Reason For Leaving </font></label>
									<div>
										<input id="element_48" name="reason10"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 120px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">From Date </font></label>
									<div>
										<input type="text" id="data18" name="from_date10" size="12"
											value="<%=datenew1%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data18",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data18"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">To Date </font></label>
									<div>
										<input type="text" id="data19" name="to_date10" size="12"
											value="<%=datenew2%>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data19",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger10"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>

						</tr>
						<tr id="trwork30" style="display: none;">
							<td colspan="4">
								<li id="li_27"><label class="description" for="element_28"><font
										size="2">You can add maximun 10 records only</font></label></li>
							</td>
						</tr>
					</table>
				</div>
			</ul>
			<ul>
				<font size="3" style="margin-left: 0.4em;">Skills</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">

						<tr>
							<td align="left" colspan="1" style="width: 30%;"><input
								id="element_1_1" name="ms_office" class="element checkbox"
								type="checkbox" value="MS Office" /> <label class="choice"
								for="element_1_1"><font size="2">MS Office</font></label></td>
							<td align="left" colspan="1" style="width: 30%;"><input
								id="element_1_2" name="windows" class="element checkbox"
								type="checkbox" value="windows" /> <label class="choice"
								for="element_1_2"><font size="2">Windows</font></label></td>
							<td align="left" colspan="1" style="width: 30%;"><input
								id="element_1_3" name="autocad" class="element checkbox"
								type="checkbox" value="autocad" /> <label class="choice"
								for="element_1_3"><font size="2">AutoCAD</font></label></td>
							<td align="left" colspan="1" style="width: 30%;"><input
								id="element_1_4" name="tally" class="element checkbox"
								type="checkbox" value="tally" /> <label class="choice"
								for="element_1_4"><font size="2">Tally</font></label></td>
						</tr>

						<tr id="trwork29">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Typing(wpm) </font></label>
									<div>
										<input id="element_45" name="typing"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 18px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Shorthand(wpm) </font></label>
									<div>
										<input id="element_46" name="shorthand"
											class="element text medium" type="text" maxlength="255"
											value=""
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Any Other skills </font></label>
									<div>
										<input id="element_47" name="other"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 200px; height: 20px;" />
									</div></li>
							</td>


						</tr>
						<tr>


							<li id="li_1"><span>
									<td align="left" colspan="1" style="width: 40%;"><label
										class="description" for="element_27" style="width: 150px;"><b><font
												size="2">Command Over English</font></b></label></td>
									<td align="left" colspan="1" style="width: 10%;"><input
										type="radio" value="Good" id="trk" class="" name="english"
										onclick=""><font size="2">Good</font></td>
								<td align="left" colspan="1" style="width: 10%;"><input
										type="radio" value="Average" id="trk" class="" name="english"
										onclick=""><font size="2">Average</font></td>
									<td align="left" colspan="1" style="width: 10%;"><input
										type="radio" value="Poor" id="trk" class="" name="english"
										onclick=""><font size="2">Poor</font></td>
						</tr>


						</span>
						</li>
					</table>
				</div>
			</ul>
			<ul>
				<font size="3" style="margin-left: 0.4em;">Other Details</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">

						<tr>
							<td align="left" colspan="4" style="width: 60%;">

								<li id="li_1"><label class="description" for="element_1"><font
										size="2">What are your achievements? </font></label>
									<div>
										<textarea id="element_1" name="achievements"
											class="element textarea small"></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_2"><label class="description" for="element_2"><font
										size="2">Where do you see yourself 5 years from now? </font></label>
									<div>
										<textarea id="element_2" name="seeafter5"
											class="element textarea small"></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_3"><label class="description" for="element_3"><font
										size="2">What are your strenghts & weaknesses? </font></label>
									<div>
										<textarea id="element_3" name="strengths"
											class="element textarea small"></textarea>
									</div></li>
							</td>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_4"><label class="description" for="element_4"><font
										size="2">What are your extra-curricular activities?</font> </label>
									<div>
										<textarea id="element_4" name="curricular"
											class="element textarea small"></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_5"><label class="description" for="element_5"><font
										size="2">Expected salary ? </font></label>
									<div>
										<input type="text" id="element_5" name="exp_sal"
											class="element text medium" value=""
											style="width: 150px; height: 16px; text-align: right" />
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_6"><label class="description" for="element_6"><font
										size="2">How would it benefit the company if we hire
											you? </font></label>
									<div>
										<textarea id="element_6" name="benefit"
											class="element textarea small"></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_7"><label class="description" for="element_7"><font
										size="2">Why do you want to leave your present job? </font> </label>
									<div>
										<textarea id="element_7" name="leaving_reason"
											class="element textarea small"></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_8"><label class="description" for="element_8"><font
										size="2">Do you suffer from any health problems,if any
											please specify: Heart Attacks/High BP/Low BP/Broachitis/Any
											Other ? </font></label>
									<div>
										<textarea id="element_8" name="health_prob"
											class="element textarea small"></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_9"><label class="description" for="element_9"><font
										size="2">Do you have any litigation? </font></label>
									<div>
										<textarea id="element_9" name="litigation"
											class="element textarea small"></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_10"><label class="description" for="element_10"><font
										size="2">Do you have any police record? If yes, please
											specify: </font></label>
									<div>
										<textarea id="element_10" name="police_record"
											class="element textarea small"></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_11"><label class="description" for="element_11"><font
										size="2">References :(Starte Name ,Address & phone nos.
											of two references who are not relatives) </font></label>
									<div>
										<textarea id="element_11" name="reference"
											class="element textarea small"></textarea>
									</div>
							</td>
						</tr>
					</table>
				</div>
			</ul>

			<br />


			<ul>
				<font size="3" style="margin-left: 0.4em;">Declaration :</font>
				<div width="100%" align="left"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">
						<tr>
							<td>
								<div>
									<p>I declare that all statements are here in are
										true,correct & complete.In any case they are found to be
										incorrect company is liable to take prosecution action against
										me.</p>
								</div>
							</td>
						</tr>
						<tr>
							<td><input type="hidden" name="emp_id" id="emp_id"
								value="<%=emp_id %>" /></td>
						</tr>
					</table>
				</div>
			</ul>
			<br />

			<ul>
				<font size="3" style="margin-left: 0.4em;">Transworld
					Agreement :</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">
						<form>
							<tr>
								<td><input type="checkbox" name="tw" value="tw" id="tw" />I
									Agree</td>
								<td><a href="AgreementCopy.pdf" target="_blank">Agreement
										Document</a></td>
							</tr>
						</form>
					</table>
			</ul>
			<br />
			<br />

			<div align="center">
				<input type="submit" id="element_15" name="submit" value="Submit"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff" />
			</div>



		</form>
	</div>


</body>
</html>