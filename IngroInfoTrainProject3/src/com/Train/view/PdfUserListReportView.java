package com.Train.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.Train.Entity.Booktrain;
import com.Train.Entity.User;
import com.lowagie.text.Document;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;

public class PdfUserListReportView extends AbstractPdfView {

 @Override
 protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer, HttpServletRequest request,
   HttpServletResponse response) throws Exception {
  
  response.setHeader("Content-Disposition", "attachment; filename=\"Ticket_info.pdf\"");
  
  @SuppressWarnings("unchecked")
  List<User> list = (List<User>) model.get("userList");

  
  Table table = new Table(6);
  table.addCell("Train number");
  table.addCell("Train name");
  table.addCell("Fullname");
  table.addCell("Age");
  table.addCell("Idproof");
  table.addCell("Total charge");

  
  for(User user : list){
   table.addCell(String.valueOf(user.getTrainnumber()));
   table.addCell(user.getTrainname());
   table.addCell(user.getFirstname());
   table.addCell(String.valueOf(user.getAge()));
   table.addCell(user.getIdproof());
   table.addCell(String.valueOf(user.getTotalfare()));
  }

  document.add(table);
 }

}