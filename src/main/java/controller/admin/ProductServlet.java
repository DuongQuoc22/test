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

import dao.CategoryDAO;
import dao.ProductDAO;
import entities.Category;
import entities.Product;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet({
	
	"/products/index",
	"/products/store",
	"/products/create",
	"/products/delete",
	"/products/update",
	"/products/edit",
})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private CategoryDAO cateDAO;
       private ProductDAO productDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
        this.cateDAO = new CategoryDAO();
        this.productDAO = new ProductDAO();
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
		
		if(uri.contains("index")) {
			this.index(request, response);
		}else if(uri.contains("create")) {
			this.create(request, response);
		}else if(uri.contains("update")) {
			this.update(request, response);
		}else if(uri.contains("delete")) {
			this.delete(request, response);
		}else if(uri.contains("edit")) {
			this.edit(request, response);
		}else {
			//bao loi
		}
	}

	private void edit(
			HttpServletRequest request,
			HttpServletResponse response
			)throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Category> dsCate = this.cateDAO.all();
		request.setAttribute("dsCate", dsCate);
		
		try {
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			Product pro = this.productDAO.findById(id);
			
			request.setAttribute("pro", pro);
			request.setAttribute("view", "/views/admin/products/edit.jsp");
			request.getRequestDispatcher("/views/layout.jsp")
			.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

	private void delete(
			HttpServletRequest request,
			HttpServletResponse response
			) throws ServletException, IOException{
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		try {
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			
			Product pro = this.productDAO.findById(id);
			
			this.productDAO.delete(pro);
			
			session.setAttribute("mes_delete_pro", "Đã Xóa Sản Phẩm");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.setAttribute("error_delete_pro", "Xóa Thất Bại!");
			
		}
		response.sendRedirect("/Assignment_SOF3011_Quocdvph14459/products/index");
	}

	private void update(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException{
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String idStr = request.getParameter("id");
		try {
			int id = Integer.parseInt(idStr);
			Product newPro = new Product();
			int cateid = Integer.parseInt(request.getParameter("category_id"));
			Category c = this.cateDAO.findById(cateid);
			BeanUtils.populate(newPro, request.getParameterMap());
			newPro.setCategories(c);
			this.productDAO.update(newPro);
			response.sendRedirect("/Assignment_SOF3011_Quocdvph14459/products/index");
			session.setAttribute("mes_update_pro", "Thông tin sản phẩm đã được thay đổi");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("/Assignment_SOF3011_Quocdvph14459/products/edit?id="+idStr);
			session.setAttribute("error_update_pro", "Lỗi! Cập nhật thất bại!");
		}
		
	}

	private void create(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException{
		List<Category> dsCate = this.cateDAO.all();
		request.setAttribute("dsCate", dsCate);
		request.setAttribute("view", "/views/admin/products/create.jsp");
		request.getRequestDispatcher("/views/layout.jsp")
		.forward(request, response);
		
	}

	private void index(
			HttpServletRequest request, 
			HttpServletResponse response
			)throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Product> dsPro = this.productDAO.all();
		
		request.setAttribute("ds", dsPro);
		request.setAttribute("view", "/views/admin/products/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		
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
		if(uri.contains("store")) {
			this.store(request, response);
		}else if(uri.contains("update")) {
			this.update(request, response);
		}else {
			/// bao loi
		}
	}

	private void store(
			HttpServletRequest request, 
			HttpServletResponse response
			)throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		try {
			String ten = request.getParameter("ten");
			int soluong = Integer.parseInt(request.getParameter("soLuong"));
			
			double gia = Double.parseDouble(request.getParameter("donGia"));
			String mau = request.getParameter("mauSac");
			String size = request.getParameter("kichThuoc");
			Product pro = new Product();
			pro.setTen(ten);
			pro.setDonGia(gia);
			pro.setKichThuoc(size);
			pro.setMauSac(mau);
			pro.setSoLuong(soluong);
			int id = Integer.parseInt(request.getParameter("category_id"));
			Category cate = this.cateDAO.findById(id);
			pro.setCategories(cate);
			this.productDAO.create(pro);
			
			response.sendRedirect("/Assignment_SOF3011_Quocdvph14459/products/index");
			session.setAttribute("mes_add_pro", "Đã thêm sản phẩm mới");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.setAttribute("error_add_pro", "Thêm sản phẩm thất bại!");
		}
	}

}
