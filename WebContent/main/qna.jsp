<%@page import="java.util.List"%>
<%@page import="oracle.net.aso.r"%>
<%@page import="kakao.dao.MypageDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kakao.bean.QnaBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("tr.qnaDetail").hide();
		
		$("tr.titleTr").click(function(){
			$(this).next().toggle();
		});
		
	});
</script>
</head>
<style>
table.qnaTb{
    border-collapse: collapse;
    width: 70%;
}
table.qnaTb th, table.qnaTb td {
  	font-size : 15pt;
    padding: 10px;
    padding-left: 40px;
    text-align: left;
}
tr:hover{
	background-color:#D7E6FF
}

button#qnaBtn{
	width: 200px;
	height: 50px;
	font-size: 20pt;
}
</style>
<body>
	<jsp:include page="/main/header.jsp" />
	<img src="/KAKAO/img/QuestionFont.jpg" style="width: 100%; height: 80%;"><br><br> 
	<%
		request.setCharacterEncoding("UTF-8");
		
		String id = (String) session.getAttribute("id");
		String job = request.getParameter("job");
		MypageDao dao = new MypageDao();
		
		if(job!=null && job.equals("add")){
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String type = request.getParameter("type");
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			
			long time = System.currentTimeMillis(); 

			SimpleDateFormat dayTime = new SimpleDateFormat("yy/MM/dd hh:mm:ss");

			String currentTime = dayTime.format(new Date(time));
			
			QnaBean bean = new QnaBean();
			bean.setId(id);
			bean.setName(name);
			bean.setEmail(email);
			bean.setTel(tel);
			bean.setType(type);
			bean.setTitle(title);
			bean.setContents(contents);
			bean.setRegdate(currentTime);
			dao.qnaInsert(bean);
			
		}
	%>
	
	<%
		List<QnaBean> list = dao.qnaSelect(id);
		if(list.size()!=0){
			for(QnaBean qnaBean : list){
	%>
		<div class="centerTable" align="center">
		  <table class="qnaTb" >
			  <tr>
			    <th>
				    <div class="row">
					  <div class="col-md-10" align="left">[<%=qnaBean.getType() %>] &emsp; <%=qnaBean.getRegdate() %> </div>
					  <div class="col-md-2" style="text-align: center;">접수완료</div>
					</div>
			   </th>
			  </tr>
			  <tr class="titleTr" >
			    <th>
			     <div class="row">
			     	<div class="col-md-10" align="left"><%=qnaBean.getTitle() %></div>
			     	<div class="col-md-2" style="text-align: center;"><span class="glyphicon glyphicon-chevron-down" id="icon" aria-hidden="true"></span></div>
			     </div>
			    </th>
			  </tr>
			  <tr class="qnaDetail" >
			  	<td><%=qnaBean.getContents() %></td>
			  </tr>
		  </table>
		</div>
		<hr style="width: 70%">	
	<%
			}
		}else{
	%>
		<div align="center" style="padding: 200px;">
			<h2>작성하신 문의글이 없습니다.</h2>
		</div>
	<%
		}
	%>
		<div align="center">
			<a href="qnaWrite.jsp"><button type="button" class="btn btn-info" id="qnaBtn">문의하기</button></a>
		</div>
	<jsp:include page="/main/footer.jsp" />
</body>
</html>