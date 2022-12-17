<%@ page import="java.sql.*"%>
<%
	Connection con_posts = null;
	Connection con_comments = null;
	Connection con_likes = null;

	String url = "jdbc:mysql://localhost:3306/sgblog_database?serverTimeZone=Asia/Seoul&useSSL=false";
	String user = "root";
	String password = "1234";

	Class.forName("com.mysql.jdbc.Driver");
	
	con_posts = DriverManager.getConnection(url, user, password);
	con_comments = DriverManager.getConnection(url, user, password);
	con_likes = DriverManager.getConnection(url, user, password);
%>