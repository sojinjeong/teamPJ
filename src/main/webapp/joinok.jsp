<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<%@ page import="school.dao.*" %>
<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>
 <jsp:useBean id="sDto" class="school.dto.SDto" scope="page" />
   <jsp:setProperty name="sDto" property="*" />

   <%
   String remem = request.getParameter("remem");
   Connection conn = db.getConnection();
   StudentsDao dao = new  StudentsDao(conn);
   int rs = dao.insertDB(sDto);
   
   
	db.closeConnection();

     
   %>
   
<!DOCTYPE html>
<html>
<head>
<script>
 alert("회원가입이 완료 되었습니다.");
 location.href="./index.jsp";
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>

</html>