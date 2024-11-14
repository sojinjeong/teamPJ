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
   Connection conn = db.getConnection();
   ScheduleDao dao = new ScheduleDao(conn);
   AttendanceDao daoo =new AttendanceDao(conn);
   String clas = request.getParameter("class");
   System.out.println(clas);
   
   int scid = Integer.parseInt(clas);
   String id = (String) session.getAttribute("id");
   String ty = request.getParameter("ty");
   
   int idd = Integer.parseInt(id);
   int rs = dao.updateDB(scid, idd);
   System.out.println(scid+", "+id);
   
  
   if(ty.equals("신청하기")){
	   
   		
   		if(rs>0){
   			int rss = daoo.insertDB(scid, idd);
   			}
   	}
   else{
	   rs = dao.deleteScDB(scid, idd);
	   int rss = daoo.deleteScDB(idd, scid);
   }
	db.closeConnection();
	
     
   %>
   
<!DOCTYPE html>
<html>
<head>

<%
	if(ty.equals("신청하기")){
		if(rs == 0){
			%>
			<script>
 				alert("이미 신청한 과목입니다.");
 				location.href="./scheduler.jsp";
			</script>
			
			<%
		}
		else{
%>

<script>
 alert("수강신청이 완료되었습니다.");
 location.href="./scheduler.jsp";
</script>
<%			
		}
	}
	else{
%>
<script>
	alert("수강신청이 취소되었습니다.");
	location.href="./scheduler.jsp";
</script>
<%
	}
%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>

</html>