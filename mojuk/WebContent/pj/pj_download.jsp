<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File, java.io.IOException" %>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.net.URLEncoder" %>
<%
	String FileName = request.getParameter("filename");
	/* String savedPath = "pj_upload";
	ServletContext context = getServletContext();
	String downPath = context.getRealPath(savedPath); */
	String downPath = "C:/apache-tomcat-8.0.46/webapps/mojuk/pj/pj_upload";
	String sFilePath = downPath + "/" + FileName;
	try {
		File oFile = new File(sFilePath); //위 문자열을 파일로 인식해야함
		byte b[] = new byte[100 * 1024 * 1024];
		String sMimeType = getServletContext().getMimeType(sFilePath); //유형 확인
		
		//파일 다운로드 시작
		response.reset();
		response.setContentType("application.octet-stream");
		
		String sEncoding = new String(FileName.getBytes("UTF-8"), "8859_1");
		response.setHeader("Content-Transper-Encoding", "binary");
		response.setHeader("Content-Disposition","attachment; filename=" + sEncoding);
		
		FileInputStream in = new FileInputStream(oFile);
		ServletOutputStream out2 = response.getOutputStream();
		
		int numRead;
		
		while((numRead = in.read(b,0,b.length)) != -1) {
			out2.write(b,0,numRead);
		}
		out2.flush();
		out2.close();
		in.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
