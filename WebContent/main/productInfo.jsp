<%@page import="java.util.HashMap"%>
<%@page import="kakao.dao.MypageDao"%>
<%@page import="kakao.bean.WishBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
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
			$("form#cartFrm").submit();
		});
		
		$("button#cartOrder").click(function(){
			$("form#cartFrm").attr("action","order.jsp");
			$("input#job").val("product");
			$("form#cartFrm").submit();
		});
		
		$("button#cartIdNull").click(function(){
			$("form#cartFrm").attr("action","/KAKAO/main/login.jsp?state=idNull");
			$("form#cartFrm").submit();
		});
		
		$("button#wish").click(function(){
			$("form#cartFrm").attr("action","");
			$("input#job").val("wish");
			$("form#cartFrm").submit();
			alert("�����Ͻ� ��ǰ�� �򸮽�Ʈ�� �߰��Ǿ����ϴ�:)");
		});
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
  	String id = (String)session.getAttribute("id");
  	String prono = request.getParameter("prono");
  	ProductDao dao = new ProductDao();
  	ProductBean bean = (ProductBean)dao.selectOne(prono);
  	
  	String job = request.getParameter("job");
  	
	/* �����߰� */
	if(job!=null && job.equals("wish")){
		MypageDao mypageDao = new MypageDao();
		
		HashMap<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("prono", prono);
		
		WishBean wishListbean = mypageDao.wishSelectOne(map);
		if(wishListbean==null){
				ProductBean productBean =  (ProductBean)dao.selectOne(prono);
				WishBean wishBean = new WishBean();
				wishBean.setIdProno(id+prono);
				wishBean.setId(id);
				wishBean.setProno(prono);
				wishBean.setProname(productBean.getProname());
				wishBean.setPicture("/KAKAO/img/"+productBean.getType()+"/"+productBean.getMainimg());
				wishBean.setPrice(productBean.getPrice());
				wishBean.setCount(Integer.parseInt("1"));
				mypageDao.wishInsert(wishBean);
		} 
	}
  %>
  
	  <div class="mainDiv">
		<div id="contentsWrap" class="contentsWrap">
				<div class="contents">
					<div class="infoDiv" align="center" style="width: 100%; margin: 0 auto; padding: 10px;">
						<%-- <h2 class="title" style="padding: 10px;"><%=bean.getProname() %></h2> --%>
						<div><img src="/KAKAO/img/<%=bean.getType() %>/<%=bean.getSubtype()%>/<%=bean.getMainimg() %>" width="60%" style="margin-top: 10px;"></div><br><br><Br>
						<h3 style="padding-top: 10px; margin-bottom:20px; color: #999999;"><%=bean.getType() %> / <%=bean.getSubtype() %></h3>
						<h1 class="title" style="padding-bottom: 10px; margin-top: 5px; "><%=bean.getProname() %></h1>
						<h2 style="padding-bottom: 10px; margin-top: 3px;"><%=NumberFormat.getInstance().format( bean.getPrice() )%>��</h2>
						
					<form action="cartList.jsp" method="get" id="cartFrm">
						<div class="middleDiv" align="right" style="width: 60%; margin: 0 auto; margin-top:10px; padding: 10px;">
							<div id="buttonContainer" >
							  <input type="number" id="count" name="count" value="1" step="1" min="1" max="10" style="text-align: center; height: 33px; margin-right: 2px;" >
							  <input type="hidden" id="prono" name="prono" value="<%=bean.getProno()%>">
							  <input type="hidden" name="proname" value="<%=bean.getProname()%>">
							  <input type="hidden" name="picture" value="/KAKAO/img/<%=bean.getType() %>/<%=bean.getSubtype()%>/<%=bean.getMainimg() %>">
							  <input type="hidden" name="price" value="<%=bean.getPrice()%>">
							  
							   <%
									if(id==null){
								%>
									<button type="button" id="cartIdNull" class="btn btn-info">���ϱ�</button>
									<button type="button" id="cartIdNull" class="btn btn-info">��ٱ���</button>
									<button type="button" id="cartIdNull" class="btn btn-info">�ֹ��ϱ�</button>
													
								<%
									}else{
								%>
									  <button type="button" id="wish" class="btn btn-info">���ϱ�</button>
									  <button type="button" id="cart" class="btn btn-info">��ٱ���</button>
									  <button type="button" id="cartOrder" class="btn btn-info">�ֹ��ϱ�</button>
								<%
									}
								%>
							  <input type="hidden" name="job" id="job" value="add">
							</div>
						</div>
					</form>

						<hr style="height: 1px;">
						<%
						if(bean.getInfo()!=null){
						%>
							<h4 style="padding: 20px;  width: 50%; color:#999999; "><%=bean.getInfo() %></h4>
						<%
						}
						%>
							<img alt="" src="/KAKAO/img/<%=bean.getType() %>/<%=bean.getSubtype()%>/<%=bean.getDetailimg1()%>" width="60%" style="margin-top: 10px;">
							<img alt="" src="/KAKAO/img/<%=bean.getType() %>/<%=bean.getSubtype()%>/<%=bean.getDetailimg2()%>" width="60%" style="margin-top: 10px;">
						<%
						if(bean.getDetailimg3()!=null){
						%>
							<img alt="" src="/KAKAO/img/<%=bean.getType() %>/<%=bean.getSubtype()%>/<%=bean.getDetailimg3() %>" width="60%" style="margin-top: 10px;">
						<%
						}
						
						if(bean.getNotice()!=null){
						%>
							 <h4 style="padding: 30px; width: 62%; color:#999999; line-height: 200%; "><%=bean.getNotice() %></h4>
						<%
						}
						%> 
					</div>
				<!-- �Ǽ� <hr style="height: 1px;"> -->
				</div>
			</div>
	</div>  
  <jsp:include page="footer.jsp" />
</body>
</html>