package com.Train.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;


import org.springframework.web.multipart.MultipartFile;

/*import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;*/

@Entity
@Table(name="booktrain")
/*@JsonIgnoreProperties({"nationality"})
@JsonPropertyOrder({"trainNumber","Train_name","fullname","age","address","idProof","totalfare"})
@JsonInclude(JsonInclude.Include.NON_NULL)*/
public class Booktrain {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="bookid")

	private int bookid;
	private Integer trainNumber;
	@Column(name="trainname")
	/*@JsonProperty("Train_name")*/
	private String trainname;
	@Column(name="fullname")
	private String fullname;
	@Column(name="address")
	private String address;
	@Column(name="age")
	private Integer age;
	@Column(name="idProof")
	private String idproof;
	@Column(name="totalfare")

	private Integer totalfare;
	
	private String email;

	private String Nationality;
	@Lob
	@Transient
	private MultipartFile photo;
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	public String getNationality() {
		return Nationality;
	}
	public void setNationality(String nationality) {
		Nationality = nationality;
	}
	
	public String getTrainname() {
		return trainname;
	}
	public void setTrainname(String trainname) {
		this.trainname = trainname;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public String getIdproof() {
		return idproof;
	}
	public void setIdproof(String idproof) {
		this.idproof = idproof;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Integer getTotalfare() {
		return totalfare;
	}
	public void setTotalfare(Integer totalfare) {
		this.totalfare = totalfare;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getTrainNumber() {
		return trainNumber;
	}
	public void setTrainNumber(Integer trainNumber) {
		this.trainNumber = trainNumber;
	}
	public Booktrain(int bookid, Integer trainNumber, String trainname) {
		super();
		this.bookid = bookid;
		this.trainNumber = trainNumber;
		this.trainname = trainname;
	}
public Booktrain() {
	// TODO Auto-generated constructor stub
}

	



	

}
