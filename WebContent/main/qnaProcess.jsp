<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="kakao.bean.QnaBean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kakao.dao.MypageDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

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
			response.sendRedirect("/KAKAO/main/qna.jsp");
		}
	%>

</body>
</html>