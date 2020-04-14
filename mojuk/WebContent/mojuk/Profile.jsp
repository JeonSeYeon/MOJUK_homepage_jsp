<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소개</title>
</head>
<body>
	<%-- <%@include file="../include/main_include.jsp"%>
	<!-- 이미지 -->
	<div id="list_img">
		<img src="../img/null_img.png" style="width: 1520px;">
	</div> --%>
	<jsp:useBean id="Profile" class="mojuk.inhatc.connection" scope="page" />
	<center>
		<%
			request.setCharacterEncoding("UTF-8");
			String img = null, name = null, content = null, location = null, position = null;
			ArrayList list = (ArrayList) Profile.getProfile();
			for (int i = 0; i < list.size(); i = i + 5) {
				img = (String) list.get(i);
				name = (String) list.get(i + 1);
				content = (String) list.get(i + 2);
				/* content = content.replaceAll("<br>","\r\n"); */
				location = (String) list.get(i + 3);
				position = (String) list.get(i + 4);
				System.out.println(position);
				
				if(position.equals("prof")){
					
		%>
		<h3>지도교수</h3>
		<table border="1" height="200px" width="500px"
			style="border-collapse: collapse; border:0px; margin:5px;">
			<tr>
				<td height="100px" width="150px">
				<img src="<%=request.getContextPath()%>/mojuk/upload/<%=img%>" height="150px" width="120px" style="margin: 20px;">
				</td>
				<td height="150px"><%=content%></td>
			</tr>
			<tr>
				<td style="text-align: center;"><%=name%></td>
				<td><%=location%></td>
			</tr>
		</table>
		<hr width="800px">
		<%
				}else if(position.equals("exec")){
					
		%>
		<h3>동아리 임원</h3>
		<table border="1" height="200px" width="500px"
			style="border-collapse: collapse; border:0px; margin:5px;">
			<tr>
				<td height="100px" width="150px">
				<img src="<%=request.getContextPath()%>/mojuk/upload/<%=img%>" height="150px" width="120px" style="margin: 20px;">
				</td>
				<td height="150px"><%=content%></td>
			</tr>
			<tr>
				<td style="text-align: center;"><%=name%></td>
				<td><%=location%></td>
			</tr>
		</table>
		<hr width="800px">
		<%
					
				}else if(position.equals("memb")){
					
		%>
		<h3>동아리 멤버</h3>
		<table border="1" height="200px" width="500px"
			style="border-collapse: collapse; border:0px; margin:5px;">
			<tr>
				<td height="100px" width="150px">
				<img src="<%=request.getContextPath()%>/mojuk/upload/<%=img%>" height="150px" width="120px" style="margin: 20px;">
				</td>
				<td height="150px"><%=content%></td>
			</tr>
			<tr>
				<td style="text-align: center;"><%=name%></td>
				<td><%=location%></td>
			</tr>
		</table>
		<hr width="800px">
		<%
					
				}
			}
			if (session.getAttribute("idd") == null) {
			} else if (session.getAttribute("idd").equals("root")) {
		%>
		<form action="write.jsp" style="margin: 5px;">
			<input type="submit" value="프로필 작성">
		</form>
		<%
			}
		%>
		<%-- <%@include file="../include/bottom.jsp"%> --%>
	</center>
</body>
</html>