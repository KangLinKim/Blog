<%@ page contentType="text/html; charset=utf-8"%>  
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("utf-8"); %>

<%@ include file="/connection/dbconn_database.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	String owner = request.getParameter("owner");
	String writer = request.getParameter("writer");
	String post_id = request.getParameter("post_id");

	String sql_likes = null;
	Statement st_likes = null;
	ResultSet rs_likes = null;

	int cnt = 0;
	
	try{
		st_likes = con_likes.createStatement();
		sql_likes = "insert likes values (" + post_id + ", '" + writer + "')";
		cnt = st_likes.executeUpdate(sql_likes);
		
		st_likes.close();
		con_likes.close();
		
	} catch (SQLException e) {
		out.println(e);
	}
%>

<jsp:forward page="/project/front/details.jsp">
	<jsp:param name="post_id" value="<%= post_id %>" />
	<jsp:param name="owner" value="<%= owner %>" />
	<jsp:param name="writer" value="<%= writer %>" />
</jsp:forward>