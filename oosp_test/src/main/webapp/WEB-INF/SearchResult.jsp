<%@page import="oosp.DB"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
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
<!-- 상세보기 버튼 클릭하면 ProductDetail에 productnumber 전달하는 함수. js로 짜여져있다. -->
<script type="text/javascript">
function viewDetail(string productnumber){
	var form = document.createElement('form');
	
	form.method = 'get';
	form.action = 'ProductDetail.jsp';
	
	//ProductDetail에 값 전달하기 위한 부분
	var input1 = document.createElement('input');
	input1.setAttribute("name", "productnumber");
	input1.setAttribute("value", productnumber );
	
	form.appendChild(input1);
	document.body.appendChild(form);
	form.submit();
}
</script>
<body>
	<% DB.loadConnect(); 
	String test="testsession";%>
	<% String result = request.getParameter("search"); %>
	'<%= result%>'에 대한 검색 결과
	<% String productnumber = "111"; %>
	
	<div class="bookimg">
	<img style="width:15%; height:15%;" src="<%=""%>"> <!-- DB.getImagePathByIsbn(isbn) -->
	<div class="upside"><%=test %><br><%=test %><br><%=test %>원<br><button type="button" onclick="viewDetail(productnumber)" >상세정보 보기</button></div>
	</div>
</body>
</html>