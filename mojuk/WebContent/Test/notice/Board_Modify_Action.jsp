<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/mojuk?characterEncoding=utf8&amp;useSSL=false&amp;autoReconnection=true";
	String id = "root";
	String pass = "1234";
	String password = "";

	Connection conn = DriverManager.getConnection(url, id, pass);
	Statement stmt = conn.createStatement();

	try {

		int idx = Integer.parseInt(request.getParameter("idx"));
		String title = request.getParameter("title");
		String memo = request.getParameter("memo");
		memo = memo.replace("\r\n","<br>");

		String sql = "UPDATE notice SET TITLE='" + title + "' ,MEMO='" + memo + "' WHERE ID=" + idx;
			stmt.executeUpdate(sql);
%>
<script language=javascript>
				  	self.window.alert("글이 수정되었습니다.");
				  	location.href="Board_View.jsp?idx=<%=idx%>";
</script>
<%
			stmt.close();
			conn.close();
%>
<script language=javascript>
	self.window.alert("비밀번호를 틀렸습니다.");
	location.href = "javascript:history.back()";
</script>
<%
	} catch (SQLException e) {
		out.println(e.toString());
	}
%>


