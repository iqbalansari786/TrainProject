/*package com.Train.Controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

@RestController
public class DashBoardController {

	 @RequestMapping(value = "pdfReader1", method = RequestMethod.GET)
	  @ResponseBody
	  public void getRpt1(HttpServletResponse response) throws JRException, IOException {
	    InputStream jasperStream = this.getClass().getResourceAsStream("/jasperreports/HelloWorld1.jasper");
	    Map<String,Object> params = new HashMap<>();
	    JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
	    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, new JREmptyDataSource());

	    response.setContentType("application/x-pdf");
	    response.setHeader("Content-disposition", "inline; filename=helloWorldReport.pdf");

	    final OutputStream outStream = response.getOutputStream();
	     .exportReportToPdfStream(jasperPrint, outStream);
	  }
}
*/