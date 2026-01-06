
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
 String title="";
 String name="";
 String add1="";
 String add2="";
 String add3="-";
 String email="";
 String gender="";;
 String state="";
 String add_state="";
 String city="";
 String add_city="";
 String pin="";
 String contact="";
 String dd="";
 String mm="";
 String yyyy="";
 
 String occupation="";
 String f_title="";
 String f_name="";
 String dl_no="";
 String pass_no="";
 String job_opening="";
 String pancard="";
 int deptID=0;
 
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
                                if(name1.equals("title")) 
                                {
                                        title = value;
                                        System.out.print("\n title==>"+title);
                                        
                                        count1++;
                                }
                                if(name1.equals("name")) 
                                {
                                        name = value;
                                        System.out.print("\n name==>"+name);
                                        
                                        count1++;
                                }
                                if(name1.equals("add1")) 
                                {
                                        add1 = value;
                                        System.out.print("\n add1==>"+add1);
                                        count1++;
                                }
                                if(name1.equals("add2")) 
                                {
                                        add2 = value;
                                        System.out.print("\n add2==>"+add2);
                                        count1++;
                                }
                                if(name1.equals("email")) 
                                {
                                		email = value;
                                        System.out.print("\n email==>"+email);
                                        count1++;
                                }
                                if(name1.equals("gender")) 
                                {
                                		gender = value;
                                        System.out.print("\n gender==>"+gender);
                                        count1++;
                                }                                
                                if(name1.equals("state")) 
                                {
                                		state = value;
                                        System.out.print("\n state==>"+state);
                                        count1++;
                                }
                                if(name1.equals("add_state")) 
                                {
                                		add_state = value;
                                        System.out.print("\n add_state==>"+add_state);
                                        count1++;
                                }
                                
                                if(name1.equals("city")) 
                                {
                                		city = value;
                                        System.out.print("\n city==>"+city);
                                        count1++;
                                }
                                if(name1.equals("add_city")) 
                                {
                                		add_city = value;
                                        System.out.print("\n add_city==>"+add_city);
                                        count1++;
                                }
                                if(name1.equals("pin")) 
                                {
                                		pin = value;
                                        System.out.print("\n pin==>"+pin);
                                        count1++;
                                }
                                if(name1.equals("contact")) 
                                {
                                		contact = value;
                                        System.out.print("\n contact==>"+contact);
                                        count1++;
                                }
                                if(name1.equals("dd")) 
                                {
                                		dd = value;
                                        System.out.print("\n dd==>"+dd);
                                        count1++;
                                }
                                if(name1.equals("mm")) 
                                {
                                		mm = value;
                                        System.out.print("\n mm==>"+mm);
                                        count1++;
                                }
                                if(name1.equals("yyyy")) 
                                {
                                		yyyy = value;
                                        System.out.print("\n yyyy==>"+yyyy);
                                        count1++;
                                }
                               	if(name1.equals("f_title")) 
                                {
                                        f_title = value;
                                        System.out.print("\n f_title==>"+f_title);
                                        
                                        count1++;
                                }
                                if(name1.equals("f_name")) 
                                {
                                        f_name = value;
                                        System.out.print("\n f_name==>"+f_name);
                                        
                                        count1++;
                                }
                                if(name1.equals("occupation")) 
                                {
                                		occupation = value;
                                        System.out.print("\n occupation==>"+occupation);
                                        count1++;
                                }
                                if(name1.equals("dl_no")) 
                                {
                                		dl_no = value;
                                        System.out.print("\n dl_no==>"+dl_no);
                                        count1++;
                                }
                                if(name1.equals("pass_no")) 
                                {
                                		pass_no = value;
                                        System.out.print("\n pass_no==>"+pass_no);
                                        count1++;
								}
                                if(name1.equals("job_opening")) 
                                {
                                		job_opening = value;
                                        System.out.print("\n current_opening==>"+job_opening);
                                        count1++;
								}                     
                                if(name1.equals("pancard")) 
                                {
                                		pancard = value;
                                        System.out.print("\n pancard==>"+pancard);
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
                                             
                                             //savedFile = new File(config.getServletContext().getRealPath("/")+"Complaints/"+itemName);
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
                                                                 saveflag++;
                                                                }
                                                                else
                                                                savefilestring=savefilestring+","+savedFile;
                                                                 //out.print("successfully saved the file");
                                                                //File file = new File(savedFile);
                                                                String screenshot=savedFile.getAbsolutePath();
                                                       // System.out.println("\n\nscreenshot--->>>"+screenshot);
                                                                }
                                                        
                                                        
                                        } catch (Exception e) {
                                                e.printStackTrace();
                                        }
                        }
                }
        
        
        System.out.println("state name is:"+state);
        System.out.println("city name is:"+city);
        System.out.println("addstate name is:"+add_state);
        System.out.println("addcity name is:"+add_city);
        if(add_state.equalsIgnoreCase("")) {} else {
        	state=add_state;
        	System.out.println("now state name is:"+state);
        }
        
        if(add_city.equalsIgnoreCase("")){}else {
        	city=add_city;
        	System.out.println("city name is:"+city);
        } 
        System.out.print("\n job_opening is >>=>"+job_opening);
        
        
        try {  
        Statement st = conn.createStatement();	
       	Statement st1 = conn.createStatement();
       	String query1 = "select DeptID from t_jobOpenings where JobOpening ='"+job_opening+"'";
     	ResultSet rs =st1.executeQuery(query1);
     	if(rs.next()) {
     	deptID =rs.getInt("DeptID");
     	System.out.print("\n deptID is >>=>"+deptID);
     	}
     	System.out.print("\n deptID is >>="+deptID);
        String query = "insert into t_applicant_details(DeptID,Name,Address1,Address2,Address3,EmailID,Gender,AddressProof,State,City,Pincode,ContactNo,DateOfBirth,FathersName,FathersOccupation,DriversLicenseNo,PassportNo,IdProof,AppliedFor,PanCard)values('"+deptID+"','"+title+" "+name+"','"+add1+"','"+add2+"','"+add3+"','"+email+"','"+gender+"','"+filename[0]+"','"+state+"','"+city+"','"+pin+"','"+contact+"','"+yyyy+"-"+mm+"-"+dd+"','"+f_title+" "+f_name+"','"+occupation+"','"+dl_no+"','"+pass_no+"','"+filename[1]+"','"+job_opening+"','"+pancard+"')";
        st.executeUpdate(query);
       
       
        response.sendRedirect("application_form2.jsp");
        //System.out.println("queryis :"+query);
        }catch(Exception e) {
                System.out.println("Exception ------------->    "+e);                        	
        } 
}

 %>
