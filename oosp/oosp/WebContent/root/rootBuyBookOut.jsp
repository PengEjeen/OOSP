<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bookstore.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rootBuyBookOut</title>
<style>

</style>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");
	try {
		int isbn = Integer.parseInt(request.getParameter("isbn"));
		String bname = request.getParameter("bname");
		String writer = request.getParameter("writer");
		String publisher = request.getParameter("publisher");
		String category = request.getParameter("category");
		int price = Integer.parseInt(request.getParameter("price"));
		String imgpath = request.getParameter("imgpath");
		String detail = request.getParameter("detail");
		
		DB.loadConnect();
		int update = DB.insertBook(isbn, bname, writer, publisher, category, price, imgpath, detail);
		
		if(update==0) out.println("<script>alert('중복된 도서가 있습니다!!'); history.back();</script>");
		else {
			out.println("<script>alert('도서추가가 정상적으로 처리되었습니다!'); location.href='rootListBooks.jsp';</script>");
			
	}
	
	}catch (NumberFormatException e){
		
		out.println("<script>alert('제대로 입력해주세요!!'); history.back();</script>");
	}

%>


</body>
</html>