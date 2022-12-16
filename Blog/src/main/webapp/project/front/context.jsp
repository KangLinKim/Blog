<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*" %> 

<link rel="stylesheet" href="/Blog/bootstrap-4.6.1-dist/css/bootstrap.min.css">

<%@ include file="dbconn.jsp" %>

<style>
div.context_box {
	width:1000px;
	height:200px;
	
	border:1px solid;
	border-radius : 0px 0px 20px 20px;
	
	background-color: white;
	box-shadow: 3px 3px 3px gray;
	
	margin:auto;
}
.inner_context_box_title {
	width:1000px;
	height:60px;
	line-height:60px;
		
	border-right:1px solid black;
	
	font-size:1.5em;
	color:white;
	background-color: #738fe5;
	
}
.inner_context_box_subject {
	width:1000px;
	height:auto;
	
	padding:10px;
}

</style>


<div align="right" class="container" style="padding:5px;">
	<input type="button" class="btn btn-outline-secondary" type="submit" value="새 글" style="margin-left:10px;">
	<button type="button" class="btn btn-outline-secondary">새 글</button>
</div>

<%
	Vector name=new Vector();
	Vector inputdate=new Vector();
	Vector email=new Vector();
	Vector subject=new Vector();
	Vector content=new Vector();
	Vector rcount=new Vector();
	
	Vector step=new Vector();
	Vector keyid=new Vector();
	int where=1;

	int totalgroup=0;
	int maxpages=2;
	int startpage=1;
	int endpage=startpage+maxpages-1;
	int wheregroup=1;

	String em=null;
	//Connection con= null;
	Statement st = null;
	ResultSet rs = null;

	//String table = request.getParameter("table");
	String table = "freeboard";
	
	try {
		st = con.createStatement();
		String sql = "select * from " + table + " order by" ;
		sql = sql + " masterid desc, replynum, step, id" ;
		rs = st.executeQuery(sql);
		
		if (!(rs.next()))  {
			out.println("게시판에 올린 글이 없습니다");
		} else {
			do {
				keyid.addElement(new Integer(rs.getInt("id")));
				name.addElement(rs.getString("name"));
				email.addElement(rs.getString("email"));
				String idate = rs.getString("inputdate");
				idate = idate.substring(0,8);
				inputdate.addElement(idate);
				
				subject.addElement(rs.getString("subject"));
				content.addElement(rs.getString("content"));
				rcount.addElement(new Integer(rs.getInt("readcount")));
				step.addElement(new Integer(rs.getInt("step")));
				
			} while(rs.next());
	
%>




<div class="container">

	<%
	for(int j = 0; j < subject.size(); j++) {
	%>
	<div class="container" style ="padding:10px;">
		<div class="container context_box">
			<div class="inner_context_box_title row">
				<div class="col-6" contenteditable="true" disabled>
					<% out.print(subject.elementAt(j)); %>
				</div>
				
				<div class="col-6">
			
				<nav class="navbar navbar-expand-md bottom-header-box" style="float:right; top:0%;">	
					<div class = "container">
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav mr-auto">
								<li class="nav-item dropdown">
									<img src = "/Blog/project/_res/etc/dots_three_circle_vertical_icon.png" class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="navbardrop" style ="width:50px; height:auto;"/>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="/pre_project/aisw.kangwon.ac.kr/aisw/intro/greetings.jsp">삭제</a>
										<a class="dropdown-item" href="/pre_project/aisw.kangwon.ac.kr/aisw/intro/history04.jsp">수정</a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</nav>
			
				</div>
			</div>
			<div class="inner_context_box_subject" contenteditable="true" disabled>
				<% out.print(content.elementAt(j));%>
			</div>
		</div>
	</div>

<%			} 
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