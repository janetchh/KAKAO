<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("button#cart").click(function(){
			//alert($("input#count").val());
			$("form#cartFrm").submit();
		})
	});
</script>
</head>
<body>
  <jsp:include page="header.jsp" />
	  <div class="mainDiv">
		<div id="contentsWrap" class="contentsWrap">
				<div class="contents">
					<div class="infoDiv" align="center" style="width: 100%; margin: 0 auto; padding: 10px;">
						<h2 class="title" style="padding: 10px;">${productInfo.proname}</h2>
						<div><img src="/KAKAO2/img/doll/25_35cm/${productInfo.mainimg}" width="60%" style="margin-top: 10px;"></div>
						<h4 style="padding-top: 20px; margin-bottom:0; color: #999999;">${productInfo.type} / ${productInfo.subtype}</h4>
						<h2 class="title" style="padding-bottom: 10px; margin-top: 5px; ">${productInfo.proname}</h2>
						<h2 style="padding-bottom: 10px; margin-top: 3px;">${productInfo.price}원</h2>
						
					<form action="cartList.do?cmd=cartList" method="post" id="cartFrm">
						<div class="middleDiv" align="right" style="width: 60%; margin: 0 auto; margin-top:10px; padding: 10px;">
							<div id="buttonContainer" >
							  <input type="number" id="count" name="count" value="1" step="1" min="1" max="10" style="text-align: center; height: 33px; " >
							  <input type="hidden" id="prono" name="prono" value="${productInfo.prono}">
							  <button type="button" id="cart" class="btn btn-info">장바구니</button>
							 <%--  <a href="cartList.do?cmd=cartList&prono=${productInfo.prono}"><button type="button" class="btn btn-info">장바구니</button></a> --%>
							  <button type="button"  class="btn btn-info">주문하기</button>
							</div>
						</div>
					</form>
					
						<hr style="height: 1px;">
						<h4 style="padding: 20px;  width: 50%; color:#999999; ">${productInfo.info}</h4>
						<img alt="" src="/KAKAO2/img/doll/25_35cm/${productInfo.detailimg1}" width="60%" style="margin-top: 10px;">
						<img alt="" src="/KAKAO2/img/doll/25_35cm/${productInfo.detailimg2}" width="60%" style="margin-top: 10px;">
						<c:if test="${productInfo.datailimg3 ne null}">
							<img alt="" src="/KAKAO2/img/doll/25_35cm/${productInfo.datailimg3}" width="60%" style="margin-top: 10px;">
						</c:if>
						<%-- <h4 style="padding: 20px; width: 50%; color:#999999; ">${productInfo.notice}</h4> --%>
					</div>
				<!-- 실선 <hr style="height: 1px;"> -->
				</div>
			</div>
	</div>  
  <jsp:include page="footer.jsp" />
</body>
</html>