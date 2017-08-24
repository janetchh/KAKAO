<%@page import="kakao.dao.MemberDao"%>
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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String state = request.getParameter("state");
		String idSave = request.getParameter("idSave");

		MemberDao dao = new MemberDao();

		/* 로그인 성공시 */
		if (state == null) {
			if (dao.idCheck(id, pw)) {
				session.setAttribute("id", id);
				response.sendRedirect("/KAKAO/main/main.jsp");
			} else {
				response.sendRedirect("/KAKAO/main/login.jsp?state=false");
			}

		/* 로그아웃시  */
		} else if (state.equals("logout")) {
			session.removeAttribute("id");
			response.sendRedirect("/KAKAO/main/main.jsp");
		}
		
		
		/* 쿠키설정 */
		if(idSave.equals("on")){
			Cookie cookie = new Cookie("id",id);
			System.out.println(cookie);
			response.addCookie(cookie);
		}else{
			
		}
	%>


</body>
</html>