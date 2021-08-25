<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 삭제</title>
<link href="/resources/bootstrap/css/view.css" rel="stylesheet" type="text/css">
</head>
<body>

<%@ include file = "../include/header.jsp" %> 
<%@ include file = "../include/nav.jsp" %>

<article>
	<div class="container text-center" role="main">
		<div class="bg-white rounded shadow-sm">
			<form role="form" method="post" autocomplete="off">
				<input type="hidden" id="bno" name="bno" value="${reply.bno}" readonly="readonly">
				<input type="hidden" id="rno" name="rno" value="${reply.rno}" readonly="readonly">
				<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly">
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly">
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly">

				
				<div style="margin-bottom: 10px;">
					정말로 삭제하시겠습니까?
				</div>
				
				<p>
					<button type="submit" class="btn btn-primary" style="margin-right: 10px; margin-bottom: 15px;">확인</button>
					<button type="button" id="cancleBtn" class="btn btn-primary" style="margin-bottom: 15px;">취소</button>
					
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
				</p>
			</form>
		</div>
	</div>
</article>

<%@ include file = "../include/footer.jsp" %>
</body>
</html>