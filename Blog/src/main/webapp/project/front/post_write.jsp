<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>

<link rel="stylesheet" href="/Blog/bootstrap-4.6.1-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/Blog/project/_res/css/style.css" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@ include file="/connection/dbconn_database.jsp" %>

<html>
<head>

<script>
function check() {
	with(document.postwrite) {
		if(subject.value.length == 0) {
			alert("제목을 입력해 주세요!!");
			subject.focus();
			return false;
		}
		if(content.value.length == 0) {
			alert("내용을 입력해주세요!!");
			content.focus();
			return false;
		}
	document.postwrite.submit();
	}
}
</script>

</head>

<body>
<%
	request.setCharacterEncoding("utf-8");
	String owner = request.getParameter("owner");
	String writer = request.getParameter("writer");
	
%>
<div class="container" style="background-color:#f8f8f8;">
	<jsp:include page="header.jsp" >
		<jsp:param name="writer" value="<%= writer %>" />
	</jsp:include>
	
	<jsp:include page="user_info.jsp" >
		<jsp:param name="user" value="<%= writer %>" />
		<jsp:param name="owner" value="<%= owner %>" />
	</jsp:include>
		
	<div class = "container new_post" >
		<form name="postwrite" class= "form-horizontal" method="post" action="/Blog/project/background/posts_save.jsp">
			<div class = "form-group">
				<hr style = "border : solid 1px black;">
				<h3 class = "text-center sign_board">새글 쓰기</h3>
				<hr style = "border : solid 1px black;">
			</div>
			<div class = "form-group row">
				<label class="col-2">제목</label>
				<div class= "col-10">
					<input type = "text" id="subject" name = "subject" class = "form-control">
				</div>
			</div>
			<div class = "form-group row">
				<label class="col-2">내용</label>
				<div class= "col-10">
					<textarea cols="65" rows="10" id="content" name="content" maxlength="2000" class="form-control"></textarea>
				</div>
			</div>
			<input type="hidden" name="owner" value="<%=owner %>"/>
			<input type="hidden" name="writer" value="<%=writer %>"/>
		</form>
		
		<div class="text-right">
			<a href="#" onClick="check();"><button type="submit" class="btn btn-outline-primary">저장</button></a>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/jquery/jquery-3.5.1.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
