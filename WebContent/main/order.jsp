<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kakao.bean.AddToCartBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style>
hr{
	border: solid 1px gray;
}
tr td{
	padding: 10px;
}
label{
	vertical-align: middle;
	padding-top: 7px;
	font-size: 13pt;
	font-weight: lighter;
}
textarea{
	resize: none;
}
.mainDiv {
	width: 84%;
	margin: 0 auto;
}
.rowmainDiv{
	width: 1400px;	
	margin: 0 auto;
}
.sendInfoDiv{
	padding: 10px;
}
.orderPrice{
	text-align: right;
}
.centerDiv{
	margin: 0 auto;
	width: 80%;
}
.redText{
	color: red;
}
.rightText{
	width:80%;
	text-align: right;
}
.dashedHr{
	border: dashed 1px gray;
	width: 100%;
}
.finalDiv{
	text-align:right;
	width: 80%;
	margin: 0 auto;
}
.finalButton{
	width: 100%;
}
.majorDiv{
	margin: 20px;
}
.leftDivs, .rightDivs{
	margin: 20px;
	padding: 10px;
}
.leftDivs{
	width: 600px;
	text-align: rigth;
}

.rightDivs{
	margin: 0 auto;
	width: 100%;
}
</style>
</head>
<body>
	<%
		String job = request.getParameter("job");
		ArrayList<AddToCartBean> cartList = new ArrayList<AddToCartBean>();
		int cartListPrice = 0; 
		
		if(job.equals("cartList")){
			
			String [] proname = request.getParameterValues("proname");
			String [] picture = request.getParameterValues("picture");
			String [] totalPrice = request.getParameterValues("totalPrice");
			String [] totalCount = request.getParameterValues("totalCount");
		
			int [] priceArr = new int[totalPrice.length];
			for(int i=0; i<totalPrice.length;i++){
				priceArr[i]=Integer.parseInt(totalPrice[i]);
				cartListPrice+=priceArr[i];
			}
			int [] countArr = new int[totalCount.length];
			for(int i=0; i<totalCount.length;i++){
				countArr[i]=Integer.parseInt(totalCount[i]);
			}
			
			for(int i=0 ; i < proname.length ; i++){
				AddToCartBean bean = new AddToCartBean();
				bean.setProname(proname[i]);
				bean.setPicture(picture[i]);
				bean.setTotalPrice(priceArr[i]);
				bean.setTotalCount(countArr[i]);
				cartList.add(bean);
			}
			
		}else if(job.equals("product")){
			
			String proname = request.getParameter("proname");
			String picture = request.getParameter("picture");
			String price = request.getParameter("price");
			String count = request.getParameter("count");
			
			AddToCartBean bean = new AddToCartBean();
			bean.setProname(proname);
			bean.setPicture(picture);
			bean.setTotalPrice(Integer.parseInt(price));
			bean.setTotalCount(Integer.parseInt(count));
			cartList.add(bean);
			cartListPrice = Integer.parseInt(price)*Integer.parseInt(count);
			
		}
	%>

	<jsp:include page="header.jsp" />
	<img alt="cartList" src="/KAKAO/img/orderFont.png" style="width: 100%; height: 100%;">
	<br><br><br>
	<form action="final.jsp" method="get" id="orderFrm">
		<!-- 중앙 div 태그 -->
		<div class="rowmainDiv">
	
			<!-- 머릿말 -->
			<h2>주문하기</h2>
	
			<!-- 수평선 -->
			<hr width="1350px">
			<!-- 왼쪽 div 태그 -->
			<div class="col-md-6">
			 	
					<div class="panel-heading" style="margin-left: 20px;">
						<h3>주문 및 배송정보</h3>
					</div>				
					<!-- panel body -->
					<div class="panel-body">
						
						<!-- 주문자명 form -->
						<div class="form-group sendInfoDiv leftDivs">
							<label for="inputName" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">주문자명</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="주문자명" name="name" value="">
							</div>
							<br>
						</div>
						
						<!-- 이메일 form -->
						<div class="form-group sendInfoDiv leftDivs">
							<label for="inputEmail" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">이메일</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="이메일" name="email" value="">
							</div>
							<br>
						</div>

						<!-- 휴대전화 form -->
						<div class="form-group sendInfoDiv leftDivs">
							<label for="inputTel" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">휴대전화</label>
							<div class="col-sm-10">
								<input type="tel" class="form-control" placeholder="전화번호" name="tel" value="">
							</div>
							<br>
						</div>
						
						<!-- 주소 form -->
						<div class="form-group sendInfoDiv leftDivs">
							<label for="inputAddress" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">주소</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="주소" name="address" value="">
							</div>
							<br>
						</div>
						
						<!-- 배송메모 form -->
						<div class="form-group sendInfoDiv leftDivs">
							<label for="inputcomment" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">배송메모</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="orderinfo" rows="5"  placeholder="배송메모"></textarea>
							</div>
							<br>
						</div>
					</div>
			</div>
	
	
			<!-- 오른쪽 div 태그 -->
				<div class="col-md-6">
	
					<!-- 상품리스트 div -->
						<div class="panel-heading" style="margin-left: 10px;">
							<h3>상품리스트</h3>
						</div>
						
						<div class="panel-body">
						
							<!-- 메뉴 추가 div -->
							<%
								for(AddToCartBean bean : cartList){
							%>
							<div class="form-group centerDiv rightDivs">
								<div class="row" >
									<div class="col-md-2" style="margin-right: 30px;"><a><img src="<%=bean.getPicture() %>" width="100" height="100"></a></div>
									<div class="col-md-8" style="padding: 5px;"><label ><%=bean.getProname() %></label></div>
									<div class="col-md-4" style="padding: 5px;"><label class="onePrice" >금액 : <%=NumberFormat.getInstance().format(bean.getTotalPrice() )%>원</label></div>
									<div class="col-md-2" style="padding: 5px;"><label class="oneCount" >수량 : <%=bean.getTotalCount() %>개</label></div>
									<input type="hidden" value="<%=bean.getPicture() %>" name="picture">
									<input type="hidden" value="<%=bean.getProname() %>" name="proname">
									<input type="hidden" value="<%=bean.getTotalPrice() %>" name="price">
									<input type="hidden" value="<%=bean.getTotalCount() %>" name="count">
								</div>
							</div>
							<%
								}
							%>
						
							<!-- 최종결제정보 -->
								<div class="form-group centerDiv rightDivs">
									<hr>
									<label class="col-sm-6" >장바구니합계</label>
									<div class="col-sm-6 orderPrice">
										<label id="totalPrice"><%=NumberFormat.getInstance().format(cartListPrice) %>원</label>
									</div>
									<label class="col-sm-6">배송비</label>
									<div class="col-sm-6 orderPrice">
										<label id="deliveryFee">0원</label>
									</div>
									<br><br><br><br><br>
									<label class="col-sm-6" style="font-size: 17pt;">총 결제금액</label>
									<div class="col-sm-6 orderPrice">
										<label id="deliveryFee" ></label><label style="font-size: 17pt;"><%=NumberFormat.getInstance().format(cartListPrice)%>원</label>
									</div>
									
								</div>
								
								<!-- 결제버튼 -->
								<div class="finalDiv rightDivs">
									<hr>
									<button type="button" class="btn btn-info" id = "finalButton" style="width: 300px; height: 50px; font-size: 15pt;">결제하기</button>
								</div>
							</div>
				</div>
			</div>
	</form>
<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
	$(function(){
		
		$("button#finalButton").click(function(){
			if($("div.col-sm-10 input.form-control").val()==''){
				alert('배송정보를 모두 기입해주세요');
			}else{
				$("form#orderFrm").submit();
			}
		});
		
		
	});
</script>
</html>