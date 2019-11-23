package com.file.save;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

public  class JavaRunBatFile {

    public static void main(String[] args) {
   
   try {

          
String filePath = " cmd /C Start  D:/jboss-4.0.5.GAGD/bin/run.bat";

    			 Runtime rt = Runtime.getRuntime();
    			 Process pr = rt.exec(filePath);

            
        } catch (IOException e) {
            e.printStackTrace();
       
        }

    }

}