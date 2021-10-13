package main.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.entity.Address;

@Repository
public class UserAddressDAOImpl implements UserAddressDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Address getAddress(int uid) {
		Session currentSession = sessionFactory.getCurrentSession();
		Address address = currentSession.get(Address.class, uid);
		return address;
	}

}
