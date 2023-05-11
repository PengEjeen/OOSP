<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로고</title>
<style>
.button{
border:0; 
outline:0;
background-color:white;
cursor:pointer;
}
.search{
height:50px;
width: 700px;
border: 1px solid green;
border-radius:20px;
margin-left:300px;
margin-top:30px;
overflow:hidden;
}

#searchimg{
position :relative;
left:630px;
bottom:35px;
}
#searchinput{
width: 650px;
height:35px;
font-size : 20px;
margin-top:7px;
margin-left:10px;
border:0px; 
outline: 0;
}
#logoimg_btn{
position:absolute;
top:0px;
left:0px;
}
</style>
</head>
<body>
<!-- 나인문고 로고 이미지 출력부분 -->
<body>
<script>
function LoadMain(){
	return location.href='Main.jsp';
}
</script>
<button class="button" id="logoimg_btn" Onclick="LoadMain()"><img src="./img/logo.png"></button>
<!--  검색창 출력부분 액션 미입력 -->
<div class=search><form action=SearchResult.jsp>
<input type="text" placeholder="검색어를 입력하세요" id="searchinput" name="search" autocomplete="off">
<button type="submit" class="button" id="searchimg"><img src="./img/search.png"></button>
</form></div>
<div>

</div>
<br><br><br><br>