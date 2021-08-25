<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
 <title>회원 탈퇴</title> 
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/nav.jsp" %>

<article>
	<div class="container col-md-8" role="main" style="margin-top: 20px;">
		<div class="card">
		<div class="card-header" style="text-align: center; font-weight: bold;">회원 탈퇴</div>
		<br/>
		
		<div class="card-body">
			<form role="form" method="post" autocomplete="off">
				<div class="form-group row">
					<label for="userID" class="col-md-4 col-form-label text-md-right">아이디<span style="color: white;">*</span></label>
					<div class="col-md-5">
						<input type="text" class="form-control" id="userID" name="userID" value="${member.userID}" readonly="readonly" style="border: none; background-color: white;">
					</div>
				</div>

				<div class="form-group row">
					<label for="userPW" class="col-md-4 col-form-label text-md-right">비밀번호<span style="color: red;"> *</span></label>
					<div class="col-md-5">
						<input type="password" class="form-control" id="userPW" name="userPW" placeholder="비밀번호를 입력해 주세요">
					</div>
				</div>
				
				<div style="margin-top: 10px; text-align: center;">
					<button type="submit" class="btn btn-dark" id="submit" style="margin-right: 10px;">탈퇴하기</button>
					<button type="button" class="btn btn-dark" id="btnCancle" onclick="location.href='/member/update'">취소</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</article>

<c:if test="${msg == false}">
	<script>
		alert("비밀번호를 다시 입력해주세요.");
	</script>
</c:if>

<c:if test="${msg == true}">
	<script>
		alert("회원탈퇴가 완료되었습니다.");
		location.href="/";
	</script>
</c:if>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>