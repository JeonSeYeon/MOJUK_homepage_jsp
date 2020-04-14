<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<form name=writeform method=post
			action="Board_Write_Action.jsp">
			<table>
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
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr height="1" bgcolor="#82B5DF">
								<td colspan="4"></td>
							</tr>
							<tr align="center">
								<td>&nbsp;</td>
								<td colspan="2"><input type=button value="등록"
									OnClick="javascript:writeCheck();"> <input type=button
									value="취소" OnClick="javascript:history.back(-1)">
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</center>
	<script language="javascript">
		// 자바 스크립트 시작

		function writeCheck() {
			var form = document.writeform;

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

			if (!form.memo.value) {
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

