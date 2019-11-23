package com.Train.CustomEditor;

import java.beans.PropertyEditorSupport;

import com.Train.Entity.addtrain;



public class AddtrainCustomEditor extends PropertyEditorSupport {
	
 
	
@Override
public void setAsText(String text) throws IllegalArgumentException {
	

	
	
	
	if(text.contains(" Express"))
	{
		setValue(text);
	}
	else {
		
		String finaltrainname=text+"  Express";
		setValue(finaltrainname);
	}
		
	
	
}	

}
