<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bookstore.DB"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="review" class="bookstore.ReviewWrite" />
<jsp:setProperty name="review" property="review" />
<jsp:setProperty name="review" property="rating" />
<jsp:setProperty name="review" property="buyingno" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 작성</title>
</head>
<body>
<%
DB.loadConnect();
if(review.getReview() == null || review.getRating() == null){ // 리뷰나 평점이 작성되지 않으면 입력 불가능
	out.println("<script>alert('작성이 되지 않았습니다.'); history.back();</script>");
}else{
	int result = DB.inputReview(review.getRating(),review.getReview(),review.getBuyingno());
	if(result == -1){
		out.println("<script>alert('리뷰 작성에 실패했습니다.'); history.back();</script>");
	}
	else{
		out.println("<script>alert('리뷰를 작성했습니다.'); history.back();</script>");
	}
}
%>
</body>
</html>