<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="utils.*" %>

<link rel="stylesheet" href="/Blog/bootstrap-4.6.1-dist/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%
	String writer = request.getParameter("writer");
	String owner = request.getParameter("owner");
	
	String banner_path = "C:\\Users\\forsa\\git\\Blog\\Blog\\src\\main\\webapp\\project\\_res\\banner\\" + owner + "_banner";
	String banner_extension = FileExists.file_exists_check(banner_path);
	
	String icon_path = "C:\\Users\\forsa\\git\\Blog\\Blog\\src\\main\\webapp\\project\\_res\\icon\\" + owner + "_icon";
	String icon_extension = FileExists.file_exists_check(icon_path);
%>

<div class="container" style="cursor:pointer;" onClick="location.href='/Blog/project/front/main.jsp?writer=<%=writer %>&owner=<%=owner %>'">
	<div class="row">
		<div class = "text-center" style = "position:relative;">
			<img class="banner_background"/>
			<div class="text-center banner_cover">
					<img class="banner_image" src="/Blog/project/_res/banner/<%= owner %>_banner<%= banner_extension%>"/>
			</div>
			<div class="icon_cover">
				<img class="icon_image" src="/Blog/project/_res/icon/<%= owner %>_icon<%= icon_extension%>" />
			</div>
			<div style="position: absolute; top: 400px; left: 300px;">
				<p class="h1" style="font-weight:bold; color:#CCCCFF;"><%= owner %></p>
			</div>
		</div>
	</div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/jquery/jquery-3.5.1.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/js/bootstrap.bundle.min.js"></script>