<%@page import="bookstore.DB"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="SearchError.jsp"%>
<!DOCTYPE html>
<html>
<style></style>
<head>
<style>
.result{
}
.upside{
	position : relative;
	left : 200px;
	bottom : 100px;
}
.bookimg{
	position : absolute;
	left : 200px;
	top : 200px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 검색 결과</title>
</head>
<script type="text/javascript">
function viewDetail(){
	var form = document.createElement('form');
	<% 
	DB.loadConnect(); 
	String result_j = request.getParameter("search");
	String isbn_j = DB.getIsbnBySearch(result_j);
	String bname = DB.getBookNameByIsbn(isbn_j);
	%>
	
	form.method = 'get';
	form.action = 'BookDetail.jsp';
	
	var input1 = document.createElement('input');
	input1.setAttribute("name", "bname");
	input1.setAttribute("value", "<%=bname%>" );
	
	form.appendChild(input1);
	document.body.appendChild(form);
	form.submit();
}
</script>
<body>
	<% DB.loadConnect(); %>
	<%@include file="LogoAndSearchBar.jsp" %>
	<% String result = request.getParameter("search"); %>
	'<%= result%>'에 대한 검색 결과
	<% String isbn = DB.getIsbnBySearch(result); %>
	
	<div class="bookimg">
	<img style="width:15%; height:15%;" src="<%=DB.getImagePathByIsbn(isbn)%>">
	<div class="upside"><%=DB.getBookNameByIsbn(isbn) %><br><%=DB.getWriterByIsbn(isbn) %><br><%=DB.getPriceByIsbn(isbn) %>원<br><button type="button" onclick="viewDetail()" >상세정보 보기</button></div>
	</div>
</body>
</html>