<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>모죽모죽</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
<link rel="stylesheet" type="text/css" href="../include/css/login.css" />
<center>
	<%@include file="../include/main_include.jsp"%>
	<!-- 이미지 -->
	<div id="list_img">
		<img src="../img/null_img.png" style="width: 1520px;">
	</div>
	<form name="login" method="post" action=login_ok.jsp>
		<div id="sign_in">
			로그인
			<center>
				<table>
					<tr>
						<td><input type="text" placeholder="아이디" name="id" /></td>
					</tr>
					<tr>
						<td><input type="password" placeholder="비밀번호" name="pw" /></td>
					</tr>
					<tr>
						<td align="right"><input type="submit" name="sign_in"
							value="로그인" onclick="javascript:writeCheck();" /></td>
					</tr>
				</table>
			</center>
		</div>
	</form>
	<%@include file="../include/bottom.jsp"%>
</center>
<script>
	function writeCheck() {
		var form = document.login;
		if (!form.id.value) {
			alert("아이디를 입력해주세요");
			form.text.focus();
			return;
		}
		if (!form.pw.value) {
			alert("비밀번호를입력해주세요");
			form.text.focus();
			return;
		}
		form.submit();
	}
</script>