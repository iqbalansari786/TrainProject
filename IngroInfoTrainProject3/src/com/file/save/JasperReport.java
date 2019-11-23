package com.file.save;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;

public class JasperReport {
	public static void main(String args[])
	{
      String sourceFileName="C://Users//Sonu//hibernatetutorial//trainproject//IngroInfoTrainProject//WebContent//report//ReportDemo.jrxml";


try { 


JasperCompileManager.compileReport(sourceFileName);
}
catch (JRException e) 

{ 
	e.printStackTrace(); 
} 
System.out.println( "Done compiling!!! ..." ); 
}



}
