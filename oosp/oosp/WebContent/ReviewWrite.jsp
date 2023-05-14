<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bookstore.*"%>
 <% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 작성</title>
<style>
.book{
	position : relative;
	top : 10px;
	left : 50px;
}
.review{
	position : absolute;
	top : 300px;
	left : 200px;
}
.rating{
	position : relative;
	bottom : 120px;
}
</style>
</head>
<body>
<%@include file="LogoAndSearchBar.jsp" %>
<div class="book">
<% DB.loadConnect(); 
int bno = Integer.parseInt(request.getParameter("buyingno"));
String isbn = DB.getIsbnByBuyingno(bno);%>
'<%=DB.getBookNameByIsbn(isbn) %>' 에 대한 리뷰 작성
</div>
<div class="review">
<form action = "ReviewWriteAction.jsp" method="post">
<textarea name ="review" rows="5" cols="60" wrap = "virtual"></textarea>
<div class="rating">점수
<select name="rating">
<option value ="">선택</option>
<option value ="5">5</option>
<option value ="4">4</option>
<option value ="3">3</option>
<option value ="2">2</option>
<option value ="1">1</option>
</select>
</div>
<input type ="hidden" name="buyingno" value="<%= request.getParameter("buyingno") %>">
<input type ="submit" value ="작성">
</form>
</div>
</body>
</html>