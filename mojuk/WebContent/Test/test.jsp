<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>My Now Amazing Webpage</title>
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flickity@2/dist/flickity.css" />
</head>
<body>
	<h1>Flickity - autoPlay</h1>

	<!-- Flickity HTML init -->
	<div class="carousel" data-flickity='{ "autoPlay": true }'>
		<div class="carousel-cell">
			<img src="../img/test/slide1.jpg" width="400px">
		</div>
		<div class="carousel-cell">
			<img src="../img/test/slide2.jpg" width="400px">
		</div>
		<div class="carousel-cell">
			<img src="../img/test/slide3.jpg" width="400px">
		</div>
		<div class="carousel-cell">
			<img src="../img/test/slide4.jpg" width="400px">
		</div>
	</div>

	<script type="text/javascript"
		src="https://npmcdn.com/flickity@2/dist/flickity.pkgd.js"></script>
</body>
</html>
