<%@ include file="headConn.jsp"%>

<%
Connection con1 = null;
%>
<%
try 
{
System.out.println("\n>>>>>$$$$$$$$$$$$$>>>In AjaxDepartmentDelete.jsp>>>>>>>>>>>>>>>>");	
Statement stmt1 = conn.createStatement();
Statement stmt2 = conn.createStatement();
Statement stmt3 = conn.createStatement();
Statement stmt4 = conn.createStatement();
List<String> myList = new ArrayList<String>();


String SqlDeleteMaster="",SqlClaimDet="",sql="",sql1="";
String cmnycode="",empid="",salutation="-",empname="-",deptid="",empemail="",designtion="",fstname="",mddlnm="",lastname="",twempid="",empcntctno="",date_brth="",maart_stts="",DateOfAnniversary="",KidsDetails="",Child1Sex="",Child2Sex="",Child1Name="",Child2Name="",Child1DOB="",Child2DOB="",AddressEmp="",SalaryDetails="",BasicSalarary="",TDS="",	NetPay="",Allowance="",Allowance1="",Allowance2="",Allowance3="",Allowance4="",deduction="",deduction1="",deduction2="",deduction3="",deduction4="",PreviousPay="",AccNo="",BankName="",BankBranch="",IFSC="",PanNo="",	PolicyNo="",NameOfClaimCompany="", 	ExpiryDateClaim="", 	ClaimAmount="", 	ContactImeediate="",ContactNoImmediate="",AddressContact="",RelationShip="",EnterBy="", 	EnteredDateTime="", 	ModifiedBy="",EditDateTime="",DateofJoining="",ContractDate="",ContractExpDate="",MediclaimFileName="", 	ContractFileName="",Status="",Status1="";
String udeptcode="";
List<Integer> deptcodearr = new ArrayList<Integer>();
//int [] deptcodearr=new int( myList.size());//(myList.size());
//myList.toArray(new String[myList.size()]);
String id=request.getParameter("id");
String companycode=request.getParameter("companycode");
System.out.println(">>>>>>>>id:"+id+"company code:--->"+companycode);


if(request.getParameter("action").equals("delete"))
{
	String underdeptcodesql="select underdeptcode from t_department where deptcode='"+id+"'";
	
	ResultSet rs2=  stmt2.executeQuery(underdeptcodesql);
	System.out.println(">>>>>>>>SqlUndptCode Sql:"+underdeptcodesql);
	while(rs2.next())
	{
		udeptcode=rs2.getString("underdeptcode");
	}
	
	System.out.println(">>>>>>>>Under Dept Code:"+udeptcode);
	
String deptcodesql="select deptcode from t_department where underdeptcode='"+id+"'";
	int i=0;
	ResultSet rs3=  stmt3.executeQuery(deptcodesql);
	System.out.println(">>>>>>>>Sql dptCode Sql:"+deptcodesql);
	while(rs3.next())
	{
		deptcodearr.add(rs3.getInt("deptcode"));
		System.out.println("dept code array--->"+deptcodearr);
		//i++;
	}
	System.out.println("dept code array Size--->"+deptcodearr.size());
	for(int j=0;j<deptcodearr.size();j++)
	{
	System.out.println("values of dept code"+deptcodearr.get(j));
	
	String updateqry="update t_department SET underdeptcode='"+udeptcode+"' where deptcode='"+deptcodearr.get(j)+"'";
	int flg=stmt4.executeUpdate(updateqry);
	System.out.println("update qry--->"+updateqry+"flag value----->"+flg);
	
	
	}
	
	
	
	
	 String SqlUpdate="UPDATE t_department SET Status ='Deactive' WHERE DeptCode='"+id+"' and ComapanyCode='"+companycode+"' limit 1 ";
	System.out.println(">>>>>>>>SqlDeleteMaster:"+SqlUpdate);
	stmt1.executeUpdate(SqlUpdate);
	
	




	out.println("Yes");
	
}

} 
catch (Exception e) {
System.out.println("AjaxDepartmentDelete.jsp error  table > "+e);
out.println("NO");
} finally {
	con1.close();

}

%>