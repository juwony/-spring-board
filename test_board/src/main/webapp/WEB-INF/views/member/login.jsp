<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>로그인</title>

<style>
	body{
		padding: 0px;
	}
	
	#title_body {
		width: 100%;
		float: left;
	}
	
	a{
		text-decoration: none;
	}
</style>
<link href="../resources/bootstrap/css/signin.css" rel="stylesheet">
</head>
<body class="text-center">
	<%@ include file = "../include/header.jsp" %>

	<main class="form-signin">
		<div class="container">
		<form role="form" class="form-signin" method="post" autocomplete="off" action="/member/login">
		<a href="/">
			<img class="mb-4" src="/resources/dist/img/춘식이셀카.gif" alt="" width="150">
	    </a>
	    <h1 class="h3 mb-3 fw-normal">Sign in</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" id="userID" name="userID" placeholder="ID">
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="userPW" name="userPW" placeholder="Password">
	    </div>
	
	
	    <button class="w-100 btn btn-lg btn-dark" type="submit">Sign in</button>
		<p><a class="text-dark" href="/member/register">Sign up</a></p>
	  	</form>
	  	
	  	<c:if test="${msg == false}">
	  		<script>
	  			alert("아이디 또는 비밀번호를 다시 입력해주세요.");
	  		</script>
	  	</c:if>
	  	
	  	<c:if test="${msg == true}">
	  		<script>
	  			location.href="/";
	  		</script>	
	  	</c:if>
	  	</div>
	</main>
</body>

</html>
