<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Customer</title>
</head>
<body>
	<h1>회원 삭제</h1>
	<form action="rootDeleteCustomerOut.jsp">
		삭제할 회원 아이디 : <input type="text" name="id"><br /><br />
		<input type="submit" value="삭제">&emsp;&emsp; <input type="reset" value="초기화">
	</form>
</body>
</html>