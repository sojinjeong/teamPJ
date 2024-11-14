package Login;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

	@Override
	   public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
	         throws IOException, ServletException {

	      HttpServletRequest request = (HttpServletRequest) req;
	      HttpServletResponse response = (HttpServletResponse) res;
	      HttpSession session = request.getSession(false);
	      
	      if(session == null || session.getAttribute("user") == null) {
	    	  System.out.println("5");
	         response.sendRedirect("index.jsp"); //세션 없으면 로그인으로 돌려 보냄
	      }else {
	    	  System.out.println("6");
	         chain.doFilter(request, response);  //세션있으면 다음 리소스 진행
	      }
	   }

}
