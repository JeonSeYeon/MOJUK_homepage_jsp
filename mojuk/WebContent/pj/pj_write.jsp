<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
</head>
<body>
	<%@include file="../include/main_include.jsp"%>
	<!-- 이미지 -->
	<div id="list_img">
		<img src="../img/Board.png" style="width: 1520px;">
	</div>
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
					action="pj_write_ok.jsp">
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center">제목</td>
							<td>&nbsp;<input name="title" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">이름</td>
							<td><input name="name" size="50" maxlength="50" value="<%=session.getAttribute("idd")%>" readonly style="border:0px;"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내용</td>
							<td>&nbsp;<textarea name="memo" cols="50" rows="13"></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">첨부파일</td>
							<td><input name="upfile" type="file" name="filename" size="50"
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
								OnClick="javascript:writeCheck(this.form);">
								<input type=button value="취소" OnClick="javascript:history.back(-1)">
							<td>&nbsp;</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
	<%
	PrintWriter out1 = response.getWriter();
	if (session.getAttribute("idd") ==null){
		out1.println("<script language='javascript'>");
		out1.println("alert('권한이 없습니다');");
		out1.println("history.back(-1)");
		out1.println("</script >");
	}
	%>
	<script language="javascript">
		// 자바 스크립트 시작
		function writeCheck(frm) {
			var form = document.writeform;
			var file = frm.upfile.value;
			var fileExt = file.substring(file.lastIndexOf('.') + 1); //파일의 확장자를 구합니다.
			var bSubmitCheck = true;

			if (!form.name.value) // form 에 있는 name 값이 없을 때
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

			if (!form.filename.value) {
				alert("파일을 선택해주세요");
				return;
			}
			
			if (!form.memo.value) {
				alert("내용을 적어주세요");
				form.memo.focus();
				return;
			}

			if (!file) {
				alert("파일을 선택하여 주세요!");
				return;
			}

			if (fileExt.toUpperCase() == "ASP" || fileExt.toUpperCase() == "PHP"
					|| fileExt.toUpperCase() == "JSP") {
				alert("ASP,PHP,JSP 파일은 업로드 하실 수 없습니다!");
				return;
			}

			alert("파일 업로드를 시작합니다.");
			form.submit();
		}
	</script>
	<%@include file="../include/bottom.jsp"%>
</body>
</html>