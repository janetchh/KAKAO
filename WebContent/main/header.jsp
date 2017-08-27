<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/Baegopang/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
html {
	margin: 0 auto;
}

header {
	padding: 1em;
	border: 1px;
	border-color: black;
	color: black;
	background-color: white;
	clear: left;
	text-align: center;
	margin: auto;
	margin-bottom: 5px;
	width: 100%;
	position: relative;
	z-index: 2;
}

body {
	position: relative;
	z-index: 1;
}

#mainTitle {
	margin-bottom: 5px;
}

#category {
	margin-bottom: 5px;
}

#mainTitle img {
	width: 400px;
	height: 190px;
}

#headerContainer {
	margin: auto;
}

#searchContainer {
	margin: o auto;
	text-align: center;
}

#searchWindow {
	width: 300px;
	height: 28px;
	margin: 0 auto;
}
</style>
<style>
.dropbtn {
	background-color: white;
	color: black;
	padding: 16px;
	font-size: 22px;
	border: none;
	cursor: pointer;
	font-weight: bold;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #5bc0de;
	min-width: 120px;
	/*  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1; */
}

.dropdown-content a {
	color: white;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: center;
	font-size: 20px;
}

.dropdown-content a:hover {
	background-color: white;
	color: #5bc0de;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: white;
}

.loginImg {
	width: 100%;
	height: 60px;
	background-image: url(/KAKAO/img/login.png);
}
</style>
<script type="text/javascript">
	$(function() {
		if ($("input.id").val() == '') {
			$("div.loginImg").hide();
		} else {
			$("div.loginImg").show();
		}

	});
</script>
<header>
	<%
		response.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("id");
	%>
	<!--로그인성공시  -->
	<%
		if (id != null) {
	%>
	<div class="loginImg" style="width: 100%;">
		<br> <font class="title" size="4" style="color: white; padding-right: 250px;"><%=id%>님 환영합니다:)</font>
		<input type="hidden" class="id" value="<%=id%>">
	</div>
	<%
		}
	%>
	<!-- 카테고리 -->
	<div id="headerContainer">
		<div id="mainTitle" align="center">
			<a href="/KAKAO/main/main.jsp"> <img src="/KAKAO/img/logo/mainlogo.jpg" >
			</a>
		</div>

		<div class="dropdown">
			<button class="dropbtn">캐릭터</button>
			<div class="dropdown-content">
				<a href="/KAKAO/characters/ryan.jsp">라이언</a> 
				<a href="/KAKAO/characters/muzi.jsp">무지</a> 
				<a href="/KAKAO/characters/apeach.jsp">어피치</a> 
				<a href="/KAKAO/characters/frodo.jsp">프로도</a> 
				<a href="/KAKAO/characters/neo.jsp">네오</a> 
				<a href="/KAKAO/characters/tube.jsp">튜브</a> 
				<a href="/KAKAO/characters/jayG.jsp">제이지</a>
				<a href="/KAKAO/characters/conn.jsp">콘</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">카테고리</button>
			<div class="dropdown-content">
				<a href="/KAKAO/category/doll.jsp">인형</a> 
				<a href="/KAKAO/category/living.jsp">리빙</a>
				<a href="/KAKAO/category/accessory.jsp">잡화</a> 
				<a href="/KAKAO/category/stationery.jsp">문구</a> 
				<a href="/KAKAO/category/electronic.jsp">생활테크</a> 
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">마이페이지</button>
			<div class="dropdown-content">
			<%
			if(id==null){
			%>
				<a href="/KAKAO/main/login.jsp">로그인</a>
				<a href="/KAKAO/main/login.jsp?state=idNull">장바구니</a>
				<a href="/KAKAO/main/login.jsp?state=idNull">주문내역</a> 
				<a href="/KAKAO/main/login.jsp?state=idNull">찜</a> 
				<a href="/KAKAO/main/login.jsp?state=idNull">1:1문의</a> 
			<%
			}else if(id!=null){
			%>
				<a href="/KAKAO/main/cartList.jsp?job=direct">장바구니</a>
				<a href="/KAKAO/main/orderList.jsp">주문내역</a> 
				<a href="/KAKAO/main/wishList.jsp">찜</a> 
				<a href="#">1:1문의</a> 
				<a href="/KAKAO/main/loginProcess.jsp?state=logout" id="logout">로그아웃</a>
			<%
			}
			%>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">고객센터</button>
			<div class="dropdown-content">
				<a href="#">공지사항</a> <a href="#">FAQ</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">매장안내</button>

		</div>

		<div id="searchContainer" align="center">
			<table align="center">
				<tr>
					<td><input type="text" id="searchWindow" class="form-control" placeholder="상품검색"></td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td><a href="#" class="btn btn-primary btn-info"><span class="glyphicon glyphicon-search"></span></a></td>
				</tr>
			</table>
		</div>
	</div>
</header>