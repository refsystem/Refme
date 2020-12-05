<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="../DBConnection/DbConnection.jsp" %>
    <%
    	JSONArray ja=new JSONArray();
    	JSONObject jo;
    	String course=request.getParameter("crs");
    	String dep=request.getParameter("dep");
    	String yr=request.getParameter("yr");
    	System.out.println("course "+course+" department "+dep+" year = "+yr);
    	String seldept="select distinct sem from student_data where crs='"+course+"' and ay='"+yr+"' and dep=(select depid from dep_info where dep_nme='"+dep+"' and crsid='"+course+"')";
    	ResultSet rs=statement.executeQuery(seldept);
    	while(rs.next()){
    		String sem=rs.getString("sem");
    		jo=new JSONObject();
    		jo.put("ksem", sem);
    		ja.add(jo);
    	}
    	System.out.println(ja);
    	out.println(ja);
    %>

