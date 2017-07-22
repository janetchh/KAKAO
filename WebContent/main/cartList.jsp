<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kakao.dao.ProductDao"%>
<%@page import="kakao.bean.ProductBean"%>
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
		  alert($("button#mod").parents().prev().prev().find("label.priceLabel").text());
		 /*  price-=$(this).siblings(".totalPrice").val();
		  $(this).siblings(".totalPrice").val($(this).siblings(".price").val()*$(this).siblings(".count").val());
		  price+=eval($(this).siblings(".totalPrice").val());
		  $("label.cartTotalPrice").text(price); */
	  }); 
	  
	  $("label.cartTotalPrice").text(price);
  });
</script>
<style type="text/css">
	

</style>
</head>
<body>
	<%
		String prono = request.getParameter("prono");
		int count = Integer.parseInt(request.getParameter("count"));	
	
		ProductBean bean = new ProductBean();
		ProductDao dao = new ProductDao();
			
		ArrayList<ProductBean> cartList = null;
		boolean state = false;
		
		if(prono!=null){
			bean = (ProductBean)dao.selectOne(prono);
			bean.setCount(count);
			cartList = (ArrayList<ProductBean>)request.getSession().getAttribute("cartList");
		}
		
		if(cartList==null){
			cartList = new ArrayList<ProductBean>();
		}
		
		for(int i=0;i<cartList.size();i++){
			if(cartList.get(i).getProno().equals(prono)){
				state=true;
			}
		}
		
		if(!state){
			cartList.add(bean);
		}
		
		session.setAttribute("cartList", cartList);
		
	 
	%>

  <jsp:include page="header.jsp" />
  	<img alt="cartList" src="/KAKAO/img/cartFont.jpg" style="width: 100%; height: 100%;">
     <div class="wrap">
    	<h2  align="left" style="margin:50px 0 50px 380px ;">�� <%=cartList.size() %>���� ��ǰ�� ��ȸ�Ǿ����ϴ�.</h2>
    	
    	<%
    		for(ProductBean productBean : cartList){
    	%>
    	
    	
    	<div class="mainDiv" style="width:60%; padding: 10px; margin: 0 auto; " >
    	<table>
    		<tr>
    		<td>
    		<a><img src="/KAKAO/img/doll/<%=productBean.getSubtype()%>/<%=productBean.getMainimg() %>" width="200" height="200" style="padding-right: 20px;"></a></td>
    		<td style="width: 520px;"> <label style="font-size: 20pt; font-weight:normal;  padding-left: 30px; "> <%=productBean.getProname() %> </label></td>
	    	<td> �ݾ� : <label class=" " style="font-size: 13pt; font-weight:normal; margin-right: 10px;"><%=productBean.getPrice()*productBean.getCount() %></label>��
	    	<td><label class="countLabel" style="font-size: 13pt; font-weight:normal; margin-right: 10px;"> 
	    			���� : <input type="number" id="count" value="<%=productBean.getCount() %>" step="1" min="1" max="10" style="text-align: center;  width: 70px;"></label> </td>
	    		<input type="hidden" class="price" value="<%=productBean.getPrice()%>">
	    		<input type="hidden" class="totalPrice" > 
	    	<!--���������� ���� ���������� �ǵ��ƿ��� �� �����ϱ� -->
	    	<td><button type="button" id="mod" class="btn btn-info" style="margin-bottom: 5px; margin-right: 10px;">����</button> </td>
	    	<td><a href="deleteCart.do?cmd=deleteCart&prono=${i.prono}"><button type="button" class="btn btn-info" style="margin-bottom: 5px;  margin-right: 10px;">����</button></a></td>
    		</tr>
    	</table>
    	</div>
    		<hr>
    	
    	
    	
    	<%-- <div class="mainDiv" style="width:60%; padding: 10px; margin: 0 auto; " >
    		<a><img src="/KAKAO/img/doll/<%=productBean.getSubtype()%>/<%=productBean.getMainimg() %>" width="200" height="200" style="padding-right: 20px;"></a>
    			<span style="font-size: 18pt; padding-left: 30px; padding-right: 300px;" > <%=productBean.getProname() %> </span>
    			<div  align="right" >
	    			�ݾ� : <label class="priceLabel" style="font-weight: light;"><%=productBean.getPrice() %></label>��
	    			���� : <input type="number" class="count" value="" step="1" min="1" max="10" style="text-align: center;  width: 70px;">
	    				 <input type="hidden" class="price" value="">
	    				 <input type="hidden" class="totalPrice">
	    				 <!--���������� ���� ���������� �ǵ��ƿ��� �� �����ϱ� -->
	    			     <button type="button" id="mod" class="btn btn-info">����</button>
	    			<span style="padding-left: 10px; padding-right: 20px;"><a href="deleteCart.do?cmd=deleteCart&prono=${i.prono}"><button type="button" class="btn btn-info">����</button></a></span>
    			</div>
    		<hr>
    	</div> --%>
    	<%
    		}
    	%>
    </div> -
    <div class="priceDiv" style="width:59%; margin: 0 auto;">
    	<h2 style="padding: 20px;" align="left">��ٱ��� �հ�</h2>
    	<div style="width: 100%" align="right"><p style="padding: 20px; font-size: 14pt; font-weight: lighter;">���հ�ݾ� &emsp; <label class="cartTotalPrice" style="font-size: 14pt; font-weight: bold;"></label>��</p></div> 
    	<hr style="border-color: #717070;">
    </div>
  <jsp:include page="footer.jsp" />
</body>
</html>