package com.Train.Entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;
 
/*import com.validatior.UniqueUserName;*/

@Entity
@Table(name="userregister")
public class UserRegistration {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="uid")
    private int id;
	@NotNull(message="is required")
	@Column(name="password")
	private String password;
	
	@Column(name="ConfirmPassword")
	private String confirmPassword;
	
	@NotNull
	@Size(min=2, max=30,message="required") 
	@Column(name="Firstname")
	private String firstname;


	@Column(name="Lastname")
	private String lastname;
	
	@NotEmpty(message = "Please enter your email addresss.")
	@Column(name="email")
	private String email;


	@Column(name="address")
	private String address;
	
	@Column(name="Nationality")
    private String Nationality;
	

	@Column(name="mobile")
	private String mobile;
	
	@Column(name="idProof")
	private String idProof;
	
	
	@Lob
	@Transient
	private MultipartFile photo;

	


	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	@Column(name="gender")
	private String gender;

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNationality() {
		return Nationality;
	}

	public void setNationality(String nationality) {
		Nationality = nationality;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getIdProof() {
		return idProof;
	}

	public void setIdProof(String idProof) {
		this.idProof = idProof;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}


	

}
