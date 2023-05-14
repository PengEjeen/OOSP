<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,bookstore.*"
errorPage="rootError.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
  thead tr {
    background-color: #0d47a1;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #bbdefb;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #e3f2fd;
  }
  h3 {
  	font-style: bold;
  	background-color: lightgray;
  }
</style>
</head>
<body>
	<% DB.loadConnect(); %>
	<% String isbn = DB.getIsbnFromShipDateNull(); %>
	<h3>구매 요청 책</h3><hr>
	<table>
		<tr> 
		<td>이름</td>
		<td>구매자 아이디</td>
		<td>가격</td>
		<td>주문날짜</td>
		<td>배송정보</td>
		<td>배송날짜</td>
		<td></td>
		</tr>
		
		<tr>
		<td><%= DB.getBookNameByIsbn(isbn) %></td>
		<td><%= DB.getCustomer_IdByIsbn(isbn) %>
		<td><%= DB.getPriceByIsbn(isbn) %></td>
		<td><%= DB.getDateByIsbn(isbn) %></td>
		<td><%= DB.getShippingByIsbn(isbn) %></td>
		<td><%= DB.getShipDateByIsbn(isbn) %></td>
		<td><a href="rootOrderDispose.jsp" > 주문 처리 </a></td>
		</tr>
	</table>
</body>
</html>