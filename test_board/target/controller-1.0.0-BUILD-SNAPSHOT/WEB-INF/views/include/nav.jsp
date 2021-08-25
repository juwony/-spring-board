<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="/" class="nav-link px-2 link-secondary">Home</a></li>
        <li><a href="/board/listPage?num=1" class="nav-link px-2 link-dark">List</a></li>
        <li><a href="/board/write" class="nav-link px-2 link-dark">Write</a></li>
      </ul>

      <div class="col-md-3 text-end">
      	<c:if test="${member == null}">
      		<button type="button" class="btn btn-outline-primary me-2" onclick="location.href='/'">Login</button>
      		<button type="button" class="btn btn-primary">Sign-up</button>
      	</c:if>
        
        <c:if test="${member != null}">
        	<p>${member.userName}님</p>
        	<button type="button" class="btn btn-primary" onclick="location.href='/member/logout'">Logout</button>
        </c:if>
      </div>
</header>
--%>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <a class="navbar-brand" href="/">JUWONY</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>



  <div class="collapse navbar-collapse" id="navbarsExample03">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/board/listPageSearch?num=1">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/board/write">Write</a>
      </li> 
      <li class="nav-item">
      	<a class="nav-link" href="/board/chunsik">chun-sik</a>
      </li>     
    </ul>
    
    <c:if test="${member == null}">
      	<button type="button" class="btn btn-primary" onclick="location.href='/member/login'" style="margin-right: 10px;">Login</button>
      	<button type="button" class="btn btn-primary" onclick="location.href='/member/register'">Sign-up</button>
      </c:if>
        
    <c:if test="${member != null}">
    	<a class="nav-link" href="/member/update" style="color: white; margin-bottom: 2px">${member.userName}님</a>
        <button type="button" class="btn btn-primary" onclick="location.href='/member/logout'" style="margin-left: 10px;">Logout</button>
    </c:if>

  </div>
</nav>


<%--
<ul> 
	<li>
  		<a href="/board/listPage?num=1">글 목록</a> 
 	</li>
 
 	<li>
  		<a href="/board/write">글 작성</a> 
 	</li>
 	
 	<c:if test="${member == null}">
 		<li>
			<a href="/">로그인</a>
		</li>
	</c:if>
 	
 	<c:if test="${member != null}">
 		<li>
 			<p>${member.userName} 님 환영합니다.</p>
 		</li>
 		
 		<li>
			<a href="/member/logout">로그아웃</a>
		</li>
 	</c:if>
 	
</ul>
 --%>
