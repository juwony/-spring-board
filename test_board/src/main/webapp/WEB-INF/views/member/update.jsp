<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
 <title>회원 정보 수정</title> 
  <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
 <style>
 	.withdrawLink {
 		float: right; margin-top: 5px; text-decoration: none;
 	}
 </style>
</head>
<body>
<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/nav.jsp" %>

<article>
	<div class="container col-md-8" role="main" style="margin-top: 20px;">
		<div class="card">
		<div class="card-header" style="text-align: center; font-weight: bold;">마이페이지</div>
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
				
				<div class="form-group row">
					<label for="userPW" class="col-md-4 col-form-label text-md-right">비밀번호 확인<span style="color: red;"> *</span></label>
					<div class="col-md-5">
						<input type="password" class="form-control" id="userPW2" name="userPW2" placeholder="비밀번호를 입력해 주세요">
					</div>
				</div>				
				
				<div class="form-group row">
					<label for="userName" class="col-md-4 col-form-label text-md-right">이름<span style="color: red;"> *</span></label>
					<div class="col-md-5">
						<input type="text" class="form-control" id="userName" name="userName" value="${member.userName}">
					</div>
				</div>
				
				<div style="margin-top: 10px; text-align: center;">
					<button type="submit" class="btn btn-dark" id="btnSave" style="margin-right: 10px;">저장</button>
					<button type="button" class="btn btn-dark" id="btnCancle" onclick="location.href='/'">취소</button>
				</div>
			</form>
			</div>
		</div>
		<p><a class="withdrawLink text-dark" href="/member/withdraw">회원탈퇴</a></p>
	</div>
</article>

<script>
$(document).ready(function(){
	$("#btnSave").on("click", function(){
		if($("#userPW").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userID").focus();
			return false;
		}
		
		if($("#userPW2").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userPW2").focus();
			return false;
		}
		
		if($("#userName").val()==""){
			alert("이름을 입력해주세요.");
			$("#userName").focus();
			return false;
		}
		
		if($("#userPW").val() != $("#userPW2").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#userPW2").focus();
			return false;
		}
		
		alert("회원정보 변경이 완료되었습니다.");
	});
})
</script>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>