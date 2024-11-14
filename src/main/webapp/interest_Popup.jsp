<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타벅스 이벤트!</title>
<script>

	function pclose(target){
			console.log(target.checked);
			var date = new Date();
			var days = 1 * 24 * 60 * 60 * 1000;
			var min = 1 * 60 * 1000;
		if(target.checked == true){
			date.setTime(date.getTime()+10000);
			localStorage.setItem("popYN", "N");
			localStorage.setItem("time", date.getTime()+days);
			localStorage.setItem("time2", date);
			self.close();
		}
		
		
	}
	
	console.log(localStorage.getItem("popYN"));
</script>
</head>
<body>
  <img src="img/popup1.png" alt="popup1"/>
  <input type="checkbox" onclick="pclose(this);"/>
  <b>오늘 하루 그만보기</b>
</body>
</html>