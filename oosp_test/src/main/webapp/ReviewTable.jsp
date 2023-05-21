<%@page import="oosp.DB, java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%// 변수 선언
    String productnumber_review = "111";
    //String productnumber = (String)request.getAttribute("productnumber");
    DB.loadConnect();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

	<table border="1">
		<tr>
			<td>구매자</td>
			<td>평점</td>
			<td>리뷰 내용</td>
			<td>구매일</td>
		</tr>
	<% 
	ResultSet rs = DB.getReview(productnumber_review);
		while (rs.next()) {
    		String customerid = rs.getString("customerid");
    		String starreview = rs.getString("starreview");
    		String review = rs.getString("review");
    		String orderdate = rs.getString("orderdate");
	%>
	<tr>
    	<td><%= customerid %></td>
    	<td><%= starreview %></td>
    	<td><%= review %></td>
    	<td><%= orderdate %></td>
	</tr>
	<%
		}
	%>
	

	</table>
</body>
</html>