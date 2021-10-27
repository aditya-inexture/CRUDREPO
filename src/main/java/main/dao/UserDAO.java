package main.dao;

import java.util.List;

import main.entity.User;
import main.generic.GenericDao;

public interface UserDAO extends GenericDao<User> {

	public List<User> getUsers();
	
	/*
	 * public void saveUser(User user);
	 * 
	 * public User getUser(int uid);
	 * 
	 * public void deleteUser(int uid);
	 */
	
	public User getuserByemail(String emails);
	
	public byte[] getUserImage(int uid);
	
}
