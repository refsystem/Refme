<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="../DBConnection/DbConnection.jsp" %>
<form action="" method="post" name="f1">
<%
	try {
	
		FileItem item = null;
		File uploadedFile=null;
		String imgfilename="";
	    int crs=10;
	    int dep=10;
	    String desig="4";
		String f1="",name="",staffId="",password="",address="",contact="",email="",qualification="",dob="";
		File path = new File(photos);
		if (!path.exists()) {
			boolean status = path.mkdirs();
		}
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		System.out.println("isMulti"+isMultipart);
		
		
		 if (isMultipart) {
			
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);

				List items=upload.parseRequest(request);
				Iterator iterator = items.iterator();
				while (iterator.hasNext()) {

					item = (FileItem) iterator.next();
					imgfilename=item.getName();
					if(imgfilename!=null)
					{
					uploadedFile = new File(path + "/"+imgfilename);	
					item.write(uploadedFile); 
					}
					
					if (!item.isFormField()) {
					
						if(item.getFieldName().equals("up"))
						{
							f1=item.getName();
						}
						
					}
					else{
						
						if(item.getFieldName().equals("sn"))
						{
							name=item.getString();System.out.println("haIIII  "+name);
						}
						if(item.getFieldName().equals("sid"))
						{
							staffId=item.getString();
						}
						if(item.getFieldName().equals("pas"))
						{
							password=item.getString();
						}
						if(item.getFieldName().equals("adr"))
						{
							address=item.getString();
						}
						if(item.getFieldName().equals("con"))
						{
							contact=item.getString();
						}
						if(item.getFieldName().equals("em"))
						{
							email=item.getString();
						}
						if(item.getFieldName().equals("qua"))
						{
							qualification=item.getString();
						}
						if(item.getFieldName().equals("dt"))
						{
							dob=item.getString();
						}
					}
				}
				System.out.println(f1+"  "+dob+"  "+qualification);
				
				String ins="insert into staf_data(nme,stfif,crs,dep,desig,adr,con,em,qual,pic,dob,st)values('"+name+"','"+staffId+"','"+crs+"','"+dep+"','"+desig+"','"+address+"','"+contact+"','"+email+"','"+qualification+"','"+f1+"','"+dob+"','1')";
				statement.executeUpdate(ins);
				String type="STAF";
				String ins1="INSERT INTO `user_log`(uid,pwd,typ,st) VALUES ('"+staffId+"','"+password+"','"+type+"','1')";
				statement.executeUpdate(ins1);

				%>
				<script type="text/javascript">
		alert("Data Inserted");
		
		</script>
				<%
				response.sendRedirect("faculty.jsp");
				
		}
		 
}catch(Exception e){System.out.println(e);}	 
	
%>

</form>
	