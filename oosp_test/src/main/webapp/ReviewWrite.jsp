<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,oosp.*"%>
 <% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 작성</title>

</head>


<body>
<form action = "ReviewWriteAction.jsp" method="post">
<div>별점
<select name="rating">
<option value ="">선택</option>
<option value ="5">5</option>
<option value ="4">4</option>
<option value ="3">3</option>
<option value ="2">2</option>
<option value ="1">1</option>
</select>
</div>
<textarea name ="review" rows="2" cols="100" wrap = "virtual"></textarea>
<input type ="submit" value ="작성">
</form>

</body>
</html>