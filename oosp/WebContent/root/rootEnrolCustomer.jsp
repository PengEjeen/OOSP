<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>rootEnrolCustomer</title>
</head>
<body>
<h1 style="text-align: center;">회원정보 입력</h1> <hr>
<form action="rootEnrolCustomerOut.jsp">
<table border="1" align="center" cellpadding="10" cellspacing="10">
	<tr>
	    <td>아이디</td>
	    <td><input type="text" name="id"></td>
	</tr>
	<tr>
	    <td>비밀번호</td>
	    <td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="age"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" name="adress"></td>
	</tr>
	<tr style="text-align: center;">
		<td colspan="2"><input type="submit" value="가입">&emsp;&emsp; <input type="reset" value="초기화"></td>
	</tr>
    </table>
</form>
</body>
</html>