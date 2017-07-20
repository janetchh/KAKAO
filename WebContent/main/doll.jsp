<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
div#outDiv {
	width: 100%;
}

div.maindiv {
	margin: 50px 200px 50px 200px;
	margin-bottom: 100px; 
}

div.gallery {
	margin: 30px;
	padding: 10px;
	float: left;
	width: 300px;
	height: 350px;
}

div.gallery:hover {
	border: 3px solid #5bc0de;
}

div.gallery img {
	width: 100%;
	height: auto;
}

div.desc {
	padding: 2px;
	text-align: center;
}

</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	$(function() {

	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<img alt="dollmain" src="/KAKAO2/img/dollmainFont.jpg" style="width: 100%; height: 100%;">
	<div id="outDiv">
		<div class="maindiv" align="center">
				<c:forEach var="i" items="${productList}">
						<div class="gallery" style="height: 100%;">
							<a href="info.do?cmd=productInfo&prono=${i.prono}"> <img src="/KAKAO2/img/doll/25_35cm/${i.mainimg}" alt="${i.proname}" width="600" height="400" >
							<label style="color: #316a7b; padding-top: 10px; padding-bottom: 5px;">${i.proname}</label><br>
							<label style="color: #316a7b; padding-bottom: 5px;">${i.price}</label><br>
							</a>
							<a href="cartList.do?cmd=cartList&prono=${i.prono}"><button type="button" class="btn btn-info">장바구니</button></a>
							<a href=""><button type="button" class="btn btn-info">주문하기</button></a>						
						</div>
				</c:forEach>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>