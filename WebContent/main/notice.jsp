<%@page import="kakao.bean.NoticeBean"%>
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
		$("tr.noticeDetail").hide();
		
		$("tr.titleTr").click(function(){
			$(this).next().toggle();
		});
		
	});
</script>
</head>
<style>
table.noticeTb{
    border-collapse: collapse;
    width: 70%;
}
table.noticeTb th, table.noticeTb td {
  	font-size : 15pt;
    padding: 10px;
    padding-left: 40px;
    text-align: left;
}
tr:hover{
	background-color:#D7E6FF
}

</style>
<body>
	<jsp:include page="/main/header.jsp" />
	<img src="/KAKAO/img/noticeFont.jpg" style="width: 100%; height: 80%;"><br><br> 

	<%
		MypageDao dao = new MypageDao();
		List<NoticeBean> list = dao.noticeSelect();
		for(NoticeBean bean : list){
		%>	
		

		<div class="centerTable" align="center">
		  <table class="noticeTb" >
			  <tr>
			    <th>
				    <div class="row">
					  <div class="col-md-10" align="left"></div>
					</div>
			   </th>
			  </tr>
			  <tr class="titleTr" >
			    <th>
			     <div class="row">
			     	<div class="col-md-10" align="left"><%=bean.getTitle() %></div>
			     	<div class="col-md-2" style="text-align: center;"><span class="glyphicon glyphicon-chevron-down" id="icon" aria-hidden="true"></span></div>
			     </div>
			    </th>
			  </tr>
			  <tr class="noticeDetail" >
			  	<td></td>
			  </tr>
		  </table>
		</div>
		<hr style="width: 70%">
		<%
		}
		%>
	
	<jsp:include page="/main/footer.jsp" />
</body>
</html>