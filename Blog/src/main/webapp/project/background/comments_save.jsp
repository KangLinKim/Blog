<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%@ include file="/connection/dbconn_database.jsp" %>

<%
	String txtarea = request.getParameter("txtarea");
	String post_id = request.getParameter("post_id");
	String owner = request.getParameter("owner");
	String writer = request.getParameter("writer");

	int id = 1;
	
	String sql_comments = null;
	Statement st_comments = null;
	ResultSet rs_comments = null;
	int cnt = 0;


	try{
		st_comments = con_comments.createStatement();
		sql_comments = "select max(comments_id) from comments";
		rs_comments = st_comments.executeQuery(sql_comments);
		
		if (!(rs_comments.next())) 
			id = 1;
		else {
			id = rs_comments.getInt(1) + 1 ;
			rs_comments.close();
		}
		
		sql_comments = "insert into comments values(" + id + ", " + post_id + ", '" + writer + "', '" + txtarea + "', now())";
		
		cnt = st_comments.executeUpdate(sql_comments);
		
		st_comments.close();
		con_comments.close();
		
	} catch (SQLException e) {
		out.println(e);
	}
%>

<jsp:forward page="/project/front/details.jsp">
	<jsp:param name="txtarea" value="<%=txtarea %>" />
	<jsp:param name="post_id" value="<%=post_id %>" />
	<jsp:param name="owner" value="<%=owner %>" />
	<jsp:param name="writer" value="<%=writer %>" />
</jsp:forward>