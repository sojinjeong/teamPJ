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
	
   
     
   %>
   
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=request.getParameter("val") %>
</body>

</html>