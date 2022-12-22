<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %> 
<%@ page import="utils.*" %>

<link rel="stylesheet" href="/Blog/bootstrap-4.6.1-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/Blog/project/_res/css/style.css?after" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%
	Vector<String> users = new Vector<String>();
	Vector<String> icon_extensions = new Vector<String>();
	String owner = (String)request.getAttribute("owner");

	int cnt = (int)request.getAttribute("cnt");
	String writer = (String)request.getAttribute("writer");
	
	for(int i = 0; i < cnt; i++) {
		users.addElement((String)request.getAttribute("user_" + i));
	}
	
	
	for(int i = 0; i < users.size(); i++) {
		String icon_path = "C:\\Users\\forsa\\git\\Blog\\Blog\\src\\main\\webapp\\project\\_res\\icon\\" + users.elementAt(i) + "_icon";
		String extension = FileExists.file_exists_check(icon_path);
		icon_extensions.addElement(extension);
	}
%>

<div class="container search_div">
	<jsp:include page="header.jsp">
		<jsp:param name="writer" value="<%= writer %>" />
	</jsp:include>
	
	<div class="container search_inner_div">
		<table class="table table-hover">
			<thead class="search_thead">
				<tr>
					<th colspan="2" class="text-center">검색결과</th>
				</tr>
			</thead>
			<tbody>
				<% 
				if(users.size() > 0) {
					for(int i = 0; i < users.size(); i++) { %>
						<tr onClick="location.href='/Blog/project/front/main.jsp?writer=<%= writer %>&owner=<%= users.elementAt(i) %>'">
							<td class="search_td">
								<img class="search_icon" src="/Blog/project/_res/icon/<%=users.elementAt(i) %>_icon<%= icon_extensions.elementAt(i) %>" />
							</td>
							<td class="search_td"><%= users.elementAt(i) %></td>
						</tr>
				<% }
				} else { %>
					<tr>
						<td class="search_td" colspan="2">검색결과가 없습니다</td>
					</tr>
				<% } %>
			</tbody>
		</table>
		
	</div>
</div>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/jquery/jquery-3.5.1.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/js/bootstrap.bundle.min.js"></script>