<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	memo = memo.replace("\r\n","<br>");
	String hit = request.getParameter("hit");
	
	title = title.replaceAll("<","&#60");
	title = title.replaceAll(">","&#62");
	title = title.replaceAll("/","&#47");
	memo = memo.replaceAll("<","&#60");
	memo = memo.replaceAll(">","&#62");
	memo = memo.replaceAll("/","&#47");

	int max = 0;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/mojuk?characterEncoding=utf8&amp;useSSL=false&amp;autoReconnection=true";
		String id = "root";
		String pass = "1234";
		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT MAX(NUM) FROM notice";
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			max = rs.getInt(1);
		}

		sql = "INSERT INTO notice (USERNAME,TITLE,MEMO,REF) VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, memo);
		pstmt.setInt(4, max+1);

		pstmt.execute();
		pstmt.close();

		conn.close();
	} catch (SQLException e) {
		out.println(e.toString());
	}
%>
<script>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href = "Board_List.jsp";
</script>

