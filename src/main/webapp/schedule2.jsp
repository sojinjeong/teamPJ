<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="inc/header.jsp" flush="true" />

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<%@ page import="school.dao.*" %>
<jsp:useBean id="dto" class="school.dto.scDto" scope="page" />
<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>
<% 

   Connection conn = db.getConnection();
   String selecteClass = request.getParameter("class");
   ScheduleDao dao = new ScheduleDao(conn);
   int scid = 2;
   dto = dao.login(scid);
   String week = dto.getWeek();
   
   System.out.println(dto.getTitle());
   System.out.println(dto.getWeek());
   db.closeConnection();
   
   String web = "";
   String java = "";
   String data = "";
   String view = "";
   
   String selectedClasses = request.getParameter("selected");
   String[] sClass = selectedClasses.split(","); 
   for(int i=0; i<sClass.length; i++){

      if(sClass[i].equals("웹디자인")){
         web = sClass[i];
      }else if(sClass[i].equals("자바프로그램")){
         java = sClass[i];
      }else if(sClass[i].equals("데이터베이스")){
         data = sClass[i];
      }else if(sClass[i].equals("영상편집")){
         view = sClass[i];
      }
      
   }
    
   
%>

<button class="btn btn-outline-dark sc_2button" onclick="window.location.href='interest.jsp';">뒤로가기</button>


         <table class="table table-bordered intertable">
         <colgroup>
            <col width="*">
            <col width="16.3%">
            <col width="16.3%">
            <col width="16.3%">
            <col width="16.3%">
            <col width="16.3%">

         </colgroup>
            <thead class="text-center">
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
                    <td class="1_mon"><%=web%></td>
                    <td class="1_tues"><%=view%></td>
                    <td class="1_wed"></td>
                    <td class="1_thurs"></td>
                    <td class="1_fir"></td>
                </tr>
                <tr>
                    <th>2교시<br>10:00~11:00</th>
                   <td class="2_mon"></td>
                    <td class="2_tues"></td>
                    <td class="2_wed"></td>
                    <td class="2_thurs"></td>
                    <td class="2_fir"></td>
                </tr>
                <tr>
                    <th>3교시<br>11:00~12:00</th>
                    <td class="3_mon"><%=java%></td>
                    <td class="3_tues"><%=java%></td>
                    <td class="3_wed"><%=data%></td>
                    <td class="3_thurs"></td>
                    <td class="3_fir"></td>
                </tr>
                <tr>
                    <th>4교시<br>12:00~13:00</th>
                      <td class="4_mon"></td>
                    <td class="4_tues"></td>
                    <td class="4_wed"></td>
                    <td class="4_thurs"><%=data%></td>
                    <td class="4_fir"><%=view%></td>
                </tr>
                <tr>
                    <th>5교시<br>13:00 - 14:00</th>
                    <td class="5_mon"></td>
                    <td class="5_tues"><%=data%></td>
                    <td class="5_wed"></td>
                    <td class="5_thurs"></td>
                    <td class="5_fir"><%=web%></td>
                </tr>
                <tr>
                    <th>6교시<br>14:00 - 15:00</th>
                     <td class="6_mon"></td>
                    <td class="6_tues"></td>
                    <td class="6_wed"></td>
                    <td class="6_thurs"></td>
                    <td class="6_fir"></td>
                </tr>
                <tr>
                    <th>7교시<br>15:00 - 16:00</th>
                   <td class="7_mon"></td>
                    <td class="7_tues"></td>
                    <td class="7_wed"><%=web%></td>
                    <td class="7_thurs"></td>
                    <td class="7_fir"><%=java%></td>
                </tr>
            </tbody>
        </table>
<jsp:include page="inc/aside.jsp" flush="true" />
<jsp:include page="inc/footer.jsp" flush="true" />