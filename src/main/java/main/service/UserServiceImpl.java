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
public class UserServiceImpl implements UserService,UserAddressService,LoginService {
	
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
	public List<Address> getAddresss(int uid) {
		return userAddressDAO.getAddresss(uid);
	}

	@Transactional
	public void saveAddress(Address address) {
		userAddressDAO.saveAddress(address);
		
	}

	@Transactional
	public void deleteAddress(int aid) {
		userAddressDAO.deleteAddress(aid);
		
	}

	@Transactional
	public String validateUser(String username, String password) throws NullPointerException {
		User user = getuserByemail(username);
		if(user != null) {
			if(user.getEmail().equalsIgnoreCase(username) && user.getPassword().equals(password) && user.getType().equalsIgnoreCase("admin") ) {
				 return "admin";
			}
			else if(user.getEmail().equalsIgnoreCase(username) && user.getPassword().equals(password) && user.getType().equalsIgnoreCase("user") ) {
				return "normalUser";
			}
			else {
				return "wrongUserOrPassword";
			}
		}else {
			return "notFound";
		}
		
	}

	@Transactional
	public User getuserByemail(String emails) {
		User user = userDAO.getuserByemail(emails);
		return user;
	}


}
