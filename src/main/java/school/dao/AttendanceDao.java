package school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import school.dto.ADto;
import school.dto.PDto;
import school.dto.SDto;

public class AttendanceDao {
	PreparedStatement pstmt = null;
	   Statement stmt = null;
	   ResultSet res = null;
	   Connection conn;
	   
	   public AttendanceDao(Connection conn) {
	      this.conn = conn;
	   }
	   
	   /*** 출석부 등록 ***/
	   public int insertDB(int scid, int stNum) {
		   ADto dto = new ADto();
		   
		   int rs = 0;
		   int num;
		   String name, phonenum, addr1, addr2;
		   String sql = "select scid from attendance where stNum = ?";
		   String sql1 = "select stNum, name, phoneNum, addr1, addr2 from student where stNum = ?";
		   
		   try {
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1, stNum);
			   res = pstmt.executeQuery();
			   res.next();
			   
			   if(res.next() == false || res.getInt("scid") != scid) {
				   
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, stNum);
			res = pstmt.executeQuery();
			res.next();
			
			num = res.getInt("stNum");
			name = res.getString("name");
			phonenum = res.getString("phoneNum");
			addr1 = res.getString("addr1");
			addr2 = res.getString("addr2");
			
			pstmt.close();
			res.close();
			
			String sql2 = "insert into attendance (scid, stNum, stName, stPhoneNum, stAddr1, stAddr2) values (?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, scid);
			pstmt.setInt(2, num);
			pstmt.setString(3, name);
			pstmt.setString(4, phonenum);
			pstmt.setString(5, addr1);
			pstmt.setString(6, addr2);
			int res = pstmt.executeUpdate();
			
			   }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return rs;
	   }
	 //수강신청 취소하기
	   
	    public int deleteScDB(int stNum, int scid) {
	    	
	       int result = 0;
	       String sql = "delete from attendance where stNum = ? and scid = ?";
	       try {
	         pstmt = conn.prepareStatement(sql);
	          pstmt.setInt(1, stNum);
	          pstmt.setInt(2, scid);
	           result = pstmt.executeUpdate();
	           System.out.println(pstmt);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } 
	       
	       return result;
	    }
	    
	    /*** 출석부 보기(기본형) ***/
	    public ArrayList<ADto> view(int num, int lpage, int pcount){
	    	ArrayList<ADto> stView = new ArrayList<>();
	    	String sql = "select * from attendance where scid = ? group by stnum order by stnum limit ?, ?";
	    	
	    	try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, lpage);
				pstmt.setInt(3, pcount);
				res = pstmt.executeQuery();
				
				while(res.next()) {
					ADto dto = new ADto();
					
					int stNum = res.getInt("stNum");
					String dep = res.getString("dep");
					String name = res.getString("stName");
					String phoneNum = res.getString("stPhoneNum");
					int att = res.getInt("att");
					int abs = res.getInt("abs");
					int late = res.getInt("late");
					int ets = res.getInt("ets");
					Timestamp time = res.getTimestamp("time");
					
					dto.setDep(dep);
					dto.setStNum(stNum);
					dto.setStName(name);
					dto.setStPhoneNum(phoneNum);
					dto.setAtt(att);
					dto.setAbs(abs);
					dto.setLate(late);
					dto.setEts(ets);
					dto.setTime(time); 
					
					stView.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return stView;
	    }
	    
	    /*** 출석부 보기(날짜별) ***/
	    public ArrayList<ADto> viewDate(int num, int lpage, int pcount, String date){
	    	ArrayList<ADto> stView = new ArrayList<>();
	    	String sql = "select * from attendance where scid = ? and time=? group by stnum order by stnum limit ?, ?";
	    	
	    	try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, date);
				pstmt.setInt(3, lpage);
				pstmt.setInt(4, pcount);
				res = pstmt.executeQuery();
				
				while(res.next()) {
					ADto dto = new ADto();
					
					int stNum = res.getInt("stNum");
					String dep = res.getString("dep");
					String name = res.getString("stName");
					String phoneNum = res.getString("stPhoneNum");
					int att = res.getInt("att");
					int abs = res.getInt("abs");
					int late = res.getInt("late");
					int ets = res.getInt("ets");
					Timestamp time = res.getTimestamp("time");
					String status = res.getString("status");
					
					dto.setDep(dep);
					dto.setStNum(stNum);
					dto.setStName(name);
					dto.setStPhoneNum(phoneNum);
					dto.setAtt(att);
					dto.setAbs(abs);
					dto.setLate(late);
					dto.setEts(ets);
					dto.setTime(time); 
					dto.setStatus(status);
					
					stView.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return stView;
	    }
	    
	    /*** 출석 체크 ***/
	    public void check(String check, int num, int prnum, String date) {
	    	System.out.println(check);
	    	try {
	    		if(check.equals("att")) {
	    			check = "출석";
	    	    	String sql = "insert into attendance (dep, scid, stNum, stName, stPhoneNum, stAddr1, stAddr2, att, abs, late, ets, time, status ) "
	    	    			+ "select dep, scid, stNum, stName, stPhoneNum, stAddr1, stAddr2, 1, 0, 0, 0, ?, ? from attendance where stNum = ? and scid = ?";
    			
	    			pstmt = conn.prepareStatement(sql);
	    			pstmt.setString(1, date);
	    			pstmt.setString(2, check);
	    			pstmt.setInt(3, num);
	    			pstmt.setInt(4, prnum);
	    			System.out.println(pstmt);
	    			
	    			int rs = pstmt.executeUpdate();
	    			pstmt.close();
	    			
	    			String sql2 =  "update attendance set att = (att+1) where stNum = ? and scid = ? and status = ''";
	    			pstmt = conn.prepareStatement(sql2);
	    			pstmt.setInt(1, num);
	    			pstmt.setInt(2, prnum);
	    			int rs2 = pstmt.executeUpdate();
	    			
	    		}
	    		else if(check.equals("abs")){
	    			check = "결석";
	    			String sql = "insert into attendance (dep, scid, stNum, stName, stPhoneNum, stAddr1, stAddr2, att, abs, late, ets, time, status ) "
	    					+ "select dep, scid, stNum, stName, stPhoneNum, stAddr1, stAddr2, 0, 1, 0, 0, ?, ? from attendance where stNum = ? and scid = ?";
	    			
	    			pstmt = conn.prepareStatement(sql);
	    			pstmt.setString(1, date);
	    			pstmt.setString(2, check);
	    			pstmt.setInt(3, num);
	    			pstmt.setInt(4, prnum);
	    			System.out.println(pstmt);
	    			int rs = pstmt.executeUpdate();
	    			pstmt.close();
	    			
	    			String sql2 =  "update attendance set abs = (abs+1) where stNum = ? and scid = ? and status = ''";
	    			pstmt = conn.prepareStatement(sql2);
	    			pstmt.setInt(1, num);
	    			pstmt.setInt(2, prnum);
	    			int rs2 = pstmt.executeUpdate();
	    		}
	    		else if(check.equals("late")) {
	    			check = "지각";
	    			String sql = "insert into attendance (dep, scid, stNum, stName, stPhoneNum, stAddr1, stAddr2, att, abs, late, ets, time, status ) "
	    					+ "select dep, scid, stNum, stName, stPhoneNum, stAddr1, stAddr2, 0, 0, 1, 0, ?, ? from attendance where stNum = ? and scid = ?";
	    			pstmt = conn.prepareStatement(sql);
	    			pstmt.setString(1, date);
	    			pstmt.setString(2, check);
	    			pstmt.setInt(3, num);
	    			pstmt.setInt(4, prnum);
	    			System.out.println(pstmt);
	    			int rs = pstmt.executeUpdate();
	    			pstmt.close();
	    			
	    			String sql2 =  "update attendance set late = (late+1) where stNum = ? and scid = ? and status = ''";
	    			pstmt = conn.prepareStatement(sql2);
	    			pstmt.setInt(1, num);
	    			pstmt.setInt(2, prnum);
	    			int rs2 = pstmt.executeUpdate();
	    		}
	    		else if(check.equals("ets")) {
	    			check = "기타";
	    			String sql = "insert into attendance (dep, scid, stNum, stName, stPhoneNum, stAddr1, stAddr2, att, abs, late, ets, time, status ) "
	    					+ "select dep, scid, stNum, stName, stPhoneNum, stAddr1, stAddr2, 0, 0, 0, 1, ?, ? from attendance where  stNum = ? and scid = ?";
	    			pstmt = conn.prepareStatement(sql);
	    			pstmt.setString(1, date);
	    			pstmt.setString(2, check);
	    			pstmt.setInt(3, num);
	    			pstmt.setInt(4, prnum);
	    			System.out.println(pstmt);
	    			int rs = pstmt.executeUpdate();
	    			pstmt.close();
	    			
	    			String sql2 =  "update attendance set ets = (ets+1) where stNum = ? and scid = ? and status = ''";
	    			pstmt = conn.prepareStatement(sql2);
	    			pstmt.setInt(1, num);
	    			pstmt.setInt(2, prnum);
	    			int rs2 = pstmt.executeUpdate();
	    		}
				
				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    
	    //교수번호? 과목번호 출력
	    public int scheduleId(String name) {
	    	int rss = 0;
	    	String sql = "select scid from schedule where pfname = ?";
	    	
	    	try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				res = pstmt.executeQuery();
				res.next();
				System.out.println(res.getInt("scid"));
				rss = res.getInt("scid");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return rss;
	    }
	    
	    /*출석부 페이징*/
	    public int totalPage(int pf) {
	    	int num = 0;
	    	String sql = "select count(distinct stName) from attendance where scid = ?";
	    	
	    	try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pf);
				res = pstmt.executeQuery();
				res.next();
				
				num = res.getInt(1);
				System.out.println(num);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return num;
	    }
	    
	    /*검색 기능*/
	    public ArrayList<ADto> search(String tp, String context, int scid){
	    	ArrayList<ADto> list = new ArrayList<>();
	    	String sql = "select * from attendance where "+ tp +" = ? and scid = ? group by stnum";
	    	try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, context);
				pstmt.setInt(2, scid);
				res = pstmt.executeQuery();
				
				System.out.println(pstmt);
				
				while(res.next()) {
					ADto dto = new ADto();
					
					int stNum = res.getInt("stNum");
					String dep = res.getString("dep");
					String name = res.getString("stName");
					String phoneNum = res.getString("stPhoneNum");
					int att = res.getInt("att");
					int abs = res.getInt("abs");
					int late = res.getInt("late");
					int ets = res.getInt("ets");
					Timestamp time = res.getTimestamp("time");
					
					dto.setDep(dep);
					dto.setStNum(stNum);
					dto.setStName(name);
					dto.setStPhoneNum(phoneNum);
					dto.setAtt(att);
					dto.setAbs(abs);
					dto.setLate(late);
					dto.setEts(ets);
					dto.setTime(time); 
					
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return list;
	    }
	    
}
