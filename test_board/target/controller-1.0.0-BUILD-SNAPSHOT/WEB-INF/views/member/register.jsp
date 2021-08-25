<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
 <title>회원가입</title>
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
 <style>
 	label {
 		text-align: right;
 		margin-right: 10px;
 	}
 </style>
</head>
<body>
<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/nav.jsp" %>

<article>
	<div class="container col-md-8" role="main" style="margin-top: 20px;">
		<div class="card">
		<div class="card-header" style="text-align: center; font-weight: bold;">회원가입</div>
		<br/>
		
		<div class="card-body">
			<form role="form" method="post" autocomplete="off">
				<div class="form-group row">
					<label for="userID" class="col-md-3 col-form-label text-md-right">아이디<span style="color: red;"> *</span></label>
					<div class="col-md-5">
						<input type="text" class="form-control" id="userID" name="userID" placeholder="아이디를 입력해 주세요">
						<div class="result" style="margin-top: 5px;"><span class="msg">아이디를 확인해주세요.</span></div>
					</div>
					<div class="col-md-3">
						<button type="button" class="btn btn-primary idCheck">중복확인</button>
					</div>
				</div>

				<div class="form-group row">
					<label for="userPW" class="col-md-3 col-form-label text-md-right">비밀번호<span style="color: red;"> *</span></label>
					<div class="col-md-5">
						<input type="password" class="form-control" id="userPW" name="userPW" placeholder="비밀번호를 입력해 주세요">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="userName" class="col-md-3 col-form-label text-md-right">이름<span style="color: red;"> *</span></label>
					<div class="col-md-5">
						<input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력해 주세요">
					</div>
				</div>
				
				<div style="margin-top: 10px; text-align: center;">
					<button type="submit" class="btn btn-primary" id="btnRegister" style="margin-right: 10px;" disabled>회원가입</button>
					<button type="button" class="btn btn-primary" id="btnCancle" onclick="location.href='/'">취소</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</article>	


<script>
$(".idCheck").click(function() {
	var query = {userID : $("#userID").val()};
	
	$.ajax({
		url : "/member/idCheck",
		type : "post",
		data : query,
		success : function(data) {
			
			if(data == 1) {
				$(".result .msg").text("사용 불가");
				$(".result .msg").attr("style", "color:#f00")
				
				$("submit").attr("disabled", "disabled");
			} else {
				$(".result .msg").text("사용 가능");
				$(".result .msg").attr("style", "color:#00f")
				
				$("#btnRegister").removeAttr("disabled");
			}
		}
	});
});

$("#userID").keyup(function() {
	$(".result .msg").text("아이디를 확인해주세요.");
	$(".result .msg").attr("style", "color:#000");
	
	$("#submit").attr("disabled", "disabled");
});


$(document).ready(function(){
	$("#btnRegister").on("click", function(){
		if($("#userID").val()==""){
			alert("아이디를 입력해주세요.");
			$("#userID").focus();
			return false;
		}
		
		if($("#userPW").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userPW").focus();
			return false;
		}
		
		if($("#userName").val()==""){
			alert("이름을 입력해주세요.");
			$("#userName").focus();
			return false;
		}
			
		alert("회원가입이 완료되었습니다.");
	});
})

</script>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>