<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
<link href="/resources/bootstrap/css/view.css" rel="stylesheet" type="text/css">
</head>
<body>

<%@ include file = "../include/header.jsp" %> 
<%@ include file = "../include/nav.jsp" %>

<article>
	<div class="container" role="main">
		<div class="bg-white rounded shadow-sm">
			<div class="replyBody col-md-12">
				<form role="form" method="post" autocomplete="off">
					<input type="hidden" id="bno" name="bno" value="${reply.bno}" readonly="readonly">
					<input type="hidden" id="rno" name="rno" value="${reply.rno}" readonly="readonly">
					<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly">
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly">
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly">
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly">
					
					<div class="replyContent col-md-12">
						<textarea class="form-control" rows="3" name="content" id="content"style="resize: none;">${reply.content}</textarea>
					</div>
					
					<div class="replyFooter col-md-12" style="margin-top: 15px; margin-bottom: 15px;">
						<button class="btn btn-primary" type="submit" style="margin-right: 10px; margin-bottom: 15px;">수정</button>
						<button class="btn btn-primary" type="button" id="cancleBtn" style="margin-bottom: 15px;">취소</button>
						
						<script>
						var formObj = $("form[role='form']");
						
						$("#cancleBtn").click(function(){
							self.location = "/board/view?bno=${reply.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}";
						});
						</script>
					</div>
				</form>			
			</div>
		</div>
	</div>
</article>

<%@ include file = "../include/footer.jsp" %>
</body>
</html>