<%@page import="oosp.DB"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>장바구니</title>
    <style>
        .upside {
            position: relative;
            left: 200px;
            bottom: 100px;
        }
        .productimg {
            position: relative;
            left: 200px;
            top: 100px;
        }
    </style>
</head>
<body>
<%@ page import="oosp.DB" %>
<%@ include file="LogoAndSearchBar.jsp" %>
<hr class="one" width="100%">

<form action="BuyWishList.jsp" method="post">
<%
    DB.loadConnect();
    ArrayList<String> productlist = (ArrayList<String>) session.getAttribute("productlist");
    if (productlist != null) {
        for (int i = 0; i < productlist.size(); i++) {
            String productnumber = productlist.get(i);
            String productname = DB.getProductnameByProductnumber(productnumber);
            String price = DB.getPriceByProductnumber(productnumber);
%>
                <div class="productimg">
                <input type="checkbox" name="buylist" value="<%= productnumber %>">
                    <img style="width: 15%; height: 15%;" src="<%= "" %>">
                    <div class="upside">
                        <%= productname %><br>
                        <%= price %><br>
                        <button type="button" onclick="viewDetail('<%= productnumber %>')">상세정보 보기</button>
                        <hr class="one" width="100%">
                    </div>
                </div>
<%
        }
    }
%>
<div style="position: relative; left: 100px; top: 100px;">
    <input type="submit" value="구매">
</div>
    </form>

    <script type="text/javascript">
        function viewDetail(productnumber) {
            var form = document.createElement('form');
            form.method = 'get';
            form.action = 'ProductDetail.jsp';
            var input1 = document.createElement('input');
            input1.setAttribute("name", "productnumber");
            input1.setAttribute("value", productnumber);
            form.appendChild(input1);
            document.body.appendChild(form);
            form.submit();
        }
    </script>
</body>
</html>