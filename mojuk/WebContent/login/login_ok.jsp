<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<jsp:useBean id="Login" class="mojuk.inhatc.connection" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		String idc = request.getParameter("id");
		String pwc = request.getParameter("pw");
		String id = "";
		String pw = "";

		ArrayList list = (ArrayList)Login.getLogin();
		for (int i = 0; i<list.size(); i=i+2) {
			if (list.get(i).equals(idc)) {
				id = (String)list.get(i);
				pw = (String)list.get(i+1);
				break;
			}
		}
		if (idc.equals(id) && pwc.equals(pw)) {
			session.setAttribute("idd", id);
			out.println("<script>");
			out.println("alert('로그인에 성공하셨습니다');");
			out.println("location.href='/'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('아이디 혹은 비밀번호를 확인하세요');");
			out.println("window.history.back()");
			out.println("</script>");
		}
	%>
</body>
</html>