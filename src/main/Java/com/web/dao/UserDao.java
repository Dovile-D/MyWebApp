package com.web.dao;
import com.web.model.User;

import java.util.ArrayList;
import java.util.List;

import com.web.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

	public class UserDao {
	
		public void newUser(User user) {
			Transaction transaction = null;
			try (Session session = HibernateUtil.getSessionFactory().openSession()) {
				transaction = session.beginTransaction();
				session.save(user);
				transaction.commit();
			} catch (Exception e) {
				if (transaction != null) {
				transaction.rollback();
				}
            e.printStackTrace();
			}
		}
	
	 public User takeUser(int id) {
	        Transaction transaction = null;
	        User user = null;
	        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	            transaction = session.beginTransaction();	
	            user = session.get(User.class, id);
	            transaction.commit();
	        } catch (Exception e) {
	            if (transaction != null) {
	                transaction.rollback();
	            }
	            e.printStackTrace();
	        }
	        return user;
	    }
	
		public List<User> listEveryUser() {

	        Transaction transaction = null;
	        List <User> usersList = new ArrayList<User>();
	        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	            transaction = session.beginTransaction();
	             usersList = session.createQuery("from User").getResultList();
	            transaction.commit();
	        } catch (Exception e) {
	            if (transaction != null) {
	                transaction.rollback();
	            }
	            e.printStackTrace();
	        }
	        return usersList;
	    }
	 public void renewalOfUser(User user) {
	        Transaction transaction = null;
	        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	            transaction = session.beginTransaction();
	            session.update(user);
	            transaction.commit();
	        } catch (Exception e) {
	            if (transaction != null) {
	                transaction.rollback();
	            }
	            e.printStackTrace();
	        }
	    }
	 
	 public void deletionOfUser(int id) {
	        Transaction transaction = null;
	        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	            transaction = session.beginTransaction();
	            User user = session.get(User.class, id);
	            if (user != null) {
	                session.delete(user);
	                System.out.println("user is deleted");
	            }
	            transaction.commit();
	        } catch (Exception e) {
	            if (transaction != null) {
	                transaction.rollback();
	            }
	            e.printStackTrace();
	        }
	    }
}
