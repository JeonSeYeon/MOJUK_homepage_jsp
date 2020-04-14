<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.Enumeration, com.oreilly.servlet.multipart.DefaultFileRenamePolicy, com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String url = "jdbc:mysql://localhost:3306/mojuk?characterEncoding=utf8&amp;useSSL=false&amp;autoReconnection=true";
		String id = "root";
		String pass = "1234";

		// String uploadPath = request.getRealPath("upload");
		//String uploadPath = "C:/Users/mojuk/git/Mojuk_Homepage/mojuk/WebContent/mojuk/upload";
		String uploadPath = "C:/apache-tomcat-8.0.46/webapps/mojuk/mojuk/upload";

		int size = 5 * 1024 * 1024;

		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

			Enumeration files = multi.getFileNames(); // 여러개의 파일이 업로드 될 경우 parameter들의 이름을 가져온다.
			String file = (String) files.nextElement(); // 업로드 될 파일의 parameter 이름(input name)
			String filename = multi.getFilesystemName(file); // 업로드 될 때 변경되는 파일 이름
			// String originalName = multi.getOriginalFileName(file); // 업로드 할 때 선택하는 파일 이름
			//String upload = uploadPath + "/" + filename; // img src로 로컬 이미지를 띄워줄 수 없다.
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, id, pass);
			Statement stmt = conn.createStatement();

			String sql = "insert into profile(img,content,location,name,position) VALUES(?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			String content = multi.getParameter("content");
			content = content.replace("\r\n","<br>");

			pstmt.setString(1, filename);
			pstmt.setString(2, content);
			pstmt.setString(3, multi.getParameter("location"));
			pstmt.setString(4, multi.getParameter("name"));
			pstmt.setString(5, multi.getParameter("position"));

			pstmt.execute();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("파일 업로드 문제 발생 : " + e.getMessage());
		}
	%>
	<%-- 
	content = <%=multi.getParameter("content")%> // post & multipart데이터로 parameter를 전송 할 경우
	content = <%=request.getParameter("content")%> // request객체가 아닌 multi 객체에서 parameter를 받을 수 있다.
	 --%>
	<script language=javascript>
		self.window.alert("입력한 글을 저장하였습니다.");
		location.href = "mojuk.jsp";
	</script>
</body>
</html>