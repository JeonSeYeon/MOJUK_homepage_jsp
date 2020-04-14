<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/mojuk?characterEncoding=utf8&amp;useSSL=false&amp;autoReconnection=true";
	String id = "root";
	String pass = "1234";
	String name = null;
	int idx = Integer.parseInt(request.getParameter("idx"));

	try {

		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT USERNAME FROM notice WHERE ID=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			name = rs.getString(1);
		}

		if (name.equals(session.getAttribute("idd"))) {

			sql = "DELETE FROM notice WHERE ID=" + idx;
			stmt.executeUpdate(sql);
%>
<script language=javascript>
	self.window.alert("해당 글을 삭제하였습니다.");
	location.href = "Board_List.jsp";
</script>

<%
	rs.close();
			stmt.close();
			conn.close();

		}
	} catch (SQLException e) {
		out.println(e.toString());
	}
%>
