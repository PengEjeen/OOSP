<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="oosp.DB"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매처리</title>
</head>
<body>
<%
if(session.getAttribute("userId") == null){
	out.println("<script>alert('로그인이 필요합니다.'); history.back();</script>");
}
else{
    DB.loadConnect();
    String[] buylist = request.getParameterValues("buylist");
    
if (buylist != null) {
        for (String productnumber : buylist) {
            String productname = DB.getProductnameByProductnumber(productnumber);
            String price = DB.getPriceByProductnumber(productnumber);
        	DB.buyingStep(productnumber,request.getParameter("customerid"),price);   
        }
	out.println("<script>alert('구매가 완료되었습니다.'); history.back();</script>");
	}
}

   %>



</body>
</html>