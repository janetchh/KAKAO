<%@page import="kakao.dao.MypageDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kakao.bean.ProductOrderBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />

		<img alt="cartList" src="/KAKAO/img/final.png" style="width: 70%; height: 80%; margin-left: 300px; " >
	
		<%
			MypageDao dao = new MypageDao();
		
			/* 주문자정보  */	
			String id = (String)session.getAttribute("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String address = request.getParameter("address");
			String orderinfo = request.getParameter("orderinfo");
			
			/* 상품정보 */
			
			String [] picture = request.getParameterValues("picture");
			String [] proname = request.getParameterValues("proname");
			String [] price = request.getParameterValues("price");
			String [] count = request.getParameterValues("count");
			
			long time = System.currentTimeMillis(); 

			SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddhhmmss");

			String currentTime = dayTime.format(new Date(time));
			
			for(int i = 0 ; i<picture.length; i++){
				ProductOrderBean bean = new ProductOrderBean();
				bean.setOrdernumber(currentTime+id+"-"+(i+1));
				bean.setId(id);
				bean.setName(name);
				bean.setEmail(email);
				bean.setTel(tel);
				bean.setAddress(address);
				bean.setOrderinfo(orderinfo);
				bean.setPicture(picture[i]);
				bean.setProname(proname[i]);
				bean.setPrice(Integer.parseInt(price[i]));
				bean.setCount(Integer.parseInt(count[i]));
				bean.setOrdertime(currentTime);
				dao.orderInsert(bean);
			}
			
			
		%>
<jsp:include page="footer.jsp" />
</body>
</html>