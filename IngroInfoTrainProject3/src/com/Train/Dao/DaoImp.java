package com.Train.Dao;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Train.Entity.Admin;
import com.Train.Entity.Booktrain;
import com.Train.Entity.UserRegistration;
import com.Train.Entity.addtrain;
import com.Train.Entity.contactUs;

import org.hibernate.query.Query;
@Repository
public class DaoImp implements Dao{
	@Autowired
	private SessionFactory Sessionfactory;
	private Session session;



	@Override
	public UserRegistration saveRegisterForm( UserRegistration userRegistration) {
	
	session = Sessionfactory.getCurrentSession();
		
		session.save(userRegistration);
		
		return userRegistration;
	}



	@Override
	public String userCheck(String email, String password) {
		session = Sessionfactory.getCurrentSession();
		System.out.println("starting");
		Query query = session.createQuery("from  UserRegistration where email =: email and password =:password ",UserRegistration.class);
		query.setParameter("email",email);
		query.setParameter("password", password);

		if ((UserRegistration) query.uniqueResult() != null) {
			System.out.println("finished");
			return "true";
		
		} 
		else {
			System.out.println("not found");
			return "false";
		}

	}



	@Override
	public String adminCheck(String email, String password) {
		session = Sessionfactory.getCurrentSession();
	
		Query query = session.createQuery("from Admin where username =: username and password =:password ",Admin.class);
		query.setParameter("username",email);
		query.setParameter("password", password);
	
	
	if ((Admin) query.uniqueResult() != null) {
		
			return "true";
		
		} 
		else {
			System.out.println("not found");
			return "false";
		}

	
	}



	@Override
	public addtrain addTrain(addtrain adtrain) {
     session = Sessionfactory.getCurrentSession();
		System.out.println("saving ......");
   session.save(adtrain);
   System.out.println("This is the value of adding Train:"+adtrain);

   
     return adtrain;
   
    }



	
	/*		@Override
			public List<addtrain> checkTrain( String fromPlace,String toPlace, Date trainDate,String seatClass) {
				Session currentSession = Sessionfactory.getCurrentSession();
				
				Query query=currentSession.createQuery("from addtrain where fromplace=:fromPlace And to =:toPlace AND trainDate=:trainDate And classes =:seatClass" ,addtrain.class);
				
				query.setString("fromplace", fromPlace);
				query.setString("toPlace", toPlace);
				query.setString("seatClass", seatClass);
				
				query.setString("trainDate", trainDate);
				System.out.println("completed dao part for find train");
				for(Object t:query.list())
				{
					addtrain ts=(addtrain)t;
					System.out.println("coming value  is based on search"+ts.getTrainname());
				
				}
				
				return query.list();
		
	}*/
			@Override
			public List<addtrain> checkTrain(String fromPlace, String toPlace, String seatClass) {
	           Session currentSession = Sessionfactory.getCurrentSession();
				
				Query query=currentSession.createQuery("from addtrain where fromplace=:fromPlace And to =:toPlace AND  classes =:seatClass" ,addtrain.class);
				
				query.setString("fromPlace", fromPlace);
				query.setString("toPlace", toPlace);
				query.setString("seatClass", seatClass);
			
				return query.list();
			}



	@Override
	public addtrain getTrain(int theid) {
		session=Sessionfactory.getCurrentSession();
	addtrain gettrainname=session.get(addtrain.class, theid);
		return gettrainname;
	}



	@Override
	public void deletetrain(int theid) {
		session=Sessionfactory.getCurrentSession();
		Query query=	session.createQuery("delete from addtrain where tid=:tid");
			query.setParameter("tid", theid);
				query.executeUpdate();
			
		
	}



	@Override
	public void savebookingticket(Booktrain booktrain) {
		Sessionfactory.getCurrentSession().save(booktrain);
		System.out.println("succesfully saved");
		
	}



	@Override
	public List<Booktrain> getbookticketvalue() {
		return Sessionfactory.getCurrentSession().createQuery("from Booktrain").list();

	 
	}



	@Override
	public void deleteticket(int theid) {
		
		session=Sessionfactory.getCurrentSession();
		Query query=	session.createQuery("delete from Booktrain where bookid=:bookid");
			query.setParameter("bookid", theid);
				query.executeUpdate();
	}



	@Override
	public List<addtrain> findallTrain() {
		// TODO Auto-generated method stub
	Query query=Sessionfactory.getCurrentSession().createQuery("from addtrain");
/*	 query.setFirstResult(1);//set first result start value
	  query.setMaxResults(3);//number of result to be display
*/		
		return query.list();
	}


	@Override
	public void savecontact(contactUs contactva) {
		Sessionfactory.getCurrentSession().saveOrUpdate(contactva);
	}



	@Override
	public void updateTrain(addtrain update) {
	Sessionfactory.getCurrentSession().saveOrUpdate(update);
	}







	@Override
	public List<UserRegistration> findpassword(String username, String email) {
		System.out.println("inside dao starting to find password");
     Query query= (Query) Sessionfactory.getCurrentSession().createQuery( "Select log.password from UserRegistration log where log.firstname=:username and log.email=:email");
	query.setString("username", username);
	query.setString("email", email);
	System.out.println("found password");
	return  query.list();
     
	}



	@Override
	public List<UserRegistration> findadminpassword(String username) {
		System.out.println("inside dao starting to find admin password");
	     Query query= (Query) Sessionfactory.getCurrentSession().createQuery( "Select log.password from Admin log where log.username=:username");
		query.setString("username", username);
		
		System.out.println("found password");
		System.out.println("coming password is .."+query.list());
		return  query.list();
	}



	@Override
	public List<addtrain> checkTrain(String fromPlace, String toPlace, Date traindate) {
		   Session currentSession = Sessionfactory.getCurrentSession();
			
			Query query=currentSession.createQuery("from addtrain where fromplace=:fromPlace And to =:toPlace AND  trainDate =:traindate" ,addtrain.class);
			
			query.setString("fromPlace", fromPlace);
			query.setString("toPlace", toPlace);
			query.setDate("traindate",traindate);
		
			return query.list();
	}



	@Override
	public Object getActiveUser(String username) {
		  Session currentSession = Sessionfactory.getCurrentSession();
	UserRegistration user;
		
		try {
			user = (UserRegistration) currentSession.createQuery("from UserRegistration u where u.email = :username")
					.setParameter("username", username)
					.getSingleResult();
		} catch (NoResultException e) {
			user = null;
		}
		
		return user;
	}



	@Override
	public List<addtrain> findallTrain(int pageid, int total) {
		Query query=Sessionfactory.getCurrentSession().createQuery("from addtrain");
		 query.setFirstResult(pageid);//set first result start value
		  query.setMaxResults(total);//number of result to be display
			
			return query.list();
	}
	}



	



	








	



