<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Blog_main</title>
<link rel="stylesheet" href="/Blog/project/_res/css/style.css?after" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<body>
<%
	String owner = request.getParameter("owner");
	String writer = request.getParameter("writer");
	
	//String user = null;
	//String owner = null;
	
	if(writer == null) {
		owner = "smilegate";
		writer = "smilegate";
	}
	
%>
<div class="container" style="background-color:#f8f8f8;">
	<jsp:include page="header.jsp" >
		<jsp:param name="writer" value="<%= writer %>" />
	</jsp:include>
	
	<jsp:include page="user_info.jsp" >
		<jsp:param name="writer" value="<%= writer %>" />
		<jsp:param name="owner" value="<%= owner %>" />
	</jsp:include>
	
	<jsp:include page="context.jsp" >
		<jsp:param name="writer" value="<%= writer %>" />
		<jsp:param name="owner" value="<%= owner %>" />
	</jsp:include>	
</div>

</body>
</html>