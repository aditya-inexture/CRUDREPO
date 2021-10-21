package main.entity;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "USER_DETAILS")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int uid;
	
	private String email;
	
	private String password;
	
	private String firstName;
	
	private String lastName;
	
	private char gender;
	
	private String type;

	@Column(name = "birthdate")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date dob;
	
	private BigInteger phoneNumber;
	
	@OneToMany(fetch=FetchType.EAGER,cascade = CascadeType.ALL,mappedBy = "user")
	private List<Address> addresss;
	
	public User() {
	}

	public User(int uid, String email, String password, String firstName, String lastName, char gender, String type,
			Date dob, BigInteger phoneNumber, List<Address> addresss) {
		super();
		this.uid = uid;
		this.email = email;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.type = type;
		this.dob = dob;
		this.phoneNumber = phoneNumber;
		this.addresss = addresss;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public List<Address> getAddresss() {
		return addresss;
	}

	public void setAddresss(List<Address> addresss) {
		this.addresss = addresss;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public BigInteger getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(BigInteger phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", email=" + email + ", password=" + password + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", gender=" + gender + ", type=" + type + ", dob=" + dob + ", phoneNumber="
				+ phoneNumber + ", addresss=" + addresss + "]";
	}
	
	
	
}
