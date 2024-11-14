<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<%@ page import="school.dao.*" %>
<%@ page import="java.text.*" %>

<jsp:include page="inc/header.jsp" flush="true" />
<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>

<%	
	String val = request.getParameter("val");
	Connection conn = db.getConnection();
	ServeyDao dao = new ServeyDao(conn);
	
	String rolee = (String) session.getAttribute("rolee");
	
	String Snum = (String) session.getAttribute("id");
	
	System.out.println(Snum);
	System.out.println(rolee);
	
	boolean res = false;
	
	if(Snum != null){
		System.out.println("2");
		int SSnum = Integer.parseInt(Snum);
		System.out.println(SSnum);
		res = dao.servey_search(SSnum);
		System.out.println(res);
	}
	else if(Snum == null){
		System.out.println("3");
		
		if(rolee == null){
			System.out.println("4");
		}
		
		else if(rolee.equals("pr1")){
			System.out.println("1");
			res = true;
		}
	}
	
	System.out.println(res);
	
	db.closeConnection();
	
%>


                  <div class="tablebox">
                     <div class="textbox">
                        <h3><span>2024학년도 1학기</span> 수강신청 기간안내</h3>
                        <p> ※ 장바구니는 선착순이 아닙니다.</p>
                     </div>
                     <table>
                        <colgroup>
                           <col width="20%">
                           <col width="40%">
                           <col width="22%">
                           <col width="18%">
                        </colgroup>
                        <thead>
                           <tr>
                              <th>수강신청 구분</th>
                              <th>일자</th>
                              <th>시간</th>
                              <th>대상</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td>수강취소기간</td>
                              <td>2024-03-09(토) ~  2024-04-01(월)</td>
                              <td>00 : 00 ~ 18 : 00</td>
                              <td>	마감:~4. 22.(월)(메뉴: mySNU-학사정보-수업-정규학기수강취소)</td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <div class="infobox">
                     <div class="infohead">
                         <h3>수강안내</h3>
                     </div>
                     <p>★  <span>수강반 제한 및 교과목 관련 문의</span>: 교과목 개설대학 학과 사무실로 문의하시기 바랍니다.(교양 교과목: 기초교육원 문의)</p>
                     <span><p>★  현재 수강신청사이트에서 취소여석으로 표시된 강좌들은 취소여석 수강신청 시간(10-11, 13-14, 17-18시)에 수강신청 하시기 바랍니다.</p></span>
                     <p>★  학부/석사 졸업 예정자 신분으로 석사/박사 입학하는 학생의 경우, 수강신청 첫 페이지 오른쪽 상단의 학번을 클릭하면 신입학 학번으로 변경하여 수강신청할 수 있습니다.</p>
                     <p>★  수강신청 후 기간 내 등록/복학 신청하지 않은 경우(휴학 상태), 수강신청 내역이 일괄 삭제됩니다.(3월 말 예정)</p>
                     <p><span class="blue">★ 신입생 수학성취도 측정시험 대상자</span>는 결과에 따른 수강과목을 정확히 확인하여 수강신청하시기 바랍니다.(기초교양 수강편람 참고)</p>
                     <p>★ 중복수강신청은 교원 승인 완료 후 학사과에서 순차적으로 처리 진행합니다. (1차 2/13 ~ 2/16, 2차 3/4 ~ 3/12)</p>
                     <p>★ 3월 9일(토)~ 4월 22일(월) 수강신청 취소는 mySNU-학사정보-수업-정규학기수강취소에서 신청해주세요. (수강신청 변경기간 이후이므로 담당 교원 승인 필요)</p>
                     <p>★ 2024. 2. 28.(수) ~ 2. 29.(목), 3. 4.(월) ~ 3. 8.(금) 수강신청 변경 기간 중 취소여석 수강신청 시간: <span class="blue">10-11시, 13-14시, 17-18시</span></p>
                     <p><span>- 3. 8.(금) 변경기간 마지막 날에 한해 20-21시에 취소여석 추가 운영</span></p>
                     <p class="bold">★ 수강(변경)신청 과목은 eTL에 주기적으로 반영되므로, 신청 후 1시간 이후에 확인하시기 바랍니다.</span>
                     <br>
                     <br>
                     <br>

                     <p>★ 로그인 없이도 강좌 검색이 가능합니다.</p>
                     <p>- 전체 강좌 검색(검색창 돋보기(검색) 아이콘 클릭)</p>
                     <p>- 조건별 강좌 검색(검색상 돋보기(검색) 아이콘 옆 간편/상세검색 아이콘 클릭)</p>
                     <p>1.'신입생'여부: 2024년 3월 입학자, 휴학으로 인해 한 학기도 이수하지 않은 학생(학기 성적이 아예 없는 학생)</p>
                     <p>2. 2023학년도 동계계절수업에 수강중인 과목을 재수강하고자 할 경우, 수강신청 변경기간(2. 28. ~ 2. 29. / 3. 4. ~ 3. 8.)에 신청해 주시기 바랍니다. 수강신청기간에 신청 시, 재수강 미인정 또는 임의 삭제처리될 수 있습니다.</p>
                     <p>4. 학부/대학원 과정간, 대학원의 석사/박사과정간 과거 이수한 과목의 수강신청(중복수강)은 가능하나 졸업/이수학점으로 인정되지 않습니다.</p>
                     <p>- 학부 3학년 이상만 석사과정의 교과목 수강 가능(1,2학년 수강시 성적표에 표기되나, 졸업학점으로 인정 안됨)</p>
                     <p>- 대학원 과정 학생의 경우 6학점까지 학부과목 수강 가능(대학원 과정(석,박사) 통산)</p>
                     <p>(학과장 또는 전공주임교수의 승인, 가능여부를 반드시 해당 대학(원)에 문의 후 신청)</p>
                     <p>5. 수강신청시 보안문자(표기된 숫자)를 입력해야만 수강신청이 가능합니다.</p>
                     <p>6. 수강신청 및 취소 후 반드시 개인 수강내역을 확인하시어 불이익이 발생하지 않도록 주의하시기 바랍니다.</p>
                  </div>
                  
                  <script>
                    window.onload = function(){
                    	var param = window.location.href;
                    	console.log(param.search("role"));
                    	
                    	
                    	if(param.search("role") == -1){
                    	                  	
                    		if(localStorage.getItem("popYN") != "N"){	
                    			var popup = window.open('interest_Popup.jsp','_blank','width=370,height=380, top=200, left=30');
                    			if(<%=!res %>){
                    				var servey = window.open('servey.jsp','_blank','width=800,height=600,top=200, left=400, scrollbars=yes');
                    			}
                    		}
                    		else{
                    			if(<%=!res %>){  
                    				var servey = window.open('servey.jsp','_blank','width=800,height=600,top=200, left=400, scrollbars=yes');
                        			}
                    		}
                    	}
                    };
                    
                    console.log(localStorage.getItem("popYN"));
                    
                    var date = new Date();
                    var msTime = localStorage.getItem("time");
					var date2 = new Date(parseInt(msTime)); //localStorage 종료 시간
					
					
                    console.log(msTime);
                    console.log(date);
                    console.log(date2);
                    console.log(date.getTime());
                    
                    if(date.getTime() > localStorage.getItem("time")){
                    	window.localStorage.clear();
                    }
                    
                    
                  </script>
                  
                  
<jsp:include page="inc/aside.jsp" flush="true" />
<jsp:include page="inc/footer.jsp" flush="true" />