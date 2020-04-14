<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String url = "jdbc:mysql://localhost:3306/mojuk?characterEncoding=utf8&amp;useSSL=false&amp;autoReconnection=true";
	String id = "root";
	String pass = "1234";
	Class.forName("com.mysql.jdbc.Driver");

	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	int idx = Integer.parseInt(request.getParameter("idx"));

	try {
		int ref = 0;
		int indent = 0;
		int step = 0;

		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT REF, INDENT, STEP FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			ref = rs.getInt(1);
			indent = rs.getInt(2);
			step = rs.getInt(3);
		}

		sql = "UPDATE board SET STEP=STEP+1 where REF=" + ref + " and STEP>" + step;
		stmt.executeUpdate(sql);

		sql = "INSERT INTO board(USERNAME, TITLE, MEMO, REF, INDENT, STEP)"
				+ "values(?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, memo);
		pstmt.setInt(4, ref);
		pstmt.setInt(5, indent +1);
		pstmt.setInt(6, step + 1);

		pstmt.execute();
		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();

	} catch (Exception e) {

	}
%>
<script language=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href = "list.jsp";
</script>


