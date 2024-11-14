<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="school.dao.*, school.dto.*, java.sql.*, java.util.*" %>
<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>
 <jsp:useBean id="sDto" class="school.dto.SDto" scope="page" />
   <jsp:setProperty name="sDto" property="*" />
   
      <%
   
   Connection conn = db.getConnection();
   ScheduleDao dao = new  ScheduleDao(conn);
   
   	dao.deleteScDB(2, 12345678);
  	int[]rs = dao.findUser("12345678");
   
   
   
   System.out.println(sDto.getLectureNum2());
   System.out.println(rs[1]);
   System.out.println(rs[2]);
   
	db.closeConnection();

     
   %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("관심등록(수강신청)이 삭제되었습니다.");
		location.href="index.jsp";
	</script>
</body>
</html>