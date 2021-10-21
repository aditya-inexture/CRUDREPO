package main.service;

import java.util.List;

import main.entity.Address;

public interface UserAddressService {

	public List<Address> getAddresss(int uid);
	
	public void deleteAddress(int aid);
	
	public void saveAddress(Address address);
	
}
