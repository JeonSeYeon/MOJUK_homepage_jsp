<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ErrorPage</title>
</head>
<body>
	<H1>에러가 났습니당!</H1>
	<%
		System.out.println("500 에러");
	%>
	<script>
		location.href = "../error/ErrorPage.jsp";
	</script>
</body>
</html>