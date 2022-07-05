package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import entities.User;
import utils.EncryptUtil;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet({
	"/users/index",
	"/users/create",
	"/users/store",
	"/users/delete",
	"/users/update",
	"/users/edit"
})
public class UserServlet extends HttpServlet {
	private UserDAO userDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
    	super();
        this.userDAO = new UserDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
				
		String uri = request.getRequestURI();
		
		if(uri.contains("index")) {
			this.index(request,response);
		}else if(uri.contains("create")) {
			this.create(request,response);
		}else if(uri.contains("edit")) {
			this.edit(request, response);
		}else if(uri.contains("delete")) {
			this.delete(request, response);
		}else if(uri.contains("update")) {
			this.update(request, response);
		}else {
			// đưa ra thông báo lỗi
		}
	}

	private void delete(
			HttpServletRequest request, 
			HttpServletResponse response
			)throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		try {
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			
			User entity = this.userDAO.findById(id);
			this.userDAO.delete(entity);
			session.setAttribute("mes_delete_user", "Đã xóa thông tin người dùng");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.setAttribute("error_delete_user", "Xóa thất bại!");
		}
		response.sendRedirect("/Assignment_SOF3011_Quocdvph14459"
				+"/users/index");
		
		
	}

	protected void update(
			HttpServletRequest request,
			HttpServletResponse response
		) throws ServletException, IOException {
		HttpSession session = request.getSession();
			String idStr = request.getParameter("id");
			try {
				int id = Integer.parseInt(idStr);
				User oldValue = this.userDAO.findById(id);
				User newValue = new User();
				BeanUtils.populate(newValue,
					request.getParameterMap());
				
				newValue.setPassword( oldValue.getPassword() );
				this.userDAO.update(newValue);
				response.sendRedirect("/Assignment_SOF3011_Quocdvph14459"
					+ "/users/index");
				session.setAttribute("mes_update_user", "Thông tin người dùng vừa được cập nhật");
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/Assignment_SOF3011_Quocdvph14459"
					+ "/users/edit?id=" + idStr);
				session.setAttribute("error_update_user", "Cập nhật thông tin thất bại!");
			}
		}

	private void edit(
			HttpServletRequest request,
			HttpServletResponse response
			)throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String idStr  = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			User entity = this.userDAO.findById(id);
			
			request.setAttribute("user", entity);
			request.setAttribute("view", "/views/admin/users/edit.jsp");
			request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	private void create(
			HttpServletRequest request,
			HttpServletResponse response
			)throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("view", "/views/admin/users/create.jsp");
		request.getRequestDispatcher("/views/layout.jsp")
		.forward(request, response);
	}

	private void index(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<User> ds = this.userDAO.all();
		
		request.setAttribute("ds", ds);
		request.setAttribute("view", "/views/admin/users/index.jsp");
		
		request.getRequestDispatcher("/views/layout.jsp")
		.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		if (uri.contains("store")) {
			this.store(request, response);
		} else if (uri.contains("update")) {
			this.update(request, response);
		} else {
			// 404
		}
	}

	private void store(
			HttpServletRequest request,
			HttpServletResponse response
			)throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		try {
			User entity = new User();
			BeanUtils.populate(entity, request.getParameterMap());
			String encrypted = EncryptUtil.encrypt(
					request.getParameter("password")
					);
			entity.setPassword(encrypted);
			this.userDAO.create(entity);
			
			session.setAttribute("message", "Thêm mới thành công");
			response.sendRedirect("/Assignment_SOF3011_Quocdvph14459"
			+"/users/index");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.setAttribute("error", "Thêm mới thất bại!");
			response.sendRedirect("/Assignment_SOF3011_Quocdvph14459"
					+"/users/create");
		}
		
	}

}
