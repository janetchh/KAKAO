<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
div#outDiv {
	width: 100%;
	margin: 0 auto;
}

div.maindiv {
	display: inline-block;
	margin: 0px 550px 0px 550px; 
}

div.gallery {
	margin: 5px;
	border: 1px solid #ccc;
	float: left;
	width: 180px;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: auto;
}

div.desc {
	padding: 15px;
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	$(function() {

	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<img alt="dollmain" src="/KAKAO/img/dollmain.jpg"
		style="width: 100%; height: 100%;">
	<div id="outDiv">
		<div class="maindiv" align="center">
			<div class="gallery">
				<a target="_blank" href="img_fjords.jpg"> <img src="img_fjords.jpg" alt="Trolltunga Norway" width="300" height="200">
				</a>
				<div class="desc">Add a description of the image here</div>
			</div>

			<div class="gallery">
				<a target="_blank" href="img_forest.jpg"> <img src="img_forest.jpg" alt="Forest" width="600" height="400">
				</a>
				<div class="desc">Add a description of the image here</div>
			</div>

			<div class="gallery">
				<a target="_blank" href="img_lights.jpg"> <img src="img_lights.jpg" alt="Northern Lights" width="600" height="400">
				</a>
				<div class="desc">Add a description of the image here</div>
			</div>

			<div class="gallery">
				<a target="_blank" href="img_mountains.jpg"> <img src="img_mountains.jpg" alt="Mountains" width="600" height="400">
				</a>
				<div class="desc">Add a description of the image here</div>
			</div>
			
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>