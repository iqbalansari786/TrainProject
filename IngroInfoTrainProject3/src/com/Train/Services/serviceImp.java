package com.Train.Services;



import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Train.Dao.Dao;
import com.Train.Entity.Booktrain;
import com.Train.Entity.UserRegistration;
import com.Train.Entity.addtrain;
import com.Train.Entity.contactUs;
@Service
public class serviceImp implements service {
	@Autowired
	private Dao dao;

	@Transactional
	public UserRegistration saveRegisterForm( UserRegistration userRegistration) {
	return dao.saveRegisterForm(userRegistration);

	}

	@Override
	@Transactional
	public String userCheck(String email, String password) {
		
		return dao.userCheck(email,password);
	}

	@Override
	@Transactional
	public String adminCheck(String email, String password) {

		return dao.adminCheck(email,password);
	}

	@Override
	@Transactional
	public addtrain addTrain(addtrain adtrain) {
		return dao.addTrain(adtrain);
	}

	

	@Override
	@Transactional
	public addtrain getTrain(int theid) {
		return dao.getTrain(theid);
	}

	@Override
	@Transactional
	public void deletetrain(int theid) {
			dao.deletetrain(theid);
		
	}

	@Override
	@Transactional
	public void savebookingticket(Booktrain booktrain) {
		dao.savebookingticket(booktrain);
		
	}

	@Override
	@Transactional
	public List<Booktrain> getbookticketvalue() {
		return dao.getbookticketvalue();
	}

	@Override
	@Transactional
	public void deleteticket(int theid) {
		dao.deleteticket(theid);
		
	}

/*	@Override
	@Transactional
	public List<addtrain> checkTrain( String toPlace, String seatClass) {
	// TODO Auto-generated method stub
		return dao.checkTrain(toPlace, seatClass);
	}*/

	@Override
	@Transactional
	public List<addtrain> checkTrain(String fromPlace, String toPlace, String seatClass) {
		return dao.checkTrain(fromPlace,toPlace, seatClass);
	}
	@Override
	@Transactional
	public List<addtrain> findallTrain() {
	return dao.findallTrain();
	}





	@Override
	@Transactional
	public void savecontact(contactUs contactva) {
		dao.savecontact(contactva);
		
	}

	@Override
	@Transactional
	public void updateTrain(addtrain update) {
		dao.updateTrain(update);
		
	}


	@Override
	@Transactional
	public List<UserRegistration> findpassword(String username, String email) {
		return dao.findpassword(username,email);
	}

	@Override
	@Transactional
	public List<UserRegistration> findadminpassword(String username) {
		return dao.findadminpassword(username);
	}

	@Override
	@Transactional
	public List<addtrain> checkTrain(String fromPlace, String toPlace, Date traindate) {
		// TODO Auto-generated method stub
		return dao.checkTrain(fromPlace,toPlace,traindate);
	}

	@Override
	public boolean isUsernameAlreadyInUse(String username) {
		boolean userInDb = true;
		if (dao.getActiveUser(username) == null) userInDb = false;
		return userInDb;
	}

	@Override
	@Transactional
	public List<addtrain> findallTrain(int page_id, int total) {
		return dao.findallTrain(page_id,total);
	}

	



}
