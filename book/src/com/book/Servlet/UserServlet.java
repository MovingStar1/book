package com.book.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.UserDao.IUserDaoImpl;
import com.book.UserDao.UserDao;
import com.book.entity.User;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao ud=new IUserDaoImpl();
	User u=new User();

    public UserServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		HttpSession session=request.getSession();
		if("login".equals(action)){
			String username=request.getParameter("username");
			session.setAttribute("username", username);
			String pwd=request.getParameter("pwd");
			u=new User(username,pwd);
			if(ud.User_login(u)){
				request.getRequestDispatcher("BookServlet?action=select").forward(request, response);
			}else{
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		}else if("reg".equals(action)){
			response.setContentType("text/html;charset=utf-8");
			String username=request.getParameter("username");
			String phone=request.getParameter("phone");
			String pwd=request.getParameter("pwd");
			u=new User(username, phone, pwd);
			if(ud.User_exiter(username)){
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}else{
				if(ud.User_Reg(u)){
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			}
			

		}
	}

}
