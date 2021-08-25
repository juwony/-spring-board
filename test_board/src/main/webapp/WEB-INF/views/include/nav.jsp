<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.nav-link {
	    text-decoration: none;
	}
	
	.text-end {
    	text-align: right!important;
	}
</style>
<!-- 
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
-->
<div class="container">
	<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      	<a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        	<img src="/resources/dist/img/춘식이얼굴2.jpg" alt="" width="65">
      	</a>

      	<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        	<li><a href="/" class="nav-link px-2 text-secondary">Home</a></li>
        	<li><a href="/board/listPageSearch?num=1" class="nav-link px-2 text-dark">Board</a></li>
        	<li><a href="/board/write" class="nav-link px-2 text-dark">Write</a></li>
        	<li><a href="/board/chunsik" class="nav-link px-2 text-dark">Chun-sik</a></li>
        	<li><a href="/board/william" class="nav-link px-2 text-dark">William</a></li>
      	</ul>
		<c:if test="${member == null}">
	      	<div class="col-md-3 text-end">
	        	<button type="button" class="btn btn-outline-dark me-2" onclick="location.href='/member/login'">Login</button>
	        	<button type="button" class="btn btn-dark" onclick="location.href='/member/register'">Sign-up</button>
	    	</div>
    	</c:if>
    	
 		<c:if test="${member != null}">
	      	<div class="col-md-3 text-end">
	      		<button type="button" class="btn btn-outline-dark me-2" onclick="location.href='/member/update'">${member.userName}님</button>
	        	<button type="button" class="btn btn-dark" onclick="location.href='/member/logout'">Logout</button>
	    	</div>
    	</c:if>   	
	</header>
</div>