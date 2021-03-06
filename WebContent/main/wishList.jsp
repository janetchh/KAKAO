<%@page import="java.text.NumberFormat"%>
<%@page import="kakao.bean.WishBean"%>
<%@page import="java.util.List"%>
<%@page import="kakao.dao.MypageDao"%>
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
		$("button#delBtn").click(function(){
			alert("선택하신 상품이 삭제되었습니다:)");
		});
		
	});
</script>
</head>
<body>
	<jsp:include page="/main/header.jsp" />
	
	<%
		String id = (String)session.getAttribute("id");
		MypageDao dao = new MypageDao();
		
		/* 찜 삭제 */
		String job = request.getParameter("job");
		if(job!=null && job.equals("del")){
			String idProno = request.getParameter("idProno");
			dao.wishDelete(idProno);
		}
		
		List<WishBean> list = dao.wishSelect(id);
		
	%>
	
	 <img src="/KAKAO/img/wishListFont.jpg" style="width: 100%; height: 80%;"><br><br> 

	<%
		if(list.size()==0){
	%>
  		 <h3 style="margin-left: 230px;">찜상품이 없습니다!</h3><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<%
		}else{
	%>
		<h3 style="margin-left: 230px;">총 <%=list.size() %>개의 상품이 조회되었습니다.</h3>
	<%
		}
	%>
	<div id="outDiv">
		<div class="maindiv" align="center">
			<%
				for( WishBean bean : list ){
			%> 
			<form action="/KAKAO/main/order.jsp" method="get" id="wishFrm" >		
				<input type="hidden" name="job" value="product">	
				<div class="gallery" style="height: 100%;">
					<a href="/KAKAO/main/productInfo.jsp?prono=<%=bean.getProno()%>"> <img src="<%=bean.getPicture() %>" width="600" height="400" >
					<label style="color: #316a7b; font-size:18px;  padding-top: 15px; padding-bottom: 5px;"><%=bean.getProname() %></label><br>
					<label style="color: #316a7b; font-size:18px; padding-bottom: 10px;"><%=NumberFormat.getInstance().format( bean.getPrice() )%></label><br>
					</a>
					<input type="hidden" name="proname" value="<%=bean.getProname() %>">
					<input type="hidden" name="picture" value="<%=bean.getPicture()%>"> 
					<input type="hidden" name="price" value="<%=bean.getPrice()%>"> 
					<input type="hidden" name="count" value="1"> 
					<input type="hidden" name="job" value="del">
					<a href="/KAKAO/main/cartList.jsp?job=add&prono=<%=bean.getProno()%>&count=1"><button type="button" class="btn btn-info">장바구니</button></a>
					<button type="submit" class="btn btn-info">주문하기</button>
					<a href="/KAKAO/main/wishList.jsp?job=del&idProno=<%=bean.getIdProno()%>"><button type="button" class="btn btn-info" id="delBtn">삭제하기</button></a>
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