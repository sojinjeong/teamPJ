package Login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class LoginCheck {
	
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet res = null;
	Connection conn;
	
	public LoginCheck(Connection conn) {
		this.conn = conn;
	}
	/***이름 세션에 저장할 이름 가져오기***/
	public String getName(String uid, String upass, String role) {
		String name = null;
		String sql = "select * from professor where userid=? and userpass=?";
		String sql2 = "select * from student where stNum =? and pass=?";
		
		try {
			if(role.equals("pr")) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, upass);
				res = pstmt.executeQuery();
				res.next();
				
				name = res.getString("name");
			}
			else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, uid);
				pstmt.setString(2, upass);
				res = pstmt.executeQuery();
				res.next();
				
				name = res.getString("name")+" "+res.getInt("stNum");
			}
			
			System.out.println(name);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return name;
	}
	
	/***로그인 검증***/
	public boolean check(String uid, String upass, String role) {
		boolean rs = false;
		System.out.println(role);
		
		String sql = "select * from professor where userid=? and userpass=?";
		String sql2 = "select * from student where stNum =? and pass=?";
		
		try {
			if(role.equals("pr")) {
				pstmt = conn.prepareStatement(sql);
			}
			else {
				pstmt = conn.prepareStatement(sql2);
			}
			pstmt.setString(1, uid);
			pstmt.setString(2, upass);
			
			System.out.println(pstmt);
			res = pstmt.executeQuery();
			
			
			
			
			
			if(res.next()) {
				rs = true;
			}
			

			System.out.println(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
				return rs;
		
	}
}
