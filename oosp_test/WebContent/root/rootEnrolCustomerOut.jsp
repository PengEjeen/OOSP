<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bookstore.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");
try{
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age"));
	String adress=request.getParameter("adress");
	String password=request.getParameter("password");

	DB.loadConnect();
	int update = DB.insertCustomer(id, name, age, adress,DB.encriptPassword(password));

	if(update==0) out.println("<script>alert('중복된 아이디가 있습니다!!'); history.back();</script>");
	else {
		out.println("<script>alert('회원 등록이 정상적으로 처리되었습니다!'); location.href='rootListMembers.jsp';</script>");
	
	}

	}catch (NumberFormatException e){
	
	out.println("<script>alert('제대로 입력해주세요!!'); history.back();</script>");
}

%>


</body>
</html>