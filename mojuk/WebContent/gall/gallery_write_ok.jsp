<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.*" %>
<%@ page
	import="java.io.File, java.io.IOException,
com.oreilly.servlet.MultipartRequest,
com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");

	MultipartRequest multi = null;
	int sizeLimit = 10 * 1024 * 1024; //10MB
	//String savePath = request.getServletContext().getRealPath("img/gallery_upload");
	//String savePath = request.getRealPath("img/gallery_upload"); //파일이 업로드 될 실제 tomcat 폴더의 Webcontent 기준
	//String savePath = "C:/Users/mojuk/git/Mojuk_Homepage/mojuk/WebContent/gall/gallery_upload"; //local
	String savePath = "C:/apache-tomcat-8.0.46/gall/gallery_upload"; //server
	//String encType = "UTF-8";
	multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
	
	//String filename = multi.getFilesystemName("filename");

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/mojuk?characterEncoding=utf8&amp;useSSL=false&amp;autoReconnection=true";
	String id = "root";
	String pass = "1234";
	String UserName = multi.getParameter("UserName");
	String title = multi.getParameter("title");
	String Contents = multi.getParameter("Contents");
	String FilePath = multi.getFilesystemName("FilePath");
	
	title = title.replaceAll("<","&#60");
	title = title.replaceAll(">","&#62");
	title = title.replaceAll("/","&#47");
	
	//System.out.println(FilePath);
	
	int max = 0;

	try {
		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();

		String sql = "SELECT MAX(ID) FROM Gallery";
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			max = rs.getInt(1);
		}

		sql = "INSERT INTO gallery(ID,title,FilePath,UserName) VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, max + 1);
		pstmt.setString(2, title);
		pstmt.setString(3, FilePath);
		pstmt.setString(4, UserName);

		pstmt.execute();
		pstmt.close();
		stmt.close();
		conn.close();
	} catch (SQLException e) {
		out.println(e.toString());
	}
%>
<script language=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href = "gallery_list.jsp";
</script>