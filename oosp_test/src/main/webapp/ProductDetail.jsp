<%@page import="oosp.DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
<style>
.btn{
	width: 100px;
	height: 30px;
	font-size: 20px; 
}
.productimg{
	position : relative;
	top : 10px;
	left : 50px;
}
.productinfo{
	position : absolute;
	top : 200px;
	left : 400px;
	font-size : 12px;
	font-weight : bold;
}
.productdetail{
	position : absolute;
	top : 300px;
	left : 400px;
}
table,th,td {
	border:1px solid black;
	border-left:0px;
	border-right:0px;
	border-collapse:collapse;
	padding-left:5px;
	font-size:20px;
}
.ntd{
	padding-left:30px;
}
.productrating{
	position : absolute;
	top : 70vh;
	left : 60px;
}
.review{
	position : relative;
	top : 300px;
	left : 400px;
}
.buy{
	position : relative;
	top : 200px;
	left : 400px;
}
.star-rating { width:205px; position:relative; top:10px;}
.star-rating,.star-rating span { display:inline-block; height:39px; overflow:hidden; background:url(./img/star.png)no-repeat; }
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
</style>
</head>
<script type="text/javascript">


//buy 함수
function buy() {
  <% 
    DB.loadConnect();  
    String productnumber_js = request.getParameter("productnumber");
    String userid = (String) session.getAttribute("userId");
    String price = DB.getPriceByProductnumber(productnumber_js);
  %>
  
  var productnumber = "<%= productnumber_js %>";
  var customerid = "<%= userid %>";
  var price = "<%= price %>";
  
  var url = "BuyAction.jsp?productnumber=" + encodeURIComponent(productnumber) + "&customerid=" + encodeURIComponent(customerid) + "&price=" + encodeURIComponent(price);
  window.location.href = url;
}
</script>
<body> <!-- 검색창 부분 -->
<%@include file="LogoAndSearchBar.jsp" %>
<!-- 상품 상세보기버튼에서 가지고오는 듯 하다. -->
<% String productnumber = request.getParameter("productnumber"); 

//ReviewWriteAction에 productnumber 보내기 위한 값
//정말 싫었는데 ReviewWriteAction에 전달해주려면 필요했음... 새로 만들기는 귀찮고 ㅎ..
//어차피 디테일 페이지 들어올 때마다 바뀌니까 괜찮지 않을까 싶었음.
session.setAttribute("productnumber", productnumber);


%>
<hr class="one" width="100%">
<!-- productname SearchResult.jsp파일 getSearchByName함수에 있음. -->
<% DB.loadConnect();
//String isbn = DB.getIsbnByBname(productnumber);
float rating = DB.getRateByProductnumber(productnumber); //rate = totalstar/starcount
%>
<div class="productimg">
<img style="width : 20%; heigth : 20%;"> 
</div>
<div class="productinfo">
<table border="1">
<tr>
<td>상품 이름</td>
<td width="300" class="ntd"><%= DB.getProductnameByProductnumber(productnumber) %></td>
</tr>
<tr>
<td>회사명</td>
<td width="300" class="ntd"><%= DB.getCompanynameByProductnumber(productnumber) %></td>
</tr>
<tr>
<td>상품번호</td>
<td width="300" class="ntd"><%= productnumber %></td>
</tr>
<tr>
<td>가격</td>
<td width="300" class="ntd"><%= DB.getPriceByProductnumber(productnumber) %></td>
</tr>
<tr>
<td>분류</td>
<td width="300" class="ntd"><%= DB.getPriceByProductnumber(productnumber) + " no category now" %></td>
</tr>
<tr>
<td>재고</td>
<td width="300" class="ntd"><%= DB.getStockByProductnumber(productnumber) %></td>
</tr>
</table>
</div>

<!-- 구매 -->
<div class="buy">
<button type="button" onclick="buy()" class='btn'>구매</button>
</div>

<!-- 댓글 작성부분 -->
<div class="review">
<%@include file="ReviewWrite.jsp" %>
<b>고객 리뷰</b><br>
<%@include file="ReviewTable.jsp" %>
</div>

<div class="productrating">
평점
<span class='star-rating'>
<span style ="width:<%= rating %>%"></span>
</span>
</div>
</body>
</html>