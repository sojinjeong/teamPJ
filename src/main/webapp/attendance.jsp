<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="inc/header.jsp" flush="true" />



<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<%@ page import="school.dao.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>

<%
   Connection conn = db.getConnection();
   AttendanceDao dao = new AttendanceDao(conn);
   
   String pf = (String) session.getAttribute("name");
   String search = request.getParameter("search");
   String search2 = request.getParameter("search2");
   ArrayList<ADto> list = null;
   
   System.out.println(pf);
   
   int num = dao.scheduleId(pf);
   
   System.out.println(request.getParameter("num"));
   System.out.println(num);
   //int num = 1;
   
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
   int pg = 1;
   if((request.getParameter("pg") == null)){
	   pg = 1;
   }
   else{
	   pg = Integer.parseInt(request.getParameter("pg"));
   }
   
   int count = dao.totalPage(num);
   int pcount = 10;
   int cpage = pg;
   int startnum = (cpage-1) * (pcount-1);
   int endnum = cpage * pcount;
   int pstart = ((cpage-1) / pcount) * pcount +1;
   int pend = pstart + pcount - 1;
   int Ptotal = ((count-1)/pcount) +1;
   int lpage = (cpage-1)*pcount;
   
   if(pstart < 1){
	   pstart = Ptotal;
   }
   if(pend > Ptotal){
	   pend = Ptotal;
   }
   
   if(search == null){
		list = dao.view(num, lpage, pcount);
  	}
  	else{
	   list = dao.search(search, search2, num);
  	}
   
   Timestamp time = null;
   
	for(int i = 0; i<list.size(); i++){
		ADto dto = list.get(i);
		
		time = dto.getTime();
	}
	
   int stnum = 0;
   String dep = null; 
   String name = null; 
   String phoneNum =null; 
   
   String date = request.getParameter("date");
   if(date == null){
	   date = "날짜를 선택하세요.";
   }
   db.closeConnection();
   
%>
<div class="tab-menu1">
     <div class="tab-menu attmenu">
                           <div class="tab-btn">
                             <h3>출석 관리</h3>
                             <br>
                               <ul>
                                   <li class="active" style="border-left:1px solid #ddd;"><a href="attendance.jsp">출석 관리</a></li>
                                   <li><a href="attendancePr.jsp">출석부</a></li>
                               </ul>
                           </div>
                           <div class="tab-cont">
                             <div class="tab-in">
                               
                                   <form id="dateform" action="attendance.jsp" method="get">                     
                                   <div>
                                     <label for="date">출결 날짜</label> 
                                     
                                     <input type="text" name="date" id="testpicker" value="<%=date %>" style="text-align : center; width:150px; cursor:pointer; caret-color: transparent;" />
                                   </div>
                                   </form>
                                   <br>
                                   <form action="attendance.jsp" method="get">
                                   <div>
                                     <select name="search" id="seach">
                                         <option value="stNum">학번</option>
                                         <option value="dep">학과</option>
                                         <option value="stName">이름</option>
                                     </select>
                                     <input type="text" name="search2" id="search_box"/>
                                     <button type="submit" id ="att_btn" class="btn btn-outline-dark">
                                       검색
                                     </button>
                                   </div>
                                   <br>
                             </form>
                             </div>
                           </div>
                       </div>
                    
                                            <!-- 출석부 -->
                     <div id="check">
                           <p>*출석현황을 체크하신 후에 하단의 저장버튼을 눌러주세요</p>
                           <form id="checkal" action="attendance.jsp" method="get">
                           <input type="radio"  name="frcheck" value="att">
                              <label for="출석">출석</label>
                           <input type="radio"  name="frcheck" value="abs">
                              <label for="결석">결석</label>
                           <input type="radio"  name="frcheck" value="late">
                              <label for="지각">지각</label>
                           <input type="radio"  name="frcheck" value="ets">
                              <label for="기타">기타</label>
                           <button type="submit" class="btn" id="att_btn3">일괄상태처리</button>
                           </form>
                     </div>
                     <div class="atttablebox"> 
                     <form name="attform" action="attendanceOk.jsp" method="post">           
                         <table>
                         선택날짜 : <%=date %>
                         <input type="hidden" value="<%=date %>" name="date"/>
                            <colgroup>
                               <col width="11%">
                               <col width="15%">
                               <col width="13%">
                               <col width="7%">
                               <col width="14%">
                               <col width="10%">
                               <col width="10%">
                               <col width="10%">
                               <col width="10%">
                            </colgroup>
                            <thead>
                               <tr>
                                  <th>사진</th>
                                  <th>학과(전공)</th>
                                  <th>학년</th>
                                  <th>학번</th>
                                  <th>이름</th>
                                  <th colspan="4">상태</th>
                               </tr>
                            </thead>
                            <tbody id="tby">
                            <%
                              for(int i=0; i<list.size(); i++){
                                ADto dto = list.get(i);
                                dep = dto.getDep();
                                stnum = dto.getStNum();
                                name = dto.getStName();
                                
                              
                            %>
                              <input type="hidden" name="seq" value="<%=i%>">

                                                 
                               <tr>
                                  <td><i class="ri-image-line" alt="사진"></i></td>
                                  <td><%=dep %></td>
                                  <td>1학년</td>
                                  <td><%=stnum %></td>
                                  <input type="hidden" value="<%=stnum %>" name="num<%=i %>"/>
                                  <input type="hidden" value="<%=num %>" name="prnum<%=i %>"/>
                                  <td><%=name %></td>
                                  <td>
                                  
                                   <input type="radio" name="check<%=i %>" value="att">
                        
                                   <label for="출석">출석</label>
                                 </td>
                                  <td>
                                  
                                   <input type="radio" name="check<%=i %>" value="abs">
                                  
                                   <label for="결석">결석</label>
                                   
                                 </td>
                                  <td>
                                  
                                   <input type="radio"  name="check<%=i %>" value="late">
                                  
                                   <label for="지각">지각</label>
                                   
                                 </td>
                                  <td>
                                  
                                   <input type="radio" name="check<%=i %>" value="ets">
                                  
                                   
                                   <label for="기타">기타</label>
                                   
                                 </td>
                               </tr>
                               
                               
                               <%
                                }
                               %>

                            </tbody>
                         </table>
                         <button type="submit" class="btn btn-outline-dark">
                           저장
                         </button>
                       	
                         </form>
                         <div class="pgbox">
                           <ul class="paging">
                               <li><a href="attendance.jsp?pg=<%=pstart %>"><i class="ri-arrow-left-double-line"></i></a></li>
                               <li><a href="attendance.jsp?pg=<%=pstart-1 %>"><i class="ri-arrow-left-s-line"></i></a></li>
                               <%
                               		for(int i = 1; i<=Ptotal; i++){
                               			if(pg == i){
                               %>
                               		<li><a href="attendance.jsp?pg=<%=i %>" class="active"><%=i %></a></li> 
                               <%
                               			}
                               			else{
                               %>
                               		<li><a href="attendance.jsp?pg=<%=i %>"><%=i %></a></li>
                               <%
                               			}
                               		}
                               %>
                               <li><a href="attendance.jsp?pg=<%=pend+1 %>"><i class="ri-arrow-right-s-line"></i></a></li>
                               <li><a href="attendance.jsp?pg=<%=pend %>"><i class="ri-arrow-right-double-line"></i></a></li>
                           </ul>
                       </div>
                     </div>              
                </div>

 <script>
 	$(function(){
		$("#att_btn3").click(function(e){
			e.preventDefault();
			
			var rs = $("input[name='frcheck']:checked").val();
			console.log(rs);
			var length = <%=list.size() %>;
			
			console.log(length);

			for(var i = 0; i<length; i++){
				$('input[name="check'+i+'"]').filter("[value="+rs+"]").prop("checked", true);
	
			}

		})
	})
 </script>               



<jsp:include page="inc/aside.jsp" flush="true" />
<jsp:include page="inc/footer.jsp" flush="true" />