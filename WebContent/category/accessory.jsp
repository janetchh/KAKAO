<%@page import="java.util.HashMap"%>
<%@page import="kakao.bean.WishBean"%>
<%@page import="kakao.dao.MypageDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="kakao.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="kakao.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		if($("input#subtype").val()=="교통카드"){
			$("div.topnav a").attr("class",""); 
			$("a#transportationCard").attr("class","active");
		}else if($("input#subtype").val()=="시즌소품"){
			$("div.topnav a").attr("class",""); 
			$("a#seasonAccessory").attr("class","active");
		}else if($("input#subtype").val()=="신발"){
			$("div.topnav a").attr("class",""); 
			$("a#shoes").attr("class","active");
		}else if($("input#subtype").val()=="파우치_지갑_가방"){
			$("div.topnav a").attr("class",""); 
			$("a#pouchWalletBag").attr("class","active");
		}else if($("input#subtype").val()=="패션소품"){
			$("div.topnav a").attr("class",""); 
			$("a#fashionAccessory").attr("class","active");
		}
		
		$("button#wishBtn").click(function(){
			alert("선택하신 상품이 찜리스트에 추가되었습니다:)");
		});
		
	});
</script>
</head>
<body>
	<jsp:include page="/main/header.jsp" />
	
	<%
		request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("id");
		ProductDao dao = new ProductDao();
		MypageDao mypageDao = new MypageDao();
		List<ProductBean> list = null;
		String subtype= request.getParameter("subtype");
		
		String job = request.getParameter("job");
		
		/* 찜목록추가 */
		if(job!=null && job.equals("wish")){
			String prono = request.getParameter("prono");
			
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
		
		if(subtype!=null){
			list = dao.selectList(subtype);
	%>
	<!--타이틀IMG  -->
	<img alt="accessorymain" src="/KAKAO/img/잡화/<%=subtype%>.jpg" style="width: 100%; height: 250px;">
	
	<%
		}else{
			list = dao.selectAllList("잡화");
	%>
	
	<!--타이틀IMG  -->
	 <img alt="accessorymain" src="/KAKAO/img/잡화/accessorymain.jpg" style="width: 100%; height: 80%;"> 

	<%
		}
	
	%>
	
	<!--세부카테고리  -->
	<div class="topnav">
	  <a id="all" class="active" href="accessory.jsp">전체</a>
	  <a id="transportationCard" href="accessory.jsp?subtype=교통카드">교통카드</a>
	  <a id="seasonAccessory" href="accessory.jsp?subtype=시즌소품">시즌소품</a>
	  <a id="shoes" href="accessory.jsp?subtype=신발">신발</a>
	  <a id="pouchWalletBag" href="accessory.jsp?subtype=파우치_지갑_가방">파우치/지갑/가방</a>
	  <a id="fashionAccessory" href="accessory.jsp?subtype=패션소품">패션소품</a>
	  <input type="hidden"  id="subtype" value="<%=subtype%>">
	</div>
	
   <h3 style="margin-left: 230px;">총 <%=list.size() %>개의 상품이 조회되었습니다.</h3>
	
	<div id="outDiv">
		<div class="maindiv" align="center">
			<%
				for( ProductBean bean : list ){
			%>
			<form action="/KAKAO/main/order.jsp" method="get" >		
				<input type="hidden" name="job" value="product">	
				<div class="gallery" style="height: 100%;">
					<a href="/KAKAO/main/productInfo.jsp?prono=<%=bean.getProno()%>"> <img src="/KAKAO/img/잡화/<%=bean.getMainimg() %>" width="600" height="400" >
					<label style="color: #316a7b; font-size:18px;  padding-top: 15px; padding-bottom: 5px;"><%=bean.getProname() %></label><br>
					<label style="color: #316a7b; font-size:18px; padding-bottom: 10px;"><%=NumberFormat.getInstance().format( bean.getPrice() )%></label><br>
					</a>
					<input type="hidden" name="proname" value="<%=bean.getProname() %>">
					<input type="hidden" name="picture" value="/KAKAO/img/잡화/<%=bean.getMainimg()%>"> 
					<input type="hidden" name="price" value="<%=bean.getPrice()%>"> 
					<input type="hidden" name="count" value="1"> 
					
				<%
					
					if(id==null){
				%>
					<a href="/KAKAO/main/login.jsp?state=idNull"><button type="button" class="btn btn-info">찜하기</button></a>		
					<a href="/KAKAO/main/login.jsp?state=idNull"><button type="button" class="btn btn-info">장바구니</button></a>
					<a href="/KAKAO/main/login.jsp?state=idNull"><button type="button" class="btn btn-info">주문하기</button></a>		
				<%
					}else{
				%>
					<a href="/KAKAO/category/accessory.jsp?job=wish&prono=<%=bean.getProno()%>"><button type="button" class="btn btn-info" id="wishBtn">찜하기</button></a>
					<a href="/KAKAO/main/cartList.jsp?job=add&prono=<%=bean.getProno()%>&count=1"><button type="button" class="btn btn-info">장바구니</button></a>
					<button type="submit" class="btn btn-info">주문하기</button>		
				<%
					}
				%>
									
				</div>
			</form>
			<%
				}
			%>		
		</div>
	</div>
	<jsp:include page="/main/footer.jsp" />
</body>
</html>