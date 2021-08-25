<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<link rel="stylesheet" href="/resources/bootstrap/css/listPage.css">
</head>
<body>

<div id="header">
	<%@ include file = "../include/header.jsp" %>
</div>

<div id="nav">
	<%@ include file = "../include/nav.jsp" %>
</div>

	
<div class="container">
	<div class="table-responsive">
	<table class="table table-striped table-sm">
		<colgroup>
			<col style="width: 8%;"/>
			<col style="width: auto%;"/>
			<col style="width: 15%;"/>
			<col style="width: 10%;"/>
			<col style="width: 10%;"/>
		</colgroup>
		
 		<thead>
 			<tr>
   				<th>번호</th>
   				<th style="text-align: left; !important">제목</th>
   				<th>작성자</th>
   				<th>조회수</th>
   				<th>작성일</th>
  			</tr>
 		</thead>
 
 		<tbody>
  			<c:forEach items="${list}" var="list">
 				<tr>
  					<td>${list.bno}</td>
  					<td style="text-align: left;">
  						<a href="/board/view?bno=${list.bno}">${list.title}</a>
  					</td>
  					<td>${list.writer}</td>
  					<td>${list.viewCnt}</td>
  					<td>
  						<fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
  					</td>
 				</tr>
			</c:forEach>
 		</tbody>
	</table>
	</div>
	
	<div>
		<button type="button" class="btn btn-primary" id="btnWriteForm" onclick="location.href='/board/write'">글쓰기</button>
	</div>
<br><br>
<!-- 페이징 -->
<div class="paging">
	<div class="paging-body">
	<ul class="pagination">
		<c:if test="${page.prev}">
			<li class="page-item">
				<a class="page-link" href="/board/listPage?num=${page.startPageNum - 1}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
		</c:if>
			
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">

			<c:if test="${select != num}">
				<li class="page-item"><a class="page-link" href="/board/listPage?num=${num}">${num}</a></li>
			</c:if>
				
			<c:if test="${select == num}">
				<li class="page-item active"><a class="page-link" href="/board/listPage?num=${num}">${num}</a></li>
			</c:if>

		</c:forEach>
		
		<c:if test="${page.next}">
			<li class="page-item">
				<a class="page-link" href="/board/listPage?num=${page.endPageNum + 1}" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</c:if>
	</ul>
</div>
</div>	
	
</div>


<%@ include file = "../include/footer.jsp" %>	
</body>
</html>