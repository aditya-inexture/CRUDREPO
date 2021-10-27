package main.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import main.entity.Address;

public interface UserAddressService {

	@Transactional
	public ArrayList<Address> getAddresss(int uid);
	
	@Transactional
	public void deleteAddress(int aid);
	
	@Transactional
	public void saveAddress(Address address);
	
}
