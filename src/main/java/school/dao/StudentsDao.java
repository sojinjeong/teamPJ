package school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import school.dto.SDto;

public class StudentsDao {
	
		//필드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn;
		
		//생성자에서 db 접속
		public StudentsDao(Connection conn) {
			this.conn = conn;
		}

		//회원가입
		public int insertDB(SDto dto) {
			int num = 0;
			String sql = "insert into student "
					+ " (id, name, stNum, pass, addr1, addr2, phoneNum, birth, email, zipcode) "
					+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getId());
				pstmt.setString(2, dto.getName());
				pstmt.setInt(3, dto.getStNum());
				pstmt.setString(4, dto.getPass());
				pstmt.setString(5, dto.getAddr1());
				pstmt.setString(6, dto.getAddr2());
				pstmt.setString(7, dto.getphoneNum());
				pstmt.setInt(8, dto.getBirth());
				pstmt.setString(9, dto.getEmail());
				pstmt.setInt(10, dto.getZipcode());
				System.out.println(pstmt);
				num = pstmt.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				  try {
						if(pstmt != null) pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
			return num;
		}
		
		//회원정보수정
		public int updateDB(SDto dto) {
			int num = 0;
			String sql = "update student set pass = ?, phoneNum = ?, zipcode = ?, addr1 = ?, addr2 = ?, email = ? where id = ? ";
			
			try {
				pstmt = conn.prepareStatement(sql);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return num;
		}
		
		//회원정보 검증
		public SDto serchDB(String name, String Snum) {
			String sql = "select * from student where name = ? and stNum = ?";
			SDto dto = new SDto();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, Snum);
				rs = pstmt.executeQuery();
				rs.next();
				
				dto.setName(rs.getString("name"));
				dto.setStNum(rs.getInt("stNum"));
				dto.setBirth(rs.getInt("birth"));
				dto.setEmail(rs.getString("email"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return dto;
		}
		
		//회원중복 검증
		public boolean findUser(String column, String uname) {
			boolean res = true;
			String sql = "select * from student where "+ column + "= ?";
			try {
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, uname);	;
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				   res = false;
			   }
			}catch(SQLException e) {
			      e.printStackTrace();
		    }finally {
			  try {
				if(pstmt != null) pstmt.close();
			  } catch (SQLException e) {
				  e.printStackTrace();
			  }
			}
			return res;
		}
		
		//회원로그인
	      public SDto login(String userid, String userpass) {
	          String sql = "select * from student where stNum=? and pass=?";
	          SDto dto = new SDto();
	          try {
	             pstmt = conn.prepareStatement(sql);
	             pstmt.setString(1, userid);
	             pstmt.setString(2, userpass);
	             rs = pstmt.executeQuery();
	             
	             if(rs.next()) {
	             dto.setId(rs.getInt("id"));
	             dto.setStNum(rs.getInt("stNum"));
	             dto.setEmail(rs.getString("email"));
	             dto.setName(rs.getString("username"));
	             dto.setphoneNum(rs.getString("usertel"));
	             dto.setZipcode(rs.getInt("zipcode"));
	             dto.setAddr1(rs.getString("addr1"));
	             dto.setAddr2(rs.getString("addr2"));
	             dto.setRole(rs.getString("role"));
	             }
	          }catch(SQLException e) {
	             e.printStackTrace();
	          }finally {
	              try {
	                  if(pstmt != null) pstmt.close();
	                  if(rs != null) rs.close();
	                 } catch (SQLException e) {
	                    e.printStackTrace();
	                 }
	          }
	          System.out.println(dto.getId());
	          return dto;
	      }
		
}
