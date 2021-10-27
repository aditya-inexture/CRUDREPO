package main.generic;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


public abstract class GenericDaoImpl<T> implements GenericDao<T> {

	@Autowired
	private SessionFactory sessionFactory;
	
	 private Class<T> type;

	 @SuppressWarnings("unchecked")
	public GenericDaoImpl() {
		 Type t = getClass().getGenericSuperclass();
		 ParameterizedType pt = (ParameterizedType) t;
		 type = (Class) pt.getActualTypeArguments()[0];
	 }
	
	public T create(T t) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(t);
		return t;
	}

	public void delete(Object id) {
		Session session = sessionFactory.getCurrentSession();
		T t = session.getReference(type, id);
		session.delete(t);	
	}

	public T find(Object id) {
		Session currentSession = sessionFactory.getCurrentSession();
		T t = currentSession.find(type, id);
		return t;
	}

	/*
	 * public T update(T t) {
	 * 
	 * return null; }
	 */

}
