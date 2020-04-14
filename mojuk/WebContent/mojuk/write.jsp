<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%
	PrintWriter out1 = response.getWriter();
	if (session.getAttribute("idd") == null){
		out1.println("<script language='javascript'>");
		out1.println("alert('권한이 없습니다');");
		out1.println("history.back(-1)");
		out1.println("</script >");
	}
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필작성</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
</head>
<body>
	<center>
		<%@include file="../include/main_include.jsp"%>
		<!-- 이미지 -->
		<div id="list_img">
			<img src="../img/null_img.png" style="width: 1520px;">
		</div>
		<form name="upload" action="write_ok.jsp" method="post"
			enctype="multipart/form-data">
			<table border="1" height="200px" width="500px"
				style="border-collapse: collapse; margin: 5px;">
				<tr>
					<td height="100px" width="150px"><img id="blah" src="#"
						height="160px" width="120px" style="margin: 15px;" /></td>
					<td height="150px"><textarea name="content"
							placeholder="소개 문구"
							style="resize: none; height: 150px; width: 350px; border: 0px;"></textarea></td>
				</tr>
				<tr>
					<td>
						<input type="text" name="name"
						style="height: 15px; width: 80px; border: 0px;"
						placeholder="이름">
						<select name="position">
							<option value="prof">교수</option>
							<option value="exec">임원</option>
							<option value="memb">멤버</option>
						</select>
					</td>
					<td><input type="text" name="location"
						style="height: 15px; width: 350px; border: 0px;"
						placeholder="개인페이지 링크(없으면 없음 기재)"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="file" id="imgInp" name="img"
						style="width: 400px; float: left;" /><input type="submit"
						value="저장" OnClick="javascript:writeCheck();"
						style="margin-left: 20px;"><input type=button value="취소"
						OnClick="javascript:history.back(-1)"></td>
				</tr>
			</table>
		</form>
		<%@include file="../include/bottom.jsp"%>
	</center>
	<script type="text/javascript" src="../include/js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#imgInp").on('change', function() {
				readURL(this);
			});
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#blah').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		function writeCheck() {
			var form = document.upload;

			if (!form.img.value) {
				alert("사진을 넣어주세요");
				return;
			}

			if (!form.content.value) {
				alert("소개문구를 넣어주세요");
				form.content.focus();
				return;
			}

			if (!form.location.value) {
				alert("링크를 넣어주세요");
				form.location.focus();
				return;
			}

			if (!form.name.value) {
				alert("이름을 넣어주세요");
				form.name.focus();
				return;
			}

			form.submit();
		}
	</script>
	<!-- 이미지 미리보기 출처 : http://touchsoul.tistory.com/84 -->
</body>
</html>