<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 책 구매</title>
<style type="text/css">
</style>
</head>
<body>
<h1 style="text-align: center;">도서 구매 정보 입력</h1> <hr>
<form action="rootBuyBookOut.jsp">
<table border="1" align="center" cellpadding="20" cellspacing="20">
	<tr>
	    <td>isbn</td>
	    <td><input type="text" name="isbn"></td>
	</tr>	
	<tr>
	    <td>책 이름</td>
	    <td><input type="text" name="bname"></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
		<td>출판사</td>
		<td><input type="text" name="publisher"></td>
	</tr>
	<tr>
		<td>카테고리 (국내도서, 해외도서)</td>
		<td><input type="text" name="category"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" name="price"></td>
	</tr>
	<tr>
		<td>이미지 경로</td>
		<td><input type="text" name="imgpath"></td>
	</tr>
	<tr>
		<td>책 세부정보</td>
		<td><input type="text" name="detail"></td>
	</tr>
	<tr style="text-align: center;">
		<td colspan="2"><input type="submit" value="등록">&emsp;&emsp; <input type="reset" value="초기화"></td>
	</tr>
    </table>
</form>
</body>
</html>