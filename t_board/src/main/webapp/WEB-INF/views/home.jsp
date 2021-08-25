<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>

<style>
	img {
		width: 500px;
		height: 250px;
	}
</style>

<link href="/resources/bootstrap/css/slide.css" rel="stylesheet" type="text/css">

</head>
<body>
<%@ include file = "include/header.jsp" %>
<%@ include file = "include/nav.jsp" %>


<article>
	<div class="container" role="main" style="text-align: center; margin-top: 100px;">
		<div class="slideshow-container">
	
	    	<!-- Full-width images with number and caption text -->
	      	<div class="mySlides fade">
	        	<img src="/resources/dist/img/윌리엄(소노).gif">
	      	</div>
	
	      	<div class="mySlides fade">
	        	<img src="/resources/dist/img/윌리엄(중노).gif">
	      	</div>
	
	      	<div class="mySlides fade">
	        	<img src="/resources/dist/img/윌리엄(대노).gif">
	      	</div>
	
	      	<div class="mySlides fade">
	        	<img src="/resources/dist/img/윌리엄(극대노).gif">
	      	</div>
	
	    </div>
	    <br/>
	
	    <!-- The dots/circles -->
	    <div style="text-align:center">
	      	<span class="dot" onclick="currentSlide(0)"></span>
	      	<span class="dot" onclick="currentSlide(1)"></span>
	      	<span class="dot" onclick="currentSlide(2)"></span>
	      	<span class="dot" onclick="currentSlide(3)"></span>
	    </div>
	</div>
</article>

<script>
	var slideIndex = 0; //slide index
	
	//HTML 로드가 끝난 후 동작
	window.onload=function(){
	showSlides(slideIndex);
	
	// Auto Move Slide
	var sec = 1500;
	setInterval(function(){
	 slideIndex++;
	 showSlides(slideIndex);
	
	}, sec);
	}
	
	//Thumbnail image controls
	function currentSlide(n) {
	slideIndex = n;
	showSlides(slideIndex);
	}
	
	function showSlides(n) {
	
	var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("dot");
	var size = slides.length;
	
	if ((n+1) > size) {
	 slideIndex = 0; n = 0;
	}else if (n < 0) {
	 slideIndex = (size-1);
	 n = (size-1);
	}
	
	for (i = 0; i < slides.length; i++) {
	   slides[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
	   dots[i].className = dots[i].className.replace(" active", "");
	}
	
	slides[n].style.display = "block";
	dots[n].className += " active";
	}
</script>

<%@ include file = "include/footer.jsp" %>
</body>
</html>
