<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.list{
width: 50vw;
height:4vh;
border:1px solid;
}

.2{
width: 3vw;
height:inherit;
padding:0;
border:0;
position:relative;
top: 50px;
left:200px;
}

.1{
width:inherit;
height:inherit;
object-fit:fill;
}

.OrderSearch{
width:99%;
height:90%;
border:0;
outline:0;
font-size:2vh;
}
</style>
</head>
<body>
일반상품 주문관리 > 주문/배송 조회<br>
<div class="list"><input class="OrderSearch" type="text" placeholder="주문한 상품을 검색할 수 있어요!"></div>
<button class="2" type="submit"><img class="1" src="./img/search.png"></button>


</div>
</body>
</html>