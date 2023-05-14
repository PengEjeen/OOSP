<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 화면</title>
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
width: 20vw;
position: relative;
left: 28vw;
bottom:30vh;
}
</style>
</head>
<body>
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
	●비밀번호 수정
	<form action="ChangePasswordOut.jsp">
	<table  align="center" cellspacing="10">
	<tr>
	   	<td><input style="font-size:3vh;" type="password" name="curpw" placeholder="현재 비밀번호"></td>
	</tr>
	<tr>
	    <td><input style="font-size:3vh;" type="password" name="newpw" placeholder="신규 비밀번호"></td>
	</tr>
	<tr>
		<td><input style="font-size:3vh;" type="password" name="newpw2" placeholder="신규 비밀번호 재확인"></td>
	</tr>
	<tr>
		<td style="background-color: lightgray"><button style="width:100%;" type="submit">확인</button></td>
	</tr>
    </table>
    </form>
</div>
</body>
</html>