package com.Train.Entity;

import java.sql.Time;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
@Entity
public class addtrain {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int tid;
	
	private Integer trainNumber;
	private Integer duration;
	private Time time;
	
	@Column(name="from_place")
	private String fromplace;
	
	@Column(name="to_place")
	private String to;
	
	@Column(name="trainname")
	private String trainname;
	
	
	@Temporal(TemporalType.DATE)
     private Date trainDate;
	
	@Column(name="train_fare")
	private Integer fare;	

	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	private Integer trainSeat;
	

	public Integer getFare() {
		return fare;
	}
	public void setFare(Integer fare) {
		this.fare = fare;
	}
	private String classes;

	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}

	public String getFromplace() {
		return fromplace;
	}
	public void setFromplace(String fromplace) {
		this.fromplace = fromplace;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getTrainname() {
		return trainname;
	}
	public void setTrainname(String trainname) {
		this.trainname = trainname;
	}
	public Date getTrainDate() {
		return trainDate;
	}
	public void setTrainDate(Date trainDate) {
		this.trainDate = trainDate;
	}

	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}

	public Integer getTrainNumber() {
		return trainNumber;
	}
	public void setTrainNumber(Integer trainNumber) {
		this.trainNumber = trainNumber;
	}
	public Integer getTrainSeat() {
		return trainSeat;
	}
	public void setTrainSeat(Integer trainSeat) {
		this.trainSeat = trainSeat;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	
	


}
