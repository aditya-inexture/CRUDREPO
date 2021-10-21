package main.dao;

import java.util.List;

import main.entity.User;

public interface UserDAO {

	public List<User> getUsers();
	
	public void saveUser(User user);
	
	public User getUser(int uid);
	
	public void deleteUser(int uid);
	
	public User getuserByemail(String emails);
	
}
