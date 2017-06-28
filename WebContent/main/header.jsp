<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/Baegopang/css/bootstrap.min.css" rel="stylesheet">
<style>
	html{
		margin: 0 auto;
	}
	header{
	    padding: 1em;
	    border : 1px;
	    border-color : black;
	    color: black;
	    background-color: white;
	    clear: left;
	    text-align: center;
	  	margin: auto;
	    margin-bottom : 50px;
	    width: 1500px;
	}
	
	#mainTitle{
		margin-bottom: 5px;
	}
	
	#category{
		margin-bottom: 5px;
	}
	
	#mainTitle img{
		width: 400px;
		height: 190px;
	}
	
	#headerContainer{
		margin: auto;
	}
	
	#searchContainer{
		margin: o auto; 
		text-align: center;
	}
	#searchWindow{
		width: 300px;
		height: 28px;
		margin: 0 auto;
		
	}
	
</style>
<header>
		<div id="headerContainer">
			<div id="mainTitle" align="center">
				<a href="main.jsp">
					<img src="/KAKAO/img/logo/mainlogo.jpg">
				</a>
			</div>
			<div id="category" align="center">
				<a href="">
					<img src="/KAKAO/img/character.png">
				</a>
				<a href="">
					<img src="/KAKAO/img/category.png">
				</a>
				<a href="">
					<img src="/KAKAO/img/mypage.png">
				</a>
				<a href="">
					<img src="/KAKAO/img/center.png">
				</a>
				<a href="">
					<img src="/KAKAO/img/store.png">
				</a>
			</div>
			
			<div id="searchContainer" align="center">
				<table align="center">
					<tr>
						<td>
							<input type="text" id="searchWindow" class="form-control" placeholder="상품검색">
						</td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td>
							<a href="#" class="btn btn-primary btn-info"><span class="glyphicon glyphicon-search"></span></a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</header>