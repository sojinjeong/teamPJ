package school.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/resche")
public class reScheduleCheck extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private static final String Integer = null;   
    public reScheduleCheck() {
        super();
    }   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      response.getWriter().append("Served at: ").append(request.getContextPath());
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      //화면출력값 한글로
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      //화면에 찍히게 값가져오기
      PrintWriter out = response.getWriter();
      HttpSession session = request.getSession();
      System.out.println(request.getParameter("val"));
      // 각과목값 요일에 넣기위해 value값 받아오기
      String value = request.getParameter("val");
      // header, aside 이 서블릿으로 가져오기위해 각각 지정된 변수 위로 옮기고 해당칸은 지움(중복값입력으로 에러떠서)      
      String role = (String) session.getAttribute("role");
      String name = (String) session.getAttribute("name");
      String rolee = (String) session.getAttribute("rolee");
      System.out.println(name+", "+rolee);
      System.out.println(role);
     
      
      /* split으로 잘라서 배열에담아 돌리기 -> 안하기로함
      String[] courses = request.getParameter("val").split(" ");
      courses를 split으로 자른 애들을 배열로 저장
      String[] cours2 = new String[100];
      for(int i = 0; i<courses.length;i++) {
         if(courses[i].equals("웹디자인")) {
            cours2[i] = courses[i];
         }else if(courses[i].equals("자바프로그램")) {
            cours2[i] = courses[i];
         }else if(courses[i].equals("데이터베이스")) {
            cours2[i] = courses[i];
         }else if(courses[i].equals("영상편집")) {
            cours2[i] = courses[i];
         System.out.println(courses[i]);
         System.out.println(cours2[i]);
      }
      }
      */
      
      // 해당 요일에 찍히게 스케쥴러.jsp의 input value값 변수로 담기
      String mon1 = "웹디자인 천호관203호";
      String wed7 = "웹디자인 천호관203호";
      String fri5 = "웹디자인 천호관203호";      
      String mon3 = "자바프로그램 창의관303호";
      String wed3 = "자바프로그램 창의관303호";
      String fri7 = "자바프로그램 창의관303호";      
      String tue5 = "데이터베이스 선호관101호";
      String wed4 = "데이터베이스 선호관101호";      
      String tue1 = "영상편집 창의관401호";
      String fri4 = "영상편집 창의관202호";
      
      //헤더
      out.println("\r\n"
            + "<!DOCTYPE html>\r\n"
            + "<html>\r\n"
            + "<head>\r\n"
            + "<meta charset=\"UTF-8\">\r\n"
            + "<title></title>\r\n"
            + "\r\n"
            + "<link rel=\"stylesheet\" href=\"css/style.css\">\r\n"
            + "<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css\" integrity=\"sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\r\n"
            + "<link rel=\"stylesheet\" href=\"js/jquery-ui-1.13.2/jquery-ui.css\">\r\n" 
            + "<script src=\"js/jquery.min.js\"></script>\r\n"
            + "<script src=\"js/popper.min.js\"></script>\r\n"
            + "<script src=\"js/bootstrap.min.js\"></script>\r\n"
            + "<script src=\"js/jquery-ui-1.13.2/jquery-ui.min.js\"></script>\r\n"
            + "<script src=\"js/jquery-ui-1.13.2/jquery-ui.js\"></script>\r\n"
            + "<script src=\"js/datepicker-ko.js\"></script>\r\n"
            + "<script src=\"js/script.js\"></script>");
      
      out.println("\r\n"
            + "</head>\r\n"
            + "<body>\r\n"
            + "          <div class=\"hedaer_container\">\r\n"
            + "             <div class=\"header\"  id=\"header\">\r\n"
            + "             <div class=\"row\">\r\n"
            + "                <a href=\"index.jsp\" class=\"brand\">\r\n"
            + "                   <img src=\"img/logo3.png\"/>\r\n"
            + "                </a>\r\n"
            + "                <nav>\r\n"
            + "                 <ul>\r\n"
            + "                    <li class=\"mainmenu-1\"><a href=\"#\">내정보</a>\r\n"
            + "                       <ul class=\"submenu-1\">");

         if(role == null){
        out.println("<li><a href=\"renamejoin.jsp\">내정보 수정</a></li>");
         }
           else if(rolee.equals("st1")){
        out.println("<li><a href=\"renamejoin.jsp\">내정보 수정</a></li>\r\n"
              + "                              <li><a href=\"schedule.jsp\">시간표</a></li>\r\n"
              + "                              <li><a href=\"interest.jsp\">관심등록</a></li>");
           }
           else if(rolee.equals("pr1")){
        out.println(" <li><a href=\"renamejoin.jsp\">내정보 수정</a></li>\r\n"
              + "                              <li><a href=\"attendance.jsp\">출석관리</a></li>");   
           }
        out.println("</ul>\r\n"
              + "                    </li>\r\n"
              + "                    <li class=\"mainmenu-2\"><a href=\"#\">수강신청</a>\r\n"
              + "                       <ul class=\"submenu-2\">");
        if(role == null){
        out.println("<li><a href=\"loginOK2.jsp\">수강신청</a></li>");   
        }
              else{
        out.println("<li><a href=\"scheduler.jsp\">수강신청</a></li>");   
           }      
      out.println("<li><a href=\"scheduleInfo.jsp\">수강안내</a></li>\r\n"
            + "                        </ul>\r\n"
            + "                    </li>\r\n"
            + "                    <li class=\"mainmenu-3\"><a href=\"#\">학사문의</a>\r\n"
            + "                       <ul class=\"submenu-3\">\r\n"
            + "                        <li><a href=\"affairsMenu1.jsp\">학사안내</a></li>    \r\n"
            + "                        <li><a href=\"affairsMenu2.jsp\">학과소개</a></li>\r\n"
            + "                        <li><a href=\"affairsMenu3.jsp\">학과연락처</a></li>\r\n"
            + "                     </ul>\r\n"
            + "                    </li>\r\n"
            + "                    <li class=\"mainmenu-4\"><a href=\"#\">입학안내</a>\r\n"
            + "                       <ul class=\"submenu-4\">\r\n"
            + "                        <li><a href=\"admissionMenu1.jsp\">입학안내</a></li>    \r\n"
            + "                        <li><a href=\"admissionMenu2.jsp\">오시는길</a></li>\r\n"
            + "                     </ul>\r\n"
            + "                    </li>\r\n"
            + "                 </ul>\r\n"
            + "                 </nav>\r\n"
            + "\r\n"
            + "          </div>\r\n"
            + "          </div>\r\n"
            + "        </div>   \r\n");
            out.println("          <div class=\"container\">");
      
      out.println("<section id=\"section\" class=\"menuSection\">");
        
      //시간표 위 확인박스 (내용 다르게)
     out.println("<div class=\"notice\">\r\n"
           + "    <div class=\"left\">수강신청 미리보기 화면입니다.<br>\r\n"
           + "                      ! 수강신청하시는 일정을 반드시 확인해주세요 !</div>\r\n"
           + "    <div class=\"right\"> - 마감시간 이후에는 변경이 불가하며, 인원충족 시 전산확정 됩니다.<br>\r\n"
           + "                       - 장바구니 담기 기간 이후의 변경내역은 장바구니에 적용되지 않습니다.</div>\r\n"
           + "</div> <!--/notice--> ");
        
      //스케쥴러 보여지는 메인화면
      out.println("<!DOCTYPE html>\r\n"
            + "<html>\r\n"
            + "<head>\r\n"
            + "<meta charset=\"UTF-8\">\r\n"
            + "<title></title>\r\n"
            + "\r\n"
            + "<link rel=\"stylesheet\" href=\"css/style.css\">\r\n"
            + "<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css\" integrity=\"sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\r\n"
            + "\r\n"
            + "<script src=\"js/jquery.min.js\"></script>\r\n"
            + "<script src=\"js/popper.min.js\"></script>\r\n"
            + "<script src=\"js/bootstrap.min.js\"></script>\r\n"
            + "<script src=\"js/script.js\"></script>\r\n");
      out.println("<table class=\"table table-bordered intertable\">");
      out.println("<colgroup>\r\n"
            + "            <col width=\"*\">\r\n"
            + "            <col width=\"16.3%\">\r\n"
            + "            <col width=\"16.3%\">\r\n"
            + "            <col width=\"16.3%\">\r\n"
            + "            <col width=\"16.3%\">\r\n"
            + "            <col width=\"16.3%\">\r\n"
            + "\r\n"
            + "         </colgroup>");
      out.println("<thead class=\"text-center\">");
      out.println("<tr>");
      out.println("<th>시간</th>");
      out.println("<th>월요일</th>");
      out.println("<th>화요일</th>");
      out.println("<th>수요일</th>");
      out.println("<th>목요일</th>");
      out.println("<th>금요일</th>");
      out.println("</tr>");
      out.println("</thead>");
      out.println("<tbody class=\"text-center\">"); 
      out.println("<tr>");
      out.println("<th>1교시<br>09:00~10:00</th>");
      out.println("<td class=\"mon1\">");
         if (value.indexOf(mon1+" 월") > -1) {
                 out.println(mon1);
         }
      out.println("</td>");
      out.println("<td class=\"tue1\">"); 
         if(value.indexOf(tue1+" 화") > -1) {
               out.println(tue1);
         }
      out.println("</td>");
      out.println("<td class=\"wed1\"></td>");
      out.println("<td class=\"thu1\"></td>");
      out.println(" <td class=\"fri1\"></td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<th>2교시<br>10:00~11:00</th>");
      out.println("<td class=\"mon2\"></td>");
      out.println("<td class=\"tue2\"></td>");
      out.println("<td class=\"wed2\"></td>");
      out.println("<td class=\"thu2\"></td>"); 
      out.println(" <td class=\"fri2\"></td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<th>3교시<br>11:00~12:00</th>");
      out.println("<td class=\"mon3\">");
      if (value.indexOf(mon3+" 월") > -1) {
          out.println(mon3);
       }      
      out.println("</td>");
      out.println("<td class=\"tue3\"></td>");
      out.println("<td class=\"wed3\">");
      if (value.indexOf(wed3+" 수") > -1) {
          out.println(wed3);
       } 
      out.println("</td>");
      out.println("<td class=\"thu3\"></td>");
      out.println(" <td class=\"fri3\"></td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<th>4교시<br>12:00~13:00</th>");
      out.println("<td class=\"mon4\"></td>");
      out.println("<td class=\"tue4\"></td>");
      out.println("<td class=\"wed4\">");
      if (value.indexOf(wed4+" 수") > -1) {
          out.println(wed4);
      }
      out.println("</td>");
      out.println("<td class=\"thu4\"></td>");
      out.println(" <td class=\"fri4\">");
      if (value.indexOf(fri4+" 금" ) > -1) {
          out.println(fri4);
      }
      out.println("</td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<th>5교시<br>13:00~14:00</th>");
      out.println("<td class=\"mon5\"></td>");
      out.println("<td class=\"tue5\">");
      if (value.indexOf(tue5+" 화") > -1) {
          out.println(tue5);
      }
      out.println("</td>");
      out.println("<td class=\"wed5\"></td>");
      out.println("<td class=\"thu5\"></td>");
      out.println(" <td class=\"fri5\">");
      if (value.indexOf(fri5+" 금") > -1) {
          out.println(fri5);
      }
      out.println("</td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<th>6교시<br>14:00~15:00</th>");
      out.println("<td class=\"mon6\"></td>");
      out.println("<td class=\"tue6\"></td>");
      out.println("<td class=\"wed6\"></td>");
      out.println("<td class=\"thu6\"></td>");
      out.println(" <td class=\"fri6\"></td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<th>7교시<br>15:00~16:00</th>");
      out.println("<td class=\"mon7\"></td>");
      out.println("<td class=\"tue7\"></td>");
      out.println("<td class=\"wed7\">");
      if (value.indexOf(wed7+" 수") > -1) {
          out.println(wed7);
      }      
      out.println("</td>");
      out.println("<td class=\"thu7\"></td>");
      out.println(" <td class=\"fri7\">");
      if (value.indexOf(fri7+" 금") > -1) {
          out.println(fri7);
      }  
      out.println("</td>");
      out.println("</tr>");
      out.println("</tbody>");
      out.println("</table>");
      out.println("<button class=\"btn btn-outline-dark sc_2button\" onclick=\"window.location.href='scheduler.jsp';\">뒤로가기</button>\r\n");
      out.println("</BODY>");
      out.println("</HTML>");
      out.println("  \r\n"
              + "                   </section>\r\n");
    //aside
      out.println("\r\n"+ "<div class=\"aside\">");
       if(rolee == null){
             if(role == null){
        out.println("div class=\"login_box\">\r\n"
              + "                     <p>로그인을 해주세요.</p>\r\n"
              + "                     <div class=\"btnbox\">\r\n"
              + "                        <button type=\"button\" class=\"btn btn-outline-dark\" id=\"st\" onclick=\"location.href='index.jsp?role=st'\"> 학생 </button>\r\n"
              + "                        <button type=\"button\" class=\"btn btn-outline-dark\" id=\"pr\" onclick=\"location.href='index.jsp?role=pr'\"> 교수 </button>\r\n"
              + "                     </div>\r\n"
              + "                     <a href=\"join.jsp\">회원가입하기</a>\r\n"
              + "                 </div>");
         }
          else if(role.equals("st")){
        out.println("<div class=\"login_box_st\">\r\n"
              + "                     <form name=\"loginForm\" action=\"LoginSevlet\" class=\"loginform\" id=\"loginform\" method=\"post\">\r\n"
              + "                        <input type=\"text\" class=\"form-control userid mb-3\" id=\"uid\"\r\n"
              + "                              placeholder=\"학번을 입력해 주세요.\" name=\"uid\"/>\r\n"
              + "                        <input type=\"password\" class=\"form-control userpass mb-3\" id=\"upass\"\r\n"
              + "                              placeholder=\"비밀번호를 입력해 주세요.\" name=\"upass\" />\r\n"
              + "                              <input type=\"hidden\" value=\""+ role +"\" name=\"val\"/>           \r\n"
              + "                        <button type=\"submit\" id =\"login_btn\" class=\"btn btn-outline-secondary btn-block\">로그인</button>                                          \r\n"
              + "                        <a href=\"join.jsp\">회원가입</a>\r\n"
              + "                        <div class=\"remem text-right mr-4 font-weight-400\">\r\n"
              + "                           <label> 아이디 기억 <input type=\"checkbox\" name=\"rid\" value=\"rid\" id=\"rid\"></label>\r\n"
              + "                        </div>\r\n"
              + "                     </form>\r\n"
              + "                 </div>");
          }
          else if(role.equals("pr")){
        out.println("<div class=\"login_box_st\">\r\n"
              + "                     <form name=\"loginForm\" action=\"LoginSevlet\" class=\"loginform\" id=\"loginform\" method=\"post\">\r\n"
              + "                        <input type=\"text\" class=\"form-control userid mb-3\" id=\"uid\"\r\n"
              + "                              placeholder=\"아이디를 입력하세요.\" name=\"uid\"/>\r\n"
              + "                        <input type=\"password\" class=\"form-control userpass mb-3\" id=\"upass\"\r\n"
              + "                              placeholder=\"비밀번호를 입력해 주세요.\" name=\"upass\" />\r\n"
              + "                              <input type=\"hidden\" value=\"" + role + "\" name=\"val\"/>          \r\n"
              + "                        <button type=\"submit\" id =\"login_btn\" class=\"btn btn-outline-secondary btn-block\">로그인</button>                     \r\n"
              + "                        <a href=\"join.jsp\">회원가입</a>\r\n"
              + "                        <div class=\"remem text-right mr-4 font-weight-400\">\r\n"
              + "                           <label> 아이디 기억 <input type=\"checkbox\" name=\"rid\" value=\"rid\" id=\"rid\"></label>\r\n"
              + "                        </div>\r\n"
              + "                     </form>\r\n"
              + "                 </div>");
          }
         }
         else{
         if(rolee.equals("st1")){
        out.println("<div class=\"login_box_st2\">\r\n"
              + "                  <p class=\"pb-4\">" + name + "환영합니다.</p>\r\n"
              + "                  <form name=\"logoutForm\" action=\"LoginSevlet\" method=\"get\">\r\n"
              + "                  <button type=\"submit\" id =\"login_btn\" class=\"btn btn-outline-secondary btn-block\">로그아웃</button>\r\n"
              + "                  </form>                                          \r\n"
              + "               </div>");
         }
         else if(rolee.equals("pr1")){
        out.println("<div class=\"login_box_st2\">\r\n"
              + "                     <p class=\"pb-4\">" + name + "환영합니다.</p>\r\n"
              + "                     <form name=\"logoutForm\" action=\"LoginSevlet\" method=\"get\">\r\n"
              + "                     <button type=\"submit\" id =\"login_btn\" class=\"btn btn-outline-secondary btn-block\">로그아웃</button>\r\n"
              + "                     </form>                                          \r\n"
              + "                </div>");    
         }
         }
        out.println("\r\n"
              + "                 <button type=\"button\" class=\"btn-btn-outline-dark\" id=\"cart_info\">장바구니 초보를 위한 수강신청 안내<i class=\"ri-arrow-right-line\"></i></button>\r\n"
              + "                 <button type=\"button\" class=\"btn-btn-outline-dark\" id=\"cart_info2\">수강신청방법 매뉴얼<i class=\"ri-download-line\"></i></button>\r\n"
              + "                 <div class=\"aside_notice\">\r\n"
              + "                     <div class=\"notice_header\">\r\n"
              + "                        <h4>공지사항<span>더보기<i class=\"ri-arrow-right-s-line\"></i></span></h4>\r\n"
              + "                     </div>\r\n"
              + "                     <p><a href=\"#\"><span>-</span> [필독]2024학년도 1학기 수강신청 부하시간</a></p>\r\n"
              + "                     <p><a href=\"#\"><span>-</span>  2024 학년도 1학기 기초 교양 수강편람 안내 </a></p>\r\n"
              + "                     <p><a href=\"#\"><span>-</span> ★ 2024학년도 1학기 수강신청 변경 및 취소</a></p>\r\n"
              + "                     <p><a href=\"#\"><span>-</span>  2024학년도 1학기 전공 및 대학원 폐강 강좌</a></p>\r\n"
              + "                  </div>\r\n"
              + "                 <div class=\"aside_faq\">\r\n"
              + "                     <div class=\"faq_header\">\r\n"
              + "                        <h4>FAQ<span>더보기<i class=\"ri-arrow-right-s-line\"></i></span></h4>\r\n"
              + "                     </div>\r\n"
              + "                     <p><a href=\"#\"><span>Q</span> 수강반 제한이란 무엇인가요?</a></p>\r\n"
              + "                     <p><a href=\"#\"><span>Q</span> 수강취소 FAQ</a></p>\r\n"
              + "                     <p><a href=\"#\"><span>Q</span> eTL 관련 FAQ</a></p>\r\n"
              + "                     <p><a href=\"#\"><span>Q</span> 재수강 및 성적평가방법 변경 FAQ</a></p>\r\n"
              + "                 </div>\r\n"
              + "               </div>\r\n"
              + "               <!-- section -->\r\n"
              + "\r\n"

              + "          </div>\r\n"
              + "          <div class=\"footer\">\r\n"
              + "            <div class=\"footer_text\">\r\n"
              + "               <p>개인정보처리방침</p>\r\n"
              + "               <p>이메일무단수집거부</p>\r\n"
              + "            </div>\r\n"
              + "            <div class=\"copyright\">\r\n"
              + "               Copyright &copy; 2020 HYOGEUN SATIONAL USIVERSITY. ALL Rights Reserved.\r\n"
              + "            </div>\r\n"
              + "         </div>\r\n"
              + " \r\n"
              + "\r\n"
              + "</body>\r\n"
              + "</html>");
      out.close();
}

}
