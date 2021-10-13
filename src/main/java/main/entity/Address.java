package main.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "USER_ADDRESS")
public class Address {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int aid;
	
	private String inputAddress1;
	
	private String inputAddress2;
	
	private String city;
	
	private String state;
	
	private String zip;
	
	private String country;
	
	@OneToOne(mappedBy = "address")
	private User user;

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getInputAddress1() {
		return inputAddress1;
	}

	public void setInputAddress1(String inputAddress1) {
		this.inputAddress1 = inputAddress1;
	}

	public String getInputAddress2() {
		return inputAddress2;
	}

	public void setInputAddress2(String inputAddress2) {
		this.inputAddress2 = inputAddress2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	
}
