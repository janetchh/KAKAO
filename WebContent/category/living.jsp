<%@page import="java.text.NumberFormat"%>
<%@page import="kakao.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="kakao.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
div#outDiv {
	width: 100%;
}

div.maindiv {
	margin: 10px 200px 10px 200px;
	margin-bottom: 0px; 
}

div.gallery {
	margin: 30px;
	padding: 10px;
	float: left;
	width: 300px;
	height: 350px;
}

div.gallery:hover {
	border: 3px solid #5bc0de;
}

div.gallery img {
	width: 100%;
	height: auto;
}

div.desc {
	padding: 2px;
	text-align: center;
}

</style>
<style>

.topnav {
  width: 1000px;
  margin-left: 200px;
  padding: 30px;
  overflow: hidden;
  background-color: white;
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 25px;
}

.topnav a:hover {
  background-color: #5bc0de;
  color: white;
  text-decoration: none;
}

.topnav a.active {
    background-color: #5bc0de;
    color: white;
}
</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		//����Ÿ�� ȿ��
		if($("input#subtype").val()=="��Ȱ��ǰ"){
			$("div.topnav a").attr("class",""); 
			$("a#livingAccessory").attr("class","active");
		}else if($("input#subtype").val()=="��ǿ�ǰ"){
			$("div.topnav a").attr("class",""); 
			$("a#bathroomWare").attr("class","active");
		}else if($("input#subtype").val()=="�ֹ��ǰ"){
			$("div.topnav a").attr("class",""); 
			$("a#kitchenware").attr("class","active");
		}else if($("input#subtype").val()=="��_�Һ�"){
			$("div.topnav a").attr("class",""); 
			$("a#cupTumbler").attr("class","active");
		}else if($("input#subtype").val()=="Ż��_������"){
			$("div.topnav a").attr("class",""); 
			$("a#airFreshener").attr("class","active");
		}else if($("input#subtype").val()=="�к긯"){
			$("div.topnav a").attr("class",""); 
			$("a#fabric").attr("class","active");
		}
		
	});
</script>
</head>
<body>
	<jsp:include page="/main/header.jsp" />
	
	
	<%
		request.setCharacterEncoding("UTF-8");
		ProductDao dao = new ProductDao();
		List<ProductBean> list = null;
		String subtype= request.getParameter("subtype");
		if(subtype!=null){
			list = dao.selectList(subtype);
	%>
	<!--Ÿ��ƲIMG  -->
	<img alt="livingmain" src="/KAKAO/img/����/<%=subtype%>.jpg" style="width: 100%; height: 250px;">
	
	<%
		}else{
			list = dao.selectAllList("����");
	%>
	
	<!--Ÿ��ƲIMG  -->
	 <img alt="livingmain" src="/KAKAO/img/����/livingmain.jpg" style="width: 100%; height: 80%;"> 

	<%
		}
	%>
	
	<!--����ī�װ�  -->
	<div class="topnav">
	  <a id="all" class="active" href="living.jsp">��ü</a>
	  <a id="livingAccessory" href="living.jsp?subtype=��Ȱ��ǰ">��Ȱ��ǰ</a>
	  <a id="bathroomWare" href="living.jsp?subtype=��ǿ�ǰ">��ǿ�ǰ</a>
	  <a id="kitchenware" href="living.jsp?subtype=�ֹ��ǰ">�ֹ��ǰ</a>
	  <a id="cupTumbler" href="living.jsp?subtype=��_�Һ�">��/�Һ�</a>
	  <a id="airFreshener" href="living.jsp?subtype=Ż��_������">Ż��/������</a>
	  <a id="fabric" href="living.jsp?subtype=�к긯">�к긯</a>
	  <input type="hidden"  id="subtype" value="<%=subtype%>">
	</div>
	
   <h3 style="margin-left: 230px;">�� <%=list.size() %>���� ��ǰ�� ��ȸ�Ǿ����ϴ�.</h3>
	
	<div id="outDiv">
		<div class="maindiv" align="center">
			<%
				for( ProductBean bean : list ){
			%>
			<form action="/KAKAO/main/order.jsp" method="get" >		
				<input type="hidden" name="job" value="product">
				<div class="gallery" style="height: 100%;">
					<a href="/KAKAO/main/productInfo.jsp?prono=<%=bean.getProno()%>"> <img src="/KAKAO/img/����/<%=bean.getMainimg() %>" width="600" height="400" >
					<label style="color: #316a7b; font-size:18px;  padding-top: 15px; padding-bottom: 5px;"><%=bean.getProname() %></label><br>
					<label style="color: #316a7b; font-size:18px; padding-bottom: 10px;"><%=NumberFormat.getInstance().format( bean.getPrice() )%></label><br>
					</a>
					<a href=""><button type="button" class="btn btn-info">���ϱ�</button></a>		
					<input type="hidden" name="proname" value="<%=bean.getProname() %>">
					<input type="hidden" name="picture" value="/KAKAO/img/����/<%=bean.getMainimg()%>"> 
					<input type="hidden" name="price" value="<%=bean.getPrice()%>"> 
					<input type="hidden" name="count" value="1"> 
					<%
						String id = (String)session.getAttribute("id");
						if(id==null){
					%>
						<a href="/KAKAO/main/login.jsp?state=idNull"><button type="button" class="btn btn-info">��ٱ���</button></a>
						<a href="/KAKAO/main/login.jsp?state=idNull"><button type="button" class="btn btn-info">�ֹ��ϱ�</button></a>				
					<%
						}else{
					%>
						<a href="/KAKAO/main/cartList.jsp?job=add&prono=<%=bean.getProno()%>&count=1"><button type="button" class="btn btn-info">��ٱ���</button></a>
						<button type="submit" class="btn btn-info">�ֹ��ϱ�</button>	
					<%
						}
					%>
					</div>
				</form>
			<%
				}
			%>		
		</div>
	</div>
	<jsp:include page="/main/footer.jsp" />
</body>
</html>