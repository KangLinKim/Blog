<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%@ include file="/connection/dbconn_database.jsp" %>

<%
	String searchText = request.getParameter("searchText");
	String writer = request.getParameter("writer");

	int id = 1;
	
	String sql_users = null;
	Statement st_users = null;
	ResultSet rs_users = null;
	int cnt = 0;

	Vector<String> users = new Vector<String>();

	try{
		st_users = con_users.createStatement();
		sql_users = "select user_id from users where user_id like '%" + searchText + "%'";
		rs_users = st_users.executeQuery(sql_users);
		
		if (!(rs_users.next()))  {
			out.println("해당 내용이 없습니다");
		
		} else {
			do {
				users.addElement(rs_users.getString("user_id"));
			} while(rs_users.next());
		}
		
		int tmp = users.size();

		request.setAttribute("writer", writer);
		request.setAttribute("cnt", tmp);
		for(int i = 0; i < tmp; i++) {
			request.setAttribute("user_" + i, users.elementAt(i));
		}
		pageContext.forward("/project/front/search.jsp");
		
		st_users.close();
		rs_users.close();
		con_users.close();
		
	} catch (SQLException e) {
		out.println(e);
	}
%>