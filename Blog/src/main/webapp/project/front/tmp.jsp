<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="utils.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String pw = "3131";
		out.println("bard\t: " + SHA256.encodeSha256(pw));
		out.println("<br>");
		
		pw = "4131";
		out.println("rkdfls12\t: " + SHA256.encodeSha256(pw));
		out.println("<br>");
		
		pw = "1111";
		out.println("root\t: " + SHA256.encodeSha256(pw));
		out.println("<br>");
		
		pw = "1234";
		out.println("smilegate\t: " + SHA256.encodeSha256(pw));
		out.println("<br>");

		pw = "fwas";
		out.println("smilegate : " + SHA256.encodeSha256(pw));
	%>
	
</body>
</html>