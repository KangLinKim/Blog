<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*"%>

<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.text.*" %> 
<%@ page language="java" import="java.io.*" %> 

<%@ page import="utils.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%@ include file="/connection/dbconn_database.jsp" %>

<%
	DiskFileUpload upload = new DiskFileUpload();

	upload.setSizeMax(10000000);
	upload.setSizeThreshold(4096);
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();


	FileItem item = (FileItem)params.next();
	String id = item.getString("utf-8");
	out.println("id = " + id);
	
	item = (FileItem)params.next();
	String pw = item.getString("utf-8");
	out.println("pw = " + pw);
	
	item = (FileItem)params.next();
	String name = item.getString("utf-8");
	out.println("name = " + name);
	
	item = (FileItem)params.next();
	String phone_number = item.getString("utf-8");
	out.println("phone_number = " + phone_number);
	
	
	
	String path = "C:\\Users\\forsa\\git\\Blog\\Blog\\src\\main\\webapp\\project\\_res\\icon\\";
	upload.setRepositoryPath(path);
	
	item = (FileItem)params.next();
	String fileFieldName = item.getFieldName();
	String fileName = item.getName();
	String contentType = item.getContentType();
	
	String extention = fileName.substring(fileName.lastIndexOf(".") + 1);

	fileName = id + "_icon." + extention;
	long fileSize = item.getSize();
	
	File file = new File(path + "/" + fileName);
	item.write(file);
	
	
	
	path = "C:\\Users\\forsa\\git\\Blog\\Blog\\src\\main\\webapp\\project\\_res\\banner\\";
	upload.setRepositoryPath(path);
	
	item = (FileItem)params.next();
	fileFieldName = item.getFieldName();
	fileName = item.getName();
	contentType = item.getContentType();
	
	extention = fileName.substring(fileName.lastIndexOf(".") + 1);

	fileName = id + "_banner." + extention;
	fileSize = item.getSize();
	
	file = new File(path + "/" + fileName);
	item.write(file);
	
	
	Statement st_users = null;
	String sql_users = null;
	int cnt = 0;
	
	try {
		st_users = con_users.createStatement();
		sql_users = "insert users values ('" + id + "', '" + SHA256.encodeSha256(pw) + "', '" + name + "', " + phone_number + ");";
		cnt = st_users.executeUpdate(sql_users);
		
		st_users = con_users.createStatement();
		sql_users = "create view posts_" + id + " as select * from posts where post_writer = '" + id + "'";
		cnt = st_users.executeUpdate(sql_users);

		st_users.close();
		con_users.close();
	} catch (SQLException e) {
		out.println(e);
	}
%>

<jsp:forward page="/project/front/main.jsp">
	<jsp:param name="owner" value="<%= id %>" />
	<jsp:param name="writer" value="<%= id %>" />
</jsp:forward>