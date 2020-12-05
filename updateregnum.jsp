<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="../DBConnection/DbConnection.jsp" %>
    <%
    String r=request.getParameter("r");
    String ad=request.getParameter("s");
    
    System.out.println("Update date = "+r+" and "+ad);
   String up="update student_data set regnum='"+r+"' where admnum='"+ad+"'";
   statement.executeUpdate(up);
   
        out.println("<span class='lable label-success'>Register Number Updated</span>");
   
    
    %>

