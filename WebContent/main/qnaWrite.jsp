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
				alert('��ĭ���� ��� �Է����ּ���!');	
			 }else{
				 alert("�ۼ����ֽ� ���ǰ� ��ϵǾ����ϴ�:)");
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
		<!-- ���� �� ���� div  -->
		  <div class="col-md-6">
		  			<div class="panel-heading" style="margin-left: 20px;">
							<h2>�� ����</h2>
						</div>				
						<!-- panel body -->
						<div class="panel-body">
							
							<!-- �̸� form -->
							<div class="form-group sendInfoDiv leftDivs">
								<label for="inputName" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">�̸�</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="�̸�" name="name" value="">
								</div>
								<br>
							</div>
							
							<!-- �̸��� form -->
							<div class="form-group sendInfoDiv leftDivs">
								<label for="inputEmail" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">�̸���</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="�̸���" name="email" value="">
								</div>
								<br>
							</div>
	
							<!-- ��ȭ��ȣ form -->
							<div class="form-group sendInfoDiv leftDivs">
								<label for="inputTel" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">��ȭ��ȣ</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" placeholder="��ȭ��ȣ" name="tel" value="">
								</div>
								<br>
							</div>
		  				</div>
		  		</div>	
		  	<!-- ������ ���� ���� div -->
		  	<div class="col-md-6">
		  			<div class="panel-heading" style="margin-left: 20px;">
							<h2>���� ����</h2>
						</div>				
						<!-- panel body -->
						<div class="panel-body">
							
							<!-- ���� form -->
							<div class="form-group sendInfoDiv leftDivs">
								<label for="inputName" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">����</label>
								<div class="col-sm-10">
									<select class="form-control" name="type">
									   <option value="">���������� �����ϼ���</option>
									   <option value="ȸ��">ȸ��</option>
									   <option value="��ǰ">��ǰ</option>
									   <option value="�ֹ�����">�ֹ�����</option>
									   <option value="���">���</option>
									   <option value="����">����</option>
									   <option value="��ȯ_ȯ��_��ǰ">��ȯ/ȯ��/��ǰ</option>
									   <option value="��Ÿ">��Ÿ</option>
									</select>
								</div>
								<br>
							</div>
							
							<!-- ���� form -->
							<div class="form-group sendInfoDiv leftDivs">
								<label for="inputEmail" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">����</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="" name="title" value="">
								</div>
								<br>
							</div>
	
							<!-- ���� form -->
							<div class="form-group sendInfoDiv leftDivs">
								<label for="inputcomment" class="col-sm-2 control-label" style="padding-left: 0px;padding-right: 0px;">����</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="contents" rows="15"  placeholder=""></textarea>
								</div>
								<br>
							</div>
						</div>
				  	</div>
				</div><br><br><br>
			<!--��ư  -->
			<div align="center">
				<button type="button" class="btn btn-info" id="qnaBtn">�����ϱ�</button>
				<a href="qna.jsp"><button type="button" class="btn btn-info">���</button></a>
			</div>
	</form>		
			
	<jsp:include page="/main/footer.jsp" />
</body>
</html>