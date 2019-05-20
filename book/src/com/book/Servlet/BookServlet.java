package com.book.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.core.ApplicationContext;

import com.alibaba.fastjson.JSON;
import com.book.BookDao.BookDao;
import com.book.BookDao.IBookDaoImpl;
import com.book.UserDao.IUserDaoImpl;
import com.book.UserDao.UserDao;
import com.book.entity.Book;
import com.book.entity.BookColor;
import com.book.entity.User;
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Book bk=new Book();
	BookDao bd=new IBookDaoImpl();
	User u=new User();
	UserDao ud=new IUserDaoImpl();
    public BookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		HttpSession session=request.getSession();
		if("select".equals(action)){
			List<Book> list=bd.getAllBook();
			session.setAttribute("list", list);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else if("shoppingcar".equals(action)){
			String username=request.getParameter("username");
			u.setUsername(username);
			List<Book> list=bd.getShoppingCar(u);
			session.setAttribute("list", list);
			response.sendRedirect("shoppingcar.jsp");
		}else if("choose".equals(action)){
			String cId=request.getParameter("id");
			int bid=Integer.parseInt(cId);
			bk.setBid(bid);
			bd.findBook(bk);
			List<BookColor> list=bd.getBookColor();
			session.setAttribute("list", list);
			session.setAttribute("bk", bk);
			response.sendRedirect("mingxi.jsp");
		}else if("add".equals(action)){
			String username=request.getParameter("username");
			String cbid=request.getParameter("bid");
			int bid=Integer.parseInt(cbid);
			bk.setBid(bid);//��bookʵ��������ID����
			bk.setUsername(username);//��bookʵ��������name����
			u.setUsername(username);//��Userʵ������name����(��ȡ��ǰ�û����ﳵ����Ϣ)
			bd.findBook(bk);//����bookʵ�����е�ID�ҵ������Ϣ
			session.setAttribute("bk", bk);
			if(bd.cheackShoppingCar(bk.getBookname(),username)){//����֮ǰbk.setUsername�����û����͵�ǰ�û����Ĺ��ﳵ��ѯ
//				System.out.println("����Ʒ�Ѿ����ڹ��ﳵ��");
				String flag=null;
				session.setAttribute("flag", flag);
				response.sendRedirect("./BookCheack/BookCheack.jsp");
			}else{
				if(bd.AddShoppingCar(bk)){
					List<Book> list=bd.getShoppingCar(u);//��ȡ��ǰ��½�û��Ĺ��ﳵ��Ϣ
					session.setAttribute("list", list);
					response.sendRedirect("shoppingcar.jsp");
				}
			}
			
		}else if("getShoppingcar".equals(action)){
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			String username=request.getParameter("username");
			u.setUsername(username);
			List<Book> list=bd.getShoppingCar(u);//��ȡ��ǰ��½�û��Ĺ��ﳵ��Ϣ
			String jsonString=JSON.toJSONString(list);
			out.print(jsonString);
			out.flush();
			out.close();
		}else if("Pay".equals(action)){
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			String Ccount=request.getParameter("count");
			int count=Integer.parseInt(Ccount);
			if(ud.User_Xiaofei(count,u)){
				if(bd.ClearShoppingCar(u)){
					boolean flag=true;
					session.setAttribute("flag", flag);
					session.setAttribute("count",count);
				}
				
			}else{
				System.out.println("֧��ʧ��");
			}
			//System.out.println(count);
		    out.print(count);
		    out.flush();
		    out.close();
			
			
			
		}else if("delbook".equals(action)){
			String cbid=request.getParameter("bid");
			int bid=Integer.parseInt(cbid);
			if(bd.delSBookByBid(bid)){
				response.sendRedirect("BookServlet?action=delsuccess");
			}
		}else if("delsuccess".equals(action)){
			List<Book> list=bd.getShoppingCar(u);//��ȡ��ǰ��½�û��Ĺ��ﳵ��Ϣ
			session.setAttribute("list", list);
			response.sendRedirect("shoppingcar.jsp");
		}
	}

}
