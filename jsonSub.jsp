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
    	String dept=request.getParameter("dept");
    	String sem=request.getParameter("sem");
    	System.out.println(course+" "+dept+" "+sem);
    	String seldept="select sub_id from syllabus_data where crsid='"+course+"' and sem='"+sem+"' and depid=(select depid from dep_info where crsid='"+course+"' and dep_nme='"+dept+"')";
    	ResultSet rs=statement.executeQuery(seldept);
    	while(rs.next()){
    		String dpt=rs.getString("sub_id");
    		jo=new JSONObject();
    		jo.put("kdept", dpt);
    		ja.add(jo);
    	}
    	System.out.println(ja);
    	out.println(ja);
    %>

