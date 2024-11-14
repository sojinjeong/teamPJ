<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
      String role = request.getParameter("role");
   
   String name = (String) session.getAttribute("name");
   String rolee = (String) session.getAttribute("rolee");
   
   System.out.println(name+", "+rolee);
   System.out.println(role);


%>
  </section>
<div class="aside">
             <%
                if(rolee == null){
                if(role == null){
             %>
                  <div class="login_box">
                     <p>로그인을 해주세요.</p>
                     <div class="btnbox">
                        <button type="button" class="btn btn-outline-dark" id="st" onclick="location.href='index.jsp?role=st'"> 학생 </button>
                        <button type="button" class="btn btn-outline-dark" id="pr" onclick="location.href='index.jsp?role=pr'"> 교수 </button>
                     </div>
                     <a href="join.jsp">회원가입하기</a>
                 </div>
                 
                 <%
                }
                    else if(role.equals("st")){
                 %>
                 <div class="login_box_st">
                     <form name="loginForm" action="LoginSevlet" class="loginform" id="loginform" method="post">
                        <input type="text" class="form-control userid mb-3" id="uid"
                              placeholder="학번을 입력해 주세요." name="uid"/>
                        <input type="password" class="form-control userpass mb-3" id="upass"
                              placeholder="비밀번호를 입력해 주세요." name="upass" />
                              <input type="hidden" value="<%=role %>" name="val"/>           
                        <button type="submit" id ="login_btn" class="btn btn-outline-secondary btn-block">로그인</button>                                          
                        <a href="join.jsp">회원가입</a>
                        <div class="remem text-right mr-4 font-weight-400">
                           <label> 아이디 기억 <input type="checkbox" name="rid" value="rid" id="rid"></label>
                        </div>
                     </form>
                 </div>
                 <%
                    }
                    else if(role.equals("pr")){
                 %>
                 <div class="login_box_st">
                     <form name="loginForm" action="LoginSevlet" class="loginform" id="loginform" method="post">
                        <input type="text" class="form-control userid mb-3" id="uid"
                              placeholder="아이디를 입력하세요." name="uid"/>
                        <input type="password" class="form-control userpass mb-3" id="upass"
                              placeholder="비밀번호를 입력해 주세요." name="upass" />
                              <input type="hidden" value="<%=role %>" name="val"/>          
                        <button type="submit" id ="login_btn" class="btn btn-outline-secondary btn-block">로그인</button>                     
                        <a href="join.jsp">회원가입</a>
                        <div class="remem text-right mr-4 font-weight-400">
                           <label> 아이디 기억 <input type="checkbox" name="rid" value="rid" id="rid"></label>
                        </div>
                     </form>
                 </div>
                 <%
                    }
                }
                else{
                if(rolee.equals("st1")){
                 %>
               <div class="login_box_st2">
                  <p class="pb-4"><%=name %>환영합니다.</p>
                  <form name="logoutForm" action="LoginSevlet" method="get">
                  <button type="submit" id ="login_btn" class="btn btn-outline-secondary btn-block">로그아웃</button>
                  </form>                                          
               </div>
                 <%
                    }
                    else if(rolee.equals("pr1")){
                 %>
                 <div class="login_box_st2">
                     <p class="pb-4"><%=name %>환영합니다.</p>
                     <form name="logoutForm" action="LoginSevlet" method="get">
                     <button type="submit" id ="login_btn" class="btn btn-outline-secondary btn-block">로그아웃</button>
                     </form>                                          
                </div>
                 <%
                    }
                }
                 %>

                 <button type="button" class="btn-btn-outline-dark" id="cart_info">장바구니 초보를 위한 수강신청 안내<i class="ri-arrow-right-line"></i></button>
                 <button type="button" class="btn-btn-outline-dark" id="cart_info2">수강신청방법 매뉴얼<i class="ri-download-line"></i></button>
                 <div class="aside_notice">
                     <div class="notice_header">
                        <h4>공지사항<span>더보기<i class="ri-arrow-right-s-line"></i></span></h4>
                     </div>
                     <p><a href="#"><span>-</span> [필독]2024학년도 1학기 수강신청 부하시간</a></p>
                     <p><a href="#"><span>-</span>  2024 학년도 1학기 기초 교양 수강편람 안내 </a></p>
                     <p><a href="#"><span>-</span> ★ 2024학년도 1학기 수강신청 변경 및 취소</a></p>
                     <p><a href="#"><span>-</span>  2024학년도 1학기 전공 및 대학원 폐강 강좌</a></p>
                  </div>
                 <div class="aside_faq">
                     <div class="faq_header">
                        <h4>FAQ<span>더보기<i class="ri-arrow-right-s-line"></i></span></h4>
                     </div>
                     <p><a href="#"><span>Q</span> 수강반 제한이란 무엇인가요?</a></p>
                     <p><a href="#"><span>Q</span> 수강취소 FAQ</a></p>
                     <p><a href="#"><span>Q</span> eTL 관련 FAQ</a></p>
                     <p><a href="#"><span>Q</span> 재수강 및 성적평가방법 변경 FAQ</a></p>
                 </div>
               </div>
               <!-- section -->

