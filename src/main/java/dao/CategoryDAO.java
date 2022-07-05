package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.Category;
import utils.JPAUtils;

public class CategoryDAO {
	 private EntityManager em;
	 public CategoryDAO() {
		 this.em = JPAUtils.getEntityManager();
	 }
	 
	 public List<Category>all(){
		 String jpql ="SELECT obj FROM Category obj";
		 TypedQuery<Category> query = this.em.createQuery(jpql,Category.class);
		 
		 List<Category> ds = query.getResultList();
		 return ds;
	 }
	 public Category findById(int id) throws Exception {
		Category u = this.em.find(Category.class, id);
		if(u==null) {
			throw new Exception("NotFoundException");
		}
		return u;
		
	 }
//	 public Category create(Category entity)throws Exception{
//		 try {
//			this.em.getTransaction().begin();
//			this.em.persist(entity);
//			this.em.getTransaction().commit();
//			return entity;
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			this.em.getTransaction().rollback();
//			throw e;
//		}
//	 }
	 public Category create(Category entity) throws Exception {
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
	 public void delete(Category entity) throws Exception {
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
	 public void update(Category entity) throws Exception{
		 try {
			this.em.getTransaction().begin();
			this.em.merge(entity);
			this.em.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			this.em.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}
	 }
}
