package main.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.dao.UserAddressDAO;
import main.dao.UserDAO;
import main.entity.Address;
import main.entity.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private UserAddressDAO userAddressDAO;

	@Transactional
	public List<User> getUsers() {
		
		return userDAO.getUsers();
	}

	@Transactional
	public void saveUser(User user) {
		userDAO.saveUser(user);
	}

	@Transactional
	public User getUser(int uid) {
		
		return userDAO.getUser(uid);
	}

	@Transactional
	public void deleteUser(int uid) {
		userDAO.deleteUser(uid);
	}

	@Transactional
	public Address getAddress(int uid) {
		
		return userAddressDAO.getAddress(uid);
	}

}
