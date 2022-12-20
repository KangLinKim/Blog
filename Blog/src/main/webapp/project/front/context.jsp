<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*" %> 

<link rel="stylesheet" href="/Blog/bootstrap-4.6.1-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/Blog/project/_res/css/style.css" type="text/css">

<%@ include file="/connection/dbconn_database.jsp" %>

<%
	Vector<Integer> post_ids = new Vector<Integer>();
	Vector<String> post_writers = new Vector<String>();
	Vector<String> post_subjects = new Vector<String>();
	Vector<String> post_contents = new Vector<String>();
	Vector<String> post_dates = new Vector<String>();
	
	String em = null;
	Statement st = null;
	ResultSet rs = null;

	String owner = request.getParameter("owner");
	String writer = request.getParameter("user");
	String view = "posts_" + owner;
	
	try {
		st = con_comments.createStatement();
		String sql = "select * from " + view + " order by post_id desc";
		
		rs = st.executeQuery(sql);

		if(owner.equals(writer)) { %>
		<div class="container text-right" style="padding:5px;">
			<form name="postwrite" class= "form-horizontal" method="post" action="post_write.jsp">
				<div class = "form-group row">
					<input type="hidden" name="owner" value="<%=owner %>"/>
					<input type="hidden" name="writer" value="<%=writer %>"/>
				</div>
				<button type="submit" onClick="check();"class="btn btn-outline-primary">새 글</button>
			</form>
		</div>
		<% }
		
		if (!(rs.next()))  {
			out.println("게시판에 올린 글이 없습니다");
			
		} else {
			do {
				post_ids.addElement(rs.getInt("post_id"));
				post_writers.addElement(rs.getString("post_writer"));
				post_subjects.addElement(rs.getString("post_subject"));
				post_contents.addElement(rs.getString("post_content"));
				String idate = rs.getString("post_date");
				idate = idate.substring(0,8);
				post_dates.addElement(idate);
				
			} while(rs.next());
			%>
<div class="container">
	<%
		for(int j = 0; j < post_ids.size(); j++) {
	%>
	<div class="container" style="padding:10px;" onClick="location.href ='/Blog/project/front/details.jsp?post_id=<%=post_ids.elementAt(j) %>&owner=<%=owner%>&writer=<%=writer %>'">
		<div class="container context_box">
			<div class="inner_context_box_title row">
				<div class="col-6" contenteditable="true" style="disabled:disabled">
					<% out.print(post_subjects.elementAt(j)); %>
				</div>
				
				<div class="col-6">
				</div>
			</div>
			<div class="inner_context_box_subject" contenteditable="true" style="disabled:disabled">
				<% out.print(post_contents.elementAt(j));%>
			</div>
		</div>
	</div>

	<%		}
		}
	} catch (java.sql.SQLException e) {
		out.println(e);
	}
	%>
	
</div>




<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/jquery/jquery-3.5.1.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/js/bootstrap.bundle.min.js"></script>