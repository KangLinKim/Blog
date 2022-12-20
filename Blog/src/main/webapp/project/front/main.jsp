<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<title>Blog_main</title>
<link rel="stylesheet" href="/Blog/project/_res/css/style.css?after" type="text/css">
</head>

<body>
<%
	//String user = request.getParameter("user");
	//String owner = request.getParameter("owner");
	
	String user = "smilegate";
	String owner = "smilegate";
%>
<div class="container" style="background-color:#f8f8f8;">
	<%@ include file="header.jsp"%>
	<jsp:include page="user_info.jsp" >
		<jsp:param name="user" value="<%= user %>" />
		<jsp:param name="owner" value="<%= owner %>" />
	</jsp:include>
	
	<jsp:include page="context.jsp" >
		<jsp:param name="user" value="<%= user %>" />
		<jsp:param name="owner" value="<%= owner %>" />
	</jsp:include>
	
</div>
</body>
</html>