<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*" %> 

<link rel="stylesheet" href="/Blog/bootstrap-4.6.1-dist/css/bootstrap.min.css">

<%@ include file="/connection/dbconn_database.jsp" %>

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

<style>
div.context_box {
	width:1000px;
	height:200px;
	
	border:1px solid;
	border-radius : 0px 0px 20px 20px;
	
	background-color: white;
	box-shadow: 3px 3px 3px gray;
	
	margin:auto;
	
	cursor:pointer;
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




<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/jquery/jquery-3.5.1.js"></script>
<script src="/Blog/bootstrap-4.6.1-dist/js/bootstrap.bundle.min.js"></script>