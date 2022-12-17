<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*" %> 

<link rel="stylesheet" href="/Blog/bootstrap-4.6.1-dist/css/bootstrap.min.css">

<%@ include file="/connection/dbconn_database.jsp" %>

<%@ include file="header.jsp"%>
<jsp:include page="user_info.jsp" >
	<jsp:param name="user" value="smilegate" />
	<jsp:param name="owner" value="smilegate" />
</jsp:include>
	
<style>
td.context {
	height:300px;
}

</style>

<script>
function check(){
	with(document.commentswrite){
		if(txtarea.value.length == 0){
			alert("제목을 입력해 주세요!!");
			txtarea.focus();
			return false;
		}
	document.commentswrite.submit();
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
	
	//String owner = request.getParameter("owner");
	String owner = "smilegate";
	String view = "posts_" + owner;
	String writer = "rkdfls12";
	
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
			
			out.println("<table class='table'>");
		
			out.println("<thead style='color:white; background-color: #738fe5; fontsize:2.0em;'>");
			out.println("<tr>");
			out.println("<th>제목 : " +rs_posts.getString("post_subject") + "</th>");
			out.println("<th></th>");
			out.println("</tr>");
			out.println("</thead>");
		
			out.println("<tbody stlye='background-color:white;'>");
			out.println("<tr>");
			out.println("<td>글쓴이 : " +rs_posts.getString("post_id") + "</td>");
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
				out.println("<td>" + comments_writers.elementAt(i) + (" : ")
							+ comments_contents.elementAt(i).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt").replaceAll("\n","<br>") + "</td>");
				out.println("<td></td>");
				out.println("</tr>");
			}

			out.println("</tbody>");
			out.println("</table>");
		%>
		
	<form name="commentswrite" class= "form-horizontal" method="post" action="/Blog/project/background/comments_save.jsp">
		<div class = "form-group row">
			<textarea cols="65" rows="5" maxlength="1000" class="form-control" name="txtarea"></textarea>
			<input type="hidden" name="post_id" value="<%=post_id %>"/>
			<input type="hidden" name="owner" value="<%=owner %>"/>
			<input type="hidden" name="writer" value="<%=writer %>"/>
		</div>
	</form>

	<div class="text-right">
		<a href="#" onClick="check();"><button type="submit" class="btn btn-outline-primary">저장</button></a>
	</div>

	<div align="right" class="container" style="padding:5px;">
		<button type="button" OnClick="location.href='post_rewrite.jsp'" class="btn btn-outline-info">수정</button>
		<button type="button" class="btn btn-outline-denger">삭제</button>
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