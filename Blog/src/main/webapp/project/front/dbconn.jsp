<%@ page import="java.sql.*"%>
<%
	Connection con = null;

	String url = "jdbc:mysql://localhost:3306/fboard?serverTimeZone=Asia/Seoul&useSSL=false";
	String user = "root";
	String password = "1234";

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
%>