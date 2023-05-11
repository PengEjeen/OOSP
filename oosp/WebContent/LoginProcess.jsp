<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bookstore.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
//암호화 비밀번호 (고객용)
String enscriptpassword=DB.encriptPassword(request.getParameter("password"));

session.setAttribute("password",request.getParameter("password"));

//암호화 X (관리자용)
String password=request.getParameter("password");

DB.loadConnect();
String CorrectPw = DB.getPasswordById(id);

String ManagerPw = DB.getManagerPasswordById(id);

if(password.equals(ManagerPw)){
	out.println("<script>alert('관리자 로그인이 정상적으로 처리되었습니다!');</script>");
	out.print("<script>location.href = './root/rootIndex.jsp';</script>");
}
else if(enscriptpassword.equals(CorrectPw)){
	out.println("<script>alert('로그인이 정상적으로 처리되었습니다!');</script>");
	//세션에다 userID를 저장 (로그인정보) 시간은 1시간으로 설정
	session.setAttribute("userId",id); 
	session.setMaxInactiveInterval(60*60);
	out.print("<script>location.href = 'Main.jsp';</script>");
}
else{
	out.println("<script>alert('아이디 또는 비밀번호가 틀렷습니다!!'); history.back();</script>");
}
%>

</body>
</html>