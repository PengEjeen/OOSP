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
	String sql = "select * from customer";
	String driver= "com.mysql.jdbc.Driver";
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC를 이용한 데이터베이스 테이블 만들기</title>
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
			<td>아이디</td>
			<td>이름</td>
			<td>나이</td>
			<td>주소</td>
			<td>비밀번호</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("cname")%></td>
			<td><%=rs.getString("age")%></td>
			<td><%=rs.getString("address")%></td>
			<td><%=rs.getString("pw") %></td>
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
	
	<input type="button" onclick="location.href='rootEnrolCustomer.jsp'"> 회원 추가 </button>
	<input type="button" onclick="location.href='rootDeleteCustomer.jsp'"> 회원 삭제 </button>
	
</body>
</html>