package Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import school.dao.*;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginSevlet
 */
@WebServlet("/LoginSevlet")
public class LoginSevlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		HttpSession session = req.getSession();
		DBConnect db = new DBConnect();
		
		String id = req.getParameter("uid");
		String pass = req.getParameter("upass");
		String role = req.getParameter("val");
		System.out.println(id+", "+pass+", "+role);
		
		Connection conn;
		try {
			conn = db.getConnection();
			LoginCheck lc = new LoginCheck(conn);
			
		
			
			if(role == null) {
				if(id.isEmpty() || pass.isEmpty()) {
				System.out.println("아이디 또는 비밀번호가 없습니다.");
				resp.sendRedirect("loginOK.jsp");
				return;
				}
			}
			
			else if(role.equals("pr")) {
				
				if(id.isEmpty() || pass.isEmpty()) {
					System.out.println("아이디 또는 비밀번호가 없습니다.");
					resp.sendRedirect("loginOK.jsp");
					return;
					}
				
				if(lc.check(id, pass, role)) { 
					String name = lc.getName(id, pass, role);
					
					session.setAttribute("name", name);
					session.setAttribute("rolee", role+"1");
					session.setAttribute("role", role);
					resp.sendRedirect("index.jsp");
					System.out.println("로그인 완료");
			
				} else {
					resp.sendRedirect("loginOK.jsp");
					System.out.println("로그인실패");
				}
			}
			else{
				
				if(id.isEmpty() || pass.isEmpty()) {
					System.out.println("아이디 또는 비밀번호가 없습니다.");
					resp.sendRedirect("loginOK.jsp");
					return;
					}
				
				if(lc.check(id, pass, role)) { 
					String name = lc.getName(id, pass, role);
					
					String[] arr = name.split(" ");
					
					session.setAttribute("name", arr[0]);
					session.setAttribute("id", arr[1]);
					session.setAttribute("rolee", role+"1");
					session.setAttribute("role", role);
					resp.sendRedirect("index.jsp");
					System.out.println("로그인 완료");
			
				} else {
					resp.sendRedirect("loginOK.jsp");
					System.out.println("로그인실패");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = req.getSession(false);
		
		if(session != null && session.getAttribute("name") != null) {
			session.invalidate();
			resp.sendRedirect("index.jsp");
			System.out.println("세션비우기");
			
		} 
		
	}
}
