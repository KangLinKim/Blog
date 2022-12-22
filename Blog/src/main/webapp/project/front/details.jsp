<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.*" %>

<link rel="stylesheet" href="/Blog/bootstrap-4.6.1-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/Blog/project/_res/css/style.css?after" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@ include file="/connection/dbconn_database.jsp" %>

<script>
function check_1() {
	with(document.commentswrite) {
		if(txtarea.value.length == 0) {
			alert("댓글을 입력해 주세요");
			txtarea.focus();
			return false;
		}
	document.commentswrite.submit();
	}
};
function comment_rewrite() {
	with(document.comment_rewrites) {
		if(txtarea.value.length == 0) {
			alert("댓글을 입력해 주세요");
			txtarea.focus();
			return false;
		}
	document.comment_rewrites.submit();
	}
};
function post_rewrite() {
	with(document.post_rewrites) {
		document.post_rewrites.submit();
	}
};
function post_del() {
	with(document.post_delete) {
		document.post_delete.submit();
	}
};
function like_Y() {
	with(document.like_Y_post) {
		document.like_Y_post.submit();
	}
};
function like_N() {
	with(document.like_N_post) {
		document.like_N_post.submit();
	}
};

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
	Vector<Integer> comments_ids = new Vector<Integer>();
	
	String owner = request.getParameter("owner");
	String writer = request.getParameter("writer");
	String view = "posts_" + owner;
	
	Vector<String> post_like_users = new Vector<String>();
	boolean post_like = false;
	
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	//int post_id = 1;
	int idx = 0;

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
				comments_ids.addElement(rs_comments.getInt("comments_id"));
			};
			while(rs_likes.next()){
				String tmp = rs_likes.getString("like_user_id");
				post_like_users.addElement(tmp);
				if(tmp.equals(writer)) {
					post_like = true;
				}
			};
			%>
			
			<jsp:include page="header.jsp" >
				<jsp:param name="writer" value="<%= writer %>" />
			</jsp:include>
	
			<jsp:include page="user_info.jsp">
				<jsp:param name="writer" value="<%= writer %>" />
				<jsp:param name="owner" value="<%= owner %>" />
			</jsp:include>
			
			<%
			out.println("<div class='table_div'>");
			out.println("<table class='table'>");
		
			out.println("<thead class='context'>");
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
			out.println("<td></td>");
			out.println("</tr>");
			
			out.println("<tr>");
			out.println("<td class ='context'>" + rs_posts.getString("post_content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt").replaceAll("\n","<br>") + "</td>");
			out.println("<td></td>");
			out.println("</tr>");

			out.println("<tr>");
			out.println("<td style='border-top:none; border-bottom:double;'></td>");
			out.println("<td class='text-right' style='border-top:none; border-bottom:double;'>");
			if(post_like) { %>
				<form name="like_N_post" class="form-horizontal" method="post" action="/Blog/project/background/like_N.jsp">
					<div class = "form-group">
						<input type="hidden" name="owner" value="<%= owner %>"/>
						<input type="hidden" name="writer" value="<%= writer %>"/>
						<input type="hidden" name="post_id" value="<%= post_id %>"/>
					</div>
				</form>
				<a style='font-size:1.5em;'><%= post_like_users.size() %></a>
				<a href="#" onclick="like_N()"><img class="like_image" src='/Blog/project/_res/etc/like_ikon_Y.png'/></a>
			<% } else { %>
				<form name="like_Y_post" class="form-horizontal" method="post" action="/Blog/project/background/like_Y.jsp">
					<div class = "form-group">
						<input type="hidden" name="owner" value="<%= owner %>"/>
						<input type="hidden" name="writer" value="<%= writer %>"/>
						<input type="hidden" name="post_id" value="<%= post_id %>"/>
					</div>
				</form>
				<a></a>
				<a style='font-size:1.5em;'><%= post_like_users.size() %></a>
				<a href="#" onclick="like_Y()"><img class="like_image" src='/Blog/project/_res/etc/like_ikon_N.png'/></a>
			<% }
			out.println("</td>");
			out.println("</tr>");
			
			idx = 0;
			for(int i = 0; i < comments_contents.size(); i++) {
				out.println("<tr>");
				out.println("<td>");
				out.println("<div id='de_dis" + i + "'>");
				out.println(comments_writers.elementAt(i) + (" : ")
							+ comments_contents.elementAt(i).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt").replaceAll("\n","<br>"));
				out.println("</div>");
				
				%>
				<script>
				function dis_mod(m_idx) {
					var m_writer = '<%= writer %>';
					var m_comments_writer = '<%= comments_writers %>';
					m_comments_writer = m_comments_writer.slice(1, -1);
					m_comments_writer = m_comments_writer.split(', ');
					m_comments_writer = m_comments_writer[m_idx];
					var tmp = m_comments_writer;
					
					if (tmp != m_writer) {
						alert("작성자가 아닙니다");
						return false;
					}
					
					if($('#dis' + m_idx).css('display') == 'none'){
						$('#dis' + m_idx).show();
						$('#de_dis' + m_idx).hide();
					} else {
						$('#dis' + m_idx).hide();
						$('#de_dis' + m_idx).show();
					}
				};
				function del_check(m_idx) {
					var m_owner = '<%= owner %>';
					var m_writer = '<%= writer %>';
					var m_comments_writer = '<%= comments_writers %>';
					m_comments_writer = m_comments_writer.slice(1, -1);
					m_comments_writer = m_comments_writer.split(', ');
					m_comments_writer = m_comments_writer[m_idx];
					var tmp = m_comments_writer;

					with(document.comment_del) {
						if (tmp != m_writer) {
							alert("작성자가 아닙니다");
							return false;
						} else if (tmp != m_owner) {
							alert("삭제 권한이 없습니다");
							return false;
						}
						document.comment_del.submit();
					}
				};
				</script>

				<div class='row' id='dis<%=i %>' style='display:none'>
					<form name="comment_rewrites" class= "form-horizontal" method="post" action="/Blog/project/background/comments_resave.jsp">
						<div class = "form-group">
							<textarea cols="60" rows="3" maxlength="1000" class="form-control" name="txtarea"><%=
								comments_contents.elementAt(i).replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
								.replaceAll(">", "&gt").replaceAll("\n","<br>")%></textarea>
							<input type="hidden" name="post_id" value="<%= post_id %>"/>
							<input type="hidden" name="owner" value="<%= owner %>"/>
							<input type="hidden" name="writer" value="<%= writer %>"/>
							<input type="hidden" name="comment_id" value="<%= comments_ids.elementAt(i) %>"/>
						</div>
						<div>
							<button type="submit" class="btn btn-outline-info" onClick="comment_rewrite();">댓글 수정</button>
						</div>
					</form>
				</div>
				
				<%
				out.println("</td>");
				out.println("<td class='text-right'>");

				if (writer.equals(comments_writers.elementAt(i))) { %>
					<button class='btn btn-info' onClick='dis_mod(<%=i%>);'>수정</button>
					
					<form name="comment_del" class= "form-horizontal" method="post" action="/Blog/project/background/comments_del.jsp">
						<div class = "form-group">
							<input type="hidden" name="post_id" value="<%= post_id %>"/>
							<input type="hidden" name="owner" value="<%= owner %>"/>
							<input type="hidden" name="writer" value="<%= writer %>"/>
							<input type="hidden" name="comment_id" value="<%= comments_ids.elementAt(i) %>"/>
						</div>
					<div>
						<button type="submit" class='btn btn-danger' id='show' onClick='del_check(<%=i%>)'>삭제</button>
					</div>
					</form>

					<%
				};
				
				out.println("</td>");
				out.println("</tr>");
				idx += 1;
			}

			out.println("</tbody>");
			out.println("</table>");
			out.println("</div>");
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
				<button type="submit" onClick="check_1();" class="btn btn-outline-primary">댓글 저장</button>
			</div>

			<%
			if(writer.equals(owner)) {	
			%>
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