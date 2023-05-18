<%@page import="oosp.DB, java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%// 변수 선언
    String productnumber = request.getParameter("productnumber");
    DB.loadConnect();
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String uid = "root";
	String pwd = "onlyroot";
	String url = "jdbc:mysql://localhost:3306/oosp" ;
	String sql = "select isbn,customer_id,rating,review,reviewdate from buying where isbn ='"+productnumber+"'";
	String driver= "com.mysql.jdbc.Driver";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<td>구매자</td>
			<td>평점</td>
			<td>리뷰 내용</td>
			<td>작성일</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("customer_id")%></td>
			<td><%=rs.getString("rating")%></td>
			<td><%=rs.getString("review")%></td>
			<td><%=rs.getString("reviewdate")%></td>
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
</body>
</html>