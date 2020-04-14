<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ErrorPage</title>
</head>
<body>
	<H1>죄송합니다.</H1>
	<H2>에러가 발생했습니다!</H2>
	<H3 id="h3"></H3>
	
	<script>
		var h3 = document.getElementById("h3");
		var i = 3;
		setInterval(function() {
			/* for(var i = 5; i>=1; i--){
				h3.innerHTML = i + "초 후 메인 페이지로 이동합니다.";
			} */
			
			h3.innerHTML = i + "초 후 메인 페이지로 이동합니다.";
			i--;
		}, 1000);
		setTimeout(function() {
			location.href = "../index.jsp";
		}, 4000);
	</script>
</body>
</html>