<%@page import="bookstore.DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 상세정보</title>
<style>
.bookimg{
	position : relative;
	top : 10px;
	left : 50px;
}
.bookinfo{
	position : absolute;
	top : 200px;
	left : 400px;
	font-size : 12px;
	font-weight : bold;
}
.bookdetail{
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
.bookrating{
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
<body>
<%@include file="LogoAndSearchBar.jsp" %>
<% String bname = request.getParameter("bname"); %>
<% DB.loadConnect();
String isbn = DB.getIsbnByBname(bname);
float rating = DB.getRateByBname(bname)*20;
%>
<div class="bookimg">
<img style="width : 20%; heigth : 20%;" src="<%= DB.getImagePathByIsbn(isbn) %>">
</div>
<div class="bookinfo">
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
<div class="bookdetail">
<b>책 소개</b><br>
<p style="font-size:12px;"><%= DB.getDetailByIsbn(isbn) %></p>
</div>
<div class="review">
<b>고객 리뷰</b><br>
<%@include file="ReviewTable.jsp" %>
</div>
<div class="bookrating">
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