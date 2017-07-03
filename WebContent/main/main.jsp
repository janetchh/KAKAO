<%@page import="java.util.List"%>
<%@page import="kakao.bean.KakaoBean"%>
<%@page import="kakao.dao.KakaoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	body{
		padding-bottom: 0px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<%
		/* KakaoDao dao = new KakaoDao();
		List<KakaoBean> list = dao.selectProduct();
		for(int i = 0;i<list.size();i++){
			KakaoBean bean = list.get(i);
			out.print(bean);
		} */
	%>
	<div class="mid_contents">
		<div class="container">
		  <div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner">
		      <div class="item active">
		        <img src="/KAKAO/img/main1.JPG" alt="main1" style="width:100%; height: 100% ">
		      </div>
		
		      <div class="item">
		        <img src="/KAKAO/img/main2.JPG" alt="main2" style="width:100%; height: 100% ">
		      </div>
		    
		      <div class="item">
		        <img src="/KAKAO/img/main3.JPG" alt="main3" style="width:100%; height: 100% ">
		      </div>
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
		  </div>
		</div>
	</div>	
	<jsp:include page="footer.jsp"/>
</body>
</html>	