<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬라이드 구성화면</title>
<style>
* {margin:0;padding:0;}
.section input[id*="slide"] {
	display:none;
}
.section .slidewrap{
	max-width:400px;
	margin:0 auto;
	overflow:hidden;
	background-color: gray;
}
.section .slidelist {
	white-space:nowrap;
	font-size:0;
}
.section .slidelist > li{
	display:inline-block;
	vertical-align:middle;
	width:100%;
	transition:all .5s;
}
.section .slidelist > li > a{
	display:block;
	position:relative;
}
.section .slidelist > li > a img{
	width:100%;
	height:100%;
}
.section .slidelist label {
	position:absolute;
	z-index:10;
	top:50%;
	transform:translateY(-50%);
	padding:30px;
	cursor:pointer;
}
.section .left {left:-10px;background:url('./img/left.png') center center / 100% no-repeat;}
.section .right {right:-10px;background:url('./img/right.png') center center / 100% no-repeat;}
.section input[id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
.section input[id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
.section input[id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}

/* 페이징 */
.slide-pagelist {text-align:center;padding:20px; background-color: white;}
.slide-pagelist > li {display:inline-block;vertical-align:middle;}
.slide-pagelist > li > label {display:block;padding:8px 30px;border-radius:30px;background:#ccc;margin:20px 10px;cursor:pointer;}
.section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(1) > label {background:#999;}
.section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(2) > label {background:#999;}
.section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(3) > label {background:#999;}

h3{margin-left:15%; color:lightgreen; font-size:30px;}
</style>
</head>
<body>
<h3> 오늘 나온 책</h3>
<div class="section">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">	
	<div class="slidewrap">
		<ul class="slidelist">
			<li>
				<a>
					<label for="slide03" class="left"></label>
					<img src="./img/돈의역사(소개).png">
					<label for="slide02" class="right"></label>
				</a>
			</li>
			<li>
				<a>
					<label for="slide01" class="left"></label>
					<img src="./img/윙맨리더십(소개).jpg">
					<label for="slide03" class="right"></label>
				</a>
			</li>
			<li>
				<a>
					<label for="slide02" class="left"></label>
					<img src="./img/혼자잘해주고상처받지마라(소개).jpg">
					<label for="slide01" class="right"></label>
				</a>
			</li>
		</ul>
		<!-- 페이징 -->
		<ul class="slide-pagelist">
			<li><label for="slide01"></label></li>
			<li><label for="slide02"></label></li>
			<li><label for="slide03"></label></li>
		</ul>
	</div>
</div>
</body>
</html>