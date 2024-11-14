<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="inc/header.jsp" flush="true" />

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<%@ page import="school.dao.*" %>

<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>
<% 
    request.setCharacterEncoding("utf-8");
   Connection conn = db.getConnection();
   ScheduleDao dao = new ScheduleDao(conn);

      int scid = 0;
      String stName = (String) session.getAttribute("name");
      System.out.println(stName);
   
   ArrayList<scDto> lists = dao.selectDB(scid, stName);
   
   String title = "";
   String week = "";
   String time = "";
   
  
   
   
   db.closeConnection();
%>
<button class="btn btn-outline-dark sc_2button" onclick="window.location.href='index.jsp';">뒤로가기</button>

 <table class="table table-bordered scheduler">
         <colgroup>
            <col width="*">
            <col width="16.3%">
            <col width="16.3%">
            <col width="16.3%">
            <col width="16.3%">
            <col width="16.3%">

         </colgroup>
            <thead class="text-center ">
                <tr>
                    <th>시간</th>
                    <th>월요일</th>
                    <th>화요일</th>
                    <th>수요일</th>
                    <th>목요일</th>
                    <th>금요일</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <tr>
                    <th>1교시<br>09:00~10:00</th>
                    <td>
                <% 
                for(int i=0; i<lists.size(); i++) {
                    scDto dto = lists.get(i);
                    title = dto.getTitle();
                    week = dto.getWeek();
                    time = dto.getTime();
                if ((week.equals("월")) && (time.equals("mon1"))) { 
                %>
                <%= title %>
                <% } else { }} %>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                if ((week.equals("화")) && (time.equals("tue1"))) { 
                %>
                <%= title %>
                <% } else { }} %>
                </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                if ((week.equals("수")) && (time.equals("wed1"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("목")) && (time.equals("thu1"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                     <% 
                     for(int i=0; i<lists.size(); i++) {
                         scDto dto = lists.get(i);
                         
                         title = dto.getTitle();
                         week = dto.getWeek();
                         time = dto.getTime();
                         
                          
                if ((week.equals("금")) && (time.equals("fri1"))) { 
                %>
                <%= title %>
                <% } else { }} %>
                    </td>
                </tr>
                <tr>
                
                    <th>2교시<br>10:00~11:00</th>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("월")) && (time.equals("mon2"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();

                         
                if ((week.equals("화")) && (time.equals("tue2"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("수")) && (time.equals("wed2"))) { 
                %>
                <%= title %>
                <% } else { }} %>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("목")) && (time.equals("thu2"))) { 
                %>
                <%= title %>
                <% } else { } } %>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        

                         
                if ((week.equals("금")) && (time.equals("fri2"))) { 
                %>
                <%= title %>
                <% } else { } } %>
                    </td>
                </tr>
                <tr>
                
                    <th>3교시<br>11:00~12:00</th>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        

                if ((week.equals("월")) && (time.equals("mon3"))) { 
                %>
                <%= title %>
                <% } else { } } %>
                    </td>
                    <td>
                     <% 
                     for(int i=0; i<lists.size(); i++) {
                         scDto dto = lists.get(i);
                         
                         title = dto.getTitle();
                         week = dto.getWeek();
                         time = dto.getTime();
                         
                          
                if ((week.equals("화")) && (time.equals("tue3"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("수")) && (time.equals("wed3"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("목")) && (time.equals("thu3"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("금")) && (time.equals("fir3"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                </tr>
                <tr>
                    <th>4교시<br>12:00~13:00</th>
                        <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("월")) && (time.equals("mon4"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("화")) && (time.equals("tue4"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                         
                if ((week.equals("수")) && (time.equals("wed4"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("목")) && (time.equals("thu4"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("금")) && (time.equals("fri4"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                </tr>
                <tr>
                    <th>5교시<br>13:00~14:00</th>
                        <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("월")) && (time.equals("mon5"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("화")) && (time.equals("tue5"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("수")) && (time.equals("wed5"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                         
                if ((week.equals("목")) && (time.equals("thu5"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("금")) && (time.equals("fri5"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                </tr>
                <tr>
                    <th>6교시<br>14:00~15:00</th>
                        <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("월")) && (time.equals("mon6"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("화")) && (time.equals("tue6"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("수")) && (time.equals("wed6"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("목")) && (time.equals("thu6"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                         
                if ((week.equals("금")) && (time.equals("fri6"))) { 
                %>
                <%= title %>
                <% } else { } } %>
                    </td>
                </tr>
                <tr>
                    <th>7교시<br>15:00~16:00</th>
                        <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("월")) && (time.equals("mon7"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("화")) && (time.equals("tue7"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("수")) && (time.equals("wed7"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        
                         
                if ((week.equals("목")) && (time.equals("thu7"))) { 
                %>
                <%= title %>
                <% } else { } }%>
                    </td>
                    <td>
                    <% 
                    for(int i=0; i<lists.size(); i++) {
                        scDto dto = lists.get(i);
                        
                        title = dto.getTitle();
                        week = dto.getWeek();
                        time = dto.getTime();
                        ;
                         
                if ((week.equals("금")) && (time.equals("fri7"))) { 
                %>
                <%= title %>
                <% } 
                else {
                   
                } }
                    %>
                    </td>
                </tr>
            </tbody>
        </table>
<jsp:include page="inc/aside.jsp" flush="true" />
<jsp:include page="inc/footer.jsp" flush="true" />