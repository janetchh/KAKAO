<%@page import="java.text.NumberFormat"%>
<%@page import="kakao.bean.ProductOrderBean"%>
<%@page import="kakao.dao.MypageDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function(){
		$("tr.orderDetail").hide();
		
		$("tr.orderTr").click(function(){
			$(this).next().toggle();
			$(this).next().next().toggle();
		});
		
	});
</script>
<style>
table.orderTb {
    border-collapse: collapse;
    width: 70%;
}
table.orderTb th,table.orderTb td {
  	font-size : 15pt;
    padding: 10px;
    border-bottom: 1px solid #ddd;
    text-align: center;
}
tr:hover{
	background-color:#FAE1E5
}
</style>
<body>
	<%
		MypageDao dao = new MypageDao();
		String id = (String)session.getAttribute("id");
	%>

	<jsp:include page="header.jsp"/>

		<br><img src="/KAKAO/img/orderlistFont.png" style="width: 100%; height: 100%;"><br><br><br>

	<div class="centerTable" align="center">
		<table class="orderTb" >
		  <tr style="background-color: #FA6176; color: white;">
		    <th style="width: 250px;">주문번호</th>
		    <th style="width: 250px;">상품이미지</th>
		    <th style="width: 500px;">상품명</th>
		    <th style="width: 100px;">개수</th>
		    <th style="width: 250px;">총 가격</th>
		  </tr>
		  
		<%
			for(ProductOrderBean bean : dao.orderSelect(id)){
		%>
		  <tr class="orderTr">
		    <td style="width: 250px;"><%=bean.getOrdernumber() %></td>
		    <td style="width: 250px;"><img src="<%=bean.getPicture()%>" width="100" height="100"></td>
		    <td style="width: 500px;"><%=bean.getProname() %></td>
		    <td style="width: 100px;"><%=bean.getCount() %>개</td>
		    <td style="width: 250px;"><%=NumberFormat.getInstance().format(bean.getPrice()*bean.getCount())%>원</td>
		  </tr>
		  <tr class="orderDetail" style="background-color: #FA6176; color: white;">
		  	<th style="width: 250px;">주문자명</th>
		  	<th style="width: 250px;">이메일</th>
		  	<th style="width: 500px;">주소</th>
		  	<th style="width: 100px;">전화번호</th>
		  	<th style="width: 250px;">배송메모</th>
		  </tr>
		  <tr class="orderDetail">
		  	<td style="width: 250px;"><%=bean.getName() %></td>
		  	<td style="width: 250px;"><%=bean.getEmail() %></td>
		  	<td style="width: 500px;"><%=bean.getAddress() %></td>
		  	<td style="width: 100px;"><%=bean.getTel() %></td>
		  	<td style="width: 250px;"><%=bean.getOrderinfo() %></td>
		  </tr>
		<%
			}
		%>
		</table>
	</div>

	<jsp:include page="footer.jsp"/>
</body>
</html>