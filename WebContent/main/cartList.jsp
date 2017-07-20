<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
  $(function(){
	  var price=0;
	  $("input.price").each(function(){
		  $(this).siblings(".totalPrice").val($(this).val()*$(this).siblings(".count").val());
		  price+=eval($(this).siblings(".totalPrice").val());
	  });
	  
	  
	  $("button#mod").click(function(){
		  price-=$(this).siblings(".totalPrice").val();
		  $(this).siblings(".totalPrice").val($(this).siblings(".price").val()*$(this).siblings(".count").val());
		  price+=eval($(this).siblings(".totalPrice").val());
		  $("label.cartTotalPrice").text(price);
	  }); 
	  
	  $("label.cartTotalPrice").text(price);
  });
</script>
</head>
<body>
  <jsp:include page="header.jsp" />
  
  	<img alt="cartList" src="/KAKAO2/img/cartFont.jpg" style="width: 100%; height: 100%;">
    <div class="wrap">
    	<h2 style="padding:20px 0 20px 400px;" align="left">총 ${totalcount}개의 상품이 조회되었습니다.</h2>
    	<c:forEach var="i" items="${cartList}">
    	<div class="mainDiv" style="width:60%; padding: 10px; margin: 0 auto; " >
    		<a><img src="/KAKAO2/img/doll/25_35cm/${i.mainimg}" width="200" height="200" style="padding-right: 20px;"></a>
    			<span style="font-size: 18pt; font-weight: bold; padding-left: 30px; padding-right: 300px;" > ${i.proname} </span>
    			<div style="width: 100%;" align="right" >
	    			금액 : <label class="priceLabel" style="font-weight: light;">${i.price}</label>원
	    			수량 : <input type="number" class="count" value="${i.count}" step="1" min="1" max="10" style="text-align: center;  width: 70px;">
	    				 <input type="hidden" class="price" value="${i.price}">
	    				 <input type="hidden" class="totalPrice">
	    				 <!--삭제누르면 이전 수량값으로 되돌아오는 것 수정하기 -->
	    			     <button type="button" id="mod" class="btn btn-info">수정</button>
	    			<span style="padding-left: 10px; padding-right: 20px;"><a href="deleteCart.do?cmd=deleteCart&prono=${i.prono}"><button type="button" class="btn btn-info">삭제</button></a></span>
    			</div>
    		<hr>
    	</div>
    	</c:forEach>
    </div>
    <div class="priceDiv" style="width:59%; margin: 0 auto;">
    	<h2 style="padding: 20px;" align="left">장바구니 합계</h2>
    	<div style="width: 100%" align="right"><p style="padding: 20px; font-size: 14pt; font-weight: lighter;">총합계금액 &emsp; <label class="cartTotalPrice" style="font-size: 14pt; font-weight: bold;"></label>원</p></div> 
    	<hr style="border-color: #717070;">
    </div>
  <jsp:include page="footer.jsp" />
</body>
</html>