<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/mojuk?characterEncoding=utf8&amp;useSSL=false&amp;autoReconnection=true";
	String id = "root";
	String pass = "1234";
	
	PrintWriter out1 = response.getWriter();
	
	String name = "";
	String password = "";
	String title = "";
	String memo = "";
	int idx = Integer.parseInt(request.getParameter("idx"));

	try {

		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT USERNAME, TITLE, MEMO FROM notice WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {

			name = rs.getString(1);
			title = rs.getString(2);
			memo = rs.getString(3);
			memo = memo.replaceAll("<br>", "\r\n");
		}

		rs.close();
		stmt.close();
		conn.close();

	} catch (SQLException e) {
		out.println(e.toString());
	}
	if (session.getAttribute("idd") != name){
		out1.println("<script language='javascript'>");
		out1.println("alert('권한이 없습니다');");
		out1.println("history.back(-1)");
		out1.println("</script >");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
</head>
<body>
	<%@include file="../include/main_include.jsp"%>
	<!-- 이미지 -->
	<div id="list_img">
		<img src="../img/Board.png" style="width: 1520px;">
	</div>
	<center>
		<table>
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr
							style="background: url('../img/table_mid.gif') repeat-x; text-align: center;">
							<td width="5"><img src="../img/table_left.gif" width="5"
								height="30" /></td>
							<td>수정</td>
							<td width="5"><img src="../img/table_right.gif" width="5"
								height="30" /></td>
						</tr>
					</table>

					<form name=modifyform method=post
						action="Board_Modify_Action.jsp?idx=<%=idx%>">
						<table>
							<tr>
								<td>&nbsp;</td>
								<td align="center">제목</td>
								<td><input name="title" size="50" maxlength="100" value="<%=title%>"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">이름</td>
								<td><%=name%><input type=hidden name=name size=50
									maxlength=50 value="<%=name%>"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">내용</td>
								<td><textarea name="memo" cols="50" rows="13"><%=memo%></textarea></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr height="1" bgcolor="#82B5DF">
								<td colspan="4"></td>
							</tr>
							<tr align="center">
								<td>&nbsp;</td>
								<td colspan="2"><input type=submit value="수정"> <input
									type=button value="취소" OnClick="javascript:history.back(-1)">
								<td>&nbsp;</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</center>
	<%@include file="../include/bottom.jsp"%>
	<script language="javascript">
		// 자바 스크립트 시작

		function modifyCheck() {
			var form = document.modifyform;

			if (!form.password.value) {
				alert("비밀번호를 적어주세요");
				form.password.focus();
				return;
			}

			if (!form.title.value) {
				alert("제목을 적어주세요");
				form.title.focus();
				return;
			}

			if (!form.memo.value) {
				alert("내용을 적어주세요");
				form.memo.focus();
				return;
			}
			form.submit();
		}
	</script>
</body>
</html>