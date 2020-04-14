<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="header">
	<div id="go_page">
		<select name="relative_hpg" id="relative_page">
			<option value="">관련홈페이지선택</option>
			<option value="인하공업전문대학교">인하공업전문대학교</option>
			<option value="컴퓨터정보과">컴퓨터정보과</option>
		</select> <input type="button" value="이동" onclick="goto_relativepage()"
			title="새창">
	</div>
	<%
		request.setCharacterEncoding("UTF-8");
		String temp = (String) session.getAttribute("idd");
		String idc = null;
		if (temp != null) {
			idc = temp;
	%>
	<!-- 톰캣 경로 설정과 맞지 않으므로 최상위인 mojuk을 넣어준다 -->
	<div id="login_form">
		<form action="/login/logout.jsp"><%=idc%>님 <input
				type="submit" value="로그아웃">
		</form>
	</div>
	<%
		} else {
	%>
	<div>
		<input type="button" value="로그인"
			onclick="window.location.href='/login/login.jsp';">
	</div>
	<%
		}
	%>
</div>
<script type="text/javascript">
	function goto_relativepage() { //관련사이트 바로가기
		var select = document.getElementById("relative_page");
		var
			select_val=select.options[select.selectedIndex].value;
			if (select_val=='인하공업전문대학교') {
			window.open('http://cms.itc.ac.kr/site/inhatc/main.do');
		} else
			if (select_val=='컴퓨터정보과') {
			window.open('http://cms.itc.ac.kr/site/cs/main.do');
		} else {
			alert("사이트를 선택하세요.");
			window.location.reload();
		}
	}
</script>