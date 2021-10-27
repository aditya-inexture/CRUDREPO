package main.service;

import java.util.ArrayList;
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

	
	public List<User> getUsers() {
		
		return userDAO.getUsers();
	}

	
	public void saveUser(User user) {
		userDAO.create(user);
	}

	
	public User getUser(int uid) {
		
		return userDAO.find(uid);
	}

	
	public void deleteUser(int uid) {
		userDAO.delete(uid);
	}

	public ArrayList<Address> getAddresss(int uid) {
		return userAddressDAO.getAddresss(uid);
	}

	public void saveAddress(Address address) {
		userAddressDAO.create(address);
		
	}

	@Transactional
	public void deleteAddress(int aid) {
		Address adr = userAddressDAO.find(aid);
		adr.getUser().getAddresss().remove(adr);
		userAddressDAO.delete(aid);
		
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

	
	public User getuserByemail(String emails) {
		User user = userDAO.getuserByemail(emails);
		return user;
	}


	public byte[] getUserImage(int uid) {
		return userDAO.getUserImage(uid);
	}


}
