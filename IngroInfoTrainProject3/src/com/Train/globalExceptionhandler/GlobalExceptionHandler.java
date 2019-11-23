package com.Train.globalExceptionhandler;

import java.io.IOException;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;


@ControllerAdvice
public class GlobalExceptionHandler {
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler({NullPointerException.class, ArrayIndexOutOfBoundsException.class, IOException.class,Exception.class})
	public String handleNullPointerException(Exception e)
	{
		
		return "ExceptionPage";
	}

}
