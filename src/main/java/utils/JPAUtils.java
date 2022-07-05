package utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtils {
		public static EntityManagerFactory getFactory() {
			EntityManagerFactory factory = 
					Persistence.createEntityManagerFactory("Assignment_SOF3011_Quocdvph14459");
			return factory;
		}
		
		public static EntityManager getEntityManager() {
			EntityManager em = JPAUtils.getFactory().createEntityManager();
			return em;
		}
}
