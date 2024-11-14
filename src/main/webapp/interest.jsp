<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="inc/header.jsp" flush="true" />

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<%@ page import="school.dao.*" %>
<jsp:useBean id="dto" class="school.dto.scDto" scope="page" />
 <jsp:useBean id="iDto" class="school.dto.IDto" scope="page" />
 <jsp:setProperty name="iDto" property="*" />
<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>
<% 

	Connection conn = db.getConnection();
	String selecteClass = request.getParameter("class");
	ScheduleDao dao = new ScheduleDao(conn);
	int scid = 2;
	dto = dao.login(scid);
	String week = dto.getWeek();
	
	 
	
	String stNum2 = (String) session.getAttribute("id");
	int stNum = Integer.parseInt(stNum2);
	 
    String title = dao.interest_viewDB(stNum); // title
	System.out.println(title);
	
	
	
	db.closeConnection();

	
%>
 <div class="req_container">
        <h2>관심강좌</h2>
        <div class="req_header">
      <button type="button" class="btn btn-outline-dark req_box" id="deleteAll">선택삭제</button>
     <button type="button" class="btn btn-outline-dark req_box" onclick="submitCheckedValues()">시간표 보기</button>
      <p class="t_score" id="checkedCount">현재 선택 강의 : 0</p> 
    </div>
    
     <div class="interest_box">
      
      <div class="interest_text">
       <p>기존 관심등록   :</p>
      </div>  
      <div class="e_interest">
        <p><%if(title == null){ %>
          관심등록된 강좌가 없습니다.
        <%}else if(title != null){ %>
        <%=title %>
        <%} %>
        </p>
      </div>
   </div>  
   
        <hr><!--헤드라인-->
      <!--본문-->
      
   <div class="body_text">
    <input type="checkbox" class="text_check" id="item1" value="웹디자인" >
   <div class="bbt">
    <h3>웹디자인</h3>
    <p> 김교수 | 이젠컴퓨터학과 / 월(9:00 ~ 10:00) 수(15:00~16:00) 금(13:00~14:00)</p>
   </div>
   </div>  

   <div class="body_text">
    <input type="checkbox" class="text_check" id="item2" value="자바프로그램">
   <div class="bbt">
    <h3>자바프로그래밍</h3>
    <p> 박교수 | 이젠컴퓨터학과 / 월(11:00 ~ 12:00) 화(11:00~12:00) 금(15:00~16:00)</p>
   </div>
   </div>
   
   <div class="body_text">
    <input type="checkbox" class="text_check" id="item3" value="데이터베이스">
   <div class="bbt">
    <h3> 데이터베이스</h3>
    <p> 이교수 | 이젠컴퓨터학과 / 화(13:00 ~ 14:00) 목(12:00~13:00) 금(12:00~13:00)</p>
   </div>
   </div> 

   <div class="body_text">
    <input type="checkbox" class="text_check" id="item4" value="영상편집">
   <div class="bbt">
    <h3>영상편집</h3>
    <p>  나교수 | 이젠컴퓨터학과 / 화(09:00 ~ 10:00)  금(12:00~13:00)</p>
   </div>
   </div> 
   
   


    <div class="popup">
      
      <button onclick="addToCart()" class="popbox"><p>관심강좌 담기</p></button>
   
      <button onclick="clearCart()" class="popbox"><p>전체 삭제</p></button>
      <form id="interestForm" action="interestOk.jsp" method="post">
        <input type="hidden" name="checkedValues" id="checkedValues" value="">
      <button onclick="interest()" class="popbox" id="box-c1"><p>관심등록/수정</p></button>
      </form>
       <button onclick="window.location.href = 'interestDel.jsp';" class="popbox"><p>관심강좌 삭제</p></button>
      <h4>My Cart</h4>
      <div class="popbody" id="cart">

      
     
    </div> <!--/popbody-->

   </div> <!--/popup-->

</div><!--req_container-->
         
<jsp:include page="inc/aside.jsp" flush="true" />
<jsp:include page="inc/footer.jsp" flush="true" />