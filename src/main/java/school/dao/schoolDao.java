package school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import school.dto.*;

public class schoolDao {
	
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet res = null;
	Connection conn;
	
	public schoolDao(Connection conn) {
		this.conn = conn;
	}
	
	
	//회원정보 수정시 필요한 비밀번호 검증
	public int findPass(String num, String pass) { 
		int stNum = Integer.parseInt(num);
    	int result = 0;
 
    	String sql = "select id from student where stNum=? and pass=?"; 
    	SDto sDto = new SDto();
    	
    	try {
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setInt(1, stNum);
    		pstmt.setString(2, pass);
    		res = pstmt.executeQuery();
    		if(res.next()) {
    			result = 1;
    		}
    	}catch (SQLException e) {
			e.printStackTrace();
		} finally {
    		try {
     		   if(res != null) res.close();
     		   if(pstmt != null) pstmt.close();
     		}catch(SQLException e) {e.printStackTrace();}   
     	}
    	return result;
    }
	
	//출석부 저장
	public int saveAtt(int scid) {
		
		int rs = 0;
		
		String sql = "select * from student where lectureNum1 = ?";
		String sql2 = "update * from attendance";
		
		try {
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setInt(1, scid);
    		res = pstmt.executeQuery();
    		
    		while(res.next()) {
    			
    			if(res.getInt("scid") == 1) {
    				rs = 1;
    				
    				res.getInt("stNum");
    			
    				ADto aDto = new ADto();
    				aDto.setStName(res.getString("name"));
    				aDto.setStNum(res.getInt("stNum"));
    				
    				
    				pstmt=conn.prepareStatement(sql2);
    				res = pstmt.executeQuery();
    			}
    		}
    	}catch (SQLException e) {
			e.printStackTrace();
		} finally {
    		try {
     		   if(res != null) res.close();
     		   if(pstmt != null) pstmt.close();
     		}catch(SQLException e) {e.printStackTrace();}   
     	}
		
		return rs;
	}
	
	//출석부 선택
	public ArrayList<ADto> selectDB(){
    	
    	ArrayList<ADto> dtos = new ArrayList<>();
   
    	String sql = "select * from attendance order by stNum";
    	try {
    	  pstmt = conn.prepareStatement(sql);
    	  	  
    	  res = pstmt.executeQuery();
    	
    	  while(res.next()) {
    		 int stNum = res.getInt("stNum"); //학번
    		 String stName = res.getString("stName"); //이름
    		 String stPhoneNum = res.getString("stPhoneNum"); //전화번호
    		 String stAddr1 = res.getString("stAddr1"); //주소1
    		 String stAddr2 = res.getString("stAddr2"); //주소2
    		 int att = res.getInt("att"); //출석상태  		 
    		 
    		 ADto aDto = new ADto();
    		 aDto.setStNum(stNum);
    		 aDto.setStName(stName);
    		 aDto.setStPhoneNum(stPhoneNum);
    		 aDto.setStAddr1(stAddr1);
    		 aDto.setStAddr2(stAddr2);
    		 aDto.setAtt(att); 
    		 dtos.add(aDto);
    	  }
    	} catch(SQLException e) {
    		e.printStackTrace();
    	} finally {
    		try {
    		   if(res != null) res.close();
    		   if(pstmt != null) pstmt.close();
    		}catch(SQLException e) {e.printStackTrace();}   
    	}
    	
    	return dtos;
    }
	
    public PDto searchDB(String name) {
		String sql = "select * from professor where name = ?";
		PDto dto = new PDto();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			res = pstmt.executeQuery();
			res.next();
			
			dto.setName(res.getString("name"));
			dto.setUserid(res.getString("userid"));
			dto.setEmail(res.getString("email"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}
	
}
