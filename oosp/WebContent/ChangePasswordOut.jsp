<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bookstore.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% DB.loadConnect();
   request.setCharacterEncoding("UTF-8");
   //세션 아이디 가져오기
   String id =(String)session.getAttribute("userId");
   
   //세션 패스워드 가져오기
   String pw =(String)session.getAttribute("password");
   
   //입력한 현재 비밀번호 값 불러오기
   String curpw =request.getParameter("curpw");
   
   //신규 비밀번호
   String newpw =request.getParameter("newpw");
   
   //신규 비밀번호 재확인
   String newpw2 =request.getParameter("newpw2");
%>
<% 
   if(curpw.equals(pw)){
	   if(newpw.equals(newpw2)){
		   DB.ChangePasswordById(id, newpw);
		   session.setAttribute("password",newpw);
		   out.println("<script>alert('비밀번호 변경이 완료되었습니다!!'); location.href='Main.jsp';</script>");
	   }
	   else{
		   out.println("<script>alert('신규 비밀번호를 재확인을 다시 확인해주세요!!'); history.back();</script>");
	   }
   }
   else{
	   out.println("<script>alert('현재 비밀번호가 틀렸습니다!!'); history.back();</script>");
   }
%>
</body>
</html>