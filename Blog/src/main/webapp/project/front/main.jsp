<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<title>Blog_main</title>
</head>


<body>
<div class="container" style="background-color:#f8f8f8;">
	<%-- <%@ include file="header.jsp"%>
	--%>
	
	<%@ include file="header.jsp"%>
	<jsp:include page="user_info.jsp" >
		<jsp:param name="user" value="smilegate" />
		<jsp:param name="owner" value="smilegate" />
	</jsp:include>
	
	<jsp:include page="context.jsp" >
		<jsp:param name="user" value="smilegate" />
		<jsp:param name="owner" value="smilegate" />
	</jsp:include>
	
	
	
</div>
</body>
</html>