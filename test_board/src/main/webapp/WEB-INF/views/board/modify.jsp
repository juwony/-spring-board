<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<link href="/resources/bootstrap/css/modify.css" rel="stylesheet" type="text/css">
</head>
<body>

<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/nav.jsp" %>

<article>
	<div class="container container-body" role="main" style="margin-top: 50px;">
		<div class="bg-white rounded shadow-sm">
		
		<form role="form" action="modify" method="post">
			<input type='hidden' name='bno' value="${view.bno}">
		
			<div class="col-md-12 board_title">
				<input type="text" class="form-control" name="title" id="title" value="${view.title}">
				<hr>
			</div>
			
			<div class="col-md-12 board_info_box">
				<input type='hidden' class="form-control" name="writer" id="writer" value="${view.writer}"><br />
			</div>			
			
			<div class="col-md-12 board_content">
				<textarea class="form-control" rows="15" name="content" id="content">${view.content}</textarea>
			</div>
			
			<div class="col-md-12 board_file">
				<div class="fileDrop">파일 첨부</div>
			</div>
			
			<div class="col-md-12 box-footer">
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
				<button type="button" class="btn btn-dark" id="goListBtn">취소</button>
				<button type="submit" class="btn btn-dark" id="writeBtn" style="margin-right: 10px;">작성</button>
			</div>
		</form>
		</div>
	</div>
</article>

<script id="template" type="text/x-handlebars-template">
<li>
	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
			</span>
		</div>
</li>
</script>

<script>
$(document).ready(
	function() {
		
		
		var formObj = $("form[role='form']");
		
		formObj.submit(function(event){
			event.preventDefault();
			
			var that = $(this);
			
			var str = "";
			$(".uploadedList .delbtn").each(function(index) {
				str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") + "'> ";
			});
			
			that.append(str);
			
			console.log(str);
			
			that.get(0).submit();
		});
		
		$("#goListBtn").on("click", function(){
			self.location = "/board/view?bno=${view.bno}";
		});
	});
	
	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event) {
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
	
	$(".uploadedList").on("click", ".delbtn", function(event){
		event.preventDefault();
		
		var that = $(this);
		
		$.ajax({
			url: "/board/deleteFile",
			type: "post",
			data: {fileName:$(this).attr("href")},
			dataType: "text",
			success: function(result){
				if(result == 'deleted'){
					that.closest("li").remove();
				}
			}
		});
	});
		
	var bno = ${view.bno};
	var template = Handlebars.compile($("#template").html());
	
	$.getJSON("/board/getAttach/" + bno, function(list) {
		$(list).each(function() {
	
			var fileInfo = getFileInfo(this);
	
			var html = template(fileInfo);
	
			$(".uploadedList").append(html);
	
		});
	});
	
	$(".uploadedList").on("click", ".mailbox-attachment-info a",
		function(event) {
	
			var fileLink = $(this).attr("href");
	
			if (checkImageType(fileLink)) {
	
				event.preventDefault();
	
				var imgTag = $("#popup_img");
				imgTag.attr("src", fileLink);
	
				console.log(imgTag.attr("src"));
	
				$(".popup").show('slow');
				imgTag.addClass("show");
			}
		});
	
	$("#popup_img").on("click", function() {
	
		$(".popup").hide('slow');
	
	});
	
</script>

<%@ include file = "../include/footer.jsp" %>
</body>
</html>