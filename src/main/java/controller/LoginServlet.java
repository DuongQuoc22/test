package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import entities.User;
import utils.EncryptUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
       
    public LoginServlet() {
        super();
        
        this.userDAO = new UserDAO();
    }

	protected void doGet(
		HttpServletRequest request,
		HttpServletResponse response
	) throws ServletException, IOException {

		request.getRequestDispatcher("/views/login.jsp")
		.forward(request, response);
	}

	protected void doPost(
		HttpServletRequest request,
		HttpServletResponse response
	) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = request.getParameter("email"),
			pwd = request.getParameter("password");
		
		if(email.length()==0 || pwd.length()==0) {
			session.setAttribute("error",
					"Vui lòng nhập đầy đủ Email & Password");
			response.sendRedirect("/Assignment_SOF3011_Quocdvph14459/login");
		}
		User u = this.userDAO.findByEmail(email);
		
		boolean checked = EncryptUtil.check(pwd, u.getPassword());
		
		if (checked == true) {
			// dang nhap thanh cong
			session.setAttribute("user", u);
			response.sendRedirect("/Assignment_SOF3011_Quocdvph14459/products/index");
			session.setAttribute("message1", "Đăng nhập thành công");
		} else {
			//dang nhap that bai			
			response.sendRedirect("/Assignment_SOF3011_Quocdvph14459/login");
			session.setAttribute("error1", "Thất Bại! Email hoặc Password không chính xác!");
		}
		
		/*
		 * SELECT * FROM users WHERE email = ?
		 */
	}
}
