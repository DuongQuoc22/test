package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.Product;
import utils.JPAUtils;

public class ProductDAO {
	 private EntityManager em;
	 public ProductDAO() {
		 this.em = JPAUtils.getEntityManager(); 
	 }
	 
	 public List<Product>all(){
		 String jpql= "SELECT obj FROM Product obj";
		 TypedQuery<Product> query = this.em.createQuery(jpql,Product.class);
		 
		 List<Product> ds = query.getResultList();
		 return ds;
	 }
	 public Product findById(int id) throws Exception {
		 Product u = this.em.find(Product.class, id);
		 if(u==null) {
			 throw new Exception("NotFoundException");
		 }
		 return u;
	 }
	 public Product create(Product entity) throws Exception {
		 try {
			this.em.getTransaction().begin();
			this.em.persist(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	 }
	 public void delete(Product entity)throws Exception{
		 try {
			this.em.getTransaction().begin();
			this.em.remove(entity);
			this.em.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	 }
	 public void update(Product entity)throws Exception {
		 try {
			this.em.getTransaction().begin();
			this.em.merge(entity);
			this.em.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	 }
}
