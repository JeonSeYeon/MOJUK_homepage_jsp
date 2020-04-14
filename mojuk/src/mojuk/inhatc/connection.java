package mojuk.inhatc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class connection {

	String id = null;
	String pw = null;

	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mojuk?characterEncoding=UTF-8&amp;useSSL=false&amp;autoReconnection=true";
	String dbid = "root";
	String dbpw = "1234";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public connection() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// db 연결
	void connect() {
		try {
			con = DriverManager.getConnection(url, dbid, dbpw);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	// db 연결 종료
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	// Login 정보 확인
	public List getLogin() {
		connect();
		List array = new ArrayList();
		String sql = "select id, aes_decrypt(unhex(pw), 'pw') as pw from user";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				array.add(rs.getString("id"));
				array.add(rs.getString("pw"));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return array;
	}

	
	public List getProfile() {
		connect();
		List profile = new ArrayList();
		String sql = "select img,name,content,location,position from profile";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				profile.add(rs.getString(1));
				profile.add(rs.getString(2));
				profile.add(rs.getString(3));
				profile.add(rs.getString(4));
				profile.add(rs.getString(5));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			disconnect();
		}
		return profile;
	}
	
}
