package com.Train.Entity;


public class User {
 private Integer trainnumber;
 private String trainname;
 private String firstname;
private Integer age;
private String idproof;
private Integer totalfare;
 
 public User() {
  super();
 }

public Integer getTrainnumber() {
	return trainnumber;
}

public void setTrainnumber(Integer trainnumber) {
	this.trainnumber = trainnumber;
}

public String getTrainname() {
	return trainname;
}

public void setTrainname(String trainname) {
	this.trainname = trainname;
}

public String getFirstname() {
	return firstname;
}

public void setFirstname(String firstname) {
	this.firstname = firstname;
}

public Integer getAge() {
	return age;
}

public void setAge(Integer age) {
	this.age = age;
}

public String getIdproof() {
	return idproof;
}

public void setIdproof(String idproof) {
	this.idproof = idproof;
}

public Integer getTotalfare() {
	return totalfare;
}

public void setTotalfare(Integer totalfare) {
	this.totalfare = totalfare;
}

public User(Integer trainnumber, String trainname, String firstname, Integer age, String idproof, Integer totalfare) {
	super();
	this.trainnumber = trainnumber;
	this.trainname = trainname;
	this.firstname = firstname;
	this.age = age;
	this.idproof = idproof;
	this.totalfare = totalfare;
}

 
}