<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<link href="/resources/bootstrap/css/view.css" rel="stylesheet" type="text/css">
</head>
<body>

<%@ include file = "../include/header.jsp" %> 
<%@ include file = "../include/nav.jsp" %>

<div class='popup back' style="display:none;"></div>
<div id="popup_front" class='popup front' style="display:none;"><img id="popup_img"></div>

<article>
	<div class="container" role="main">
		<div class="bg-white rounded shadow-sm">
		
		<form role="form" action="modify" method="post">
			<input type='hidden' name='bno' value="${view.bno}">
		</form>
		
			<div class="col-md-12 board_title">
				${view.title}
			</div>
			
			<div class="col-md-12 board_info_box">
				<span class="board_author">
					${view.writer} 
				</span>
				<span class="board_date">
				<fmt:formatDate value="${view.regDate}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate><br/>
				</span>
				<hr>
			</div>
			
			<div class="col-md-12 board_content">
				<pre style="font-family: inherit;">${view.content}</pre><br/>
			</div>
			
			<div class="col-md-12 board_file">
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
			</div>
			
			<div class="col-md-12 btn">
				<button type="submit" class="btn btn-primary" id="goListBtn">목록</button>

				<button type="button" class="btn btn-primary" id="removeBtn">삭제</button>

				<button type="button" class="btn btn-primary" id="modifyBtn">수정</button>
			</div>
		</div>
	</div>
</article>

<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			</span>
		</div>
</li>
</script>

<script>
$(document).ready(
	function() {
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$("#modifyBtn").on("click", function() {
					
			formObj.attr("action", "/board/modify");
			formObj.attr("method", "get");
			formObj.submit();
			
		});
		
		
		$("#removeBtn").on("click", function() {
			var arr = [];
			
			$(".uploadedList li").each(function(index) {
				arr.push($(this).attr("data-src"));
			});
			
			if(arr.length > 0) {
				$.post("/board/deleteAllFiles", {
					files : arr
				}, function() {
					
				});
			}
			
			formObj.attr("action", "/board/delete");
			formObj.submit();
			
		});
		
		$("#goListBtn").on("click", function() {
			self.location = "/board/listPage?num=1";
		});
				
		var bno = ${view.bno};
		var template = Handlebars.compile($("#templateAttach").html());
	
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
	});
</script>

<%@ include file = "../include/footer.jsp" %>
</body>
</html>