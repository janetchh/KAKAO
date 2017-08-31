<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		$("button#qnaBtn").click(function(){
			if($("input[name='name']").val()==''||$("input[name='email']").val()==''
				||$("input[name='tel']").val()==''||$("select[name='type']").val()==''||
				$("input[name='title']").val()==''||$("textarea[name='contents']").val()==''){
				alert('빈칸없이 모두 입력해주세요!');	
			 }else{
				 alert("작성해주신 문의가 등록되었습니다:)");
				 $("form#qnaFrm").submit();
			 }
			
		});
		
	});
</script>
<style>
hr{
	border: solid 1px gray;
}
tr td{
	padding: 10px;
}
label{
	vertical-align: middle;
	padding-top: 7px;
	font-size: 13pt;
	font-weight: lighter;
}
textarea{
	resize: none;
}
.mainDiv {
	width: 84%;
	margin: 0 auto;
}
div.row{
	text-align:center;
	width: 1300px;	
	margin: 0 auto;
}
.sendInfoDiv{
	padding: 10px;
}
.orderPrice{
	text-align: right;
}
.centerDiv{
	margin: 0 auto;
	width: 80%;
}
.redText{
	color: red;
}
.rightText{
	width:80%;
	text-align: right;
}
.dashedHr{
	border: dashed 1px gray;
	width: 100%;
}
.finalDiv{
	text-align:right;
	width: 80%;
	margin: 0 auto;
}
.finalButton{
	width: 100%;
}
.majorDiv{
	margin: 20px;
}
.leftDivs, .rightDivs{
	margin: 20px;
	padding: 10px;
}
.leftDivs{
	width: 600px;
	text-align: rigth;
}

.rightDivs{
	margin: 0 auto;
	width: 100%;
}

button{
	width: 200px;
	height: 50px;
	font-size: 20pt;
}
</style>
</head>
<body>
	<jsp:include page="/main/header.jsp" />
	<img src="/KAKAO/img/QuestionFont.jpg" style="width: 100%; height: 80%;"><br><br> 
	
	<form action="qnaProcess.jsp" method="post" id="qnaFrm">
		<input type="hidden" name="job" value="add"> 
	<div class="row">
		<!-- 왼쪽 고객 정보 div  -->
		  <div class="col-md-6">
		  			<div class="panel-heading" style="margin-left: 20px;">
							<h2>고객 정보</h2>
						</div>				
						<!-- panel body -->
						<div class="panel-body">
							
							<!-- 이름 form -->
							<div class="form-group sendInfoDiv leftDivs">
								<label for="inputName" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="이름" name="name" value="">
								</div>
								<br>
							</div>
							
							<!-- 이메일 form -->
							<div class="form-group sendInfoDiv leftDivs">
								<label for="inputEmail" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">이메일</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="이메일" name="email" value="">
								</div>
								<br>
							</div>
	
							<!-- 전화번호 form -->
							<div class="form-group sendInfoDiv leftDivs">
								<label for="inputTel" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">전화번호</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" placeholder="전화번호" name="tel" value="">
								</div>
								<br>
							</div>
		  				</div>
		  		</div>	
		  	<!-- 오른쪽 문의 내용 div -->
		  	<div class="col-md-6">
		  			<div class="panel-heading" style="margin-left: 20px;">
							<h2>문의 내용</h2>
						</div>				
						<!-- panel body -->
						<div class="panel-body">
							
							<!-- 유형 form -->
							<div class="form-group sendInfoDiv leftDivs">
								<label for="inputName" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">유형</label>
								<div class="col-sm-10">
									<select class="form-control" name="type">
									   <option value="">문의유형을 선택하세요</option>
									   <option value="회원">회원</option>
									   <option value="상품">상품</option>
									   <option value="주문결제">주문결제</option>
									   <option value="배송">배송</option>
									   <option value="쿠폰">쿠폰</option>
									   <option value="교환_환불_반품">교환/환불/반품</option>
									   <option value="기타">기타</option>
									</select>
								</div>
								<br>
							</div>
							
							<!-- 제목 form -->
							<div class="form-group sendInfoDiv leftDivs">
								<label for="inputEmail" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">제목</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="" name="title" value="">
								</div>
								<br>
							</div>
	
							<!-- 내용 form -->
							<div class="form-group sendInfoDiv leftDivs">
								<label for="inputcomment" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">내용</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="contents" rows="15"  placeholder=""></textarea>
								</div>
								<br>
							</div>
						</div>
				  	</div>
				</div><br><br><br>
			<!--버튼  -->
			<div align="center">
				<button type="button" class="btn btn-info" id="qnaBtn">문의하기</button>
				<a href="qna.jsp"><button type="button" class="btn btn-info">취소</button></a>
			</div>
	</form>		
			
	<jsp:include page="/main/footer.jsp" />
</body>
</html>