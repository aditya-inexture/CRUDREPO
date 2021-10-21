package main.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.entity.Address;
import main.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<User> getUsers() {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<User> cq = cb.createQuery(User.class);
		Root<User> root = cq.from(User.class);
		cq.select(root);
		Query query = session.createQuery(cq);
		return query.getResultList();
	}

	public void saveUser(User user) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(user);
	}

	public User getUser(int uid) {
		Session currentSession = sessionFactory.getCurrentSession();
		User user = currentSession.get(User.class, uid);
		return user;
	}

	public void deleteUser(int uid) {
		Session session = sessionFactory.getCurrentSession();
		User user = session.byId(User.class).load(uid);
		session.delete(user);
	}

	@SuppressWarnings("unchecked")
	public User getuserByemail(String email) {
		Session currentSession = sessionFactory.getCurrentSession();
		TypedQuery<User> typedQuery = currentSession.createQuery("FROM User U WHERE U.email = :email");
		User user = typedQuery.setParameter("email", email).getSingleResult();
		return user;
	}

}
