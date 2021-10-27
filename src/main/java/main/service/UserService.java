package main.service;

import java.util.List;

import javax.transaction.Transactional;

import main.entity.User;

public interface UserService {

	@Transactional
	public List<User> getUsers();
	
	@Transactional
	public void saveUser(User user);
	
	@Transactional
	public User getUser(int uid);
	
	@Transactional
	public void deleteUser(int uid);
	
	@Transactional
	public User getuserByemail(String emails);
	
	@Transactional
	public byte[] getUserImage(int uid);
}
