package com.Train.InterceptorConcept;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class InterceptorTrain extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Calendar cal=Calendar.getInstance();
	int day=cal.get(cal.DAY_OF_WEEK);
	System.out.println("day of week is "+day);
	if(day==1)
	{
		response.getWriter().write("sorry sir u r not able to use it today is friday");
		return false;
	}
		
		return true;
	}

}
