/*package com.validatior;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.Train.Services.service;

@Component
public class UniqueUsernameValidator implements ConstraintValidator<UniqueUserName, String>{

	@Autowired
	private service userService;

	

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		return value != null && !userService.isUsernameAlreadyInUse(value);
	}



	@Override
	public void initialize(UniqueUserName arg0) {
		
		
	}
}*/