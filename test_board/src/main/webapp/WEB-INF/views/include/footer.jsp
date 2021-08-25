<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

<style>
	.footer {
		width: 100%;
		position: absolute;
		bottom: 0;
		left: 0;
		background-color: white;
		display: block;
		margin-top: -100px;
	}
</style>

</head>
<body>
	<!-- 
    <footer class="footer mt-auto py-3 bg-light navbar-fixed-bottom">
    	<div class="footer-container" style="text-align: center;">
    		<span class="text-muted">JUWONY</span>
    	</div>
    </footer>
     -->
     
<div class="container">
	<footer class="footer d-flex flex-wrap justify-content-between align-items-center py-3 border-top">
	    <p class="col-md-4 mb-0 text-muted">© 2021 Company, Inc</p>
	
	    <a href="/">
			<img src="/resources/dist/img/춘식이고심이.jpg" alt="" width="70">
		</a>
	
	   	<ul class="nav col-md-4 justify-content-end">
	   		<li class="nav-item"><a href="/" class="nav-link px-2 text-muted">Home</a></li>
	   		<li class="nav-item"><a href="/board/listPageSearch?num=1" class="nav-link px-2 text-muted">Board</a></li>
	   		<li class="nav-item"><a href="/board/write" class="nav-link px-2 text-muted">Write</a></li>
	   		<li class="nav-item"><a href="/board/chunsik" class="nav-link px-2 text-muted">Chun-sik</a></li>
	   		<li class="nav-item"><a href="/board/william" class="nav-link px-2 text-muted">William</a></li>
	   	</ul>
	</footer>
</div> 
</body>
</html>