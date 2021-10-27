package main.dao;

import java.util.ArrayList;
import java.util.List;

import main.entity.Address;
import main.generic.GenericDao;

public interface UserAddressDAO extends GenericDao<Address> {

	public ArrayList<Address> getAddresss(int uid);
	
	//public void deleteAddress(int aid);
	
	//public void saveAddress(Address address);
		
}
