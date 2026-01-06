<%@ page import="java.util.List"%>
<%@ include file="headConn.jsp"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.jibble.simpleftp.*"%>
<%@ page import="java.net.URLConnection"%>
<%@ page import="java.net.URL"%>
<%@ page language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/multifile.js"></script>
<title>Transworld Inward Upload</title>
</head>
<body>
	<%
String doa="0000-00-00",child1="-",child2="-",child1sex="-",child2sex="-",child1dob="0000-00-00",child2dob="0000-00-00",kids="No",basic="0.00",tds="0.00",net="0.00",allow="0.00";
String todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
String todaysDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
String empId="",empName="",cmpCode="",deptId="",email="",desg="",fName="",mName="",lName="",salut="",contact="",dob="",marial="";
String address="",accno="",bank="",branch="",ifsc="",pan="",policy="",claimcmpny="",amount="",doe="",namecont="",contno="",contaddress="";
String relation="",EMPName="",doj="",contractdate="",contractexpdate="";
// String child1sex="",child1="",child2="",child2sex="",child1dob="",child2dob="";
String salary="-",filename="",filename1="",itemNames="";
String contractdate1="",contractexpdate1="",docPath="";
String f123="";
int fileCount=0;int count=0;
String servername="",pass="",user="";
StringBuffer filevalues=new StringBuffer();
String l="",n="",m="";
String sendMsg="",action="";
%>
	<%
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st3=conn.createStatement();
%>
	<%
//*(*********************** *******          file uplaod        *******************************************************  

boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	System.out.println(!isMultipart);
	if (!isMultipart) {
	} else {
		System.out.println("IN ELSE    +++++   ");
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Iterator itr = items.iterator();

		//  String a[]=request.getParameter("");
		String a = "";
		while (itr.hasNext()) {
			System.out.println("IN iter while");
			
			FileItem item = (FileItem) itr.next();
			System.out.println("ITEM  "+item);
			
			if (item.isFormField()) 
			{
				System.out.println("IN iffff   ");
				String name = item.getFieldName();
				System.out.println(" "+name);
				String value = item.getString();
				System.out.println(" "+value);
				if (name.equals("filename"))
				{
					filename = value.trim();
					System.out.println("my file Names   ))))))))))))))))))))))))*"+ filename);
					
				}
				if (name.equals("filename1"))
				{
					filename1 = value.trim();
					System.out.println("my file Names   ))))))))))))))))))))))))*"+ filename1);

				}

				
				if (name.equals("empId")) {
					empId = value;
					System.out.println("emp id"+ empId);
				}
				
				if (name.equals("empName")) {
					empName = value;
					System.out.println("empName "+ empName);
				}
				if (name.equals("cmpName")) {
					cmpCode = value;
					System.out.println("cmpCode "+ cmpCode);
				}
				if (name.equals("deptName")) {
					deptId = value;
					System.out.println("deptName "+ deptId);
				}
				if (name.equals("email")) {
					email = value;
					System.out.println("email "+ email);
				}
				if (name.equals("empDesg")) {
					desg = value;
					System.out.println("empDesg "+ desg);
				}	
				if (name.equals("doe")) {
					doe = value;
					System.out.println("doe "+ doe);
				}
			//	String =request.getParameter("");
				if (name.equals("fName")) {
					fName = value;
					System.out.println("fName "+ fName);
				}
				if (name.equals("mName")) {
					mName = value;
					System.out.println("mName "+ mName);
				}
				if (name.equals("mName")) {
					mName = value;
					System.out.println("mName "+ mName);
				}
				if (name.equals("lName")) {
					lName = value;
					System.out.println("lName "+ lName);
				}
				if (name.equals("gender")) {
					salut = value;
					System.out.println("gender "+ salut);
				}
				if (name.equals("contact")) {
					contact = value;
					System.out.println("contact "+ contact);
				}
				if (name.equals("dob")) 
				{
					dob = value;
					System.out.println("contact "+ dob);
					try
					{
						dob=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(dob));
					}
					catch(Exception e)
					{
						System.out.println(">>>>>>>>>>>>>>>>>>Exception:"+e);
					}
					
				}
				if (name.equals("marial")) {
					marial = value;
					System.out.println("marial "+ marial);
				}
				if (name.equals("kids")) {
					kids = value;
					System.out.println("kids "+ kids);
				}
				if (name.equals("address")) {
					address = value;
					System.out.println("address "+ address);
				}
				if (name.equals("accno")) {
					accno = value;
					System.out.println("accno "+ accno);
				}
				if (name.equals("bank")) {
					bank = value;
					System.out.println("bank "+ bank);
				}
				if (name.equals("branch")) {
					branch = value;
					System.out.println("branch "+ branch);
				}
				if (name.equals("ifsc")) {
					ifsc = value;
					System.out.println("ifsc "+ ifsc);
				}
				
				if (name.equals("pan")) {
					pan = value;
					System.out.println("pan "+ pan);
				}	
				
				if (name.equals("policy")) {
					policy = value;
					System.out.println("policy "+ policy);
				}
				if (name.equals("claimcmpny")) {
					claimcmpny = value;
					System.out.println("claimcmpny "+ claimcmpny);
				}
				if (name.equals("amount")) {
					amount = value;
					if(amount.equals("")||amount.contains("")||amount=="")
					{ amount="0.0";
					System.out.println("amount "+ amount);}
				}
				if (name.equals("doe")) {
					doe = value;
					System.out.println("doe "+ doe);
				}
				
				if (name.equals("namecont")) {
					namecont = value;
					System.out.println("namecont "+ namecont);
				}
				
				if (name.equals("contno")) {
					contno = value;
					System.out.println("contno "+ contno);
				}
				
				if (name.equals("contaddress")) {
					contaddress = value;
					System.out.println("contaddress "+ contaddress);
				}
				
				if (name.equals("relation")) {
					relation = value;
					System.out.println("relation "+ relation);
				}
				if (name.equals("action")) {
					action = value;
					System.out.println("action "+ action);
				}
				//if (name.equals("empname")) {
					//EMPName = value;
					//System.out.println("EMPName "+ EMPName);
				//}
				
				if (name.equals("doj")) {
					doj = value;
					System.out.println("doj "+ doj);
				}
				
				if (name.equals("contractdate")) {
					contractdate = value;
					System.out.println("contractdate "+ contractdate);
					contractdate1=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(contractdate));
				}
				
				if (name.equals("contractexpdate")) {
					contractexpdate = value;
					System.out.println("contract exp date "+ contractexpdate);
					contractexpdate1=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(contractexpdate));
				}
					
				
				if(marial=="Married" ||marial.contains("Married")|| marial.equals("Married"))
				{
					//doa=request.getParameter("doa");
					try
					{
						doa=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("doa")));
					}
					catch(Exception e)
					{
						System.out.println(">>>>>>>>>>>>>>>>>>Exception:"+e);
					}
					
					if(kids=="Yes"||kids.contains("Yes")||kids.equals("Yes"))
					{
						
						if (name.equals("kidsex")) {
							child1sex = value;
							System.out.println("child1sex "+ child1sex);
						}
						
						if (name.equals("child1")) {
							child1 = value;
							System.out.println("child1 "+ child1);
						}
						
						if (name.equals("child2")) {
							child2 = value;
							System.out.println("child2 "+ child2);
						}
						
						if (name.equals("kidsex1")) {
							child2sex = value;
							System.out.println("kidsex1 "+ child2sex);
						}
						
						if (name.equals("doch1")) {
							child1dob = value;
							System.out.println("doch1 "+ child1dob);
						}
					
						if (name.equals("doch2")) {
							child2dob = value;
							System.out.println("doch2 "+ child2dob);
						}
						
						if(child1dob==null)
						{
							child1dob="0000-00-00";
						}
						else
						{
							try
							{
								child1dob=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(child1dob));
							}
							catch(Exception e)
							{
								System.out.println(">>>>>>>>>>>>>>>>>>Exception:"+e);
							}
						}
						if(child2==" "||child2==null||child2.contains("")||child2.contains(" "))
						{
							/*if(child2dob==null)
							{
								child2dob="0000-00-00";
							}*/
							child2sex="-";
							child2dob="0000-00-00";
						}
						else
						{
							try
							{
								child2dob=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(child2dob));
							}
							catch(Exception e)
							{
								System.out.println(">>>>>>>>>>>>>>>>>>Exception:"+e);
							}
						}
					}
					
				}
			
				
			} else {
				try {

					 itemNames = item.getName();
					 System.out.println("888888   8888888888888888 8" +itemNames);
					 filevalues=filevalues.append(","+itemNames);					
					 
						
					 if(itemNames.equalsIgnoreCase(""))
					 {
					 }
					 else
					 {
						try
						{
						  //  System.out.println("HHHHHH  ");
						  //String FileUploadPath =getServletContext().getInitParameter("configuredUploadDir");
						  String FileUploadPath ="usr/share/tomcat6/webapps/TransworldDocs/HRDocs/";
							 
						   // String FileUploadPath ="/home/r_lakhote/Desktop/Test/";
						    System.out.println("IIIIIII  "+FileUploadPath);
						    File uploadDir = new File(FileUploadPath);
						    
						    File savedFile = new File(FileUploadPath+"/"+itemNames);
						    System.out.println("IIIIIII  "+savedFile);
							item.write(savedFile);
							System.out.println("*******file copied 1******");
							
							//File savedFile111 = new File(FileUploadPath+"/"+n);
						    //System.out.println("IIIIIII  "+savedFile111);
							//item.write(savedFile111);
							//System.out.println("*******file copied 2******");
						  
						}catch(Exception e)
						{
							e.printStackTrace();
						}
					}
							
				} catch (Exception e) {
	  					e.printStackTrace();
	  				}
					}
		}
	 
		try
		 	{System.out.println("FIRST FILE  is:   ");
					m=filevalues.toString();
					StringTokenizer singlesup=new StringTokenizer(m,",");
					count=singlesup.countTokens();
					System.out.println("Count is:   "+count);
					if(singlesup.hasMoreTokens())
					{
						System.out.println("-----------12121------------");	
						 	l =singlesup.nextToken();
						 	System.out.println("FIRST FILE  is:   "+l);
						   	n=singlesup.nextToken();
						   	System.out.println("SECOND  FILE  is:   "+n);
						 	
						 	System.out.println("==========================>>"+docPath+"/"+l);
						 	System.out.println("path----------->>"+docPath+"/"+l);
						 	
						 	System.out.println("==========================>>"+docPath+"/"+n);
						 	System.out.println("path----------->>"+docPath+"/"+n);
						 	
					}
						 	try
						 	{
						 		doe=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(doe));
						 	}
						 	catch(Exception e)
						 	{
						 		System.out.println(">>>>>>>>>>>>>>>>>>Exception:"+e);
						 	}

						 	try
						 	{
						 		doj=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(doj));
						 	}
						 	catch(Exception e)
						 	{
						 		System.out.println(">>>>>>>>>>>>>>>>>>Exception:"+e);
						 	}
					//int empId=0;
						 
						 	try
						 	{
						 		int ud1=0;
						 		int ct=0;
						 		String cmp="",dpt="";
						 		String delims12 = "[,]";
						 		String[] tokensEmail = deptId.split(delims12);
						 		for(String t : tokensEmail)
						 		{
						 			if(ct==0)
						 			{
						 				dpt=t;
						 			}
						 			else
						 			{
						 				cmp=t;
						 			}
						 			ct++;
						 			
						 		}
//						 		ud1=Integer.parseInt(cmp);
						 		
						 		
						 		int cCd=Integer.parseInt(cmpCode);
						 		int dId=Integer.parseInt(dpt);
						 		int twEmp=Integer.parseInt(session.getAttribute("empID").toString());
						 		//*******************update contractor ***************
						 		if(action.contains("edit"))
						 		{
						 			if(marial=="Married" ||marial.contains("Married")|| marial.equals("Married"))
						 			{
						 				String sqlupdate="update t_employee set CompanyCode='"+cCd+"',Salutation='"+salut+"',EmpName='"+empName+"',DeptID='"+dId+"',Empemail='"+email+"',designation='"+desg+"',FirstName='"+fName+"',MiddleName='"+mName+"',LastName='"+lName+"',TWEmpID='"+twEmp+"',EmpContactNo='"+contact+"',DateOfBirth='"+dob+"',MarialStatus='"+marial+"',DateOfAnniversary='"+doa+"',KidsDetails='"+kids+"',Child1Sex='"+child1sex+"',Child2Sex='"+child2sex+"',Child1Name='"+child1+"',Child2Name='"+child2+"',Child1DOB='"+child1dob+"',Child2DOB='"+child2dob+"',AddressEmp='"+address+"',SalaryDetails='"+salary+"',BasicSalarary='"+basic+"',TDS='"+tds+"',NetPay='"+net+"',Allowance='"+allow+"',AccNo='"+accno+"',BankName='"+bank+"',BankBranch='"+branch+"',IFSC='"+ifsc+"',PanNo='"+pan+"',PolicyNo='"+policy+"',NameOfClaimCompany='"+claimcmpny+"',ExpiryDateClaim='"+doe+"',ClaimAmount='"+amount+"',ContactImeediate='"+namecont+"',ContactNoImmediate='"+contno+"',AddressContact='"+contaddress+"',RelationShip='"+relation+"',EnterBy='"+EMPName+"',EnteredDateTime='"+todaysDateTime+"',DateofJoining='"+doj+"',ContractDate='"+contractdate1+"',ContractExpDate='"+contractexpdate1+"',MediclaimFileName='"+n+"',ContractFileName='"+l+"' where EmpID='"+empId+"'";
						 				System.out.println(">>>>>>>>>>>>>>sqlInsert:::::"+sqlupdate);
						 				st1.executeUpdate(sqlupdate);
						 				String sqlInsert1="insert into t_employeehistory (CompanyCode,EmpID,Salutation,EmpName,DeptID,Empemail,designation,FirstName,MiddleName,LastName,TWEmpID,EmpContactNo,DateOfBirth,MarialStatus,DateOfAnniversary,KidsDetails,Child1Sex,Child2Sex,Child1Name,Child2Name,Child1DOB,Child2DOB,AddressEmp,SalaryDetails,BasicSalarary,TDS,NetPay,Allowance,AccNo,BankName,BankBranch,IFSC,PanNo,PolicyNo,NameOfClaimCompany,ExpiryDateClaim,ClaimAmount,ContactImeediate,ContactNoImmediate,AddressContact,RelationShip,EnterBy,EnteredDateTime,ContractDate,ContractExpDate,MediclaimFileName,ContractFileName) values ('"+cCd+"','"+empId+"','"+salut+"','"+empName+"','"+dId+"','"+email+"','"+desg+"','"+fName+"','"+mName+"','"+lName+"','"+twEmp+"','"+contact+"','"+dob+"','"+marial+"','"+doa+"','"+kids+"','"+child1sex+"','"+child2sex+"','"+child1+"','"+child2+"','"+child1dob+"','"+child2dob+"','"+address+"','"+salary+"',"+basic+","+tds+","+net+","+allow+","+accno+",'"+bank+"','"+branch+"','"+ifsc+"','"+pan+"','"+policy+"','"+claimcmpny+"','"+doe+"',"+amount+",'"+namecont+"','"+contno+"','"+contaddress+"','"+relation+"','"+EMPName+"','"+todaysDateTime+"','"+contractdate1+"','"+contractexpdate1+"','"+n+"','"+l+"')";
						 				System.out.println(">>>>>>>>>>>>>>sqlInsert1:::::"+sqlInsert1);
						 				st2.executeUpdate(sqlInsert1);
						 			}
						 			else
						 			{
						 				String sqlupdate="update t_employee set CompanyCode='"+cCd+"',Salutation='"+salut+"',EmpName='"+empName+"',DeptID='"+dId+"',Empemail='"+email+"',designation='"+desg+"',FirstName='"+fName+"',MiddleName='"+mName+"',LastName='"+lName+"',TWEmpID='"+twEmp+"',EmpContactNo='"+contact+"',DateOfBirth='"+dob+"',MarialStatus='"+marial+"',AddressEmp='"+address+"',SalaryDetails='"+salary+"',BasicSalarary='"+basic+"',TDS='"+tds+"',NetPay='"+net+"',Allowance='"+allow+"',AccNo='"+accno+"',BankName='"+bank+"',BankBranch='"+branch+"',IFSC='"+ifsc+"',PanNo='"+pan+"',PolicyNo='"+policy+"',NameOfClaimCompany='"+claimcmpny+"',ExpiryDateClaim='"+doe+"',ClaimAmount='"+amount+"',ContactImeediate='"+namecont+"',ContactNoImmediate='"+contno+"',AddressContact='"+contaddress+"',RelationShip='"+relation+"',EnterBy='"+EMPName+"',EnteredDateTime='"+todaysDateTime+"',DateofJoining='"+doj+"',ContractDate='"+contractdate1+"',ContractExpDate='"+contractexpdate1+"',MediclaimFileName='"+n+"',ContractFileName='"+l+"' where EmpID='"+empId+"'";
						 				System.out.println(">>>>>>>>>>>>>>sqlInsert:::::"+sqlupdate);
						 				st1.executeUpdate(sqlupdate);
						 			//	String sqlInsert1="insert into t_employeehistory (CompanyCode,EmpID,Salutation,EmpName,DeptID,Empemail,designation,FirstName,MiddleName,LastName,TWEmpID,EmpContactNo,DateOfBirth,MarialStatus,AddressEmp,SalaryDetails,BasicSalarary,TDS,NetPay,Allowance,AccNo,BankName,BankBranch,IFSC,PanNo,PolicyNo,NameOfClaimCompany,ExpiryDateClaim,ClaimAmount,ContactImeediate,ContactNoImmediate,AddressContact,RelationShip,EnterBy,EnteredDateTime,ContractDate,ContractExpDate,MediclaimFileName,ContractFileName) values ('"+cCd+"','"+empId+"','"+salut+"','"+empName+"','"+dId+"','"+email+"','"+desg+"','"+fName+"','"+mName+"','"+lName+"','"+twEmp+"','"+contact+"','"+dob+"','"+marial+"','"+address+"','"+salary+"',"+basic+","+tds+","+net+","+allow+","+accno+",'"+bank+"','"+branch+"','"+ifsc+"','"+pan+"','"+policy+"','"+claimcmpny+"','"+doe+"','"+amount+"','"+namecont+"','"+contno+"','"+contaddress+"','"+relation+"','"+EMPName+"','"+todaysDateTime+"','"+contractdate1+"','"+contractexpdate1+"','"+n+"','"+l+"')";
						 			//	System.out.println(">>>>>>>>>>>>>>sqlInsert1:::::"+sqlInsert1);
						 			//	st2.executeUpdate(sqlInsert1);
						 			}
						 			
						 			String sendMsg1="Contractor Record Updated Successfully ";
						 			response.sendRedirect("alertGoTo.jsp?msg="+sendMsg1+"&goto=contractorReport.jsp");
						 			
						 		}
						 		//***************************************************
						 		
						 		//====Chk for duplicate======================================
						 		if(action.contains("add"))
						 		{
						 		String sqlId="select * from t_employee where EmpID="+empId+"";
						 			ResultSet rsId=st1.executeQuery(sqlId);
						 			 System.out.println("1345========= ");
						 			if(rsId.next())
						 			{  System.out.println(" before ");
						 			
						 			 String sendMsg1="Contractor Already Exist";
						 			 response.sendRedirect("employeeRegistration.jsp?sendMsg="+sendMsg1+"");
						 				
						 			}
						 		else
						 		{
						 		System.out.println(empId+"==="+empName+"===="+cmpCode+"==="+deptId+"==="+email+"====="+desg+"====="+fName+"====="+mName+"====="+lName+"====");
						 		
						 		try
						 		{
						 			if(marial=="Married" ||marial.contains("Married")|| marial.equals("Married"))
						 			{
						 				String sqlInsert="insert into t_employee (CompanyCode,EmpID,Salutation,EmpName,DeptID,Empemail,designation,FirstName,MiddleName,LastName,TWEmpID,EmpContactNo,DateOfBirth,MarialStatus,DateOfAnniversary,KidsDetails,Child1Sex,Child2Sex,Child1Name,Child2Name,Child1DOB,Child2DOB,AddressEmp,SalaryDetails,BasicSalarary,TDS,NetPay,Allowance,AccNo,BankName,BankBranch,IFSC,PanNo,PolicyNo,NameOfClaimCompany,ExpiryDateClaim,ClaimAmount,ContactImeediate,ContactNoImmediate,AddressContact,RelationShip,EnterBy,EnteredDateTime,DateofJoining,ContractDate,ContractExpDate,MediclaimFileName,ContractFileName) values ('"+cCd+"','"+empId+"','"+salut+"','"+empName+"','"+dId+"','"+email+"','"+desg+"','"+fName+"','"+mName+"','"+lName+"','"+twEmp+"','"+contact+"','"+dob+"','"+marial+"','"+doa+"','"+kids+"','"+child1sex+"','"+child2sex+"','"+child1+"','"+child2+"','"+child1dob+"','"+child2dob+"','"+address+"','"+salary+"',"+basic+","+tds+","+net+","+allow+","+accno+",'"+bank+"','"+branch+"','"+ifsc+"','"+pan+"','"+policy+"','"+claimcmpny+"','"+doe+"',"+amount+",'"+namecont+"','"+contno+"','"+contaddress+"','"+relation+"','"+EMPName+"','"+todaysDateTime+"','"+doj+"','"+contractdate1+"','"+contractexpdate1+"','"+n+"','"+l+"')";
						 				System.out.println(">>>>>>>>>>>>>>sqlInsert:::::"+sqlInsert);
						 				st1.executeUpdate(sqlInsert);
						 				String sqlInsert1="insert into t_employeehistory (CompanyCode,EmpID,Salutation,EmpName,DeptID,Empemail,designation,FirstName,MiddleName,LastName,TWEmpID,EmpContactNo,DateOfBirth,MarialStatus,DateOfAnniversary,KidsDetails,Child1Sex,Child2Sex,Child1Name,Child2Name,Child1DOB,Child2DOB,AddressEmp,SalaryDetails,BasicSalarary,TDS,NetPay,Allowance,AccNo,BankName,BankBranch,IFSC,PanNo,PolicyNo,NameOfClaimCompany,ExpiryDateClaim,ClaimAmount,ContactImeediate,ContactNoImmediate,AddressContact,RelationShip,EnterBy,EnteredDateTime,ContractDate,ContractExpDate,MediclaimFileName,ContractFileName) values ('"+cCd+"','"+empId+"','"+salut+"','"+empName+"','"+dId+"','"+email+"','"+desg+"','"+fName+"','"+mName+"','"+lName+"','"+twEmp+"','"+contact+"','"+dob+"','"+marial+"','"+doa+"','"+kids+"','"+child1sex+"','"+child2sex+"','"+child1+"','"+child2+"','"+child1dob+"','"+child2dob+"','"+address+"','"+salary+"',"+basic+","+tds+","+net+","+allow+","+accno+",'"+bank+"','"+branch+"','"+ifsc+"','"+pan+"','"+policy+"','"+claimcmpny+"','"+doe+"',"+amount+",'"+namecont+"','"+contno+"','"+contaddress+"','"+relation+"','"+EMPName+"','"+todaysDateTime+"','"+contractdate1+"','"+contractexpdate1+"','"+n+"','"+l+"')";
						 				System.out.println(">>>>>>>>>>>>>>sqlInsert1:::::"+sqlInsert1);
						 				st2.executeUpdate(sqlInsert1);
						 			}
						 			else
						 			{
						 				String sqlInsert="insert into t_employee (CompanyCode,EmpID,Salutation,EmpName,DeptID,Empemail,designation,FirstName,MiddleName,LastName,TWEmpID,EmpContactNo,DateOfBirth,MarialStatus,AddressEmp,SalaryDetails,BasicSalarary,TDS,NetPay,Allowance,AccNo,BankName,BankBranch,IFSC,PanNo,PolicyNo,NameOfClaimCompany,ExpiryDateClaim,ClaimAmount,ContactImeediate,ContactNoImmediate,AddressContact,RelationShip,EnterBy,EnteredDateTime,DateofJoining,ContractDate,ContractExpDate,MediclaimFileName,ContractFileName) values ('"+cCd+"','"+empId+"','"+salut+"','"+empName+"','"+dId+"','"+email+"','"+desg+"','"+fName+"','"+mName+"','"+lName+"','"+twEmp+"','"+contact+"','"+dob+"','"+marial+"','"+address+"','"+salary+"',"+basic+","+tds+","+net+","+allow+","+accno+",'"+bank+"','"+branch+"','"+ifsc+"','"+pan+"','"+policy+"','"+claimcmpny+"','"+doe+"','"+amount+"','"+namecont+"','"+contno+"','"+contaddress+"','"+relation+"','"+EMPName+"','"+todaysDateTime+"','"+doj+"','"+contractdate1+"','"+contractexpdate1+"','"+n+"','"+l+"')";
						 				System.out.println(">>>>>>>>>>>>>>sqlInsert:::::"+sqlInsert);
						 				st1.executeUpdate(sqlInsert);
						 				String sqlInsert1="insert into t_employeehistory (CompanyCode,EmpID,Salutation,EmpName,DeptID,Empemail,designation,FirstName,MiddleName,LastName,TWEmpID,EmpContactNo,DateOfBirth,MarialStatus,AddressEmp,SalaryDetails,BasicSalarary,TDS,NetPay,Allowance,AccNo,BankName,BankBranch,IFSC,PanNo,PolicyNo,NameOfClaimCompany,ExpiryDateClaim,ClaimAmount,ContactImeediate,ContactNoImmediate,AddressContact,RelationShip,EnterBy,EnteredDateTime,ContractDate,ContractExpDate,MediclaimFileName,ContractFileName) values ('"+cCd+"','"+empId+"','"+salut+"','"+empName+"','"+dId+"','"+email+"','"+desg+"','"+fName+"','"+mName+"','"+lName+"','"+twEmp+"','"+contact+"','"+dob+"','"+marial+"','"+address+"','"+salary+"',"+basic+","+tds+","+net+","+allow+","+accno+",'"+bank+"','"+branch+"','"+ifsc+"','"+pan+"','"+policy+"','"+claimcmpny+"','"+doe+"','"+amount+"','"+namecont+"','"+contno+"','"+contaddress+"','"+relation+"','"+EMPName+"','"+todaysDateTime+"','"+contractdate1+"','"+contractexpdate1+"','"+n+"','"+l+"')";
						 				System.out.println(">>>>>>>>>>>>>>sqlInsert1:::::"+sqlInsert1);
						 				st2.executeUpdate(sqlInsert1);
						 			}
						 			sendMsg="Contractor Added successfully";
						 		}
						 		catch(Exception e)
						 		{
						 			System.out.println(">>>>>>>>>>>>>>>>>>>>Exception:"+e);
						 			sendMsg="Please try again1";
						 		}
						 		response.sendRedirect("alertGoTo.jsp?msg="+sendMsg+"&goto=contractorReport.jsp");
						 		//response.sendRedirect("contractorReport.jsp?EmpID="+empId+"&EmpName="+empName+"&Empemail="+email+"&sendMsg="+sendMsg);
						 		}
						 	 }
						 	}
						 	catch(Exception e)
						 	{
						 		System.out.println("----->>"+e);
						 		e.printStackTrace();
						 		sendMsg="Please try again ";
						 	}
						 	
						    //end of if 
				//	} // for loop end here	
			}
		 	catch(Exception e)
		 	{
		 		System.out.println("Exception Copy File to FTP----------->>"+e);
		 	} 
	
	}
	
//String empId=request.getParameter("");
/*if(salary=="Yes"||salary.contains("Yes")||salary.equals("Yes"))
{
	basic=request.getParameter("basic");
	tds=request.getParameter("tds");
	net=request.getParameter("net");
	allow=request.getParameter("allow");
}*/



	conn.close();
	
%>
</body>
</html>