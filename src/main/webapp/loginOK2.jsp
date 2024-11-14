<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	String role = (String) session.getAttribute("rolee");
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	if(role == null){
		
	
%>
	<script>
	alert("로그인이 필요한 시스템입니다.");
	location.href="index.jsp";
	</script>
<%
	}
	else if(role.equals("pr1")){
%>
	<script>
	alert("학생만 확인할 수 있는 시스템입니다.");
	location.href="index.jsp";
	</script>
<%	
	}
%>
</body>
</html>