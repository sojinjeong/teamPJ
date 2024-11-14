package school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import school.dto.scDto;

public class ServeyDao {
      PreparedStatement pstmt = null;
      Statement stmt = null;
      ResultSet res = null;
      Connection conn;
      
      public ServeyDao(Connection conn) {
         this.conn = conn;
      }
           
           //교육평가 설문조사 
      
           public int servey_insertDB(int stNum, int Q1, int Q2, int Q3, int Q4) {
              int result = 0;
              String sql = "insert into servey (stNum, Q1, Q2, Q3, Q4) values (?,?,?,?,?)";
               try {
                   pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, stNum);
                    pstmt.setInt(2, Q1);
                    pstmt.setInt(3, Q2);
                    pstmt.setInt(4, Q3);
                    pstmt.setInt(5, Q4);
                     result = pstmt.executeUpdate();
                } catch (SQLException e) {
                   e.printStackTrace();
                } finally {
                    try {
                        if(res != null) res.close();
                        if(pstmt != null) pstmt.close();
                     }catch(SQLException e) {
                        e.printStackTrace();
                     }   
                  }
               return result;
           }
           
           //학생정보 유무 확인
           public boolean servey_search(int stNum) {
        	   boolean result = false;
        	   
        	   String sql="select * from servey where stNum = ?";
        	   
        	   try {
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setInt(1, stNum);
    			res = pstmt.executeQuery();
    			
    			System.out.println(pstmt);
    			
    			if(res.next()) {
    				result = true;
    			}
    			
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        	   
        	   return result;
           }
        	   
         

      
   }