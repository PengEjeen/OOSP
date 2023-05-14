<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bookstore.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 도서</title>
<style>
.arrow{
position:absolute;
margin:0 10% 0 10%;
z-index : -10;
width:80%;
}
.block1{
position:absolute;
margin-top:2%;
width:30%;
height:30%;
}
.block2{
position:absolute;
margin-left:31%;
width:30%;
height:30%;
}
.block3{
position:absolute;
margin-left:62%;
margin-top:2%;
width:30%;
height:30%;
}
.blocks{
width:100%;
}
.blocks button{
width: 50%;
height:100%;
background-color:white;
cursor:pointer;
border:0;
outline:0;
}
.BookName{
color: blue;
font-size:1.3vw;
position: absolute;
right:0px;
}
.subName{
color: black;
font-size: 1vw;
font-weight: bold;
position:absolute;
bottom:100px;
right:0px;
white-space:pre-line;
overflow:hidden;
}
.detail{
position:absolute;
bottom:20px;
right:0px;
font-size:0.8vw;
}
h2{
color:green;
}
.detail > hr {
height :3px;background-color:black; width:100%;
}
.contents{
position :relative;
bottom:120%;
left:50%;
width:50%;
height:100%;
overflow: hidden;
}
</style>
</head>
<body>
<h2> 추천 도서</h2>
<% DB.loadConnect(); %>
<img class="arrow" src="./img/꺾인화살표.png">
<div class="blocks">
	<div class="block1">
		<%!String isbn1="9788965707592";%>
		<button><img style="max-width:100%; max-heigh:100%;" src="<%=DB.getImagePathByIsbn(isbn1)%>"></button>
		<div class="contents">
			<div class="BookName"><%=DB.getBookNameByIsbn(isbn1)%></div> 
			<div class="detail"><hr><%=DB.getWriterByIsbn(isbn1)%> |
			<%=DB.getPublisherByIsbn(isbn1)%></div>
		</div>
	</div>
	<div class="block2">
	<%!String isbn2="9788954654319";%>
		<button><img style="max-width:100%; max-heigh:100%;" src="<%=DB.getImagePathByIsbn(isbn2)%>"></button>
		<div class="contents">
		<div class="BookName"><%=DB.getBookNameByIsbn(isbn2)%></div>
		<div class="subName">개인주의자 문유석의 유쾌한 책 읽기</div>
		<div class="detail"><hr><%=DB.getWriterByIsbn(isbn2) %> |
		<%=DB.getPublisherByIsbn(isbn2)%></div>
		</div>
	</div>
	<div class="block3">
	<%!String isbn3="9791160560381";%>
		<button><img style="max-width:100%; max-heigh:100%;" src="<%=DB.getImagePathByIsbn(isbn3)%>"></button>
		<div class="contents">
		<div class="BookName" id="bname"><%=DB.getBookNameByIsbn(isbn3)%></div>
		<div class="subName">혐오표현은 무엇이고 왜 문제인가?</div>
		<div class="detail"><hr><%=DB.getWriterByIsbn(isbn3) %> |
		<%=DB.getPublisherByIsbn(isbn3)%></div>
		</div>
	</div>
</div>

</script>
</body>
</html>