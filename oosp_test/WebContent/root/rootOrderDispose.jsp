<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,bookstore.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>rootOrderDispose</title>
</head>
<body>
	<% DB.loadConnect(); %>	
	<% request.setCharacterEncoding("UTF-8");
	try{
		String isbn = DB.getIsbnFromShipDateNull();
		
		int shipDateUpdate = DB.shipDateUpdateByIsbn(isbn);
		int shippingUpdate = DB.updateShippingByIsbn(isbn);
		if( shipDateUpdate+shippingUpdate == 0) out.println("<script>alert('업데이트가 완료되지 않았습니다.'); history.back();</script>");
		else {
		out.println("<script>alert('배송이 시작되었습니다.'); location.href='rootListMembers.jsp';</script>");
	
	}

	}catch (NumberFormatException e){
	
	out.println("<script>alert('제대로 입력해주세요!!'); history.back();</script>");
	}

	%>
</body>
</html>