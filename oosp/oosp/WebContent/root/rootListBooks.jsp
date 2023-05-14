<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%!// 변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String uid = "root";
	String pwd = "onlyroot";
	String url = "jdbc:mysql://localhost:3306/bookstore" ;;
	String sql = "select * from books";
	String driver= "com.mysql.jdbc.Driver";
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 리스트</title>
<style>
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
  thead tr {
    background-color: #0d47a1;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #bbdefb;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #e3f2fd;
  }
</style>
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
			<td>isbn</td>
			<td>bname</td>
			<td>writer</td>
			<td>publisher</td>
			<td>category</td>
			<td>price</td>
			<td>reviewcnt</td>
			<td>sellcnt</td>
			<td>rateavg</td>
			<td>imgpath</td>
			<td>detail</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("isbn")%></td>
			<td><%=rs.getString("bname")%></td>
			<td><%=rs.getString("writer")%></td>
			<td><%=rs.getString("publisher")%></td>
			<td><%=rs.getString("category") %></td>
			<td><%=rs.getInt("price") %></td>
			<td><%=rs.getInt("reviewcnt") %></td>
			<td><%=rs.getInt("sellcnt") %></td>
			<td><%=rs.getDouble("rateavg") %></td>
			<td><%=rs.getString("imgpath") %></td>
			<td><%=rs.getString("detail") %></td>
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
	
	<input type="button" onclick="location.href='rootBuyBook.jsp'"> 도서 추가 </button>
	<input type="button" onclick="location.href='rootDeleteBook.jsp'"> 도서 삭제 </button>
	
</body>
</html>