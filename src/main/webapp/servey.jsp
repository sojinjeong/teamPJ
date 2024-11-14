<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>



<div class="servey_box" style="display:block;">
    <h1>설문조사 [본교 학생만 가능]</h1>

    <h3>[교육만족도 평가]</h3>
    <form id="serveyForm" action="serveyOk.jsp" method="post">
    <p><span>1.</span> 교육의 구성 및 내용이 만족한다.</p>
    <table>
    <thead>
      <tr>
      <td id="num">No.</td>
      <td>매우 그렇다</td>
      <td>그렇다</td>
      <td>보통이다</td>
      <td>아니다</td>
      <td>전혀 아니다</td>
      </tr>
    </thead>
    <tbody>
    </tbody>
      <tr>
      <td id="num">1</td>
      <td><input type="radio" name="servey_box1" value="5"/></td>
      <td><input type="radio" name="servey_box1" value="4"/></td>
      <td><input type="radio" name="servey_box1" value="3"/></td>
      <td><input type="radio" name="servey_box1" value="2"/></td>
      <td><input type="radio" name="servey_box1" value="1"/></td>
      </tr>
    </table>
    
   
    <p><span>2.</span> 교육 내용을 이해하기 쉽게 전달한다.</p>
    <table>
    <thead>
      <tr>
      <td id="num">No.</td>
     <td>매우 그렇다</td>
      <td>그렇다</td>
      <td>보통이다</td>
      <td>아니다</td>
      <td>전혀 아니다</td>
      </tr>
    </thead>
    <tbody>
    </tbody>
      <tr>
      <td id="num">2</td>
      <td><input type="radio" name="servey_box2" value="5"/></td>
      <td><input type="radio" name="servey_box2" value="4"/></td>
      <td><input type="radio" name="servey_box2" value="3"/></td>
      <td><input type="radio" name="servey_box2" value="2"/></td>
      <td><input type="radio" name="servey_box2" value="1"/></td>
      </tr>
    </table>
    
   
    <p><span>3.</span> 교육이 현실에서 적용하는데 효과적이다.</p>
    <table>
    <thead>
      <tr>
      <td id="num">No.</td>
      <td>매우 그렇다</td>
      <td>그렇다</td>
      <td>보통이다</td>
      <td>아니다</td>
      <td>전혀 아니다</td>
      </tr>
    </thead>
    <tbody>
    </tbody>
      <tr>
      <td id="num">3</td>
      <td><input type="radio" name="servey_box3" value="5"/></td>
      <td><input type="radio" name="servey_box3" value="4"/></td>
      <td><input type="radio" name="servey_box3" value="3"/></td>
      <td><input type="radio" name="servey_box3" value="2"/></td>
      <td><input type="radio" name="servey_box3" value="1"/></td>
      </tr>
    </table>
    
   
    <p><span>4.</span> 교육 내용에 대해서 전반적으로 만족하는가?</p>
    <table>
    <thead>
      <tr>
      <td id="num">No.</td>
      <td>매우 그렇다</td>
      <td>그렇다</td>
      <td>보통이다</td>
      <td>아니다</td>
      <td>전혀 아니다</td>
      </tr>
    </thead>
    <tbody>
    </tbody>
      <tr>
      <td id="num">4</td>
      <td><input type="radio" name="servey_box4" value="5"/></td>
      <td><input type="radio" name="servey_box4" value="4"/></td>
      <td><input type="radio" name="servey_box4" value="3"/></td>
      <td><input type="radio" name="servey_box4" value="2"/></td>
      <td><input type="radio" name="servey_box4" value="1"/></td>
      </tr>
    </table>
    <button type="button"  class="btn btn-outline-dark" onclick="window.close()">설문닫기</button>
    <input type="submit" class="btn btn-outline-dark" name="survey_submit" value="설문제출"/>
    </form>
</div>