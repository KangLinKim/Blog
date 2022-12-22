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
	with(document.post_rewrite) {
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
	document.post_rewrite.submit();
	}
}
</script>

</head>

<body>
<%
	request.setCharacterEncoding("utf-8");
	String owner = request.getParameter("owner");
	String writer = request.getParameter("writer");
	String post_id = request.getParameter("post_id");
	String post_subject = request.getParameter("post_subject");
	String post_writer = request.getParameter("post_writer");
	String post_date = request.getParameter("post_date");
	String post_content = request.getParameter("post_content");
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
		<form name="post_rewrite" class= "form-horizontal" method="post" action="/Blog/project/background/posts_resave.jsp">
			<div class = "form-group">
				<hr style = "border : solid 1px black;">
				<h3 class = "text-center sign_board">수정하기</h3>
				<hr style = "border : solid 1px black;">
			</div>
			<div class = "form-group row">
				<label class="col-2">제목</label>
				<div class= "col-10">
					<input type = "text" id="subject" name = "post_subject" class = "form-control" value = "<%=post_subject %>">
				</div>
			</div>
			<div class = "form-group row">
				<label class="col-2">내용</label>
				<div class= "col-10">
					<textarea cols="65" rows="10" id="content" name="post_content" maxlength="2000" class="form-control"><%=post_content %></textarea>
				</div>
			</div>
			<input type="hidden" name="owner" value="<%=owner %>"/>
			<input type="hidden" name="writer" value="<%=writer %>"/>
			<input type="hidden" name="post_id" value="<%=post_id %>"/>
			<input type="hidden" name="post_writer" value="<%=post_writer %>"/>
			<input type="hidden" name="post_date" value="<%=post_date %>"/>
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
