<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*" %> 

<link rel="stylesheet" href="/Blog/bootstrap-4.6.1-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/Blog/project/_res/css/style.css" type="text/css">

<%@ include file="/connection/dbconn_database.jsp" %>

<script>
function check() {
	with(document.commentswrite) {
		if(txtarea.value.length == 0) {
			alert("제목을 입력해 주세요!!");
			txtarea.focus();
			return false;
		}
	document.commentswrite.submit();
	}
}
function post_rewrite() {
	with(document.post_rewrites) {
		document.post_rewrites.submit();
	}
}
function post_del() {
	with(document.post_delete) {
		document.post_delete.submit();
	}
}
function dis_mod(i) {
	if($('#dis' + i).css('display') == 'none'){
		$('#dis' + i).show();
		$('#de_dis' + i).hide();
	} else {
		$('#dis' + i).hide();
		$('#de_dis' + i).show();
	}
}

</script>

<div class="container" style="background-color:#f8f8f8;">
<%
	String sql_posts = null;
	PreparedStatement st_posts = null;
	ResultSet rs_posts = null;

	String sql_comments = null;
	PreparedStatement st_comments = null;
	ResultSet rs_comments = null;

	String sql_likes = null;
	PreparedStatement st_likes = null;
	ResultSet rs_likes = null;
	
	Vector<Integer> post_ids = new Vector<Integer>();
	Vector<String> post_writers = new Vector<String>();
	Vector<String> post_subjects = new Vector<String>();
	Vector<String> post_contents = new Vector<String>();
	Vector<String> post_dates = new Vector<String>();
	
	Vector<String> comments_contents = new Vector<String>();
	Vector<String> comments_writers = new Vector<String>();
	
	String owner = request.getParameter("owner");
	String writer = request.getParameter("writer");
	String view = "posts_" + owner;
	
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	//int post_id = 1;

	try {
		sql_posts = "select * from posts where post_id = " + post_id;
		sql_posts = sql_posts + " order by post_id desc";
		st_posts = con_posts.prepareStatement(sql_posts);
		rs_posts = st_posts.executeQuery();

		sql_comments = "select * from comments where comments_post_id = " + post_id;
		st_comments = con_comments.prepareStatement(sql_comments);
		rs_comments = st_comments.executeQuery();

		sql_likes = "select * from likes where like_post_id = " + post_id;
		st_likes = con_likes.prepareStatement(sql_likes);
		rs_likes = st_likes.executeQuery();
		
		if (!(rs_posts.next()))  {
			out.println("해당 내용이 없습니다");
		
		} else {
			while(rs_comments.next()){
				comments_contents.addElement(rs_comments.getString("comments_content"));
				comments_writers.addElement(rs_comments.getString("comments_writer"));
			};
			%>
			
			<%@ include file="header.jsp"%>
			<jsp:include page="user_info.jsp" >
				<jsp:param name="user" value="smilegate" />
				<jsp:param name="owner" value="smilegate" />
			</jsp:include>
			
			<%
			out.println("<table class='table'>");
		
			out.println("<thead style='color:white; background-color: #738fe5; fontsize:2.0em;'>");
			out.println("<tr>");
			out.println("<th>제목 : " + rs_posts.getString("post_subject") + "</th>");
			out.println("<th></th>");
			out.println("</tr>");
			out.println("</thead>");
		
			out.println("<tbody stlye='background-color:white;'>");
			out.println("<tr>");
			out.println("<td>글쓴이 : " + rs_posts.getString("post_writer") + "</td>");
			out.println("<td></td>");
			out.println("</tr>");
			
			out.println("<tr>");
			out.println("<td>작성일 : " + rs_posts.getString("post_date") + "</td>");
			out.println("</tr>");
			
			out.println("<tr>");
			out.println("<td class ='context'>" + rs_posts.getString("post_content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt").replaceAll("\n","<br>") + "</td>");
			out.println("<td></td>");
			out.println("</tr>");
			
			for(int i = 0; i < comments_contents.size(); i++) {
				out.println("<tr>");
				out.println("<td>");
				out.println("<div id='de_dis" + i + "'>");
				out.println(comments_writers.elementAt(i) + (" : ")
							+ comments_contents.elementAt(i).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt").replaceAll("\n","<br>"));
				out.println("</div>");

				out.println("<div class='row' id='dis" + i + "' style='display:none'>");
				out.println("<textarea rows='3' maxlength='1000' class='form-control' name='txtarea'>" + 
						comments_contents.elementAt(i).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt").replaceAll("\n","<br>") + "</textarea>");
				out.println("<button class='btn btn-outline-info' id='dis" + i + "'>저장</button>");
				out.println("</div>");
				
				out.println("</td>");
				out.println("<td class='text-right'>");
				
				out.println("<button class='btn btn-info' onClick='dis_mod(" + i + ")'>수정</button>");
				out.println("<button class='btn btn-danger' id='show' onClick=''>삭제</button>");
				out.println("</td>");
				out.println("</tr>");
				
			}

			out.println("</tbody>");
			out.println("</table>");
		%>
		
	<form name="commentswrite" class= "form-horizontal" method="post" action="/Blog/project/background/comments_save.jsp">
		<div class = "form-group row">
			<textarea cols="60" rows="5" maxlength="1000" class="form-control" name="txtarea"></textarea>
			<input type="hidden" name="post_id" value="<%=post_id %>"/>
			<input type="hidden" name="owner" value="<%=owner %>"/>
			<input type="hidden" name="writer" value="<%=writer %>"/>
		</div>
	</form>

	<div class="text-right">
		<button type="submit" onClick="check();" class="btn btn-outline-primary">댓글 저장</button>
	</div>

	<div class="container">
	<div class="text-right float-right row" style="padding:5px;">
		<form name="post_rewrites" class= "form-horizontal" method="post" action="/Blog/project/front/post_rewrite.jsp">
			<div class = "form-group row">
				<input type="hidden" name="post_id" value="<%=post_id %>"/>
				<input type="hidden" name="owner" value="<%=owner %>"/>
				<input type="hidden" name="writer" value="<%=writer %>"/>
				<input type="hidden" name="post_subject" value="<%=rs_posts.getString("post_subject") %>"/>
				<input type="hidden" name="post_writer" value="<%=rs_posts.getString("post_writer") %>"/>
				<input type="hidden" name="post_date" value="<%=rs_posts.getString("post_date") %>"/>
				<input type="hidden" name="post_content" value="<%=rs_posts.getString("post_content") %>"/>
			</div>
		</form>
		<button type ="submit" onClick="post_rewrite();" class="btn btn-outline-info" style="margin:10px;">수정</button>
		
		<form name="post_delete" class= "form-horizontal" method="post" action="/Blog/project/background/posts_del.jsp">
			<div class = "form-group row">
				<input type="hidden" name="post_id" value="<%=post_id %>"/>
				<input type="hidden" name="owner" value="<%=owner %>"/>
				<input type="hidden" name="writer" value="<%=writer %>"/>
			</div>
		</form>
		<button type ="submit" onClick="post_del();" class="btn btn-outline-danger" style="margin:10px;">삭제</button>
	</div>
	</div>

		<%
		}
		
		rs_posts.close();
		st_posts.close();
		con_posts.close();
		
		rs_comments.close();
		st_comments.close();
		con_comments.close();

		rs_likes.close();
		st_likes.close();
		con_likes.close();
		
	} catch (SQLException e) {
		out.println(e);
	} 
	%>

</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/jquery/jquery-3.5.1.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/js/bootstrap.bundle.min.js"></script>