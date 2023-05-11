<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<style>
html{
overflow-x:hidden;
}
.LoginPosition{
position :relative;
left:70%;
}
.BestsellerPosition{
position : abolute;
margin-left:5%;
margin-top: 35%;
}
.slidePosition{
position :absolute;
margin:0 35% 0 35%;
}
.NoticePosition{
position: absolute;
margin-top: 5%;
margin-left: 10%;
}
.Categories{
posision: absolute;
margin-top:1%;
}
</style>
</head>
<body>
<%@include file="LogoAndSearchBar.jsp" %>
<div class="NoticePosition"><%@include file="Notice.jsp" %></div>
<div class="slidePosition"><%@include file="Slide.jsp" %></div>
<div class="Categories"></div>
<!-- 로그인폼 위치선정 -->
<div class=LoginPosition>
<%
if(session.getAttribute("userId")==null){
 %>
<%@ include file="Login.jsp" %>
 <%
}else{
 %>
 <%@ include file="LoginResult.jsp" %>
 <%
}
 %>
</div>
<!-- 추천 도서 위치선정 -->
<div class="BestsellerPosition">
<%@ include file="Bestseller.jsp" %>
</div>

</body>
</html>