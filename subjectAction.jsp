<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="../DBConnection/DbConnection.jsp" %>
    <%
String course="",department="",semester="",sub="",code="";

	 course=request.getParameter("cr");
	 department=request.getParameter("dp");
	 semester=request.getParameter("sm");
	 sub=request.getParameter("sn");
	 code=request.getParameter("sc");
	 
	 System.out.println(code+" "+course+" "+department+" "+sub+" "+semester);
	 
	 String ins="insert into subject_data(course,dept,sem,sub_name,sub_code)values('"+course+"','"+department+"','"+semester+"','"+sub+"','"+code+"')";
	 statement.executeUpdate(ins);
	 response.sendRedirect("subject.jsp?c="+course+"&d="+department+"&s="+semester);


%>