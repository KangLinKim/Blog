<%@ page contentType="text/html; charset=utf-8"%>  
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("utf-8"); %>

<%@ include file="/connection/dbconn_database.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	String owner = request.getParameter("owner");
	String writer = request.getParameter("writer");
	String post_id = request.getParameter("post_id");

	String sql_posts = null;
	Statement st_posts = null;
	ResultSet rs_posts = null;

	String sql_comments = null;
	Statement st_comments = null;
	ResultSet rs_comments = null;

	String sql_likes = null;
	Statement st_likes = null;
	ResultSet rs_likes = null;
	
	
	int cnt = 0;
	
	try{
		st_posts = con_posts.createStatement();
		sql_posts = "delete from posts where post_id = " + post_id;
		cnt = st_posts.executeUpdate(sql_posts);
		
		st_comments = con_comments.createStatement();
		sql_comments = "delete from comments where comments_post_id = " + post_id;
		cnt = st_comments.executeUpdate(sql_comments);
		
		st_likes = con_likes.createStatement();
		sql_likes = "delete from likes where like_post_id = " + post_id;
		cnt = st_likes.executeUpdate(sql_likes);
		
		st_posts.close();
		con_posts.close();
		
		st_comments.close();
		con_comments.close();

		st_likes.close();
		con_likes.close();
		
	} catch (SQLException e) {
		out.println(e);
	}
%>

<jsp:forward page="/project/front/main.jsp">
	<jsp:param name="owner" value="<%=owner %>" />
	<jsp:param name="writer" value="<%=writer %>" />
</jsp:forward>