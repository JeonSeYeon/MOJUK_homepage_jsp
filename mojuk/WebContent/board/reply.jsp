<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<script language="javascript">
	// 자바 스크립트 시작

	function replyCheck() {
		var form = document.replyform;

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

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String url = "jdbc:mysql://localhost:3306/mojuk?characterEncoding=utf8&amp;useSSL=false&amp;autoReconnection=true";
	String id = "root";
	String pass = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	String title = "";

	try {

		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT TITLE FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			title = rs.getString(1);
		}

		rs.close();
		stmt.close();
		conn.close();

	} catch (SQLException e) {

	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
</head>
<body>
	<center>
		<%@include file="../include/main_include.jsp"%>
		<!-- 이미지 -->
		<div id="list_img">
			<img src="../img/Board.png" style="width: 1520px;">
		</div>
		<form name=replyform method=post action="reply_ok.jsp?idx=<%=idx%>">
			<table>
				<tr>
					<td>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr
								style="background: url('photo/table_mid.gif') repeat-x; text-align: center;">
								<td width="5"><img src="photo/table_left.gif" width="5"
									height="30" /></td>
								<td>답글</td>
								<td width="5"><img src="photo/table_right.gif" width="5"
									height="30" /></td>
							</tr>
						</table>
						<table>
							<tr>
								<td>&nbsp;</td>
								<td align="center">제목</td>
								<td><input name="title" size="50" maxlength="100"
									value="<%=title%>"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">이름</td>
								<td><input name="name" size="50" maxlength="50" value="<%=session.getAttribute("idd") %>" readonly style="border:0px;"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">내용</td>
								<td><textarea name="memo" cols="50" rows="13"></textarea></td>
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
								<td colspan="2"><input type=button value="등록"
									OnClick="javascript:replyCheck();"> <input type=button
									value="취소" OnClick="javascript:history.back(-1)">
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
		<%@include file="../include/bottom.jsp"%>
	</center>
</body>
</html>


