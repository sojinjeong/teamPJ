<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<%@ page import="school.dao.*" %>
<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>
 <jsp:useBean id="iDto" class="school.dto.IDto" scope="page" />
   <jsp:setProperty name="iDto" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 등록 결과</title>
</head>
<body>
<% 
 
  String checkedValues = request.getParameter("checkedValues"); 
  Connection conn = db.getConnection();
  ScheduleDao dao = new ScheduleDao(conn);
  String stNum2 = (String) session.getAttribute("id");
  
  
  
  int stNum = Integer.parseInt(stNum2);
  int rs = dao.interest_deleteDB(stNum);
  
  
  

 %>
 
 
    
</body>
<script>
  alert("관심등록이 삭제되었습니다.");
  location.href="interest.jsp";
</script>
</html>