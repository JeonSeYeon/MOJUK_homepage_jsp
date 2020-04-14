<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page
	import="java.io.File, java.io.IOException,
com.oreilly.servlet.MultipartRequest,
com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");

	MultipartRequest multi = null;
	int sizeLimit = 100 * 1024 * 1024; //100MB
	//String savePath = request.getRealPath("/pj/pj_upload"); //파일이 업로드 될 실제 tomcat 폴더의 Webcontent 기준
	String savePath = "C:/apache-tomcat-8.0.46/webapps/mojuk/pj/pj_upload";

	try {
		multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String file = (String) files.nextElement();
		String filename = multi.getFilesystemName("filename");

		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/mojuk?characterEncoding=utf8&amp;useSSL=false&amp;autoReconnection=true";
		String id = "root";
		String pass = "1234";
		String name = multi.getParameter("name");
		String title = multi.getParameter("title");
		String memo = multi.getParameter("memo");
		memo = memo.replace("\r\n", "<br>");

		title = title.replaceAll("<", "&#60");
		title = title.replaceAll(">", "&#62");
		title = title.replaceAll("/", "&#47");
		memo = memo.replaceAll("<", "&#60");
		memo = memo.replaceAll(">", "&#62");
		memo = memo.replaceAll("/", "&#47");

		int max = 0;

		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT MAX(ID) FROM project";
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			max = rs.getInt(1);
		}

		sql = "INSERT INTO project(USERNAME,TITLE,MEMO,REF,FILENAME) VALUES(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, memo);
		pstmt.setInt(4, max + 1);
		pstmt.setString(5, filename);

		pstmt.execute();
		pstmt.close();
		stmt.close();
		conn.close();
	} catch (SQLException e) {
		out.println(e.toString());
		e.printStackTrace();
	}
%>
<script language=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href = "pj_list.jsp";
</script>