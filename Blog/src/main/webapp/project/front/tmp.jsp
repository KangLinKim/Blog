<%@ page language="java" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/Blog/bootstrap-4.6.1-dist/css/bootstrap.min.css">

<%
	String user = request.getParameter("user");
	String owner = request.getParameter("owner");
	
%>

<div class="container">
	<a>user=<%= user %></a>
	<a>owner=<%= owner %></a>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/jquery/jquery-3.5.1.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/js/bootstrap.bundle.min.js"></script>