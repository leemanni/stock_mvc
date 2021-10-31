<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		<!-- 대입문, 제어문 -->
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		<!-- 서식 -->
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 	<!-- 함수 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 자산 이야기</title>
<link rel="shortcut icon" href="images/coin.png">
<link rel="stylesheet" href="./css/styles.css">
</head>
<body>
<div class="container">
	<header class="login-header">
		<c:set var="flag" value="${flag}"/>
		<a href="#">
			<h1>당신임을 증명해주세요</h1>
		</a>
		<c:if test="${flag == null}">
			<p>
				이 페이지는 제작자 본인만 들어 갈 수 있습니다. <br/>
				하지만 ID 와 PW 을 맞추면 들어가실 수 있습니다.<br/>
			</p>
			<p>
				(맞춰 보세요)
			</p>
		</c:if>
		<c:if test="${flag == false}">
			<p id="login-error">
				아이디와 패스워드가 일치하지 않습니다.
			</p>
		</c:if>
	</header>
	
	<form class="login-form" action="main.jsp" method="post" >
		<input type="text" id="id" name="id" placeholder="Your ID">
		<input type="password" id="pw" name="pw" placeholder="Your PW">
		<input class="login-form__submit" type="submit" value="Login">
	</form>
</div>

<footer class="footermain">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h5>copyright</h5>
				<h5>&copy;leemanni(이원희)</h5>
			</div>
			<div class="col-sm-6">
				<h5>github</h5>
				<h5><a class="foot-a" href="https://github.com/leemanni"><i class="fab fa-github"></i>&nbsp;leemanni's github</a></h5>
			</div>
		</div>
	</div>
</footer>

<script src="https://kit.fontawesome.com/27afa53023.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
<script type="text/javascript"src="./js/formCheck.js"></script>
</body>
</html>	 