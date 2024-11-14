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
   System.out.println(pf);
   String[] check = (String[] ) session.getAttribute("check");
   String search = request.getParameter("search");
   String search2 = request.getParameter("search2");
   String date = request.getParameter("date");
   ArrayList<ADto> list = null;
   ArrayList<ADto> list2 = null;
   int a = 0;
  
   if(check != null){
	  a = 1;
  }
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
	   if(date == null){
			date = "날짜를 선택하세요.";
			list = dao.view(num, lpage, pcount);
	   }
	   else{
		   list = dao.viewDate(num, lpage, pcount, date);
		   list2 = dao.view(num, lpage, pcount);
	   }
   	}
   else{
	   date = "날짜를 선택하세요.";
	   list = dao.search(search, search2, num);
	   list2 = dao.view(num, lpage, pcount);
   }
   
   String dep = null;
   int stnum = 0;
   String name = null;
   int att = 0;
   int abs = 0;
   int late = 0;
   int ets = 0;
   int att2 = 0;
	int abs2 = 0;
 	int late2 = 0;
 	int ets2 = 0;
   Timestamp time = null;
   String status = "";
   
	for(int i = 0; i<list.size(); i++){
		ADto dto = list.get(i);
		
		time = dto.getTime();
	}
   
   System.out.println(Ptotal);
   System.out.println(time);
   db.closeConnection();
   
%>

<div class="tab-menu1">
     <div class="tab-menu attmenu">
                           <div class="tab-btn">
                             <h3>출석부</h3>
                             <br>
                               <ul>
                                   <li style="border-left:1px solid #ddd;"><a href="attendance.jsp">출석 관리</a></li>
                                   <li class="active"><a href="attendancePr.jsp">출석부</a></li>
                               </ul>
                           </div>
                           <div class="tab-cont">
                             <div class="tab-in">
                               <form action="attendancePr.jsp" method="get">
                                   <br>
                                   <div>
                                     <select name="search" id="search">
                                         <option value="stNum">학번</option>
                                         <option value="dep">학과</option>
                                         <option value="stName">이름</option>
                                     </select>
                                     <input type="text" id="search_box" name="search2">
                                     <button type="submit" id ="att_btn" class="btn btn-outline-dark">
                                       검색
                                     </button>
                                   </div>
                                   <br>                                  
                                   <br>
                                </form>
                             </div>                             
                           </div>
                       </div>
                    
                                            <!-- 출석부 -->
                     <div class="d-day">
                     </div>
                     <div class="atttablebox">
                     <form id="dateform" action="attendancePr.jsp" method="get">
                     <input type="text" name="date" id="testpicker" value="<%=date %>" style="text-align : center; width:150px; cursor:pointer; caret-color: transparent;" />
                     </form>            
                         <table>
                            <colgroup>
                               <col width="3%">
                               <col width="15%">
                               <col width="7%">
                               <col width="15%">
                               <col width="12%">
                               <col width="10%">
                               <col width="10%">
                               <col width="10%">
                               <col width="10%">
                               <col width="10%">
                            </colgroup>
                            <thead>
                               <tr>
                                  <th>번호</th>
                                  <th>학과(전공)</th>
                                  <th>학년</th>
                                  <th>학번</th>
                                  <th>이름</th>
                                  <th>출결상황</th>
                                  <th>출석일수</th>
                                  <th>결석일수</th>
                                  <th>지각일수</th>
                                  <th>기타일수</th>
                               </tr>
                            </thead>
                            <tbody id="tby">
                            <%
                               for(int i = 0; i<list.size(); i++){
                                  ADto dto = list.get(i);
                                  
                                  if(list2 != null){
                                	  ADto dto2 = list2.get(i);
                                  	
                                  	att2 = dto2.getAtt();
                                  	abs2 = dto2.getAbs();
                                  	late2 = dto2.getLate();
                                  	ets2 = dto2.getEts();
                                  }
                                                                    
                                  dep = dto.getDep();
                                  stnum = dto.getStNum();
                                  name = dto.getStName();
                                  att = dto.getAtt();
                                  abs = dto.getAbs();
                                  late = dto.getLate();
                                  ets = dto.getEts();
                                  status=dto.getStatus();
                                  
                                  
                                  
                                  
                                  
                                  
                            %>
                               <tr>
                                  <td><%=i+1 %></td>
                                  <td><%=dep %></td>
                                  <td>1</td>
                                  <td><%=stnum %></td>
                                  <td><%=name %></td>
                                  <%
                                  
                                  if(status == null){
                                	  status = " ";
                                  
                                  %>
                                  <td><%=status %></td>
                                  <td><%=att %></td>
                                  <td><%=abs %></td>
                                  <td><%=late %></td>
                                  <td><%=ets %></td>
                                  <%
                                  }
                                  else{
                                	  %>
                                  <td><%=status %></td>
                                  <td><%=att2 %></td>
                                  <td><%=abs2 %></td>
                                  <td><%=late2 %></td>
                                  <td><%=ets2 %></td>
                                	  
                                	  <%
                                  }
                                  %>
                              </tr>
                              <%
                              }
                            %>
                            </tbody>
                         </table>
                         <div class="pgbox">
                           <ul class="paging">
                               <li><a href="attendancePr.jsp?pg=<%=pstart %>"><i class="ri-arrow-left-double-line"></i></a></li>
                               <li><a href="attendancePr.jsp?pg=<%=pstart-1 %>"><i class="ri-arrow-left-s-line"></i></a></li>
                               <%
                               		for(int i = 1; i<=Ptotal; i++){
                               			if(pg == i){
                               %>
                               		<li><a href="attendancePr.jsp?pg=<%=i %>" class="active"><%=i %></a></li> 
                               <%
                               			}
                               			else{
                               %>
                               		<li><a href="attendancePr.jsp?pg=<%=i %>"><%=i %></a></li>
                               <%
                               			}
                               		}
                               %>
                               <li><a href="attendancePr.jsp?pg=<%=pend+1 %>"><i class="ri-arrow-right-s-line"></i></a></li>
                               <li><a href="attendancePr.jsp?pg=<%=pend %>"><i class="ri-arrow-right-double-line"></i></a></li>
                           </ul>
                       </div>
                     </div>              
                </div>

                



<jsp:include page="inc/aside.jsp" flush="true" />
<jsp:include page="inc/footer.jsp" flush="true" />