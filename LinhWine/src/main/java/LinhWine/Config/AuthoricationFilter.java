package LinhWine.Config;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import LinhWine.Entity.Users;
import LinhWine.utils.SessionUtil;


public class AuthoricationFilter implements Filter {

	private ServletContext context;
	
	
	
	public void init(FilterConfig filterConfig) throws ServletException{
		this.context = filterConfig.getServletContext();
	}
	
	public void doFilter(ServletRequest requestServl, ServletResponse responseServl, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) requestServl;
		HttpServletResponse response = (HttpServletResponse) responseServl;
		String url = request.getRequestURI();
		if(url.startsWith(request.getContextPath()+"/quan-tri")) {
			Users user = (Users) SessionUtil.getInstance().getValue(request, "UserLogin");
			if(user != null) {
				if(user.getRole().getName().equals("ADMIN")) {
					filterChain.doFilter(requestServl, responseServl);
				}else if(user.getRole().getName().equals("USER")) {
				
					response.sendRedirect(request.getContextPath()+"/dang-nhap");
					SessionUtil.getInstance().putValue(request, "login", "Bạn không có quyền truy cập!");
				}
			}else {
				SessionUtil.getInstance().putValue(request, "login", "Bạn chưa đăng nhập!");
				response.sendRedirect(request.getContextPath()+"/dang-nhap");
			}
		}else {
			filterChain.doFilter(requestServl, responseServl);
		}
	}



	

}
