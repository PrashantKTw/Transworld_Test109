
<%@ page import="java.sql.* "%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%@ page
	import="java.util.Properties,javax.mail.*,javax.mail.internet.*"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import=" java.io.IOException"%>
<%@ page import="javax.activation.*"%>


<% 
Connection conn=null;
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","erp","1@erp");
//conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","fleetview","F@5a<I86");
}
catch(Exception e)
{
	System.out.println("Exception=========>>"+e);
}
	String s_board="";
	String s_year="";
	String s_spe="";
	String s_marks="";
String h_board="";
String h_year="";
String h_spe="";
String h_marks="";
		String g_board="";
		String g_year="";
		String g_spe="";
		String g_marks="";
 		String p_board="";
			String p_year="";
			String p_spe="";
			String p_marks="";
			
			
			
			String inst1="";
			 String year1="";
			 String spe1="";
			 String marks1="";
			 		String inst2="";
			 		String year2="";
			 		String spe2="";
			 		String marks2="";
			 	String inst3="";
			 	String year3="";
			 	String spe3="";
			 	String marks3="";
			 String inst4="";
			 String year4="";
			 String spe4="";
			 String marks4="";
			 	String inst5="";
			 	String year5="";
			 	String spe5="";
			 	String marks5="";
			 		String inst6="";
			 		String year6="";
					String spe6="";
			 		String marks6="";
			 String inst7="";
			 String year7="";
			 String spe7="";
			 String marks7="";
			 	String inst8="";
				String year8="";
			 	String spe8="";
			 	String marks8="";
			 String inst9="";
			 String year9="";
			 String spe9="";
			 String marks9="";
			 	String inst10="";
			 	String year10="";
				String spe10="";
			 	String marks10="";
			 	
			 	
			 	String comp1="";
			 	 String post1="";
			 	 String sal1="";
			 	 String reason1="";
			 	 String from_date1="";
			 	 String to_date1="";
			 	 	String comp2="";
			 	 	String post2="";
			 	 	String sal2="";
			 	 	String reason2="";
			 	 	String from_date2="";
			 	 	String to_date2="";
			 	 String comp3="";
			 	 String post3="";
			 	 String sal3="";
			 	 String reason3="";
			 	 String from_date3="";
			 	 String to_date3="";
			 	 	String comp4="";
			 	 	String post4="";
			 	 	String sal4="";
			 	 	String reason4="";
			 	 	String from_date4="";
			 	 	String to_date4="";
			 	 String comp5="";
			 	 String post5="";
			 	 String sal5="";
			 	 String reason5="";
			 	 String from_date5="";
			 	 String to_date5="";
			 	 	String comp6="";
			 	 	String post6="";
			 	 	String sal6="";
			 	 	String reason6="";
			 	 	String from_date6="";
			 	 	String to_date6="";
			 	 String comp7="";
			 	 String post7="";
			 	 String sal7="";
			 	 String reason7="";
			 	 String from_date7="";
			 	 String to_date7="";
			 	 	String comp8="";
			 		 String post8="";
			 	 	String sal8="";
			 	 	String reason8="";
			 	 	String from_date8="";
			 	 	String to_date8="";
			 	 String comp9="";
			 	 String post9="";
			 	 String sal9="";
			 	 String reason9="";
			 	 String from_date9="";
			 	 String to_date9="";
			 	 	String comp10="";
			 	 	String post10="";
			 	 	String sal10="";
			 	 	String reason10="";
			 	 	String from_date10="";
			 	 	String to_date10="";
			 	 
String ms_office="";
String windows="";
String autocad="";
String tally="";
String typing="";
String shorthand="";
String other="";
String english="";
String achievements="";
String seeafter5="";
String strengths="";
String curricular="";
String exp_sal="";
String benefit="";
String leaving_reason="";
String health_prob="";
String litigation="";
String police_record="";
String reference="";
String emp_id = "";

int saveflag=1;
File savedFile;
String[] filepath =new String[10];
String[] filename =new String[10];
String savefilestring="";
int  count2 = 0, filecount = 0, count4 = 0, count5 = 0,count6 = 0,complaintID=0;
Boolean innerflag=false;
Boolean flag=false;
Writer output = null;


 int count=1;

int count1=0;




boolean isMultipart = ServletFileUpload.isMultipartContent(request);
System.out.println("\n\n ismultipart-->>"+isMultipart);
        if (!isMultipart) {
        System.out.println("\n\nin multipart..");
        } else {
                System.out.println("\n\n in else with  multipart..");
                FileItemFactory factory = new DiskFileItemFactory();
                //System.out.print("\n\nfactory==>"+factory);
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                        items = upload.parseRequest(request);
                //      System.out.print("\n\n items==>"+items);
                } catch (FileUploadException e) {
                        e.printStackTrace();
                }
                Iterator itr = items.iterator();
        
        while (itr.hasNext()) {
                        FileItem item = (FileItem) itr.next();
                        if(item.isFormField()) 
                        {
                                String name1 = item.getFieldName();
                                System.out.print("\n name==>"+name1);
                                String value = item.getString();
                                System.out.print("\n value==>"+value);
                                if(name1.equals("emp_id")) 
                                {
                                	emp_id = value;
                                        System.out.print("\n emp_id==>"+emp_id);
                                        
                                        count1++;
                                }
                                if(name1.equals("s_board")) 
                                {
                                	s_board = value;
                                        System.out.print("\n s_board==>"+s_board);
                                        
                                        count1++;
                                }
                                if(name1.equals("s_year")) 
                                {
                                	s_year = value;
                                        System.out.print("\n s_year==>"+s_year);
                                        
                                        count1++;
                                }
                                if(name1.equals("s_spe")) 
                                {
                                	s_spe = value;
                                        System.out.print("\n s_spe==>"+s_spe);
                                        count1++;
                                }
                                if(name1.equals("s_marks")) 
                                {
                                	s_marks = value;
                                        System.out.print("\n s_marks==>"+s_marks);
                                        count1++;
                                }
                                if(name1.equals("h_board")) 
                                {
                                	h_board= value;
                                        System.out.print("\n h_board=>"+h_board);
                                        
                                        count1++;
                                }
                                if(name1.equals("h_year")) 
                                {
                                	h_year = value;
                                        System.out.print("\n h_year==>"+h_year);
                                        
                                        count1++;
                                }
                                if(name1.equals("h_spe")) 
                                {
                                	h_spe = value;
                                        System.out.print("\n h_spe==>"+h_spe);
                                        count1++;
                                }
                                if(name1.equals("h_marks")) 
                                {
                                	h_marks = value;
                                        System.out.print("\n h_marks==>"+h_marks);
                                        count1++;
                                }
                                if(name1.equals("g_board")) 
                                {
                                	g_board = value;
                                        System.out.print("\n g_board==>"+g_board);
                                        
                                        count1++;
                                }
                                if(name1.equals("g_year")) 
                                {
                                	g_year = value;
                                        System.out.print("\n g_year==>"+g_year);
                                        
                                        count1++;
                                }
                                if(name1.equals("g_spe")) 
                                {
                                	g_spe = value;
                                        System.out.print("\n g_spe==>"+g_spe);
                                        count1++;
                                }
                                if(name1.equals("g_marks")) 
                                {
                                	g_marks = value;
                                        System.out.print("\n g_marks==>"+g_marks);
                                        count1++;
                                }
                                if(name1.equals("p_board")) 
                                {
                                	p_board = value;
                                        System.out.print("\n p_board==>"+p_board);
                                        
                                        count1++;
                                }
                                if(name1.equals("p_year")) 
                                {
                                	p_year = value;
                                        System.out.print("\n p_year==>"+p_year);
                                        
                                        count1++;
                                }
                                if(name1.equals("p_spe")) 
                                {
                                	p_spe = value;
                                        System.out.print("\n p_spe==>"+p_spe);
                                        count1++;
                                }
                                if(name1.equals("p_marks")) 
                                {
                                	p_marks = value;
                                        System.out.print("\n p_marks==>"+p_marks);
                                        count1++;
                                }
                                if(name1.equals("inst1")) 
                                {
                                	inst1 = value;
                                        System.out.print("\n inst1==>"+inst1);
                                        count1++;
                                }
                                if(name1.equals("year1")) 
                                {
                                	year1 = value;
                                        System.out.print("\n year1==>"+year1);
                                        count1++;
                                }
                                if(name1.equals("spe1")) 
                                {
                                	spe1 = value;
                                        System.out.print("\n spe1==>"+spe1);
                                        count1++;
                                }
                                if(name1.equals("marks1")) 
                                {
                                	marks1 = value;
                                        System.out.print("\n marks1==>"+marks1);
                                        count1++;
                                }
                                if(name1.equals("inst2")) 
                                {
                                	inst2 = value;
                                        System.out.print("\n inst2==>"+inst2);
                                        count1++;
                                }
                                if(name1.equals("year2")) 
                                {
                                	year2 = value;
                                        System.out.print("\n year2==>"+year2);
                                        count1++;
                                }
                                if(name1.equals("spe2")) 
                                {
                                	spe2 = value;
                                        System.out.print("\n spe2==>"+spe2);
                                        count1++;
                                }
                                if(name1.equals("marks2")) 
                                {
                                	marks2 = value;
                                        System.out.print("\n marks2==>"+marks2);
                                        count1++;
                                }
                                if(name1.equals("inst3")) 
                                {
                                	inst3 = value;
                                        System.out.print("\n inst3==>"+inst3);
                                        count1++;
                                }
                                if(name1.equals("year3")) 
                                {
                                	year3 = value;
                                        System.out.print("\n year3==>"+year3);
                                        count1++;
                                }
                                if(name1.equals("spe3")) 
                                {
                                	spe3 = value;
                                        System.out.print("\n spe3==>"+spe3);
                                        count1++;
                                }
                                if(name1.equals("marks3")) 
                                {
                                	marks3 = value;
                                        System.out.print("\n marks3==>"+marks3);
                                        count1++;
                                }
                                if(name1.equals("inst4")) 
                                {
                                	inst4 = value;
                                        System.out.print("\n inst4==>"+inst4);
                                        count1++;
                                }
                                if(name1.equals("year4")) 
                                {
                                	year4 = value;
                                        System.out.print("\n year4==>"+year4);
                                        count1++;
                                }
                                if(name1.equals("spe4")) 
                                {
                                	spe4 = value;
                                        System.out.print("\n spe4==>"+spe4);
                                        count1++;
                                }
                                if(name1.equals("marks4")) 
                                {
                                	marks4 = value;
                                        System.out.print("\n marks4==>"+marks4);
                                        count1++;
                                }
                                if(name1.equals("inst5")) 
                                {
                                	inst5 = value;
                                        System.out.print("\n inst5==>"+inst5);
                                        count1++;
                                }
                                if(name1.equals("year5")) 
                                {
                                	year5 = value;
                                        System.out.print("\n year5==>"+year5);
                                        count1++;
                                }
                                if(name1.equals("spe5")) 
                                {
                                	spe5 = value;
                                        System.out.print("\n spe5==>"+spe5);
                                        count1++;
                                }
                                if(name1.equals("marks5")) 
                                {
                                	marks5 = value;
                                        System.out.print("\n marks5==>"+marks5);
                                        count1++;
                                }
                                if(name1.equals("inst6")) 
                                {
                                	inst6 = value;
                                        System.out.print("\n inst6==>"+inst6);
                                        count1++;
                                }
                                if(name1.equals("year6")) 
                                {
                                	year6 = value;
                                        System.out.print("\n year6==>"+year6);
                                        count1++;
                                }
                                if(name1.equals("spe6")) 
                                {
                                	spe6 = value;
                                        System.out.print("\n spe6==>"+spe6);
                                        count1++;
                                }
                                if(name1.equals("marks6")) 
                                {
                                	marks6 = value;
                                        System.out.print("\n marks6==>"+marks6);
                                        count1++;
                                }
                                if(name1.equals("inst7")) 
                                {
                                	inst7 = value;
                                        System.out.print("\n inst7==>"+inst7);
                                        count1++;
                                }
                                if(name1.equals("year7")) 
                                {
                                	year7 = value;
                                        System.out.print("\n year7==>"+year7);
                                        count1++;
                                }
                                if(name1.equals("spe7")) 
                                {
                                	spe7 = value;
                                        System.out.print("\n spe7==>"+spe7);
                                        count1++;
                                }
                                if(name1.equals("marks7")) 
                                {
                                	marks7 = value;
                                        System.out.print("\n marks7==>"+marks7);
                                        count1++;
                                }
                                if(name1.equals("inst8")) 
                                {
                                	inst8 = value;
                                        System.out.print("\n inst8==>"+inst8);
                                        count1++;
                                }
                                if(name1.equals("year8")) 
                                {
                                	year8 = value;
                                        System.out.print("\n year8==>"+year8);
                                        count1++;
                                }
                                if(name1.equals("spe8")) 
                                {
                                	spe8 = value;
                                        System.out.print("\n spe8==>"+spe8);
                                        count1++;
                                }
                                if(name1.equals("marks8")) 
                                {
                                	marks8 = value;
                                        System.out.print("\n marks8==>"+marks8);
                                        count1++;
                                }
                                if(name1.equals("inst9")) 
                                {
                                	inst9 = value;
                                        System.out.print("\n inst9==>"+inst9);
                                        count1++;
                                }
                                if(name1.equals("year9")) 
                                {
                                	year9 = value;
                                        System.out.print("\n year9==>"+year9);
                                        count1++;
                                }
                                if(name1.equals("spe9")) 
                                {
                                	spe9 = value;
                                        System.out.print("\n spe9==>"+spe9);
                                        count1++;
                                }
                                if(name1.equals("marks9")) 
                                {
                                	marks9 = value;
                                        System.out.print("\n marks9==>"+marks9);
                                        count1++;
                                }
                                if(name1.equals("inst10")) 
                                {
                                	inst10 = value;
                                        System.out.print("\n inst10==>"+inst10);
                                        count1++;
                                }
                                if(name1.equals("year10")) 
                                {
                                	year10 = value;
                                        System.out.print("\n year10==>"+year10);
                                        count1++;
                                }
                                if(name1.equals("spe10")) 
                                {
                                	spe10 = value;
                                        System.out.print("\n spe10==>"+spe10);
                                        count1++;
                                }
                                if(name1.equals("marks10")) 
                                {
                                	marks10 = value;
                                        System.out.print("\n marks10==>"+marks10);
                                        count1++;
                                }
                                if(name1.equals("comp1")) 
                                {
                                	comp1 = value;
                                        System.out.print("\n comp1==>"+comp1);
                                        count1++;
                                }
                                if(name1.equals("post1")) 
                                {
                                	post1 = value;
                                        System.out.print("\n post1==>"+post1);
                                        count1++;
                                }
                                if(name1.equals("sal1")) 
                                {
                                	sal1 = value;
                                        System.out.print("\n sal1==>"+sal1);
                                        count1++;
                                }
                                if(name1.equals("reason1")) 
                                {
                                	reason1 = value;
                                        System.out.print("\n reason1==>"+reason1);
                                        count1++;
                                }
                               	if(name1.equals("from_date1")) 
                                {
                               		from_date1 = value;
                                        System.out.print("\n from_date1==>"+from_date1);
                                        
                                        count1++;
                                }
                               	if(name1.equals("to_date1")) 
                                {
                                		to_date1 = value;
                                        System.out.print("\n to_date1==>"+to_date1);
                                        count1++;
                                }
                                if(name1.equals("comp2")) 
                                {
                                	comp2 = value;
                                        System.out.print("\n comp2==>"+comp2);
                                        count1++;
                                }
                                if(name1.equals("post2")) 
                                {
                                	post2 = value;
                                        System.out.print("\n post2==>"+post2);
                                        count1++;
                                }
                                if(name1.equals("sal2")) 
                                {
                                	sal2 = value;
                                        System.out.print("\n sal2==>"+sal2);
                                        count1++;
                                }
                                if(name1.equals("reason2")) 
                                {
                                	reason2 = value;
                                        System.out.print("\n reason2==>"+reason2);
                                        count1++;
                                }
                               	if(name1.equals("from_date2")) 
                                {
                               		from_date2 = value;
                                        System.out.print("\n from_date2==>"+from_date2);
                                        
                                        count1++;
                                }
                                if(name1.equals("to_date2")) 
                                {
                                	to_date2 = value;
                                        System.out.print("\n to_date2==>"+to_date2);
                                        
                                        count1++;
                                }
                                if(name1.equals("comp3")) 
                                {
                                	comp3 = value;
                                        System.out.print("\n comp3==>"+comp3);
                                        count1++;
                                }
                                if(name1.equals("post3")) 
                                {
                                	post3 = value;
                                        System.out.print("\n post3==>"+post3);
                                        count1++;
                                }
                                if(name1.equals("sal3")) 
                                {
                                	sal3 = value;
                                        System.out.print("\n sal3==>"+sal3);
                                        count1++;
                                }
                                if(name1.equals("reason3")) 
                                {
                                	reason3 = value;
                                        System.out.print("\n reason3==>"+reason3);
                                        count1++;
                                }
                               	if(name1.equals("from_date3")) 
                                {
                               		from_date3 = value;
                                        System.out.print("\n from_date3==>"+from_date3);
                                        
                                        count1++;
                                }
                                if(name1.equals("to_date3")) 
                                {
                                	to_date3 = value;
                                        System.out.print("\n to_date3==>"+to_date3);
                                        
                                        count1++;
                                }
                                if(name1.equals("comp4")) 
                                {
                                	comp4 = value;
                                        System.out.print("\n comp4==>"+comp4);
                                        count1++;
                                }
                                if(name1.equals("post4")) 
                                {
                                	post4 = value;
                                        System.out.print("\n post4==>"+post4);
                                        count1++;
                                }
                                if(name1.equals("sal4")) 
                                {
                                	sal4 = value;
                                        System.out.print("\n sal4==>"+sal4);
                                        count1++;
                                }
                                if(name1.equals("reason4")) 
                                {
                                	reason4 = value;
                                        System.out.print("\n reason4==>"+reason4);
                                        count1++;
                                }
                               	if(name1.equals("from_date4")) 
                                {
                               		from_date4 = value;
                                        System.out.print("\n from_date4==>"+from_date4);
                                        
                                        count1++;
                                }
                                if(name1.equals("to_date4")) 
                                {
                                	to_date4 = value;
                                        System.out.print("\n to_date4==>"+to_date4);
                                        
                                        count1++;
                                }
                                if(name1.equals("comp5")) 
                                {
                                	comp5 = value;
                                        System.out.print("\n comp5==>"+comp5);
                                        count1++;
                                }
                                if(name1.equals("post5")) 
                                {
                                	post5 = value;
                                        System.out.print("\n post5==>"+post5);
                                        count1++;
                                }
                                if(name1.equals("sal5")) 
                                {
                                	sal5 = value;
                                        System.out.print("\n sal5==>"+sal5);
                                        count1++;
                                }
                                if(name1.equals("reason5")) 
                                {
                                	reason5 = value;
                                        System.out.print("\n reason5==>"+reason5);
                                        count1++;
                                }
                               	if(name1.equals("from_date5")) 
                                {
                               		from_date5 = value;
                                        System.out.print("\n from_date5==>"+from_date5);
                                        
                                        count1++;
                                }
                                if(name1.equals("to_date5")) 
                                {
                                	to_date5 = value;
                                        System.out.print("\n to_date5==>"+to_date5);
                                        
                                        count1++;
                                }
                                if(name1.equals("comp6")) 
                                {
                                	comp6 = value;
                                        System.out.print("\n comp6==>"+comp6);
                                        count1++;
                                }
                                if(name1.equals("post6")) 
                                {
                                	post6 = value;
                                        System.out.print("\n post6==>"+post6);
                                        count1++;
                                }
                                if(name1.equals("sal6")) 
                                {
                                	sal6 = value;
                                        System.out.print("\n sal6==>"+sal6);
                                        count1++;
                                }
                                if(name1.equals("reason6")) 
                                {
                                	reason6 = value;
                                        System.out.print("\n reason6==>"+reason6);
                                        count1++;
                                }
                               	if(name1.equals("from_date6")) 
                                {
                               		from_date6 = value;
                                        System.out.print("\n from_date6==>"+from_date6);
                                        
                                        count1++;
                                }
                                if(name1.equals("to_date6")) 
                                {
                                	to_date6 = value;
                                        System.out.print("\n to_date6==>"+to_date6);
                                        
                                        count1++;
                                }
                                if(name1.equals("comp7")) 
                                {
                                	comp7 = value;
                                        System.out.print("\n comp7==>"+comp7);
                                        count1++;
                                }
                                if(name1.equals("post7")) 
                                {
                                	post7 = value;
                                        System.out.print("\n post7==>"+post7);
                                        count1++;
                                }
                                if(name1.equals("sal7")) 
                                {
                                	sal7 = value;
                                        System.out.print("\n sal7==>"+sal7);
                                        count1++;
                                }
                                if(name1.equals("reason7")) 
                                {
                                	reason7 = value;
                                        System.out.print("\n reason7==>"+reason7);
                                        count1++;
                                }
                               	if(name1.equals("from_date7")) 
                                {
                               		from_date7 = value;
                                        System.out.print("\n from_date7==>"+from_date7);
                                        
                                        count1++;
                                }
                                if(name1.equals("to_date7")) 
                                {
                                	to_date7 = value;
                                        System.out.print("\n to_date7==>"+to_date7);
                                        
                                        count1++;
                                }
                                if(name1.equals("comp8")) 
                                {
                                	comp8 = value;
                                        System.out.print("\n comp8==>"+comp8);
                                        count1++;
                                }
                                if(name1.equals("post8")) 
                                {
                                	post8 = value;
                                        System.out.print("\n post8==>"+post8);
                                        count1++;
                                }
                                if(name1.equals("sal8")) 
                                {
                                	sal8 = value;
                                        System.out.print("\n sal8==>"+sal8);
                                        count1++;
                                }
                                if(name1.equals("reason8")) 
                                {
                                	reason8 = value;
                                        System.out.print("\n reason8==>"+reason8);
                                        count1++;
                                }
                               	if(name1.equals("from_date8")) 
                                {
                               		from_date8 = value;
                                        System.out.print("\n from_date8==>"+from_date8);
                                        
                                        count1++;
                                }
                                if(name1.equals("to_date8")) 
                                {
                                	to_date8 = value;
                                        System.out.print("\n to_date8==>"+to_date8);
                                        
                                        count1++;
                                }
                                if(name1.equals("comp9")) 
                                {
                                	comp9 = value;
                                        System.out.print("\n comp9==>"+comp9);
                                        count1++;
                                }
                                if(name1.equals("post9")) 
                                {
                                	post9 = value;
                                        System.out.print("\n post9==>"+post9);
                                        count1++;
                                }
                                if(name1.equals("sal9")) 
                                {
                                	sal9 = value;
                                        System.out.print("\n sal9==>"+sal9);
                                        count1++;
                                }
                                if(name1.equals("reason9")) 
                                {
                                	reason9 = value;
                                        System.out.print("\n reason9==>"+reason9);
                                        count1++;
                                }
                               	if(name1.equals("from_date9")) 
                                {
                               		from_date9 = value;
                                        System.out.print("\n from_date9==>"+from_date9);
                                        
                                        count1++;
                                }
                                if(name1.equals("to_date9")) 
                                {
                                	to_date9 = value;
                                        System.out.print("\n to_date9==>"+to_date9);
                                        
                                        count1++;
                                }
                                if(name1.equals("comp10")) 
                                {
                                	comp10 = value;
                                        System.out.print("\n comp10==>"+comp10);
                                        count1++;
                                }
                                if(name1.equals("post10")) 
                                {
                                	post10 = value;
                                        System.out.print("\n post10==>"+post10);
                                        count1++;
                                }
                                if(name1.equals("sal10")) 
                                {
                                	sal10 = value;
                                        System.out.print("\n sal10==>"+sal10);
                                        count1++;
                                }
                                if(name1.equals("reason10")) 
                                {
                                	reason10 = value;
                                        System.out.print("\n reason10==>"+reason10);
                                        count1++;
                                }
                               	if(name1.equals("from_date10")) 
                                {
                               		from_date10 = value;
                                        System.out.print("\n from_date10==>"+from_date10);
                                        
                                        count1++;
                                }
                                if(name1.equals("to_date10")) 
                                {
                                	to_date10 = value;
                                        System.out.print("\n to_date10==>"+to_date10);
                                        
                                        count1++;
                                }
                                if(name1.equals("ms_office")) 
                                {
                                	ms_office = value;
                                        System.out.print("\n ms_office==>"+ms_office);
                                        count1++;
                                }
                                if(name1.equals("windows")) 
                                {
                                	windows = value;
                                        System.out.print("\n windows==>"+windows);
                                        count1++;
                                }
                                if(name1.equals("autocad")) 
                                {
                                	autocad = value;
                                        System.out.print("\n autocad==>"+autocad);
                                        count1++;
								}
                                if(name1.equals("tally")) 
                                {
                                	tally = value;
                                        System.out.print("\n tally==>"+tally);
                                        count1++;
								}
                                if(name1.equals("typing")) 
                                {
                                	typing = value;
                                        System.out.print("\n typing==>"+typing);
                                        count1++;
								}
                                if(name1.equals("shorthand")) 
                                {
                                	shorthand = value;
                                        System.out.print("\n shorthand==>"+shorthand);
                                        count1++;
								}
                                if(name1.equals("other")) 
                                {
                                	other = value;
                                        System.out.print("\n other==>"+other);
                                        count1++;
								}
                                if(name1.equals("english")) 
                                {
                                	english = value;
                                        System.out.print("\n english==>"+english);
                                        count1++;
								}
                                if(name1.equals("achievements")) 
                                {
                                	achievements = value;
                                        System.out.print("\n achievements==>"+achievements);
                                        count1++;
								}
                                if(name1.equals("seeafter5")) 
                                {
                                	seeafter5 = value;
                                        System.out.print("\n seeafter5==>"+seeafter5);
                                        count1++;
								}
                                if(name1.equals("strengths")) 
                                {
                                	strengths = value;
                                        System.out.print("\n strengths==>"+strengths);
                                        count1++;
								}
                                if(name1.equals("curricular")) 
                                {
                                	curricular = value;
                                        System.out.print("\n curricular==>"+curricular);
                                        count1++;
								}
                                if(name1.equals("exp_sal")) 
                                {
                                	exp_sal = value;
                                        System.out.print("\n exp_sal==>"+exp_sal);
                                        count1++;
								}
                                if(name1.equals("benefit")) 
                                {
                                	benefit = value;
                                        System.out.print("\n benefit==>"+benefit);
                                        count1++;
								}
                                if(name1.equals("leaving_reason")) 
                                {
                                	leaving_reason = value;
                                        System.out.print("\n leaving_reason==>"+leaving_reason);
                                        count1++;
								}
                                if(name1.equals("health_prob")) 
                                {
                                	health_prob = value;
                                        System.out.print("\n health_prob==>"+health_prob);
                                        count1++;
								}
                                if(name1.equals("litigation")) 
                                {
                                	litigation = value;
                                        System.out.print("\n litigation==>"+litigation);
                                        count1++;
								}
                                if(name1.equals("police_record")) 
                                {
                                	police_record = value;
                                        System.out.print("\n police_record==>"+exp_sal);
                                        count1++;
								}
                                if(name1.equals("reference")) 
                                {
                                	reference = value;
                                        System.out.print("\n reference==>"+reference);
                                        count1++;
								}
                                
                                
                                //System.out.println("\n $$$$$$$$$$$$$ "+PageName);

                        } else {
                                       try {

                                             String itemName = item.getName();
                                             System.out.print("\n\nitemName==>"+itemName);
                                              if(itemName.equalsIgnoreCase(""))
                                              {
                                              }
                                            else
                                             {
                                             try
                                             {
                                            	 System.out.println("in doc uploading");
                                            	 String FileUploadPath =getServletContext().getInitParameter("configuredUploadDir"); 
                                            	 System.out.println("in doc uploading 1");
                                            	 File uploadDir = new File(FileUploadPath);
                                            	 System.out.println("in doc uploading 2");
                                            	savedFile = new File(FileUploadPath+"/"+itemName);
                                            	 System.out.println("in doc uploading 3");
                                         		// savedFile = new File("/home/a_bhardwaj/Desktop/Documents/"+itemName);
                                                                System.out.print("\n\nsavedFile==>"+savedFile);
                                                                item.write(savedFile);
                                                                filepath[filecount]=""+savedFile;
                                                                
                                                                filename[filecount]=itemName;
                                                                filecount++;
                                                                if(saveflag==1)
                                                                {
                                                                 savefilestring=""+savedFile;
                                                                // saveflag++;
                                                                }
                                                                else
                                                                savefilestring=savefilestring+","+savedFile;
                                                                 //out.print("successfully saved the file");
                                                                //File file = new File(savedFile);
                                                                String screenshot=savedFile.getAbsolutePath();
                                                       			System.out.println("\n\nscreenshot--->>>"+screenshot);
                                                                
                                                       			
                                                       				
                                             }
                                             catch(Exception e)
                                             {
                                            	 System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&>>>>>"+e);
                                             }
                                             					
                                             					}
                                                        
                                                        
                                        } catch (Exception e) {
                                                e.printStackTrace();
                                        }
                        }
                }
        
        
        try { 
       
        
       
       Statement st14 = conn.createStatement();
       Statement st15 = conn.createStatement();
       Statement st16 = conn.createStatement();
       Statement st17 = conn.createStatement();
       
       
       
       Statement st1 = conn.createStatement();
       Statement st5 = conn.createStatement();
       Statement st6 = conn.createStatement();
       Statement st7 = conn.createStatement();
       Statement st8 = conn.createStatement();
       Statement st9 = conn.createStatement();
       Statement st10 = conn.createStatement();
       Statement st11= conn.createStatement();
       Statement st12= conn.createStatement();
       Statement st13 = conn.createStatement();
       
       
      Statement st2 = conn.createStatement();
       Statement st18 = conn.createStatement();
        Statement st19 = conn.createStatement();
         Statement st20 = conn.createStatement();
          Statement st21 = conn.createStatement();
           Statement st22 = conn.createStatement();
            Statement st23 = conn.createStatement();
             Statement st24 = conn.createStatement();
              Statement st25 = conn.createStatement();
               Statement st26 = conn.createStatement();
      
      
      
               System.out.println("************  in else  "+marks1);
       Statement st3 = conn.createStatement();
       Statement st4 = conn.createStatement();
		System.out.println("####### inst3:"+inst3);
       
       String query14 = "insert into t_empeduqualification(EmpID,Degree,Board,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','S.S.C','"+s_board+"','"+s_year+"','"+s_spe+"','"+s_marks+"')";
       st14.executeUpdate(query14);
       String query15 = "insert into t_empeduqualification(EmpID,Degree,Board,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','H.S.C','"+h_board+"','"+h_year+"','"+h_spe+"','"+h_marks+"')";
       st15.executeUpdate(query15);
      
       if(g_board== null || g_board.equalsIgnoreCase(null)|| g_board == "" || g_board.equalsIgnoreCase(""))
       {}
       else {
    	   String query16 = "insert into t_empeduqualification(EmpID,Degree,Board,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','Graduation','"+g_board+"','"+g_year+"','"+g_spe+"','"+g_marks+"')";
       	st16.executeUpdate(query16);
      }
       
       
       if(p_board== null || p_board.equalsIgnoreCase(null)|| p_board == "" || p_board.equalsIgnoreCase(""))
       {}
       else {
       	String query17 = "insert into t_empeduqualification(EmpID,Degree,Board,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','Post Graduation','"+p_board+"','"+p_year+"','"+p_spe+"','"+p_marks+"')";
       	st17.executeUpdate(query17);
      }
       
       				if(inst1== null || inst1.equalsIgnoreCase(null)|| inst1 == "" || inst1.equalsIgnoreCase("")) 
       				{
       					System.out.println("************  in if  "+inst1);
       				}
       				else
       				{
       					System.out.println("************  in else  "+marks1);
       				String query1 = "insert into t_empadditionalQualification(EmpID,Institute,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','"+inst1+"','"+year1+"','"+spe1+"','"+marks1+"')";
       			 	st1.executeUpdate(query1);
       			 	System.out.println("query is:"+query1);
       			 	}
       				if(inst2== null || inst2.equalsIgnoreCase(null)|| inst2 == "" || inst2.equalsIgnoreCase(""))  
       				{}
       				else {
       				String query5 = "insert into t_empadditionalQualification(EmpID,Institute,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','"+inst2+"','"+year2+"','"+spe2+"','"+marks2+"')";
       			 	st5.executeUpdate(query5);
       				}
       				if(inst3== null || inst3.equalsIgnoreCase(null)|| inst3 == "" || inst3.equalsIgnoreCase(""))  
       				{}
       				else {
       				String query6 = "insert into t_empadditionalQualification(EmpID,Institute,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','"+inst3+"','"+year3+"','"+spe3+"','"+marks3+"')";
       				st6.executeUpdate(query6);
       				}
       				if(inst4== null || inst4.equalsIgnoreCase(null)|| inst4 == "" || inst4.equalsIgnoreCase(""))  
       				{}
       				else {
       				String query7 = "insert into t_empadditionalQualification(EmpID,Institute,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','"+inst4+"','"+year4+"','"+spe4+"','"+marks4+"')";
       				st7.executeUpdate(query7);
       				}
       				if(inst5== null || inst5.equalsIgnoreCase(null)|| inst5 == "" || inst5.equalsIgnoreCase(""))  
       				{}
       				else {
       				String query8 = "insert into t_empadditionalQualification(EmpID,Institute,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','"+inst5+"','"+year5+"','"+spe5+"','"+marks5+"')";
       				st8.executeUpdate(query8);
       				}
       				if(inst6== null || inst6.equalsIgnoreCase(null)|| inst6 == "" || inst6.equalsIgnoreCase(""))  
       				{}
       				else {
       				String query9 = "insert into t_empadditionalQualification(EmpID,Institute,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','"+inst6+"','"+year6+"','"+spe6+"','"+marks6+"')";
       				st9.executeUpdate(query9);
       				}
       				if(inst7== null || inst7.equalsIgnoreCase(null)|| inst7 == "" || inst7.equalsIgnoreCase(""))  
       				{}
       				else {
       				String query10 = "insert into t_empadditionalQualification(EmpID,Institute,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','"+inst7+"','"+year7+"','"+spe7+"','"+marks7+"')";
       				st10.executeUpdate(query10);
       				}
       				if(inst8== null || inst8.equalsIgnoreCase(null)|| inst8 == "" || inst8.equalsIgnoreCase(""))  
       				{}       				
       				else {
       				String query11 = "insert into t_empadditionalQualification(EmpID,Institute,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','"+inst8+"','"+year8+"','"+spe8+"','"+marks8+"')";
       				st11.executeUpdate(query11);
       				}
       				if(inst9== null || inst9.equalsIgnoreCase(null)|| inst9 == "" || inst9.equalsIgnoreCase(""))  
       				{}
       				else {
       				String query12 = "insert into t_empadditionalQualification(EmpID,Institute,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','"+inst9+"','"+year9+"','"+spe9+"','"+marks9+"')";
       				st12.executeUpdate(query12);
       				}
       				if(inst10== null || inst10.equalsIgnoreCase(null)|| inst10 == "" || inst10.equalsIgnoreCase("")) 
       				{}
       				else {
       				String query13= "insert into t_empadditionalQualification(EmpID,Institute,Year,Specialisation,Marks_Percentage)values('"+emp_id+"','"+inst10+"','"+year10+"','"+spe10+"','"+marks10+"')";	
       			 	st13.executeUpdate(query13);
       				}
      			
       			
       			
     
      
       if(comp1== null || comp1.equalsIgnoreCase(null)|| comp1 == "" || comp1.equalsIgnoreCase(""))
       {}
       else {
       String query2 = "insert into t_workexperience(EmpID,Company,PositionHeld,SalaryPA,ReasonforLeaving,FromDate,Todate)values('"+emp_id+"','"+comp1+"','"+post1+"','"+sal1+"','"+reason1+"','"+from_date1+"','"+to_date1+"')";
       st2.executeUpdate(query2);
       }
       if(comp2== null || comp2.equalsIgnoreCase(null)|| comp2 == "" || comp2.equalsIgnoreCase(""))
       {}
       else {
       String query18 = "insert into t_workexperience(EmpID,Company,PositionHeld,SalaryPA,ReasonforLeaving,FromDate,Todate)values('"+emp_id+"','"+comp2+"','"+post2+"','"+sal2+"','"+reason2+"','"+from_date2+"','"+to_date2+"')";
       st18.executeUpdate(query18);
       }
       if(comp3== null || comp3.equalsIgnoreCase(null)|| comp3 == "" || comp3.equalsIgnoreCase(""))
       {}
       else {
       String query19 = "insert into t_workexperience(EmpID,Company,PositionHeld,SalaryPA,ReasonforLeaving,FromDate,Todate)values('"+emp_id+"','"+comp3+"','"+post3+"','"+sal3+"','"+reason3+"','"+from_date3+"','"+to_date3+"')";
       st19.executeUpdate(query19);
       }
       if(comp4== null || comp4.equalsIgnoreCase(null)|| comp4 == "" || comp4.equalsIgnoreCase(""))
       {}
       else {
       String query20 = "insert into t_workexperience(EmpID,Company,PositionHeld,SalaryPA,ReasonforLeaving,FromDate,Todate)values('"+emp_id+"','"+comp4+"','"+post4+"','"+sal4+"','"+reason4+"','"+from_date4+"','"+to_date4+"')";
       st20.executeUpdate(query20);
       }
       if(comp5== null || comp5.equalsIgnoreCase(null)|| comp5 == "" || comp5.equalsIgnoreCase(""))
       {}
       else {
       String query21 = "insert into t_workexperience(EmpID,Company,PositionHeld,SalaryPA,ReasonforLeaving,FromDate,Todate)values('"+emp_id+"','"+comp5+"','"+post5+"','"+sal5+"','"+reason5+"','"+from_date5+"','"+to_date5+"')";
       st21.executeUpdate(query21);
       }
       if(comp6== null || comp6.equalsIgnoreCase(null)|| comp6 == "" || comp6.equalsIgnoreCase(""))
       {}
       else {
       String query22 = "insert into t_workexperience(EmpID,Company,PositionHeld,SalaryPA,ReasonforLeaving,FromDate,Todate)values('"+emp_id+"','"+comp6+"','"+post6+"','"+sal6+"','"+reason6+"','"+from_date6+"','"+to_date6+"')";
       st22.executeUpdate(query22);
       }
       if(comp7== null || comp7.equalsIgnoreCase(null)|| comp7 == "" || comp7.equalsIgnoreCase(""))
       {}
       else {
       String query23 = "insert into t_workexperience(EmpID,Company,PositionHeld,SalaryPA,ReasonforLeaving,FromDate,Todate)values('"+emp_id+"','"+comp7+"','"+post7+"','"+sal7+"','"+reason7+"','"+from_date7+"','"+to_date7+"')";
       st23.executeUpdate(query23);
       }
       if(comp8== null || comp8.equalsIgnoreCase(null)|| comp8 == "" || comp8.equalsIgnoreCase(""))
       {}
       else {
       String query24= "insert into t_workexperience(EmpID,Company,PositionHeld,SalaryPA,ReasonforLeaving,FromDate,Todate)values('"+emp_id+"','"+comp8+"','"+post8+"','"+sal8+"','"+reason8+"','"+from_date8+"','"+to_date8+"')";
       st24.executeUpdate(query24);
       }
       if(comp9== null || comp9.equalsIgnoreCase(null)|| comp9 == "" || comp9.equalsIgnoreCase(""))
       {}
       else {
       String query25 = "insert into t_workexperience(EmpID,Company,PositionHeld,SalaryPA,ReasonforLeaving,FromDate,Todate)values('"+emp_id+"','"+comp9+"','"+post9+"','"+sal9+"','"+reason9+"','"+from_date9+"','"+to_date9+"')";
       st25.executeUpdate(query25);
       }
       if(comp10== null || comp10.equalsIgnoreCase(null)|| comp10 == "" || comp10.equalsIgnoreCase(""))
       {}
       else {
       String query26 = "insert into t_workexperience(EmpID,Company,PositionHeld,SalaryPA,ReasonforLeaving,FromDate,Todate)values('"+emp_id+"','"+comp10+"','"+post10+"','"+sal10+"','"+reason10+"','"+from_date10+"','"+to_date10+"')";
       st26.executeUpdate(query26);
       }
       
       
       
       System.out.println("*********    *****************");
       
      String query3 = "insert into t_skills(EmpID,MSOffice,Windows,AutoCAD,Tally,Typing,Shorthand,AnyOtherSkills,CommandOverEnglish)values('"+emp_id+"','"+ms_office+"','"+windows+"','"+autocad+"','"+tally+"','"+typing+"','"+shorthand+"','"+other+"','"+english+"')";
      st3.executeUpdate(query3);
      String query4 = "insert into t_otherdetails(EmpID,Achievements,Seeyourself5YearsFromNow,StrengthsWeakness,ExtraCurricular,ExpectedSalary,BenefitToCompany,whyYouWantToLeaveYourPresentJob,HealthProblem,AnyLitigation,AnyPoliceRecord,References1,documentUpload1,documentUpload2,documentUpload3,documentUpload4)values('"+emp_id+"','"+achievements+"','"+seeafter5+"','"+strengths+"','"+curricular+"','"+exp_sal+"','"+benefit+"','"+leaving_reason+"','"+health_prob+"','"+litigation+"','"+police_record+"','"+reference+"','"+filepath[0]+"','"+filepath[1]+"','"+filepath[2]+"','"+filepath[3]+"')";
      st4.executeUpdate(query4);
       
       
      	response.sendRedirect("application_report.jsp?emp_id='"+emp_id+"'");
        //System.out.println("queryis :"+query);
        }catch(Exception e) {
                System.out.println("Exception ------------->    "+e);                        	
        } 
        
        
        
        
        
}
        
        


%>