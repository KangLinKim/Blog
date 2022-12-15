<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<title>Blog_main</title>
</head>


<body>
<div class="container">
	<%-- <%@ include file="header.jsp"%>
	--%>
	
	<%@ include file="header.jsp"%>
	<jsp:include page="user_info.jsp" >
		<jsp:param name="user" value="smilegate" />
		<jsp:param name="owner" value="smilegate" />
	</jsp:include>
	
	<h3>2022.12.09 ~</h3>
	<h1>Coming Soon!</h1>
	
</div>
</body>
</html>