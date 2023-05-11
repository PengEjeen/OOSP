<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
<style>
.LogOut{
position: absolute;
width:20vw;
height:10vh;
padding:5vh;
background-color:azure;
text-align :center;
}
.LogOutFont{
font-size :1.5vw;

}
</style>
</head>
<body>
<% if(session.getAttribute("userId")==null){
	response.sendRedirect("Login.jsp");
	}
	String userId= (String)session.getAttribute("userId");
	%>
	<div class="LogOut">
	<div class="LogOutFont"><%= userId %>님 환영합니다!!<br></div>
	<!-- 로그아웃 하이퍼링크 누르면, 세션 종료와 메인화면으로 이동 -->
	<a href=LogOut.jsp onClick="LogOut()">로그아웃</a>
	<a href=CustomerInf.jsp>마이페이지</a>
	</div>
<script>
function LogOut(){
	alert('로그아웃이 정상적으로 처리되었습니다!');
}
</script>
</body>
</html>