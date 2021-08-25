<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<link href="/resources/bootstrap/css/write.css" rel="stylesheet" type="text/css">
</head>
<body>

<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/nav.jsp" %>
<article>
	<div class="container" role="main">
		<div class="bg-white rounded shadow-sm" id="main">
		
		<c:if test="${msg == null}">
		<form id="registerForm" role="form" method="post" enctype="multipart/form-data">
			
		
			<div class="col-md-12 board_title">
				<input type="text" class="form-control" name="title" id="title" placeholder="제목">
				<hr>
			</div>
			
			<div class="col-md-12 board_info_box">
				<input type='hidden' class="form-control" name="writer" id="writer" value="${member.userName}"><br />
			</div>			
			
			<div class="col-md-12 board_content">
				<textarea class="form-control" rows="15" name="content" id="content" placeholder="내용을 자유롭게 작성해보세요."></textarea>
			</div>
			
			<div class="col-md-12 board_file">
				<div class="fileDrop">파일 첨부</div>
			</div>
			
			<div class="col-md-12 box-footer">
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
				<button type="button" class="btn btn-primary" id="goListBtn">취소</button>
				<button type="submit" class="btn btn-primary" id="writeBtn" style="margin-right: 10px;">작성</button>
			</div>
		</form>
		</c:if>
		
		<c:if test="${msg == false}">
			<script>
				alert("로그인 후 이용해주세요.");
				location.href="/member/login";
			</script>
		</c:if>	
		</div>
	</div>

</article>

<script id="template" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment" style="height: 100px;"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
				<i class="fa fa-fw fa-remove"></i>
			</a>
		</div>
	</li>
</script>

<script>
	$("#goListBtn").on("click", function() {
		self.location = "/board/listPageSearch?num=1";
	});
	
	var template = Handlebars.compile($("#template").html());
		
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
		
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
			
		var files = event.originalEvent.dataTransfer.files;
			
		var file = files[0];
			
		var formData = new FormData();
			
		formData.append("file", file);
			
		$.ajax({
			url: '/board/uploadAjax',
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data) {
					var fileInfo = getFileInfo(data);
					var html = template(fileInfo);
						
					$(".uploadedList").append(html);
			}
		});
	});
		
	$("#registerForm").submit(function(event){
		event.preventDefault();
			
		var that = $(this);
			
		var str = "";
		
		$(".uploadedList .delbtn").each(function(index){
			str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
			
		that.append(str);
			
		that.get(0).submit();
	});
		
	$(".uploadedList").on("click", ".delbtn", function(event){
			
		event.preventDefault();
			
		var that = $(this);
			 
		$.ajax({
		  url:"/board/deleteFile",
		  type:"post",
		   data: {fileName:$(this).attr("href")},
		   dataType:"text",
		   success:function(result){
			   if(result == 'deleted'){
				   that.closest("li").remove();
			   }
		   }
	   });
	});
		
	$(document).ready(function(){
		$("#writeBtn").on("click", function(){
			if($("#title").val()==""){
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return false;
			}
				
			if($("#writer").val()==""){
				alert("작성자를 입력해주세요.");
				$("#writer").focus();
				return false;
			}
				
			if($("#content").val()==""){
				alert("내용을 입력해주세요.");
				$("#content").focus();
				return false;
			}
					
			alert("글이 작성되었습니다.");
		});
	})
</script>

<%@ include file = "../include/footer.jsp" %>
</body>
</html>
