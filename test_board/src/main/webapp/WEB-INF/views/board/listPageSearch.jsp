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
	<!-- 검색 -->
	<div class="form-group row search">
		<div style="margin-right: 10px;">
 			<select name="searchType" class="form-control" style="width: 120px;">
     			<option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>제목</option>
   		    	<option value="content" <c:if test="${searchType eq 'content'}">selected</c:if>>내용</option>
   		    	<option value="title_content" <c:if test="${searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
				<option value="writer" <c:if test="${searchType eq 'writer'}">selected</c:if>>작성자</option>
 			</select>
 		</div>
 	
 		<div class="form-inline">
 			<div class="form-group">
				<input type="text" class="form-control" name="keyword" value="${keyword}" style="margin-right: 10px;">
			</div>
				<button type="button" id="searchBtn" class="btn btn-dark">검색</button>
 		</div>
 	
 		<script>

 			document.getElementById("searchBtn").onclick = function () {
    
  			let searchType = document.getElementsByName("searchType")[0].value;
  			let keyword =  document.getElementsByName("keyword")[0].value;
  
  			location.href = "/board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
 			
 			};
		</script>
	</div>
	
	<div class="table-responsive">
	<table class="table table-hover table-sm">
		<colgroup>
			<col style="width: 8%;"/>
			<col style="width: auto%;"/>
			<col style="width: 15%;"/>
			<col style="width: 10%;"/>
			<col style="width: 10%;"/>
		</colgroup>
		
 		<thead class="bg-light">
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
  						<a class="board-title text-dark" href="/board/view?bno=${list.bno}">${list.title}
  							<c:if test="${list.reCnt > 0}">
  								<span> [${list.reCnt}]</span>
  							</c:if>
  						</a>
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
		<button type="button" class="btn btn-dark" id="btnWriteForm" onclick="location.href='/board/write'">글쓰기</button>
	</div>
	
	<br><br>
		
	<!-- 페이징 -->
	<div class="paging">
		<div class="paging-body">
		<ul class="pagination my">
			<c:if test="${page.prev}">
				<li class="page-item">
					<a class="page-link" href="/board/listPageSearch?num=${page.startPageNum - 1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>
					
			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		
				<c:if test="${select != num}">
					<li class="page-item"><a class="page-link" href="/board/listPageSearch?num=${num}">${num}</a></li>
				</c:if>
						
				<c:if test="${select == num}">
					<li class="page-item active"><a class="page-link" href="/board/listPageSearch?num=${num}">${num}</a></li>
				</c:if>
		
			</c:forEach>
				
			<c:if test="${page.next}">
				<li class="page-item">
					<a class="page-link" href="/board/listPageSearch?num=${page.endPageNum + 1}" aria-label="Next">
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