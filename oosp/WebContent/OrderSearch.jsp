<%@page import="bookstore.DB, java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%// 변수 선언
    String userID= (String)session.getAttribute("userId");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String uid = "root";
	String pwd = "onlyroot";
	String url = "jdbc:mysql://localhost:3306/bookstore" ;;
	String sql = "select date,isbn,price,shipping,buyingno from buying where customer_id ='"+userID+"'";
	String driver= "com.mysql.jdbc.Driver";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문/배송 조회</title>
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
.OrderList{
position:relative;
left:28vw;
bottom:30vh;
}
</style>
</head>

<body>
<% DB.loadConnect(); %>
<%@include file="LogoAndSearchBar.jsp" %>
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
<div class="OrderList">
일반상품 주문관리 > 주문/배송 조회<br>
●주문/배송 조회 <br><br>
<%
		try {
		// 데이터베이스를 접속하기 위한 드라이버 SW 로드
		Class.forName(driver);
		// 데이터베이스에 연결하는 작업 수행
		conn = DriverManager.getConnection(url, uid, pwd);
		// 쿼리를 생성할 객체 생성
		stmt = conn.createStatement();
		// 쿼리 생성
		rs = stmt.executeQuery(sql);
	%>
	<table border="1">
		<tr>
			<td>구매일</td>
			<td>책 제목</td>
			<td>가격</td>
			<td>배송 상태</td>
			<td>리뷰 작성</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("date")%></td>
			<td><%=DB.getBookNameByIsbn(rs.getString("isbn")) %></td>
			<td><%=rs.getString("price")%></td>
			<td><%=rs.getString("shipping")%></td>
			<td align = "center"><form action="ReviewWrite.jsp">
			<input type="hidden" name="buyingno" value="<%=rs.getInt("buyingno")%>">
			<input type="submit" value="작성">
			</form></td>
		</tr>
	

	<%
		}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	try {
	if (rs != null) {
		rs.close();
	}
	if (stmt != null) {
		stmt.close();
	}
	if (conn != null) {
		conn.close();
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	}
	%>
	</table>
</div>
</body>
</html>