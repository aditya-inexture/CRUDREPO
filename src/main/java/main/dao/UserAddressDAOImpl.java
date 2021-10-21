package main.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.entity.Address;
import main.entity.User;
import main.service.UserService;

@Repository
public class UserAddressDAOImpl implements UserAddressDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<Address> getAddresss(int uid) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<Address> cq = cb.createQuery(Address.class);
		Root<Address> root = cq.from(Address.class);
		cq.select(root).where(cb.equal(root.get("user"), uid));
		Query query = session.createQuery(cq);
		return query.getResultList();
	}

	public void deleteAddress(int aid) {
		Session session = sessionFactory.getCurrentSession();
		Address address = session.byId(Address.class).load(aid);
		address.getUser().getAddresss().remove(address);
		session.delete(address);		
	}

	public void saveAddress(Address address) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(address);
	}


}
