<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%@ page import="utils.*" %>

<%@ include file="/connection/dbconn_database.jsp" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	pw = SHA256.encodeSha256(pw);

	String sql_users = null;
	Statement st_users = null;
	ResultSet rs_users = null;

	String user_pw = null;
	
	try {
		st_users = con_users.createStatement();
		sql_users = "select * from users where user_id = '" + id + "';";
		rs_users = st_users.executeQuery(sql_users);
		
		if (!(rs_users.next()))  {
			out.println("해당 내용이 없습니다");
		
		} else {
			do {
				user_pw = rs_users.getString("user_password");
				
			} while(rs_users.next());
		}
		
		if(!user_pw.equals(pw)) {
			out.println("<script>alert('비밀번호가 다릅니다');location.href='/Blog/project/front/login.jsp';</script>");
		} else {
			%>
			<jsp:forward page="/project/front/main.jsp">
				<jsp:param name="owner" value="<%= id %>" />
				<jsp:param name="writer" value="<%= id %>" />
			</jsp:forward>
			<%
		}
		
		st_users.close();
		con_users.close();
		rs_users.close();
		
	} catch (SQLException e) {
		out.println(e);
	}
%>

