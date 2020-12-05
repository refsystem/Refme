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
    	
    	System.out.println(course);
    	String seldept="select * from dep_info where crsid='"+course+"'";
    	ResultSet rs=statement.executeQuery(seldept);
    	while(rs.next()){
    		String dpt=rs.getString("dep_nme");
    		jo=new JSONObject();
    		jo.put("kdept", dpt);
    		ja.add(jo);
    	}
    	System.out.println(ja);
    	out.println(ja);
    %>

