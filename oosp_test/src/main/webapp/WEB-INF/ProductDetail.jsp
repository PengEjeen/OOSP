<%@page import="oosp.DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
<style>
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
	position : absolute;
	top : 400px;
	left : 400px;
}
.buy{
	position : absolute;
	top : 200px;
	left : 800px;
}
.star-rating { width:205px; position:relative; top:10px;}
.star-rating,.star-rating span { display:inline-block; height:39px; overflow:hidden; background:url(./img/star.png)no-repeat; }
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
</style>
</head>
<script type="text/javascript">

//왜 여기에 buy 함수가 있나?
function buy(){
	var form = document.createElement('form');
	<% 
	DB.loadConnect(); 
	String bname_js = request.getParameter("bname");
	String isbn_js = DB.getIsbnBySearch(bname_js);
	String cid = (String)session.getAttribute("userId");
	String price = DB.getPriceByIsbn(isbn_js);
	%>
	
	form.method = 'get';
	form.action = 'BuyAction.jsp';
	
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
	
	input1.setAttribute("name", "isbn");
	input1.setAttribute("value", "<%=isbn_js%>" );
	input2.setAttribute("name", "cid");
	input2.setAttribute("value", "<%=cid%>" );
	input3.setAttribute("name", "price");
	input3.setAttribute("value", "<%=price%>" );
	
	form.appendChild(input1);
	form.appendChild(input2);
	form.appendChild(input3);
	document.body.appendChild(form);
	form.submit();
}
</script>
<body> <!-- 검색창 부분 -->
<%@include file="LogoAndSearchBar.jsp" %>
<% String productname = request.getParameter("bname"); %>

<!-- productname SearchResult.jsp파일 getSearchByName함수에 있음. -->
<% DB.loadConnect();
String isbn = DB.getIsbnByBname(bname);
float rating = DB.getRateByBname(bname)*20;
%>
<div class="productimg">
<img style="width : 20%; heigth : 20%;"> 
</div>
<div class="productinfo">
<table border="1">
<tr>
<td>책 제목</td>
<td width="300" class="ntd"><%= DB.getBookNameByIsbn(isbn) %></td>
</tr>
<tr>
<td>저자</td>
<td width="300" class="ntd"><%= DB.getWriterByIsbn(isbn) %></td>
</tr>
<tr>
<td>ISBN</td>
<td width="300" class="ntd"><%= isbn %></td>
</tr>
<tr>
<td>가격</td>
<td width="300" class="ntd"><%= DB.getPriceByIsbn(isbn) %></td>
</tr>
<tr>
<td>분류</td>
<td width="300" class="ntd"><%= DB.getCategoryByIsbn(isbn) %></td>
</tr>
</table>
</div>
<div class="productdetail">
<b>책 소개</b><br>
<p style="font-size:12px;"><%= DB.getDetailByIsbn(isbn) %></p>
</div>
<div class="review">
<b>고객 리뷰</b><br>
<%@include file="ReviewTable.jsp" %>
</div>
<div class="productrating">
평점
<span class='star-rating'>
<span style ="width:<%= rating %>%"></span>
</span>
</div>
<div class="buy">
<button type="button" onclick="buy()">구매</button>
</div>
</body>
</html>