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
	<div class="container container-body" role="main">
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
				<button type="submit" class="btn btn-dark" id="goListBtn">목록</button>
				<c:if test="${member.userName == view.writer}">
					<button type="button" class="btn btn-dark" id="removeBtn">삭제</button>
					<button type="button" class="btn btn-dark" id="modifyBtn">수정</button>
				</c:if>
			</div>
		</div>
		
		<!-- 댓글 -->
		<div class="my-3 p-3 bg-white rounded shadow-sm" style="paddig-top: 10px;">
			<!-- 댓글 조회 -->
			<div class="col-md-12 reply_info_box border-bottom">
				<span class="reply_title">
					댓글 [${view.reCnt}]
				</span>
			</div>

			<div id="replyList" style="margin-bottom: 20px;">
				<ul class="list-group">
					<c:forEach items="${reply}" var="reply">
						<li class="list-group-item border-bottom" style="border: none;">
							<div>
								<p>
									<b>${reply.writer}</b> 
									/ <fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd HH:mm"/>
									<c:if test="${member.userName == reply.writer}">
									<button type="button" class="btn btn-sm btn-outline-dark replyDelete" data-rno="${reply.rno}" id="replyDelete">삭제</button>
									<button type="button" class="btn btn-sm btn-outline-dark replyUpdate" data-rno="${reply.rno}" id="replyUpdate">수정</button>
									
									<script>
										$(".replyUpdate").click(function(){
											self.location = "/board/replyUpdate?bno=${view.bno}"
												+ "&page=${scri.page}"
												+ "&perPageNum=${scri.perPageNum}"
												+ "&searchType=${scri.searchType}"
												+ "&keyword=${scri.keyword}"
												+ "&rno=" + $(this).attr("data-rno");
										});
										
										$(".replyDelete").click(function(){
											self.location = "/board/replyDelete?bno=${view.bno}"
												+ "&page=${scri.page}"
												+ "&perPageNum=${scri.perPageNum}"
												+ "&searchType=${scri.searchType}"
												+ "&keyword=${scri.keyword}"
												+ "&rno=" + $(this).attr("data-rno");
										});
									</script>
									</c:if>
								</p>
								
								<p>${reply.content}</p>
								
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			
			<!-- 댓글 작성(로그인 사용자) -->
			<c:if test="${member.userName != null}">
			<form name = "replyForm" method="post" action="/reply/write">
				<input type='hidden' name='bno' value="${view.bno}">
				<div class="row">
					<div class="col-sm-10">
						<textarea class="form-control" rows="3" name="content" id="content" placeholder="댓글을 입력해 주세요." style="resize: none;"></textarea>
					</div>
					
					<div class="col-sm-2">
						<input type='text' class="form-control" name="writer" id="writer" value="${member.userName}" readonly="readonly" style="border: none; background-color: white; text-align: center;">
						<button type="submit" class="btn btn-dark" id="ReplyBtn" style="width: 100%; margin-top: 5px;">작성</button>
					</div>
				</div>
			</form>
			</c:if>
			
			<!-- 댓글 작성(로그인  x) -->
			<c:if test="${member.userName == null}">
			<form name = "replyForm" method="post" action="/reply/write">
				<input type='hidden' name='bno' value="${view.bno}">
				<div class="row">
					<div class="col-sm-10">
						<textarea class="form-control" rows="3" name="content" id="content" placeholder="로그인 후 이용해주세요." style="resize: none; background-color: white;" readonly="readonly"></textarea>
					</div>
					
					<div class="col-sm-2">
						<input type='text' class="form-control" name="writer" id="writer" value="${member.userName}" readonly="readonly" style="border: none; background-color: white; text-align: center;">
						<button type="submit" class="btn btn-dark" id="ReplyBtn" style="width: 100%; margin-top: 5px;" disabled>작성</button>
					</div>
				</div>
			</form>
			</c:if>
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
			if(!confirm("삭제하시겠습니까?")){
				false;
			} else {
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
				alert("삭제가 완료되었습니다.");
			}
		});
		
		$("#goListBtn").on("click", function() {
			self.location = "/board/listPageSearch?num=1";
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