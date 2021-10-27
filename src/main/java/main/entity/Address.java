package main.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


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
	
	@ManyToOne
	@JoinColumn(name = "user_id",updatable = false)
	private User user;

	@JsonIgnore
	public User getUser() {
		return user;
	}

	@JsonIgnore
	public void setUser(User user) {
		this.user = user;
	}

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

	@Override
	public String toString() {
		return "Address [aid=" + aid + ", inputAddress1=" + inputAddress1 + ", inputAddress2=" + inputAddress2
				+ ", city=" + city + ", state=" + state + ", zip=" + zip + ", country=" + country + ", user=" + user
				+ "]";
	}

	public Address() {
	}

	public Address(int aid, String inputAddress1, String inputAddress2, String city, String state, String zip,
			String country, User user) {
		super();
		this.aid = aid;
		this.inputAddress1 = inputAddress1;
		this.inputAddress2 = inputAddress2;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.country = country;
		this.user = user;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	
}
