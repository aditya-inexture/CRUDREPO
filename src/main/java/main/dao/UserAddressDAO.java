package main.dao;

import java.util.List;

import main.entity.Address;

public interface UserAddressDAO {

	public List<Address> getAddresss(int uid);
	
	public void deleteAddress(int aid);
	
	public void saveAddress(Address address);
		
}
