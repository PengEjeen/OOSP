<%@page import="java.sql.*,bookstore.DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="BookDetail.jsp">
	<input type="text" name="bname" size="30">
	<input type="submit" value="입력">
	</form>
	<% 
	DB.loadConnect();
	String s = DB.getIsbnBySearch("쾌");
	%>
	<%= s %>
</body>
</html>