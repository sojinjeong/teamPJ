<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<%@ page import="school.dao.*" %>
<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>
 <jsp:useBean id="serDto" class="school.dto.serDto" scope="page" />
   <jsp:setProperty name="serDto" property="*" />
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
  ServeyDao dao = new ServeyDao(conn);
  String check = (String) session.getAttribute("id"); //로그인 유무 확인
  String Snum = (String) session.getAttribute("id");  //servery DB의 DB존재확인

 
  
   if(check == null){
%>
	   <script> alert("로그인을 먼저 해주세요.");
	            location.href="servey.jsp";
	   </script>
<%    
  }else{
	  
	  int stnum = Integer.parseInt(Snum);
	  
	  boolean res = dao.servey_search(stnum);
	  
	 if(!res){ 

	  String servey1 = request.getParameter("servey_box1");
	  String servey2 = request.getParameter("servey_box2");
	  String servey3 = request.getParameter("servey_box3");
	  String servey4 = request.getParameter("servey_box4");
	  
	  int Q1 = Integer.parseInt(servey1);
	  int Q2 = Integer.parseInt(servey2);
	  int Q3 = Integer.parseInt(servey3);
	  int Q4 = Integer.parseInt(servey4);
	  
	  System.out.println(Q1);
	  System.out.println(Q2);
	  System.out.println(Q3);
	  System.out.println(Q4);
	  
	  int rs = dao.servey_insertDB(stnum, Q1, Q2, Q3, Q4);
	 }else{
%>
     <script>
     alert("이미 설문에 참여 하셨습니다.")
      window.close()
     </script>
<%		 
	 }
}
  db.closeConnection();
 %>
 
 
    
</body>
<script>
  
		alert("정상적으로 제출 되었습니다.");
		window.close()
 	
</script>
</html>