package main.service;

import java.util.List;

import main.entity.User;

public interface UserService {

	public List<User> getUsers();
	
	public void saveUser(User user);
	
	public User getUser(int uid);
	
	public void deleteUser(int uid);
	
}
