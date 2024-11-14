<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="js/jquery-ui-1.13.2/jquery-ui.css">
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-ui-1.13.2/jquery-ui.min.js"></script>
<script src="js/jquery-ui-1.13.2/jquery-ui.js"></script>
<script src="js/datepicker-ko.js"></script>
<script src="js/script.js"></script>
<%
	String role = (String) session.getAttribute("rolee");
	System.out.println(role);
%>
</head>
<body>
        <!-- 헤더 -->
          <div class="hedaer_container">
          	<div class="header"  id="header">
             <div class="row">
	             <a href="index.jsp" class="brand">
	                <img src="img/logo3.png"/>
	             </a>
            	 <nav>
                 <ul>
                    <li class="mainmenu-1"><a href="#">내정보</a>
                    	<ul class="submenu-1">
                    		<%
               					if(role == null){
              				%>
                           <li><a href="renamejoin.jsp">내정보 수정</a></li>
                            <%
               					}
               					else if(role.equals("st1")){
            				%>
			               		<li><a href="renamejoin.jsp">내정보 수정</a></li>
			               		<li><a href="schedule.jsp">시간표</a></li>
			               		<li><a href="interest.jsp" onclick="servey_open()">관심등록</a></li>
                            <%
               					}
               					else if(role.equals("pr1")){
             				%>
	             				<li><a href="renamejoin.jsp">내정보 수정</a></li>
	               				<li><a href="attendance.jsp">출석관리</a></li>
             				<%
               					}
              				%>
                        </ul>
                    </li>
                    <li class="mainmenu-2"><a href="#">수강신청</a>
                    	<ul class="submenu-2">
			               <%
			               		if(role == null){
			               %>
                           <li><a href="loginOK2.jsp">수강신청</a></li>
                           	<%
			               		}
			               		else{
			               			if(role.equals("pr1")){
			               	%>
			               	<li><a href="loginOK2.jsp">수강신청</a></li>
               				<%
               					}
               					else{
             				  %>		
             				  <li><a href="scheduler.jsp">수강신청</a></li>
				               <%
				               				
				               			}		
				               		}
				            	%>
				               <li><a href="scheduleInfo.jsp">수강안내</a></li>
                        </ul>
                    </li>
                    <li class="mainmenu-3"><a href="#">학사문의</a>
                    	<ul class="submenu-3">
			               <li><a href="affairsMenu1.jsp">학사안내</a></li>    
			               <li><a href="affairsMenu2.jsp">학과소개</a></li>
			               <li><a href="affairsMenu3.jsp">학과연락처</a></li>
			            </ul>
                    </li>
                    <li class="mainmenu-4"><a href="#">입학안내</a>
                    	<ul class="submenu-4">
			               <li><a href="admissionMenu1.jsp">입학안내</a></li>    
			               <li><a href="admissionMenu2.jsp">오시는길</a></li>
			            </ul>
                    </li>
                 </ul>
                 </nav>

          </div>
          </div>
        </div>   

        <!-- 헤더 -->
    

          <!-- / 헤더 -->
          <div class="container">
               <section id="section" class="menuSection">