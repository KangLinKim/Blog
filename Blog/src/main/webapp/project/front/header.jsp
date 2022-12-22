<%@ page language="java" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/Blog/bootstrap-4.6.1-dist/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%
	String writer = request.getParameter("writer");
%>

<nav class="navbar navbar-expand-md bg-light navbar-light bottom-header-box">
<div class = "container" style="text-align:center;">
	<div class="col-6" align="left">
		<img src="/Blog/project/_res/etc/Smilegate_Logo.png" style ="width:100px; height:auto; cursor:pointer;" onClick="location.href='/Blog/project/front/main.jsp'"/>
	</div>

	<div class="col-6" align="right">
		<table class="pull-right">
			<tr>
				<form name="search" class="form-horizontal" method="post" action="/Blog/project/background/search_back.jsp">
				<td>
					<input type="text" class="form-control" placeholder="검색어 입력" name="searchText" maxlength="100">
				</td>
				<td>
					<button type="submit" class="btn btn-success">검색</button>
					<input type="hidden" name="writer" value="<%= writer %>"/>
				</td>
				</form>
				<td>
					<input type="button" class="btn btn-outline-secondary" value="로그인" style="margin-left:10px;"
							onClick="location.href='/Blog/project/front/login.jsp'">
				</td>
			</tr>
		</table>
	</div>
</div>
</nav>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/jquery/jquery-3.5.1.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/js/bootstrap.bundle.min.js"></script>