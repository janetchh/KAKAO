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
	
	div.bannerContainer img{
		padding: 5px;
	}
	div.characterContainer img{
		padding: 10px;
		width: 300px; 
		height: 150px;
	}
	
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<%-- <%
		KakaoDao dao = new KakaoDao();
		List<KakaoBean> list = dao.selectProduct();
		for(int i = 0;i<list.size();i++){
			KakaoBean bean = list.get(i);
			out.print(bean);
		} 
	%> --%>
	<div class="mid_contents">
		<div class="slideContainer" style="width: 100%;">
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
		        <img src="/KAKAO/img/main1.jpg" alt="main1" style="width:100%; height: 50% ">
		      </div>
		
		      <div class="item">
		        <img src="/KAKAO/img/main2.jpg" alt="main2" style="width:100%; height: 50%">
		      </div>
		    
		      <div class
		      ="item">
		        <img src="/KAKAO/img/main3.jpg" alt="main3" style="width:100%; height: 50% ">
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
		
		<div class="bannerContainer" style="padding: 20px; margin: 0 auto; width: 1300px; "  align="center" >
			<img src="/KAKAO/img/banner/20170612_CbannerA_tmoney_W.jpg" width="400px" height="400px">
			<img src="/KAKAO/img/banner/20170621_Cbanner_hood_W.jpg" width="400px" height="400px">
			<img src="/KAKAO/img/banner/20170609_Cbanner_icecup_W.jpg" width="400px" height="400px">
			<img src="/KAKAO/img/banner/20170626_Cbanner_miniset_W.jpg" width="400px" height="400px">
			<img src="/KAKAO/img/banner/20170626_CbannerW_globalgift_W.jpg" width="800px" height="400px">
		</div>
		
		<div class="characterContainer" style="padding: 20px; margin: 0 auto; width: 1300px; "  align="center"> 
			<img src="/KAKAO/img/character/ico_character_apeach.png">
			<img src="/KAKAO/img/character/ico_character_con.png">
			<img src="/KAKAO/img/character/ico_character_frodo.png">
			<img src="/KAKAO/img/character/ico_character_jayg.png">
			<img src="/KAKAO/img/character/ico_character_muzi.png">
			<img src="/KAKAO/img/character/ico_character_neo.png" >
			<img src="/KAKAO/img/character/ico_character_ryan.png">
			<img src="/KAKAO/img/character/ico_character_tube.png">
		</div>
		
	</div>	
	<jsp:include page="footer.jsp"/>
</body>
</html>	