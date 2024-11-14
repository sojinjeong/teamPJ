/**
 * 
 */
 /***nav**/
  
$(function(){
    $('.mainmenu-1,.submenu-1').mouseover(function(){
       $('.submenu-1').stop().show();
       $("#header").addClass("on");
    });
    $('.mainmenu-1,.submenu-1').mouseout(function(){
        $('.submenu-1').stop().hide();
        $("#header").removeClass("on");
     });


     $('.mainmenu-2,.submenu-2').mouseover(function(){
        $('.submenu-2').stop().show();
        $("#header").addClass("on");
     });
     $('.mainmenu-2,.submenu-2').mouseout(function(){
         $('.submenu-2').stop().hide();
         $("#header").removeClass("on");
      });


      $('.mainmenu-3,.submenu-3').mouseover(function(){
        $('.submenu-3').stop().show();
        $("#header").addClass("on");
     });
     $('.mainmenu-3,.submenu-3').mouseout(function(){
         $('.submenu-3').stop().hide();
         $("#header").removeClass("on");
      });

      
      $('.mainmenu-4,.submenu-4').mouseover(function(){
        $('.submenu-4').stop().show();
        $("#header").addClass("on");
     });
     $('.mainmenu-4,.submenu-4').mouseout(function(){
         $('.submenu-4').stop().hide();
         $("#header").removeClass("on");
      });
 });
 
 /**
 * 
 */
 
 
 /*** 메인메뉴 섹션 변경 ***/
 
 $(function(){
    
    $(".main").click(function(){
       
       const url = new URL(location.href).searchParams;
       const url2 = new URL(location.href);
       var menu = "";
       
       menu = $("this").write(urlParams.get('val'));
       
       alret(location.href);
       
    })
    
 });
 
 $(function(){
 
    $(".mymenu").find("h3").click(function(){
    
       var pg = $(this).text();
       
       
       if(pg == "내정보수정"){
          location.href="renamejoin.jsp";
       }
       else if(pg == "관심등록"){
          location.href="interest.jsp";
       }
       else if(pg =="수강신청"){
          location.href="scheduler.jsp";
       }
       else if(pg =="수강안내"){
          location.href="scheduleInfo.jsp";
       }
       else if(pg == "학사안내"){
          location.href="affairsMenu1.jsp";
       }
       else if(pg == "학과소개"){
          location.href="affairsMenu2.jsp";
       }
       else if(pg == "학과연락처"){
          location.href="affairsMenu3.jsp";
       }
       else if(pg == "입학안내"){
          location.href="admissionMenu1.jsp";
       }
       else if(pg =="오시는길"){
          location.href="admissionMenu2.jsp";
       }
    
    });
    
 });
 
 /* 우편번호 검색 */
 $(function(){


   $("#zip").click(function(){
      dPostcode();
   });

   //검색
   $('.dropdown-menu>a.dropdown-item').click(function(e){
      e.preventDefault();
      let $val = $(this).attr("href");
      let $txt = $(this).text();
      $('.dropdown-toggle').text($txt);
      $('.dropdown-toggle').val($val);
      $('.searchname').val($val);
   });
   


});


//다음주소 api
function dPostcode() {
   new daum.Postcode({
       oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var addr = ''; // 주소 변수
           var extraAddr = ''; // 참고항목 변수

           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
           } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('zipcode').value = data.zonecode;
           document.getElementById("addr1").value = addr;
           // 커서를 상세주소 필드로 이동한다.
           document.getElementById("addr2").focus();
       }
   }).open();
}
 
/** 관심등록 **/ 


function addToCart() {
   
    // 체크된 체크박스들을 담을 배열
    let checkedItems = [];
    let cartItems = [];
    // 모든 체크박스 요소들을 가져옴
    let checkboxes = document.querySelectorAll('input[type="checkbox"]');
    
    // 각 체크박스를 순회하면서 체크 여부를 확인
    checkboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            checkedItems.push(checkbox.value);
        }
    });
    
    // 장바구니에 선택된 항목을 추가
    cartItems = cartItems.concat(checkedItems);
    
    
    // 장바구니에 추가된 항목을 출력
    let cartList = document.getElementById('cart');
    cartList.innerHTML = ''; // 기존 내용을 초기화

    cartItems.forEach(function(item) {
        let li = document.createElement('li');
        li.textContent = item;
        cartList.appendChild(li);
        let xbutton = document.createElement("button");
        xbutton.textContent = "x";
        li.appendChild(xbutton);   
      
    });
}

 /**관심등록 전송**/
 
 function getCheckedValues(){
   let checkboxes = document.querySelectorAll('.text_check');
   let checkedValues = [];
   checkboxes.forEach(function(checkbox) {
      if (checkbox.checked) {
       checkedValues.push(checkbox.value);
         
     }; //if문
   });  //forEach문
  
  
    return checkedValues;
 }  //gCV함수
 
 function interest() {
   let checkedValues = getCheckedValues();
   document.getElementById('checkedValues').value = checkedValues.join(',');
 
    document.getElementById('interestForm').submit();
    document.getElementById('checkedValues').setAttribute('value', checkedValues);
    
    }
   
/**카트 전체 비우기 */
function clearCart() {
 
let cartList = document.getElementById('cart');
   
cartList.innerHTML = ''; 
cartItems=[];
}




$(document).ready(function(){  // 제이쿼리문 시작
  /**선택한 카트요소 비우기 */
  $('#cart').on('click','button',function(){
  $(this).parent().remove();
  
  	
  });
  
  /**check box 선택삭제 */
  $('#deleteAll').on('click', function() {
 $(".text_check").prop("checked", false);
  $('#checkedCount').text('현재 선택 강의 : 0');
 });

  /***check box 선택개수 */
  $('input[type="checkbox"]').change(function() {
    var checkedCount = $('input[type="checkbox"]:checked').length;
    $('#checkedCount').text('현재 선택 강의 : ' + checkedCount);
});


});
/** 출석부 **/
    $(function(){
        $(".nav > ul > li").mouseover(function(){
            $(this).find(".submenu").stop().slideDown();
        });
        $(".nav > ul > li").mouseout(function(){
            $(this).find(".submenu").stop().slideUp();
        });
        // 탭 메뉴 작업
        let tabBtn = $(".tab-btn ul li"); //버튼 설정
        let tabCont = $(".tab-cont > div");   //콘텐츠 설정
        tabCont.hide().eq(0).show();          //첫번째 콘텐츠만 보이게 설정

        tabBtn.click(function(){
            const index = $(this).index();    //클릭한 번호를 저장
            console.log(index);
            //alert(index);

            $(this).addClass("active").siblings().removeClass("active");    
            //내가 클릭한 버튼의 클래스를 추가하고 나머지 버튼은 삭제
            tabCont.eq(index).show().siblings().hide();
            //내가 클릭한 버튼의 콘텐츠는 보여주고 나머지는 숨기기 
        });
    });

    
    
    
    /** 관심등록 > 시간표보기 **/
    
    function submitCheckedValues() {
    var checkedValues = [];
    var checkboxes = document.querySelectorAll('.text_check:checked');
    checkboxes.forEach(function(checkbox) {
        checkedValues.push(checkbox.value);
    });
    var queryString = checkedValues.join(',');
  
    window.location.href = 'schedule2.jsp?selected=' + queryString;
    }
    
    /** 관심등록 > 시간표보기 > 선택된 시간표td 색상변경 **/
    $(function(){
       $("td:contains('웹디자인')").css("background-color", "#e9fcff");
       $("td:contains('자바프로그램')").css("background-color", "#fdf7e5");
       $("td:contains('데이터베이스')").css("background-color", "#edf7e9");
       $("td:contains('영상편집')").css("background-color", "#f4eefd");
    });

/**
 * 
 */
 /***nav**/
 $(function(){
    $('.mainmenu-1,.submenu-1').mouseover(function(){
       $('.submenu-1').stop().show();
    });
    $('.mainmenu-1,.submenu-1').mouseout(function(){
        $('.submenu-1').stop().hide();
     });


     $('.mainmenu-2,.submenu-2').mouseover(function(){
        $('.submenu-2').stop().show();
     });
     $('.mainmenu-2,.submenu-2').mouseout(function(){
         $('.submenu-2').stop().hide();
      });


      $('.mainmenu-3,.submenu-3').mouseover(function(){
        $('.submenu-3').stop().show();
     });
     $('.mainmenu-3,.submenu-3').mouseout(function(){
         $('.submenu-3').stop().hide();
      });

      
      $('.mainmenu-4,.submenu-4').mouseover(function(){
        $('.submenu-4').stop().show();
     });
     $('.mainmenu-4,.submenu-4').mouseout(function(){
         $('.submenu-4').stop().hide();
      });
 });
 
 /**
 * 
 */
 
 
 /*** 메인메뉴 섹션 변경 ***/
 
 $(function(){
    
    $(".main").click(function(){
       
       const url = new URL(location.href).searchParams;
       const url2 = new URL(location.href);
       var menu = "";
       
       menu = $("this").write(urlParams.get('val'));
       
       alret(location.href);
       
    })
    
 });
 
 $(function(){
 
    $(".mymenu").find("h3").click(function(){
    
       var pg = $(this).text();
       
       
       if(pg == "내정보수정"){
          location.href="renamejoin.jsp";
       }
       else if(pg == "관심등록"){
          location.href="interest.jsp";
       }
       else if(pg =="수강신청"){
          location.href="scheduler.jsp";
       }
       else if(pg =="수강안내"){
          location.href="scheduleInfo.jsp";
       }
       else if(pg == "학사안내"){
          location.href="affairsMenu1.jsp";
       }
       else if(pg == "학과소개"){
          location.href="affairsMenu2.jsp";
       }
       else if(pg == "학과연락처"){
          location.href="affairsMenu3.jsp";
       }
       else if(pg == "입학안내"){
          location.href="admissionMenu1.jsp";
       }
       else if(pg =="오시는길"){
          location.href="admissionMenu2.jsp";
       }
    
    });
    
 });
 
 /* 우편번호 검색 */
 $(function(){


   $("#zip").click(function(){
      dPostcode();
   });

   //검색
   $('.dropdown-menu>a.dropdown-item').click(function(e){
      e.preventDefault();
      let $val = $(this).attr("href");
      let $txt = $(this).text();
      $('.dropdown-toggle').text($txt);
      $('.dropdown-toggle').val($val);
      $('.searchname').val($val);
   });
   


});


//다음주소 api
function dPostcode() {
   new daum.Postcode({
       oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var addr = ''; // 주소 변수
           var extraAddr = ''; // 참고항목 변수

           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
           } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('zipcode').value = data.zonecode;
           document.getElementById("addr1").value = addr;
           // 커서를 상세주소 필드로 이동한다.
           document.getElementById("addr2").focus();
       }
   }).open();
}
 
/** 관심등록 **/ 


function addToCart() {
   
    // 체크된 체크박스들을 담을 배열
    let checkedItems = [];
    let cartItems = [];
    // 모든 체크박스 요소들을 가져옴
    let checkboxes = document.querySelectorAll('input[type="checkbox"]');
    
    // 각 체크박스를 순회하면서 체크 여부를 확인
    checkboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            checkedItems.push(checkbox.value);
        }
    });
    
    // 장바구니에 선택된 항목을 추가
    cartItems = cartItems.concat(checkedItems);
    
    // 장바구니에 추가된 항목을 출력
    let cartList = document.getElementById('cart');
    cartList.innerHTML = ''; // 기존 내용을 초기화

    cartItems.forEach(function(item) {
        let li = document.createElement('li');
        li.textContent = item;
        cartList.appendChild(li);
        let xbutton = document.createElement("button");
        xbutton.textContent = "x";
        li.appendChild(xbutton);
    });
}



/**카트 전체 비우기 */
function clearCart() {
 
let cartList = document.getElementById('cart');
   
cartList.innerHTML = ''; 
cartItems=[];
}




$(document).ready(function(){  // 제이쿼리문 시작
  /**선택한 카트요소 비우기 */
  $('#cart').on('click','button',function(){
  $(this).parent().remove();
  
     
  });
  
  /**check box 선택삭제 */
  $('#deleteAll').on('click', function() {
 $(".text_check").prop("checked", false);
  $('#checkedCount').text('현재 선택 강의 : 0');
 });

  /***check box 선택개수 */
  $('input[type="checkbox"]').change(function() {
    var checkedCount = $('input[type="checkbox"]:checked').length;
    $('#checkedCount').text('현재 선택 강의 : ' + checkedCount);
});


});

/** 출석부 **/

    $(function(){
        $(".nav > ul > li").mouseover(function(){
            $(this).find(".submenu").stop().slideDown();
        });
        $(".nav > ul > li").mouseout(function(){
            $(this).find(".submenu").stop().slideUp();
        });
        // 탭 메뉴 작업
        let tabBtn = $(".tab-btn > ul > li"); //버튼 설정
        let tabCont = $(".tab-cont > div");   //콘텐츠 설정
        tabCont.hide().eq(0).show();          //첫번째 콘텐츠만 보이게 설정

        tabBtn.click(function(){
            const index = $(this).index();    //클릭한 번호를 저장
            //alert(index);
			
            $(this).addClass("active").siblings().removeClass("active");    
            //내가 클릭한 버튼의 클래스를 추가하고 나머지 버튼은 삭제
            tabCont.eq(index).show().siblings().hide();
            //내가 클릭한 버튼의 콘텐츠는 보여주고 나머지는 숨기기
        });
    });
    
    
    
    /** 관심등록 > 시간표보기 **/
    
    function submitCheckedValues() {
    var checkedValues = [];
    var checkboxes = document.querySelectorAll('.text_check:checked');
    checkboxes.forEach(function(checkbox) {
        checkedValues.push(checkbox.value);
    });
    var queryString = checkedValues.join(',');
  
    window.location.href = 'schedule2.jsp?selected=' + queryString;
    }
    
    /** 관심등록 > 시간표보기 > 선택된 시간표td 색상변경 **/
    $(function(){
       $("td:contains('웹디자인')").css("background-color", "#e9fcff");
       $("td:contains('자바프로그램')").css("background-color", "#fdf7e5");
       $("td:contains('데이터베이스')").css("background-color", "#edf7e9");
       $("td:contains('영상편집')").css("background-color", "#f4eefd");
    });

	/** 날짜 선택 **/    
    $(function(){
		$("#testpicker").datepicker({
			dateFormat: 'yy-mm-dd',
			onSelect: function(dateString){
				$("#dateform").submit();
				console.log(dateString);
				
			}
		});
		
	})

