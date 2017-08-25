<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="kakao.bean.ProductBean"%>
<%@page import="kakao.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	margin: 10px 200px 10px 200px;
	margin-bottom: 0px; 
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
<style>

.topnav {
  width: 1000px;
  margin-left: 200px;
  padding: 30px;
  overflow: hidden;
  background-color: white;
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 25px;
}

.topnav a:hover {
  background-color: #5bc0de;
  color: white;
  text-decoration: none;
}

.topnav a.active {
    background-color: #5bc0de;
    color: white;
}
</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		//세부타입 효과
		if($("input#subtype").val()=="미니인형"){
			$("div.topnav a").attr("class",""); 
			$("a#mini").attr("class","active");
		}else if($("input#subtype").val()=="25_35cm"){
			$("div.topnav a").attr("class",""); 
			$("a#2535cm").attr("class","active");
		}else if($("input#subtype").val()=="대형인형"){
			$("div.topnav a").attr("class",""); 
			$("a#big").attr("class","active");
		}else if($("input#subtype").val()=="키체인인형"){
			$("div.topnav a").attr("class",""); 
			$("a#keychain").attr("class","active");
		}
		
	});
</script>
</head>
<body>
	<jsp:include page="/main/header.jsp" />
	
	
	<%
		request.setCharacterEncoding("UTF-8");
		ProductDao dao = new ProductDao();
		List<ProductBean> list = null;
		String subtype= request.getParameter("subtype");
		if(subtype!=null){
			list = dao.selectList(subtype);
	%>
	<!--타이틀IMG  -->
	<img alt="dollmain" src="/KAKAO/img/인형/<%=subtype%>.jpg" style="width: 100%; height: 80%;">
	
	<%
		}else{
			list = dao.selectAllList("인형");
	%>
	
	<!--타이틀IMG  -->
	<img alt="dollmain" src="/KAKAO/img/인형/dollmainmod.jpg" style="width: 100%; height: 80%;">
	
	<%
		}
	%>
	
	<!--세부카테고리  -->
	<div class="topnav">
	  <a id="all" class="active" href="doll.jsp">전체</a>
	  <a id="mini" href="doll.jsp?subtype=미니인형">미니인형</a>
	  <a id="2535cm" href="doll.jsp?subtype=25_35cm">25cm/35cm인형</a>
	  <a id="big" href="doll.jsp?subtype=대형인형">대형인형</a>
	  <a id="keychain" href="doll.jsp?subtype=키체인인형">키체인인형</a>
	  <input type="hidden"  id="subtype" value="<%=subtype%>">
	</div>
	
   <h3 style="margin-left: 230px;">총 <%=list.size() %>개의 상품이 조회되었습니다.</h3>
	
	<div id="outDiv">
		<div class="maindiv" align="center">
			<%
				for( ProductBean bean : list ){
			%>
				<div class="gallery" style="height: 100%;">
					<a href="/KAKAO/main/productInfo.jsp?prono=<%=bean.getProno()%>"> <img src="/KAKAO/img/인형/<%=bean.getMainimg() %>" width="600" height="400" >
					<label style="color: #316a7b; font-size:18px;  padding-top: 15px; padding-bottom: 5px;"><%=bean.getProname() %></label><br>
					<label style="color: #316a7b; font-size:18px; padding-bottom: 10px;"><%=NumberFormat.getInstance().format( bean.getPrice() )%></label><br>
					</a>
					<a href=""><button type="button" class="btn btn-info">찜하기</button></a>	
					<%
						String id = (String)session.getAttribute("id");
						if(id==null){
					%>
						<a href="/KAKAO/main/login.jsp?state=idNull"><button type="button" class="btn btn-info">장바구니</button></a>
										
					<%
						}else{
					%>
						<a href="/KAKAO/main/cartList.jsp?job=add&prono=<%=bean.getProno()%>&count=1"><button type="button" class="btn btn-info">장바구니</button></a>
					<%
						}
					%>
					<a href=""><button type="button" class="btn btn-info">주문하기</button></a>						
					</div>
			<%
				}
			%>		
		</div>
	</div>
	<jsp:include page="/main/footer.jsp" />
</body>
</html>