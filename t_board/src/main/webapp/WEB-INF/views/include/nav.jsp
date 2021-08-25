<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
        <a class="nav-link" href="/board/listPage?num=1">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/board/write">Write</a>
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
