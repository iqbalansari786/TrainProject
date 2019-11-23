package com.Train.Dao;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.Train.Entity.Admin;
import com.Train.Entity.Booktrain;
import com.Train.Entity.UserRegistration;
import com.Train.Entity.addtrain;
import com.Train.Entity.contactUs;

public interface Dao {
	
	public UserRegistration saveRegisterForm( UserRegistration userRegistration);



	public String userCheck(String email, String password);



	public String adminCheck(String email, String password);



	public addtrain addTrain(addtrain adtrain);



/*	public List<addtrain> checkTrain( String toPlace, String seatClass);*/



	public addtrain getTrain(int theid);



	public void deletetrain(int theid);



	public void savebookingticket(Booktrain booktrain);



	public List<Booktrain> getbookticketvalue();



	public void deleteticket(int theid);



	public List<addtrain> findallTrain();



	



	public void savecontact(contactUs contactva);



	public void updateTrain(addtrain update);







	public List<UserRegistration> findpassword(String username, String email);



	public List<UserRegistration> findadminpassword(String username);



	public List<addtrain> checkTrain(String fromPlace, String toPlace, String seatClass);



	public List<addtrain> checkTrain(String fromPlace, String toPlace, Date traindate);



	public Object getActiveUser(String username);



	public List<addtrain> findallTrain(int page_id, int total);



}
