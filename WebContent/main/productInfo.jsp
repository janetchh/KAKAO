<%@page import="kakao.dao.ProductDao"%>
<%@page import="kakao.bean.ProductBean"%>
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
<style type="text/css">
	div#buttonContainer button{
		margin: 1px;
	}
</style>
</head>
<body>
  <jsp:include page="header.jsp" />
  <%
  	String prono = request.getParameter("prono");
  	ProductDao dao = new ProductDao();
  	ProductBean bean = (ProductBean)dao.selectOne(prono);
  %>
  
	  <div class="mainDiv">
		<div id="contentsWrap" class="contentsWrap">
				<div class="contents">
					<div class="infoDiv" align="center" style="width: 100%; margin: 0 auto; padding: 10px;">
						<%-- <h2 class="title" style="padding: 10px;"><%=bean.getProname() %></h2> --%>
						<div><img src="/KAKAO/img/doll/<%=bean.getSubtype()%>/<%=bean.getMainimg() %>" width="60%" style="margin-top: 10px;"></div><br><br><Br>
						<%-- <h4 style="padding-top: 20px; margin-bottom:0; color: #999999;">${productInfo.type} / ${productInfo.subtype}</h4> --%>
						<h1 class="title" style="padding-bottom: 10px; margin-top: 5px; "><%=bean.getProname() %></h1>
						<h2 style="padding-bottom: 10px; margin-top: 3px;"><%=bean.getPrice() %>원</h2>
						
					<form action="cartList.jsp" method="post" id="cartFrm">
						<div class="middleDiv" align="right" style="width: 60%; margin: 0 auto; margin-top:10px; padding: 10px;">
							<div id="buttonContainer" >
							  <input type="number" id="count" name="count" value="1" step="1" min="1" max="10" style="text-align: center; height: 33px; margin-right: 2px;" >
							  <input type="hidden" id="prono" name="prono" value="<%=bean.getProno()%>">
							  <button type="button" id="" class="btn btn-info">찜</button>
							  <button type="button" id="cart" class="btn btn-info">장바구니</button>
							  <button type="button" class="btn btn-info">주문하기</button>
							  <input type="hidden" name="job" value="add">
							</div>
						</div>
					</form>
					
						<hr style="height: 1px;">
						<h4 style="padding: 20px;  width: 50%; color:#999999; "><%=bean.getInfo() %></h4>
						<img alt="" src="/KAKAO/img/doll/<%=bean.getSubtype()%>/<%=bean.getDetailimg1()%>" width="60%" style="margin-top: 10px;">
						<img alt="" src="/KAKAO/img/doll/<%=bean.getSubtype()%>/<%=bean.getDetailimg2()%>" width="60%" style="margin-top: 10px;">
						<%
						if(bean.getDetailimg3()!=null){
						%>
							<img alt="" src="/KAKAO/img/doll/<%=bean.getSubtype()%>/<%=bean.getDetailimg3() %>" width="60%" style="margin-top: 10px;">
						<%
						}
						%>
						 <h4 style="padding: 30px; width: 62%; color:#999999; line-height: 200%; "><%=bean.getNotice() %></h4> 
					</div>
				<!-- 실선 <hr style="height: 1px;"> -->
				</div>
			</div>
	</div>  
  <jsp:include page="footer.jsp" />
</body>
</html>