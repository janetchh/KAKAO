<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="/Baegopang/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.padding{
		padding: 15px;
	}
	div.difPadding{
		padding: 30px;
	}
</style>
<script type="text/javascript">
  $(function(){
	  $("button[name='loginBtn']").click(function(){
		 $("form#loginFrm").submit();
	  });
  });
</script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<img alt="cartList" src="/KAKAO2/img/loginmainFont.png" style="width: 100%; height: 100%;">
	<form action="login.do?cmd=login" method="POST" id="loginFrm">
		<div class="mainDiv" align="center" style="margin: 30px auto; width: 500px; height: 500px; border: 1px solid #D5D5D5;">
			<h1 style="padding: 30px;" align="center">KAKAO 로그인</h1>
				<div class="input-group">
					<div class="difPadding"><input type="text" name="id" class="form-control" placeholder="카카오계정(email)"></div>
					<div class="difPadding"><input type="text" name="pw" class="form-control" placeholder="비밀번호(4~16자리)"></div>
					<div class="padding"><input type="checkbox" name="idSave">카카오계정 저장</div>
					<div class="padding"><button type="button" name="loginBtn" class="btn btn-info" style="width: 196px;">로그인</button></div>
				</div>
			<hr style="width: 450px; margin-top: 50px;">
				<div class="bottom-group">
					<a href="#" style="padding-right: 130px;">회원가입</a>
					<a href="#">카카오계정 찾기</a>
					<a href="#">비밀번호 재설정</a>
				</div>
		</div>
	</form>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>