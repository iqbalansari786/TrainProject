package com.Train.Controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

import com.Train.Entity.Dummy;

@RestController
public class TrainProjectRestApiController {

	@RequestMapping(value = "/bookedtrainValue", method = RequestMethod.GET)
	public ArrayList<Dummy> booktrainvalue() {
		
		Dummy d = new Dummy();
		d.setName("sham");
		Dummy d1 = new Dummy();
		d1.setName("bhagirati");

		ArrayList<Dummy> al = new ArrayList<Dummy>();
		al.add(d);
		al.add(d1);
		System.out.println(al.toString());
		return al;
	}

}
