<%@ page contentType="text/html; charset=utf-8"%>  
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("utf-8"); %>

<%@ include file="/connection/dbconn_database.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	String owner = request.getParameter("owner");
	String writer = request.getParameter("writer");
	String post_id = request.getParameter("post_id");
	String post_subject = request.getParameter("post_subject");
	String post_writer = request.getParameter("post_writer");
	String post_date = request.getParameter("post_date");
	String post_content = request.getParameter("post_content");
	
	 int id = 1;
	 int pos = 0;
	 if (post_content.length() == 1) 
		 post_content = post_content+" ";

	while ((pos = post_content.indexOf("\'", pos)) != -1) {
		String left = post_content.substring(0, pos);
		String right = post_content.substring(pos, post_content.length());
		post_content = left + "\'" + right;
		pos += 2;
	}

	String sql_posts = null;
	Statement st_posts = null;
	ResultSet rs_posts = null;
	int cnt = 0;
	
	try{
		st_posts = con_posts.createStatement();
		sql_posts = "update posts set post_subject = '" + post_subject + "', post_content = '" + post_content + "' where post_id = " + post_id;
		cnt = st_posts.executeUpdate(sql_posts); 
		
		st_posts.close();
		con_posts.close();
		
	} catch (SQLException e) {
		out.println(e);
	}
%>

<jsp:forward page="/project/front/details.jsp">
	<jsp:param name="owner" value="<%=owner %>" />
	<jsp:param name="writer" value="<%=writer %>" />
	<jsp:param name="post_id" value="<%=post_id %>" />
</jsp:forward>