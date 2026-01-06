<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict/aaa/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="org.jfree.data.time.Year"%>
<%@ include file="headConn.jsp"%>
<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>
<%@
page
	import="javax.*,java.awt.*,
java.util.zip.*,
 com.lowagie.text.Chunk,  
 com.lowagie.text.Document,  
 com.lowagie.text.DocumentException,  
com.lowagie.text.Font, 
com.lowagie.text.FontFactory,  
com.lowagie.text.HeaderFooter,  
com.lowagie.text.Image,  
com.lowagie.text.PageSize,  
com.lowagie.text.Paragraph,  
com.lowagie.text.Phrase,
 com.lowagie.text.pdf.BaseFont,  
 com.lowagie.text.pdf.PdfContentByte,  
 com.lowagie.text.pdf.PdfImportedPage,  
com.lowagie.text.pdf.PdfLayer,  
com.lowagie.text.pdf.PdfReader,  
com.lowagie.text.pdf.PdfStamper,  
com.lowagie.text.pdf.PdfString,  
com.lowagie.text.pdf.PdfWriter,  
java.io.FileOutputStream,
java.io.*,
java.util.*,
java.awt.*,
java.awt.geom.Rectangle2D,
com.lowagie.text.pdf.*,
com.lowagie.text.pdf.PdfPCellEvent,
com.lowagie.text.*,
com.lowagie.text.Image"%>
<%@page import="com.lowagie.text.Rectangle"%>
<%@page import="com.lowagie.text.rtf.style.*"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<script src="dropdown.js" type="text/javascript"></script>
<script src="dynamic.js" type="text/javascript"></script>

<script type="text/javascript">
		
	
	</script>

<body>
	<%
	 Statement st = null, st1 = null,st2=null,st3=null,st4=null;
	 st=conn.createStatement();
	 st1=conn.createStatement();
	 st1=conn.createStatement();
	 int count1=0;
	 //String source= "/home/r_lakhote/Desktop/Task_List";
	 String source= "/usr/share/tomcat6/webapps/TaskList";

	 String netpay="";
	 ServletOutputStream ouputStream;
	 byte[] buf = new byte[1024];
	 %>

	<%
	
	try{
		String month1="";int  year=0;
	String payno=request.getParameter("Payno");
	System.out.println("payno"+payno);
	String[] paynumber = payno.split(" ");
	for (int i=0;i<paynumber.length;i++)
	{
		System.out.println("payno is ===="+paynumber[i]);
	
	String sql="select * from t_payable where PayNo='"+paynumber[i]+"'";
    ResultSet rs=st.executeQuery(sql);
    System.out.println("sql ===="+sql);
	while(rs.next())
	{
	 int allowance=rs.getInt("allowance");
	 int allowance1=rs.getInt("allowance1");
	 int allowance2=rs.getInt("allowance2");
	 int allowance3=rs.getInt("allowance3");
	 int allowance4=rs.getInt("allowance4");
	 int deduction=rs.getInt("deduction");
	 int deduction1=rs.getInt("deduction1");
	 int deduction2=rs.getInt("deduction2");
	 int deduction3=rs.getInt("deduction3");
	 int deduction4=rs.getInt("deduction4");
	 int gross=rs.getInt("grosspay");
	  netpay=rs.getString("Netpay");
	 int totaldedct=deduction+deduction1+deduction2+deduction3+deduction3+deduction4;
	 
      String name=rs.getString("contractorName");
      int month=rs.getInt("month");
	year=rs.getInt("year");
	System.out.println("Year   "+year);
	  switch(month)
	  {
	  case 1:month1="Jan";
	          break;
	  case 2:month1="Feb";
      break;
	  case 3:month1="Mar";
      break;
	  case 4:month1="Apr";
      break;
	  case 5:month1="May";
      break;
	  case 6:month1="June";
      break;
	  case 7:month1="July";
      break;
	  case 8:month1="Aug";
      break;
	  case 9:month1="Sep";
      break;
	  case 10:month1="Oct";
      break;
	  case 11:month1="Nov";
      break; 
	  case 12:month1="Dec";
      break;
      
     // default : month1="Invalid month";
       
	    }
	  try{
       String ContractDate="",ContractExpDate="";
       String sql1="select * from t_employee where EmpID='"+rs.getString("EmpId")+"'";
       ResultSet rs1=st1.executeQuery(sql1);
       System.out.println("sql1 ===="+sql1);
       while(rs1.next())
       {
    	    
    	   String empname=rs1.getString("EmpName");
    	   empname= empname.replaceAll(" ","");
	String filename="payshilp_"+empname+"_"+month1+"_"+year+".pdf";
	try{ContractDate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("ContractDate"))); 
	ContractExpDate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("ContractExpDate"))); 
	}
	catch(Exception e){
	ContractDate="-";
	ContractExpDate="-";
	}
     System.out.println("ContractDate  ="+ContractDate+ " ContractExpDate = "+ContractExpDate);
	///Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
   
	Document document = new Document();

	
	
  
  
	PdfWriter writer=PdfWriter.getInstance(document, new FileOutputStream(source+"/"+filename));
	Font catFont = new Font(Font.TIMES_ROMAN,14,Font.BOLD);
	Font NormalFont = new Font(Font.TIMES_ROMAN,8);
	Font underline=new Font(Font.TIMES_ROMAN,10,Font.UNDERLINE);
	Font Fontforname = new Font(Font.TIMES_ROMAN,8,Font.BOLD);
	Font forterms = new Font(Font.TIMES_ROMAN,9,Font.BOLD);
	Font smallfont = new Font(Font.TIMES_ROMAN,6,Font.BOLD);
	document.open();
	document.setPageSize(PageSize.A3);
    

    
	Paragraph preface = new Paragraph();
	preface.add(new Paragraph("Transworld Compressor Technologies Limited",catFont));
	preface.setAlignment("center");
	preface.add(new Paragraph("Vendor Natasha Consultants Pvt. Ltd.",NormalFont));
	 
    preface.setAlignment("center");
	preface.add(new Paragraph("CONTRACTOR PAYMENT ADVICE",Fontforname));
	
    /*  File imgRed = new File("smileyRed.png");
	java.awt.Image smileyRed = ImageIO.read(imgRed);
	com.lowagie.text.Image mySmileyRed = com.lowagie.text.Image.getInstance(smileyRed);
	
	Chapter chapter1 = new Chapter("", 1);
	Section section1 = chapter1.addSection("");
	String imageUrlRed ="/home/r_lakhote/transworld.jpg";
	com.lowagie.text.Image image2 = com.lowagie.text.Image.getInstance(imageUrlRed);*/
	document.add(preface);
	PdfPTable tableFirst = new PdfPTable(4);

	tableFirst.setWidthPercentage(90);
	tableFirst.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	tableFirst.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	tableFirst.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
	document.add(Chunk.NEWLINE );
	
	PdfPTable table4 = new PdfPTable(1);
	table4.setWidthPercentage(90);
	table4.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	table4.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	table4.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
	PdfPCell c9 = new PdfPCell();
	c9.addElement(new Paragraph(""+rs1.getString("EmpName")+"",catFont));
	c9.addElement(new Paragraph("       ",catFont));
	table4.addCell(c9);
	document.add(table4);
	
	PdfPTable table5 = new PdfPTable(4);
	table5.setWidthPercentage(90);
	table5.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	table5.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	table5.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
	PdfPCell c10 = new PdfPCell();
	c10.addElement(new Paragraph("Contractor No. :",Fontforname));
	c10.addElement(new Paragraph("Contract Date :",Fontforname));
	c10.addElement(new Paragraph("Contract Expiry Date :",Fontforname));
	c10.addElement(new Paragraph("Pay Order No :",Fontforname));
	table5.addCell(c10);
	
	PdfPCell c11 = new PdfPCell();
	c11.addElement(new Paragraph(""+rs1.getString("EmpID")+"",Fontforname));
	c11.addElement(new Paragraph(""+ContractDate+"",Fontforname));
	c11.addElement(new Paragraph(""+ContractExpDate+"",Fontforname));
	c11.addElement(new Paragraph(""+rs.getString("PayNo")+"",Fontforname));
	table5.addCell(c11);
	
	PdfPCell c12 = new PdfPCell();
	c12.addElement(new Paragraph("Month/Year    :",Fontforname));
	c12.addElement(new Paragraph("Available Days: ",Fontforname));
	c12.addElement(new Paragraph("Bank A/c. No. :",Fontforname));
	c12.addElement(new Paragraph("Pan Number :",Fontforname));
	table5.addCell(c12);
	
	PdfPCell c13 = new PdfPCell();
	
	c13.addElement(new Paragraph(""+month1+"/"+rs.getString("year")+"",Fontforname));
	c13.addElement(new Paragraph(""+rs.getString("payableDays")+"",Fontforname));
	c13.addElement(new Paragraph(""+rs1.getString("AccNo")+"",Fontforname));
	c13.addElement(new Paragraph(""+rs1.getString("PanNo")+"",Fontforname));
	table5.addCell(c13);
	document.add(table5);
	
	document.add(Chunk.NEWLINE );
	
	PdfPCell c2 = new PdfPCell(new Phrase("Earnings ",catFont));
	c2.setFixedHeight(20f); 
	c2.setBackgroundColor(Color.gray);  
	c2.setHorizontalAlignment(Element.ALIGN_CENTER);
	tableFirst.addCell(c2);
	
	c2 = new PdfPCell(new Phrase("Amount",catFont));
	c2.setHorizontalAlignment(Element.ALIGN_CENTER);
	c2.setBackgroundColor(Color.gray); 
	tableFirst.addCell(c2);

	c2 = new PdfPCell(new Phrase("Deductions",catFont));
	c2.setHorizontalAlignment(Element.ALIGN_CENTER);
	c2.setBackgroundColor(Color.gray); 
	tableFirst.addCell(c2);
	
	c2 = new PdfPCell(new Phrase("Amount",catFont));
	c2.setHorizontalAlignment(Element.ALIGN_CENTER);
	c2.setBackgroundColor(Color.gray); 
	tableFirst.addCell(c2);
	
	PdfPCell c3 = new PdfPCell();
	c3.setFixedHeight(150f); 
	c3.addElement(new Paragraph("   ",Fontforname));
	c3.addElement(new Paragraph("Basic  ",Fontforname));
	c3.addElement(new Paragraph("Additional Payables 1 ",Fontforname));
	c3.addElement(new Paragraph("Additional Payables 2  ",Fontforname));
	c3.addElement(new Paragraph("Additional Payables 3 ",Fontforname));
	c3.addElement(new Paragraph("Additional Payables 4",Fontforname));
	c3.addElement(new Paragraph("Additional Payables 5 ",Fontforname));
	
	
	
	tableFirst.addCell(c3);
	
	Paragraph p1 = new Paragraph(""+rs.getString("basic")+".00",Fontforname);
	p1.setAlignment(Element.ALIGN_RIGHT);
    Paragraph p2 = new Paragraph(""+rs.getString("allowance")+".00",Fontforname);
    p2.setAlignment(Element.ALIGN_RIGHT);
    Paragraph p3 = new Paragraph(""+rs.getString("allowance1")+".00",Fontforname);
    p3.setAlignment(Element.ALIGN_RIGHT);
    
    Paragraph p4 = new Paragraph(""+rs.getString("allowance2")+".00",Fontforname);
    p4.setAlignment(Element.ALIGN_RIGHT);
    Paragraph p5 = new Paragraph(""+rs.getString("allowance3")+".00",Fontforname);
    p5.setAlignment(Element.ALIGN_RIGHT);
    
    Paragraph p6 = new Paragraph(""+rs.getString("allowance4")+".00",Fontforname);
    p6.setAlignment(Element.ALIGN_RIGHT);
   
    Paragraph p7 = new Paragraph(""+rs.getString("deduction")+".00",Fontforname);
    p7.setAlignment(Element.ALIGN_RIGHT);
    
    Paragraph p8 = new Paragraph(""+rs.getString("deduction1")+".00",Fontforname);
    p8.setAlignment(Element.ALIGN_RIGHT);
    
    Paragraph p9 = new Paragraph(""+rs.getString("deduction2")+".00",Fontforname);
    p9.setAlignment(Element.ALIGN_RIGHT);
    
    Paragraph p10 = new Paragraph(""+rs.getString("deduction3")+".00",Fontforname);
    p10.setAlignment(Element.ALIGN_RIGHT);
    Paragraph p11 = new Paragraph(""+rs.getString("deduction4")+".00",Fontforname);
    p11.setAlignment(Element.ALIGN_RIGHT);
    
	
	PdfPCell c4 = new PdfPCell();
	c4.setHorizontalAlignment(Element.ALIGN_RIGHT);
	c4.setFixedHeight(150f); 
	c4.addElement(new Paragraph("     ",Fontforname));
	c4.addElement(p1);
	c4.addElement(p2);
	c4.addElement(p3);
	c4.addElement(p4);
	c4.addElement(p5);
	c4.addElement(p6);
	c4.setHorizontalAlignment(Element.ALIGN_RIGHT);
	tableFirst.addCell(c4);
	
	PdfPCell firstcell1 = new PdfPCell();
	firstcell1.setFixedHeight(150f);
	
	firstcell1.addElement(new Paragraph("     ",Fontforname));
	firstcell1.addElement(new Paragraph("Deduction 1 ",Fontforname));
	firstcell1.addElement(new Paragraph("Deduction 2  ",Fontforname));
	firstcell1.addElement(new Paragraph("Deduction 3 ",Fontforname));
	firstcell1.addElement(new Paragraph("Deduction 4",Fontforname));
	firstcell1.addElement(new Paragraph("Deduction 5 ",Fontforname));
	
	tableFirst.addCell(firstcell1);
	
	PdfPCell c6 = new PdfPCell();
	c6.setHorizontalAlignment(Element.ALIGN_RIGHT);
	c6.setFixedHeight(150f); 
	c6.addElement(new Paragraph("    ",Fontforname));
	c6.addElement(p7);
	c6.addElement(p8);
	c6.addElement(p9);
	c6.addElement(p10);
	c6.addElement(p11);
	c6.setHorizontalAlignment(Element.ALIGN_RIGHT);
	tableFirst.addCell(c6);
	
	PdfPCell c7 = new PdfPCell(new Phrase("Gross Payables :",Fontforname));
	c7.setFixedHeight(20f); 
	//c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	tableFirst.addCell(c7);
	
	c7 = new PdfPCell(new Phrase(""+gross+".00",Fontforname));
	c7.setHorizontalAlignment(Element.ALIGN_RIGHT);
	tableFirst.addCell(c7);
	
	c7 = new PdfPCell(new Phrase("Total Deductions :",Fontforname));
	c7.setHorizontalAlignment(Element.ALIGN_LEFT);
	tableFirst.addCell(c7);
	
	c7 = new PdfPCell(new Phrase(""+totaldedct+".00",Fontforname));
	c7.setHorizontalAlignment(Element.ALIGN_RIGHT);
	tableFirst.addCell(c7);
	
	document.add(tableFirst);
	
	//document.add( Chunk.NEWLINE );
	
	PdfPTable table2 = new PdfPTable(1);

	table2.setWidthPercentage(90);
	table2.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	table2.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	table2.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
	PdfPCell first = new PdfPCell();
	first.addElement(new Paragraph("TDS Rate in %  :"+rs.getString("tds")+"",Fontforname));
	table2.addCell(first);
	document.add(table2);
	
	PdfPTable table3 = new PdfPTable(1);

	table3.setWidthPercentage(90);
	table3.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	table3.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	table3.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
	PdfPCell c8 = new PdfPCell();
	c8.addElement(new Paragraph("Net Payables  :  "+rs.getString("Netpay")+".00",Fontforname));
	c8.addElement(new Paragraph("      ",Fontforname));
	
	//String netinworld =
	//c8.addElement(new Paragraph("Net Payables  in words : "+netinworld+"",Fontforname));
	
	table3.addCell(c8);
	document.add(table3);
	
	PdfPTable table6= new PdfPTable(1);

	table6.setWidthPercentage(90);
	table6.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	table6.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	table6.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
	PdfPCell c14= new PdfPCell();
	c14.addElement(new Paragraph(" Cheque/DD/Direct Credit    :",Fontforname));
	
	c14.addElement(new Paragraph("  ",Fontforname));
	table6.addCell(c14);
	document.add(table6);
	/*
	PdfPTable table = new PdfPTable(1);
	Image image1 =Image.getInstance("/home/r_lakhote/Desktop/transworld.jpg");
	table.setWidthPercentage(80);
	table.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
	PdfPCell c = new PdfPCell();
	c.setBorder(Rectangle.NO_BORDER);
	c.setFixedHeight(130f); 
	image1.scaleAbsoluteWidth(70);

	image1.scaleAbsolute(550f, 550f);
	c.addElement(image1);
	table.addCell(c);
	document.add(table);
	*/
	document.close();
	/* FileInputStream in1 = new FileInputStream(source+"/"+filename);
	 ByteArrayOutputStream buffer = new ByteArrayOutputStream();
	   
	   count1=IOUtils.copy(in1, buffer);
	   System.out.println("Count >>>>>>>>"+count1);
	   IOUtils.closeQuietly(in1);
	   IOUtils.closeQuietly(buffer);
	
 	DataOutput dataOutput = new DataOutputStream(response.getOutputStream());
	byte[] bytes = buffer.toByteArray();
	response.setContentLength(bytes.length);
	for(int l = 0; l < bytes.length; l++)
	{
	dataOutput.writeByte(bytes[l]);
	}*/
	
	
    }
  	}
    catch(Exception e)
    { System.out.println("Error in sql data"+e); 
    }
	
	} // end while 
	
	}// end for 
	  //########### Zip creation #############
	 
	 try
	 {
	   File inFolder=new File(source);
	  // File outFolder=new File(target);
	   ouputStream = response.getOutputStream();
	   ZipOutputStream out1 = new ZipOutputStream(ouputStream);
		 BufferedInputStream in = null;
		 byte[] data  = new byte[1000];
		 String files[] = inFolder.list();
		 for (int i=0; i<files.length; i++)
		  {
		  in = new BufferedInputStream(new FileInputStream(inFolder.getPath() + "/" + files[i]), 1000);  
		  out1.putNextEntry(new ZipEntry(files[i])); 
		  int count;
		  while((count = in.read(data,0,1000)) != -1)
		  {
		   out1.write(data, 0, count);
		  }
		  String zipfilename=""+month1+"_"+year+"payslip.zip";
	  response.setContentType("application/zip");
	  response.addHeader("Content-Disposition", "attachment; filename="+zipfilename );
	  
	  out1.closeEntry();
	  }
	  out1.flush();
	  out1.close();
	  }
	  catch(Exception e)
		 { System.out.println("Exception in >>>>>>>>>"+e);
		  e.printStackTrace();
		  } 
				
		//#####################################
	 
		//-----------------remove pdf from folder---------------
	 	File fin = new File(source);  
		File[] finlist = fin.listFiles();       
          for (int n = 0; n < finlist.length; n++) {
          if (finlist[n].isFile()) {
              finlist[n].delete();
            }
        } 
          System.out.println("All pdf files are deleted");
	 //-----------------------------------------------------
		
		
		
}catch(Exception e){
	e.printStackTrace();
	}
	finally
	{
		//ouputStream.close();
	}	
	

%>

</body>
</html>