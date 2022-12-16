<%@ page language="java" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/Blog/bootstrap-4.6.1-dist/css/bootstrap.min.css">

<style>
img.banner_image {
	border-radius : 0px 0px 20px 20px;
	width: 700px;
	height: auto;
}

.icon_image {
	border-radius : 50%;
	border : solid 8px;
	border-color : white;
	width : 100px;
	height : 100px;
}
.banner_background {
	width:1110px;
	height:500px;
	object_fit:cover;
	background:linear-gradient(to bottom right, pink, #738fe5);
}
</style>

<%
	String user = request.getParameter("user");
	String owner = request.getParameter("owner");
%>

<div class="container">
	<div class="row">
		<div class = "text-center" style = "position:relative;">
			<img class="banner_background"/>
			<div class = "text-center" style="position: absolute; top: 0px; left: 200px;">
				<img class = "banner_image" src="/Blog/project/_res/banner/<%=owner %>_banner.jpg"/>
			</div>
			<div style="position: absolute; top: 370px; left: 180px;">
				<img class = "icon_image" src="/Blog/project/_res/icon/<%=owner %>_icon.jpg"/>
			</div>
			<div style="position: absolute; top: 400px; left: 300px;">
				<p class = "h1" style="font-weight:bold; color:#CCCCFF;"><%=owner %></p>
			</div>
		</div>
	</div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/jquery/jquery-3.5.1.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/js/bootstrap.bundle.min.js"></script>