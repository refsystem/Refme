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

		String f1="",logId="",dis="";
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
					
						if(item.getFieldName().equals("f1"))
						{
							f1=item.getName();
						}
						
					}
					else{
						
						if(item.getFieldName().equals("dis"))
						{
							dis=item.getString();
						}
						if(item.getFieldName().equals("logId"))
						{
							logId=item.getString();
						}
						
						
					}
				}
				System.out.println(f1+"  "+dis+"  "+logId);
				
				String ins="insert into acheivements(photo,discription,loginId)values('"+f1+"','"+dis+"','"+logId+"')";
				statement.executeUpdate(ins);
			

				%>
				<script type="text/javascript">
		alert("Data Inserted");
		window.location.href="ach_fac.jsp"
		</script>
				<%
			
				
		}
		 
}catch(Exception e){System.out.println(e);}	 
	
%>

</form>
	