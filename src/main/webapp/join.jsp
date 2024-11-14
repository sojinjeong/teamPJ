<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<jsp:include page="inc/header.jsp" flush="true" />
<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>
  
<%

	
	
%>

<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


 <section class="bg-white pb-3 joinpage">
        <!-- listbox -->
   <div class="listbox">
      <h1 class="text-center ">회원가입</h1>
      <p class="text-danger text-center">* 표시가 되어 있는 부분은 필수 항목입니다.</p>
   
                 <form name="registerForm" action="joinok.jsp" id="registerform" class="registerform" method="post">
                <div class="row">
                    <div class="col-5 d-flex align-items-center mb-4">
                        <label for="name" class="text-right mr-3 col-4">이름*</label>
                        <input type="text" name="name" id="name" 
                               class="form-control col-8" placeholder="이름" />
                    </div>
                    <div class="col-2 mb-4"></div>
                    <div class="col-5 d-flex align-items-center mb-4">
                        <label for="stNum" class="text-right mr-3 col-4">학번*</label>
                        <input type="text" name="stNum" id="stNum" 
                               class="form-control col-8" placeholder="학번을 입력 해주세요." />
                    </div>
                    


                    <div class="col-5 d-flex align-items-center mb-4">
                        <label for="pass" class="text-right mr-3 col-4">비밀번호*</label>
                        <input type="password" name="pass" id="pass"
                               class="form-control col-8" placeholder="비밀번호">
                    </div>
                    <div class="col-2 mb-4"></div>
                    <div class="col-5 d-flex align-items-center mb-4">
                        <label for="repass" class="text-right mr-3 col-4">비밀번호 확인</label>
                        <input type="password" name="repass" id="repass"
                               class="form-control col-8" placeholder="비밀번호확인">
                    </div>
                    

                    <div class="col-6 d-flex align-items-center mb-4">
                        <label for="birth" class="text-right mr-3 col-4">생년월일</label>
                        <input type="text" name="birth" id="birth"
                               class="form-control col-8" placeholder="앞 6자리만 입력해주세요.">
                    </div>
                    <div class="col-6 mb-4"></div>

                    <div class="col-6 d-flex align-items-center mb-4">
                        <label for="email" class="text-right mr-3 col-4">이메일*</label>
                        <input type="text" name="email" id="email"
                               class="form-control col-8" placeholder="이메일">
                    </div>
                    <div class="col-6 mb-4"></div>

                    
                    <div class="col-8 d-flex align-items-center mb-4">
                      <label for="phoneNum" class="text-right mr-3 col-3">전화번호*</label>
                      <input type="text" name="phoneNum" id="phoneNum"
                             class="form-control col-8 mr-2" placeholder="010-0000-0000"
                             oninput="autoHyphen(this)" maxlength="13"> 
                    </div>
                    <div class="col-4"></div>


                    <div class="col-5 d-flex">
                      <label for="zip" class="text-right mr-2 col-5 zipcode">우편번호</label>
                      <input type="number" name="zipcode" id="zipcode"
                             class="form-control col-7 mx-2 mt-1" placeholder="우편번호" >
                    </div>
                    <div class="col-3">
                        <button type="button" id="zip" class="btn btn-secondary mt-1">우편번호찾기</button>
                    </div>
                    <div class="col-4"></div>

                    <div class="col-12 d-flex">
                        <label for="zip" class="text-right mr-2 col-5">주소</label>
                        <input type="text" name="addr1" id="addr1"
                             class="form-control col-7 mx-2 mt-1" placeholder="주소" >
                    </div>
                    <div class="col-12 d-flex mb-4">
                      <label for="zip" class="text-right mr-2 col-5 bg-white"></label>
                      <input type="text" name="addr2" id="addr2"
                           class="form-control col-7 mx-2 mt-1" placeholder="상세주소">
                    </div>
                
                    <div class="col-12 text-center">
                      <a href="index.jsp"><button class="btn btn-outline-dark px-5 mx-2 rename_btn2" type="button">취소</button></a>
                        <button class="btn btn-outline-dark px-5 mx-2 rename_btn" type="submit">전송</button>
                    </div>
                    
                 
                </div>
            </form>
   
   </div>
        </section>
<jsp:include page="inc/footer.jsp" flush="true" />