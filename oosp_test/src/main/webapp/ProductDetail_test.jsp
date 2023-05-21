<%@page import="oosp.DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
</head>

<body> 
<% String productnumber = "111"; %>
<% DB.loadConnect();
float rating = DB.getRateByProductnumber(productnumber); //rate = totalstar/starcount
%>

상품 이름
<%= DB.getProductnameByProductnumber(productnumber) %>

저자
<%= DB.getCompanynameByProductnumber(productnumber) %>
상품번호
<%= productnumber %>

가격
<%= DB.getPriceByProductnumber(productnumber) %>
분류
<%= DB.getPriceByProductnumber(productnumber) + " no category now" %>
</body>
</html>