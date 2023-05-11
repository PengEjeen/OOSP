<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나인문고 관리자 페이지</title>
<style>
   .menu {
      float:center;
      width:100%;
      height:17%;
    }
    .Content {
      float:center;
      width:100%;
      height:500px;
    }
  </style>
</head>
<body>
  <iframe class="menu" src=rootMenu.html name=iframerootMenu></iframe>
  <iframe class="Content" src="contentForConnection.jsp" name=iframeContent></iframe>
</body>
</html>