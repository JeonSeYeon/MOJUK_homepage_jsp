<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	final int ROWSIZE = 10; // 한페이지에 보일 게시물 수
	final int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정

	int pg = 1; //기본 페이지값

	if (request.getParameter("pg") != null) { //받아온 pg값이 있을때, 다른페이지일때
		pg = Integer.parseInt(request.getParameter("pg")); // pg값을 저장
	}
	int start = (pg * ROWSIZE) - (ROWSIZE - 1); // 해당페이지에서 시작번호(step2)
	int end = (pg * ROWSIZE); // 해당페이지에서 끝번호(step2)

	int allPage = 0; // 전체 페이지수

	int startPage = ((pg - 1) / BLOCK * BLOCK) + 1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
	int endPage = ((pg - 1) / BLOCK * BLOCK) + BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
</head>
<body>
	<center>
		<%@include file="../include/main_include.jsp"%>
		<!-- 이미지 -->
		<div id="list_img">
			<img src="../img/Board.png" style="width: 1520px;">
		</div>
		<!-- Devlop by GyeongWon Kim -->
		<!-- Devlop by GyeongWon Kim -->
		<!-- Devlop by GyeongWon Kim -->
		<!-- Devlop by GyeongWon Kim -->
		<!-- Devlop by GyeongWon Kim -->
		<%
			String url = "jdbc:mysql://localhost:3306/mojuk?characterEncoding=utf8&amp;useSSL=false&amp;autoReconnection=true";
			String id = "root";
			String pass = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			int total = 0;

			try {
				request.setCharacterEncoding("UTF-8");
				Connection conn = DriverManager.getConnection(url, id, pass);
				Statement stmt = conn.createStatement();
				Statement stmt1 = conn.createStatement();
				String sql = "";

				String sqlCount = "SELECT COUNT(*) FROM board";
				ResultSet rs = stmt.executeQuery(sqlCount);

				if (rs.next()) {
					total = rs.getInt(1);
				}

				int sort = 1;
				String sqlSort = "SELECT NUM from board order by ref desc, step asc";
				rs = stmt.executeQuery(sqlSort);

				while (rs.next()) {
					int stepNum = rs.getInt(1);
					sql = "UPDATE board SET STEP=" + sort + " where NUM=" + stepNum;
					stmt1.executeUpdate(sql);
					sort++;
				}

				allPage = (int) Math.ceil(total / (double) ROWSIZE);

				if (endPage > allPage) {
					endPage = allPage;
				}

				out.print("총 게시물 : " + total + "개");

				String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, HIT, INDENT from board where STEP >=" + start
						+ " and STEP <= " + end + " order by step asc";
				rs = stmt.executeQuery(sqlList);
		%>
		<table width="1000px" cellpadding="0" cellspacing="0" border="0">
			<tr height="5">
				<td width="5"></td>
			</tr>
			<tr
				style="background: url('../img/table_mid.gif') repeat-x; text-align: center;">
				<td width="5"><img src="../img/table_left.gif" width="5"
					height="30" /></td>
				<td width="70">번호</td>
				<td width="380">제목</td>
				<td width="70">작성자</td>
				<td width="160">작성일</td>
				<td width="60">조회수</td>
				<td width="10"><img src="../img/table_right.gif" width="5"
					height="30" /></td>
			</tr>

			<%
				if (total == 0) {
			%>
			<tr align="center" bgcolor="#FFFFFF" height="30">
				<td colspan="6">등록된 글이 없습니다.</td>
			</tr>
			<%
				} else {
						while (rs.next()) {
							int idx = rs.getInt(1);
							String name = rs.getString(2);
							String title = rs.getString(3);
							String time = rs.getString(4);
							int hit = rs.getInt(5);
							int indent = rs.getInt(6);

							Date date = new Date();
							SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
							String year = (String) simpleDate.format(date);
							String yea = time.substring(0, 10);
			%>
			<tr height="25" align="center">
				<td>&nbsp;</td>
				<td><%=idx%></td>
				<td align="left">
					<%
						for (int j = 0; j < indent; j++) {
					%> &nbsp;&nbsp;&nbsp;<%
 	}
 				if (indent != 0) {
 %> <img src='../img/reply_icon.gif' /> <%
 	}
 %> <a href="view.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=title%></a> <%
 	if (year.equals(yea)) {
 %> <img src='../img/new.jpg' /> <%
 	}
 %>
				</td>
				<td align="center"><%=name%></td>
				<td align="center"><%=time%></td>
				<td align="center"><%=hit%></td>
				<td>&nbsp;</td>
			</tr>

			<tr height="1" bgcolor="#D2D2D2">
				<td colspan="6"></td>
			</tr>
			<%
				}
					}
					rs.close();
					stmt.close();
					conn.close();
				} catch (SQLException e) {
					out.print(e.toString());
				}
			%>
			<tr height="1" bgcolor="#82B5DF">
				<td colspan="6" width="752"></td>
			</tr>
		</table>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="4" height="5"></td>
			</tr>
			<tr>
				<td align="center">
					<%
						if (pg > BLOCK) {
					%> [<a href="list.jsp?pg=1">◀◀</a>] [<a
					href="pj_list.jsp?pg=<%=startPage - 1%>">◀</a>] <%
						}
					%> <%
 	for (int i = startPage; i <= endPage; i++) {
 		if (i == pg) {
 %> <u><b>[<%=i%>]
					</b></u> <%
 	} else {
 %> [<a href="list.jsp?pg=<%=i%>"><%=i%></a>] <%
 	}
 	}
 %> <%
 	if (endPage < allPage) {
 %> [<a href="list.jsp?pg=<%=endPage + 1%>">▶</a>] [<a
					href="list.jsp?pg=<%=allPage%>">▶▶</a>] <%
 	}
 %>
				</td>
			</tr>
			<tr align="center">
				<%
					if (session.getAttribute("idd") == null) {
				%><td></td>
				<%
					} else if (session.getAttribute("idd").equals("201744030")) {
				%>
				<td><input type=button value="글쓰기"
					OnClick="window.location='write.jsp'"></td>
				<%
					}
				%>
			</tr>
		</table>
		<%@include file="../include/bottom.jsp"%>
	</center>
</body>
</html>
