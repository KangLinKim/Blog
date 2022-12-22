<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import = "utils.*" %>

<link rel="stylesheet" href="/Blog/project/_res/css/style.css?after" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script>
function login_check() {
	with(document.login) {
		if(id.value.length == 0) {
			alert("아이디를 입력해 주세요");
			id.focus();
			return false;
		}
		if(pw.value.length == 0) {
			alert("비밀번호를 입력해주세요");
			pw.focus();
			return false;
		}
	document.login.submit();
	}
}
</script>

<div class="container">
	<%@ include file="header.jsp"%>
	<div class="backgr_div">
		<img class="backgr_img" src="/Blog/project/_res/etc/Smilegate_Logo.png"/>
		
		<div class="container inner_container" style="width:80%;">
			<form name="login" class= "form-horizontal" method="post" action="/Blog/project/background/login.jsp">
				<div class="form-group row">
					<label class="col-2">아이디</label>
					<div class= "col-10">
						<input type="text" id="id" name="id" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-2">비밀번호</label>
					<div class= "col-10">
						<input type="password" id="pw" name="pw" class="form-control">
					</div>
				</div>
			</form>
			
			<div class="text-right">
				<button class="btn btn-warning" onClick="location.href='/Blog/project/front/new_user.jsp'">회원가입</button>
				<a onClick="login_check();"><button type="submit" class="btn btn-secondary">로그인</button></a>
			</div>
		</div>
	</div>
</div>