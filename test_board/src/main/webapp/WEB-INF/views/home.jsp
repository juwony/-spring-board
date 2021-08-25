<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<%@ include file = "include/header.jsp" %>
<%@ include file = "include/nav.jsp" %>


<article>
	<div class="container" role="main" style="text-align: center; margin-top: auto;">
	
		<div class="row" style="margin: 0px auto;">
			<div class="col-md-6 pr-1 pb-1">
				<img src="/resources/dist/img/바다1.jpg" alt="바다1" style="width: 450px; height: 450px; display: block; float: right;">
			</div>
			
			<div class="col-md-6 pl-1 pb-1">
 				<img src="/resources/dist/img/바다3.jpg" alt="바다2" style="width: 450px; height: 450px; display: block;">
 			</div>
 			
			<div class="col-md-6 pr-1 pt-1">
 				<img src="/resources/dist/img/바다4.jpg" alt="바다3" style="width: 450px; height: 450px; display: block; float: right;">
 			</div>
 			
			<div class="col-md-6 pl-1 pt-1">
 				<img src="/resources/dist/img/바다5.jpg" alt="바다4" style="width: 450px; height: 450px; display: block;">
 			</div>
        </div>
	</div>
</article>

</body>
<%@ include file = "include/footer.jsp" %>
</html>
