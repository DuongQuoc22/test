package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import dao.CategoryDAO;
import entities.Category;
import entities.User;


@WebServlet({
	"/category/index",
	"/category/create",
	"/category/store",
	"/category/delete",
	"/category/update",
	"/category/edit"
})
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO categoryDAO;
	private UserDAO userDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
        this.categoryDAO = new CategoryDAO();
        this.userDAO = new UserDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();

		if (uri.contains("index")) {
			this.index(request, response);
		} else if (uri.contains("create")) {
			this.create(request, response);
		} else if (uri.contains("edit")) {
			this.edit(request, response);
		} else if (uri.contains("delete")) {
			this.delete(request, response);
		} else if (uri.contains("update")) {
			this.update(request, response);
		} else {
			// đưa ra thông báo lỗi
		}
	}

	private void update(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String idStr = request.getParameter("id");
		try {
			int id = Integer.parseInt(idStr);
			Category newCate = new Category();
			int userid = Integer.parseInt(request.getParameter("user_id"));
			User u = this.userDAO.findById(userid);
			BeanUtils.populate(newCate, request.getParameterMap());
			newCate.setUser(u);
			this.categoryDAO.update(newCate);
			
			response.sendRedirect("/Assignment_SOF3011_Quocdvph14459/category/index");
			session.setAttribute("mes_update_cate", "Đã Cập Nhật");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("/Assignment_SOF3011_Quocdvph14459/category/edit?id="+idStr);
			session.setAttribute("error_update_cate", "Cập Nhật Thất Bại");
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
			
			Category cate = this.categoryDAO.findById(id);
			this.categoryDAO.delete(cate);
			
			session.setAttribute("mes_delete_cate", "Đã Xóa");
			
		} catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("error_delete_cate", "Thất Bại!");
		}
		response.sendRedirect("/Assignment_SOF3011_Quocdvph14459"
				+"/category/index");
	}

	private void edit(
			HttpServletRequest request,
			HttpServletResponse response
			)throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<User> ds = this.userDAO.all();
		request.setAttribute("dsUser", ds);
		try {
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			Category cate = this.categoryDAO.findById(id);
			request.setAttribute("cate", cate);
			request.setAttribute("view", "/views/admin/category/edit.jsp");
			request.getRequestDispatcher("/views/layout.jsp")
			.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	private void create(
			HttpServletRequest request,
			HttpServletResponse response
			)throws ServletException,IOException {
		// TODO Auto-generated method stub
		List<User> ds = this.userDAO.all();
		request.setAttribute("dsUser", ds);
		request.setAttribute("view","/views/admin/category/create.jsp" );
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void index(
			HttpServletRequest request, 
			HttpServletResponse response
			)throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Category> cate = this.categoryDAO.all();
		
		request.setAttribute("dsCate", cate);
		request.setAttribute("view", "/views/admin/category/index.jsp");
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
			)throws ServletException,IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		try {
			String ten = request.getParameter("ten");
			Category cate = new Category();
			cate.setTen(ten);
			int id = Integer.parseInt(request.getParameter("user_id"));
			User user = this.userDAO.findById(id);
			cate.setUser(user);
			
			this.categoryDAO.create(cate);
			
			session.setAttribute("mes_add_cate", "Thêm Thành Công");
			response.sendRedirect("/Assignment_SOF3011_Quocdvph14459"
					+"/category/index");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.setAttribute("error_add_cate", "Thêm Thất Bại!");
		}
	}

}
