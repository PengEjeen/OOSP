<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.sql.*,bookstore.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 조회 화면</title>
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
.CustomerInf{
position:relative;
left:28vw;
bottom:30vh;
}
table{
border-collapse: collapse;
}
</style>
</head>
<body>
<% DB.loadConnect(); %>
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
<div class="CustomerInf">
회원정보관리 > 회원정보수정<br>
●회원정보확인 <br><br>
<span style="color: green"><%=DB.getNameById((String)session.getAttribute("userId")) %></span>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.
<table border="1" cellpadding="10" cellspacing="10">
	<tr>
	    <td style="background-color: lightgray">아이디</td>
	    <td><%=session.getAttribute("userId") %></td>
	</tr>
	<tr>
	    <td style="background-color: lightgray">비밀번호</td>
	    <td>
	    	<form action="CustomerCheck.jsp">
	    		<input type="password" name="password"><button type="submit">확인</button>
	    	</form>
	    </td>
	</tr>
</table>
</div>

</body>
</html>