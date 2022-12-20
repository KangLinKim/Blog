<%@ page contentType="text/html; charset=utf-8"%>  
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("utf-8"); %>

<%@ include file="/connection/dbconn_database.jsp" %>
<%
	String owner = request.getParameter("owner");
	String writer = request.getParameter("writer");
	String comment_content = request.getParameter("txtarea");
	String post_id = request.getParameter("post_id");
	String comment_id = request.getParameter("comment_id");

	java.util.Date yymmdd = new java.util.Date() ;
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	String ymd = myformat.format(yymmdd);
	
	String sql_comments = null;
	Statement st_comments = null;
	ResultSet rs_comments = null;
	
	int cnt = 0;

	try{
		st_comments = con_comments.createStatement();
		sql_comments = "update comments set comments_content = '" + comment_content + "', comments_date = now() where comments_id = " + comment_id;
		cnt = st_comments.executeUpdate(sql_comments);
		
		st_comments.close();
		con_comments.close();
	} catch (SQLException e) {
		out.println(e);
	}
%>

<jsp:forward page="/project/front/details.jsp">
	<jsp:param name="post_id" value="<%=post_id %>" />
	<jsp:param name="owner" value="<%=owner %>" />
	<jsp:param name="writer" value="<%=writer %>" />
</jsp:forward>