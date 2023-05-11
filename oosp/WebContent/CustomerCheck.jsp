<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bookstore.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.Menu{
border:1px solid green;
max-width:20vw;
min-width:100px;
font-size:1.3vw;
max-height:50vh;
margin-left:5vw;
}
.MenuName{
background-color:white;
color: green;
font-size:2vw;
position:relative;
bottom:1.5vw;
left:6vw;
width:40%;
font-weight:bold;
}

.green{
color:green;
position:relative;
left:1.5vw;
}

.content{
list-style-type:"\2d";
}
.CustomerInformation{
width: 50vw;
position: relative;
left: 28vw;
bottom:30vh;
}
table{
border-collapse: collapse;
}
</style>

</head>
<body>
<%
DB.loadConnect();
request.setCharacterEncoding("UTF-8");
String id=(String)session.getAttribute("userId");
String enscriptpassword=DB.encriptPassword(request.getParameter("password"));
if(!enscriptpassword.equals(DB.getPasswordById(id))){
	out.println("<script>alert('비밀번호가 틀렷습니다!');  history.back()</script>");
}

%>
<%@include file="LogoAndSearchBar.jsp" %>
<!--My나인 메뉴 부분 -->
<div class="Menu">
	<div class="MenuName">MY나인</div>
	<ul class="green">
		<li>일반상품 주문관리
			<ul class="content">
				<li><a href="OrderSearch.jsp">주문/배송 조회</a></li>
				<li><a href="OrderCancel.jsp">취소 조회</a></li>
			</ul>
		</li>
		<br><br><br>
		<li>회원정보관리
			<ul class="content">
				<li><a href="CustomerInf.jsp">회원정보수정</a></li>
				<li><a href="ChangePassword.jsp">비밀번호변경</a></li>
			</ul>
		</li>
	</ul>
</div>
<div class="CustomerInformation">
	회원정보관리 > 회원정보수정 <br>
	●내 정보
	<table border="1" align="center" cellpadding="10" cellspacing="10">
	<tr>
	    <td style="background-color: lightgray">아이디</td>
	    <td><%= session.getAttribute("userId") %></td>
	</tr>
	<tr>
	    <td style="background-color: lightgray">비밀번호</td>
	    <td><%= session.getAttribute("password") %></td>
	</tr>
	<tr>
		<td style="background-color: lightgray">이름</td>
		<td><%= DB.getNameById((String)session.getAttribute("userId")) %></td>
	</tr>
	<tr>
		<td style="background-color: lightgray">나이</td>
		<td><%= DB.getAgeById((String)session.getAttribute("userId")) %></td>
	</tr>
	<tr>
		<td style="background-color: lightgray">주소</td>
		<td><%= DB.getAddressById((String)session.getAttribute("userId")) %></td>
	</tr>
	<tr>
		<td style="background-color: lightgray">구입횟수</td>
		<td><%= DB.getBuyCntById((String)session.getAttribute("userId")) %></td>
	</tr>
	<tr>
		<td style="background-color: lightgray">총 구매가격</td>
		<td><%= DB.getBuySumById((String)session.getAttribute("userId")) %></td>
	</tr>
    </table>
</div>
</body>
</html>