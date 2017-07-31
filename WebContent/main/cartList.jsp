<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kakao.dao.ProductDao"%>
<%@page import="kakao.bean.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		var price = 0;
		
		/* 총합계금액  */
		$("label.onePrice").each(function() {
			$(this).siblings(".totalPrice").val($(this).text())
			price += eval($(this).siblings(".totalPrice").val());
			$("label.cartTotalPrice").text(price);
		});

		/* 변경버튼 클릭시 금액 및 총합계금액 수정 */
		$("button#mod").click(function() {
				$(this).parents().prev().prev().children().eq(0).text($(this).parents().prev().children().eq(0).find("input#count").val()* $(this).siblings(".price").val());
				$(this).siblings(".totalPrice").val($(this).parents().prev().prev().children().eq(0).text());
					
					$("label.onePrice").each(function() {
						$(this).siblings(".totalPrice").val($(this).text());
						price += eval($(this).siblings(".totalPrice").val());
						$("label.cartTotalPrice").text(price);
					});
					price = 0;
		});

	});
</script>
<style type="text/css">
</style>
</head>
<body>
	<%
		response.setCharacterEncoding("UTF-8");
		String prono = request.getParameter("prono");
		String job = request.getParameter("job");
		String count = request.getParameter("count");

		ProductBean bean = new ProductBean();
		ProductDao dao = new ProductDao();

		ArrayList<ProductBean> cartList = null;
		boolean state = false;
		
		/* 장바구니 추가 */
		if(job.equals("add")){
			if (prono != null) {
				bean = (ProductBean) dao.selectOne(prono);
				bean.setCount(Integer.parseInt(count));
				cartList = (ArrayList<ProductBean>) request.getSession().getAttribute("cartList");
			}
			if (cartList == null) {
				cartList = new ArrayList<ProductBean>();
			}
			for (int i = 0; i < cartList.size(); i++) {
				if (cartList.get(i).getProno().equals(prono)) {
					state = true;
				}
			}
	
			if (!state) {
				cartList.add(bean);
			}
			session.setAttribute("cartList", cartList);
			
		/* 장바구니 삭제  */
		}else if(job.equals("del")){
			cartList = (ArrayList<ProductBean>) request.getSession().getAttribute("cartList");
			for (int i = 0; i < cartList.size(); i++) {
				if (cartList.get(i).getProno().equals(prono)) {
					cartList.remove(i);
				}
			}
			session.setAttribute("cartList", cartList);
		}
		
	%>

	<jsp:include page="header.jsp" />
	
	<!-- 장바구니IMG  -->
	<img alt="cartList" src="/KAKAO/img/cartFont.jpg" style="width: 100%; height: 100%;">
	
	
	<!-- 장바구니 목록리스트  -->
	<div class="wrap">
		<h2 align="left" style="margin: 50px 0 50px 380px;">
			<%
			if(cartList.size()==0){
				%>
				장바구니에 담긴 상품이 없습니다! 상품을 담아주세요:)
				<%
			}else{
				%>
				총 <%=cartList.size()%>개의 상품이 조회되었습니다.
				<%
			}
			%>
			
		</h2>

		<%
			for (ProductBean productBean : cartList) {
		%>


		<div class="mainDiv"
			style="width: 60%; padding: 10px; margin: 0 auto;">
			<table>
				<tr>
					<td><a><img src="/KAKAO/img/<%=productBean.getType() %>/<%=productBean.getSubtype()%>/<%=productBean.getMainimg()%>" width="200" height="200" style="padding-right: 20px;"></a></td>
					<td style="width: 520px;">
						<label style="font-size: 20pt; font-weight: normal; padding-left: 30px;"><%=productBean.getProname()%></label></td>
					<td style="font-size: 13pt; font-weight: normal;">
						금액 : <label class="onePrice" style="font-size: 13pt; font-weight: normal; margin-right: 10px;"><%=productBean.getPrice() * productBean.getCount()%></label>원
							 <input type="hidden" class="totalPrice"></td>
					<td><label class="countLabel" style="font-size: 13pt; font-weight: normal; margin-left: 10px; margin-right: 10px;">
						수량 : <input type="number" id="count" value="<%=productBean.getCount()%>" step="1" min="1" max="10" style="text-align: center; width: 70px;"></label></td>

					<!--삭제누르면 이전 수량값으로 되돌아오는 것 수정하기 -->
					<td><button type="button" id="mod" class="btn btn-info" style="margin-bottom: 5px; margin-right: 10px;">변경</button>
					    <input type="hidden" class="price" value="<%=productBean.getPrice()%>">
					    <input type="hidden" class="totalPrice"></td>
					<td><a href="cartList.jsp?job=del&prono=<%=productBean.getProno()%>">
						<button type="button" class="btn btn-info" style="margin-bottom: 5px; margin-right: 10px;">삭제</button></a></td>
				</tr>
			</table>
		</div>
		<hr>

		<%
			}
		%>
	</div>
	
	
	<!--장바구니 합계  -->
	1<div class="priceDiv" style="width: 59%; margin: 0 auto;">
		<h2 style="padding: 20px;" align="left">장바구니 합계</h2>
		<div style="width: 100%" align="right">
			<p style="padding: 20px; font-size: 14pt; font-weight: lighter;">
				총합계금액 &emsp; <label class="cartTotalPrice"
					style="font-size: 14pt; font-weight: bold;"></label>원
			</p>
		</div>
		<hr style="border-color: #717070;">
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>