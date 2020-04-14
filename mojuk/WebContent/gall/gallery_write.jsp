<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PrintWriter out1 = response.getWriter();
	if (session.getAttribute("idd") == null){
		out1.println("<script language='javascript'>");
		out1.println("alert('권한이 없습니다');");
		out1.println("history.back(-1)");
		out1.println("</script >");
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
</head>
<body>
	<%@include file="../include/main_include.jsp"%>
	<table align="center">
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr
						style="background: url('../img/table_mid.gif') repeat-x; text-align: center;">
						<td width="5"><img src="../img/table_left.gif" width="5"
							height="30" /></td>
						<td>글쓰기</td>
						<td width="5"><img src="../img/table_right.gif" width="5"
							height="30" /></td>
					</tr>
				</table>
				<form name=writeform method=post enctype="multipart/form-data"
					action="gallery_write_ok.jsp">
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center">제목</td>
							<td><input name="title" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">이름</td>
							<td><input name="UserName" maxlength="50" value="<%=session.getAttribute("idd")%>" readonly style="border:0px; float:left;"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">첨부파일</td>
							<td><input type="file" name="FilePath" size="50"
								maxlength="50"></td>
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
							<td colspan="2"><input type=submit value="등록"
								OnClick="javascript:writeCheck();"> <input type=button
								value="취소" OnClick="javascript:history.back(-1)">
							<td>&nbsp;</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
	<script language="javascript">
		// 자바 스크립트 시작
		function writeCheck() {
			var form = document.writeform;

			if (!form.Username.value) // form 에 있는 name 값이 없을 때
			{
				alert("이름을 적어주세요"); // 경고창 띄움
				form.name.focus(); // form 에 있는 name 위치로 이동
				return;
			}

			if (!form.title.value) {
				alert("제목을 적어주세요");
				form.title.focus();
				return;
			}

			if (!form.Contents.value) {
				alert("내용을 적어주세요");
				form.memo.focus();
				return;
			}

			form.submit();
		}
	</script>
	<%@include file="../include/bottom.jsp"%>
</body>
</html>