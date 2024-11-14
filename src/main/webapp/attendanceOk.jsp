<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<%@ page import="school.dao.*" %>
<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>

<%
    Connection conn = db.getConnection();
    AttendanceDao dao = new AttendanceDao(conn);
	String[] seq = request.getParameterValues("seq");
	String[] check = new String[seq.length];
	int[] num2 =  new int[seq.length];
	int[] prnum = new int[seq.length];   
	String[] check1 = new String[seq.length];
	String date = request.getParameter("date");
	   
	   for(int i = 0; i<check.length; i++){
		   
	      check[i] = request.getParameter("check"+i);
	      num2[i] = Integer.parseInt(request.getParameter("num"+i));
	      prnum[i] = Integer.parseInt(request.getParameter("prnum"+i));
	      
	      System.out.println(check[i]); // 출결체크 상황
	      System.out.println(num2[i]); // 학번
	      System.out.println(prnum[i]); // 교수번호(scid)
	      if(check[i].equals("att")){
	         check1[i] = "출석";
	      }
	      if(check[i].equals("abs")){
	         check1[i] = "결석";
	      }
	      if(check[i].equals("late")){
	         check1[i] = "지각";
	      }
	      if(check[i].equals("ets")){
	         check1[i] = "기타";
	      }
	       
	      System.out.println(check1[i]);
	   }
	
	   for(int i = 0; i<check.length; i++ ){
		   dao.check(check[i], num2[i], prnum[i], date);
	   }
	   
	   session.setAttribute("check", check1);
	
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	alert("체크 되었습니다.");
	location.href="attendance.jsp";
	</script>
</body>
</html>