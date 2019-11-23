package com.Train.Controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.MediaType;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Train.CustomEditor.AddtrainCustomEditor;
import com.Train.Entity.Admin;
import com.Train.Entity.Booktrain;
import com.Train.Entity.User;
import com.Train.Entity.UserRegistration;
import com.Train.Entity.addtrain;
import com.Train.Entity.contactUs;
import com.Train.Services.service;
import com.Train.view.PdfUserListReportView;


import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;

@org.springframework.stereotype.Controller
public class Controller {

	private static final String UPLOAD_DIRECTORY = "/photo";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3;
	// And receiver! gmail.com";

	@Autowired
	private service serviceforall;
	@Autowired
	public JavaMailSender emailSender;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		/* binder.setDisallowedFields(new String[] {"tranDate"}); */

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		binder.registerCustomEditor(Date.class, "trainDate", new CustomDateEditor(sdf, true));
		binder.registerCustomEditor(String.class, "trainname", new AddtrainCustomEditor());
	}

	@RequestMapping(value = { "/", "/home" })
	public String homesection(Model model) {
		/*
		 * String exceptionOccured="NULL_POINTER";
		 * if(exceptionOccured.equalsIgnoreCase("NULL_POINTER")) { throw new
		 * RuntimeException(); throw new NullPointerException("null ponter exception");
		 * }
		 */

		UserRegistration userRegistration = new UserRegistration();
		model.addAttribute("forgetvalue", userRegistration);
		model.addAttribute("regvalue", userRegistration);
		Map<String, String> idproof = new HashMap<String, String>();
		idproof.put("Adharcard", "AdharCard");
		idproof.put("Passport", "Passport");
		idproof.put("Student id", "Student ID");
		model.addAttribute("idproof", idproof);

		Map<String, String> classes = new HashMap<String, String>();
		classes.put("AC", "Ac");
		classes.put("Sleeper", "Sleeper");
		classes.put("General", "General");
		model.addAttribute("classes", classes);
		addtrain atrain = new addtrain();
		model.addAttribute("findtrainvalue", atrain);

		model.addAttribute("loginformvalue", userRegistration);
		return "home";
	}

	@RequestMapping("/homeafterfindtrain")
	public String homeafterfindtrain()

	{
		return "redirect:/";
	}

	@RequestMapping("/aboutus")
	public String homesections(Model model) {
		contactUs conatct = new contactUs();
		model.addAttribute("contactvalue", conatct);
		return "aboutus";
	}

	@RequestMapping(value = "/registeringprocess", method = RequestMethod.POST)
	public String registerationProcessform(@Valid @ModelAttribute("regvalue")  UserRegistration userRegistration,
			 BindingResult binding,	@RequestParam CommonsMultipartFile file, HttpSession session, Model model)
			throws IOException {
		
		  if(binding.hasErrors()) { 
			  System.out.println("some error in databinding");
		  }
		 
	
		SimpleMailMessage message = new SimpleMailMessage();
		String email = userRegistration.getEmail();
		String passwords = userRegistration.getPassword();
		int id = userRegistration.getId();

		System.out.println("mail id :" + email);
		if (email.isEmpty()) {
			throw new RuntimeException();

		}
		message.setTo(email);

		message.setSubject("Registration...");
		message.setText("You are  succesfully registred..\n" + "with username=>:" + email + " passowrd=>:" + passwords);

		// Send Message!
		this.emailSender.send(message);
		System.out.println("succesfully sent");

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);
		ServletContext context = session.getServletContext();

		String uploadPath = context.getRealPath(UPLOAD_DIRECTORY);
		System.out.println(uploadPath);
		/* file.getOriginalFilename()+ */
		byte[] bytes = file.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream(
				new FileOutputStream(new File(uploadPath + File.separator + id + "_" + email + ".jpg")));
		stream.write(bytes);
		stream.flush();
		stream.close();

		UserRegistration userregistration = new UserRegistration();

		serviceforall.saveRegisterForm(userRegistration);
		model.addAttribute("msg", "succesfully registered");
		return "redirect:/";
		
		/*
		 * SimpleMailMessage message = new SimpleMailMessage(); String
		 * email=userRegistration.getEmail(); String
		 * passwords=userRegistration.getPassword(); int id=userRegistration.getId();
		 * 
		 * System.out.println("mail id :"+email); if(email.isEmpty()) { throw new
		 * RuntimeException();
		 * 
		 * } message.setTo(email);
		 * 
		 * message.setSubject("Registration...");
		 * message.setText("You are  succesfully registred..\n" + "with username=>:"
		 * +email+ " passowrd=>:" +passwords);
		 * 
		 * // Send Message! this.emailSender.send(message);
		 * System.out.println("succesfully sent");
		 * 
		 * DiskFileItemFactory factory = new DiskFileItemFactory();
		 * factory.setSizeThreshold(THRESHOLD_SIZE); factory.setRepository(new
		 * File(System.getProperty("java.io.tmpdir")));
		 * 
		 * ServletFileUpload upload = new ServletFileUpload(factory); ServletContext
		 * context = session.getServletContext();
		 * 
		 * String uploadPath = context.getRealPath(UPLOAD_DIRECTORY);
		 * System.out.println(uploadPath); file.getOriginalFilename()+ byte[] bytes =
		 * file.getBytes(); BufferedOutputStream stream =new BufferedOutputStream(new
		 * FileOutputStream(new File(uploadPath + File.separator +id+"_"+
		 * email+".jpg"))); stream.write(bytes); stream.flush(); stream.close();
		 * 
		 * UserRegistration userregistration= new UserRegistration();
		 * 
		 * serviceforall.saveRegisterForm(userRegistration);
		 * model.addAttribute("msg","succesfully registered"); return "redirect:/";
		 */
	}

	@RequestMapping(value = "/loginintoUserPage", method = RequestMethod.POST)
	public String loginpage(@Valid @ModelAttribute("loginformvalue") UserRegistration userlogin,BindingResult result, Model model,
			HttpSession session) {
		if(result.hasErrors())
		{
			System.out.println("there is error while binding with form with pojo");
			model.addAttribute("loginError","plz insert some valid value");
		}

		String email = userlogin.getEmail();
		String password = userlogin.getPassword();

		session.setAttribute("username", email);
		System.out.println("userlogin session value" + session.getAttribute("username"));

		String flag = serviceforall.userCheck(email, password);

		if (flag.equals("true")) {

			System.out.println("logged sucesfully");
			return "updatedUserPage";
		} else {

			Model s = model.addAttribute("userlogin", "Invalid information");
			System.out.println("failed value" + s);

			return "redirect:/";
		}

	}

	@RequestMapping("/findtrain")
	public String enquirypage() {

		return "enquirypage";

	}

	@RequestMapping(value = "/gotofindtrainpage", method = RequestMethod.POST)
	public String findtrainpage(@ModelAttribute("findtrainvalue") addtrain findtrainvalue, Model model) {

		String fromPlace = findtrainvalue.getFromplace();
		String toPlace = findtrainvalue.getTo();
		Date traindate = findtrainvalue.getTrainDate();

		System.out.println("coming date" + traindate + "...and from is.." + fromPlace);
		String seatClass = findtrainvalue.getClasses();

		model.addAttribute("trainvalue", findtrainvalue);
		/*
		 * List<addtrain>
		 * listoftrain=serviceforall.checkTrain(fromPlace,toPlace,seatClass);
		 */
		List<addtrain> listoftrain = serviceforall.checkTrain(fromPlace, toPlace, traindate);
		model.addAttribute("listoftrain", listoftrain);
		model.addAttribute("findtrain", "found train");

		return "afterfindtrain";

	}

	@RequestMapping("/homepagebooking")
	public String homepagebooking(@RequestParam("tid") int id, HttpSession session, Model model) {
		String username = (String) session.getAttribute("username");
		if (username != null) {
			Booktrain booknow = new Booktrain();
			model.addAttribute("booknowvalue", booknow);
			Map<String, String> selectclass = new HashMap<String, String>();
			selectclass.put("adhar", "adhar");
			selectclass.put("passwort", "passwort");
			selectclass.put("Dl", "dl");
			model.addAttribute("selectclasss", selectclass);
			addtrain listoftrains = serviceforall.getTrain(id);
			System.out.println("trainname" + listoftrains.getTrainname());

			model.addAttribute("trainname", listoftrains.getTrainname());
			model.addAttribute("trainnumber", listoftrains.getTrainNumber());
			/* return "redirect/booknow"; */
			return "booknowtrain";

		} else {
			model.addAttribute("msg", "login first for booking");
		}
		return "redirect:/";

	}

	@RequestMapping("/booknow")
	public String booknow(@RequestParam("tid") int id, Model model) {

		addtrain listoftrains = serviceforall.getTrain(id);
		System.out.println("trainname" + listoftrains.getTrainname());

		model.addAttribute("trainname", listoftrains.getTrainname());
		model.addAttribute("trainnumber", listoftrains.getTrainNumber());
		Booktrain booknow = new Booktrain();
		model.addAttribute("booknowvalue", booknow);
		Map<String, String> selectclass = new HashMap<String, String>();
		selectclass.put("adhar", "adhar");
		selectclass.put("passwort", "passwort");
		selectclass.put("Dl", "dl");
		model.addAttribute("selectclasss", selectclass);

		return "booknowtrain";
	}

	@RequestMapping("/booknowtrain")
	public String booknowtrain(@ModelAttribute("booknowvalue") Booktrain booktrain,
			@RequestParam CommonsMultipartFile file, HttpSession session, Model model) throws IOException {

		String s = (String) session.getAttribute("username");

		if (s != null) {
			System.out.println("session value is " + s);
			SimpleMailMessage message = new SimpleMailMessage();
			String email = booktrain.getEmail();

			System.out.println("mail id :" + email);
			message.setTo(email);

			message.setSubject("Booking Status");
			message.setText("You are  succesfully Booked..\n" + "with username=>:" + email);

			// Send Message!
			this.emailSender.send(message);
			System.out.println("succesfully sent");

			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(THRESHOLD_SIZE);
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

			ServletFileUpload upload = new ServletFileUpload(factory);
			ServletContext context = session.getServletContext();

			String uploadPath = context.getRealPath(UPLOAD_DIRECTORY);
			System.out.println(uploadPath);

			byte[] bytes = file.getBytes();
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(new File(uploadPath + File.separator + file.getOriginalFilename())));
			stream.write(bytes);
			stream.flush();
			stream.close();
			serviceforall.savebookingticket(booktrain);
			model.addAttribute("message", "succesfully booked");
			System.out.println("booked ticket");

			return "redirect:/detailofbooktrain";
		} else {
			model.addAttribute("booknow", "plz login first to book the train");
			return "redirect:/";
		}
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/detailofbooktrain",method=RequestMethod.GET) public
	 * ModelAndView modify(Model model) { ArrayList<Booktrain>
	 * booktrain=(ArrayList<Booktrain>) serviceforall.getbookticketvalue();
	 * 
	 * Map<String,String> mp=new HashMap<>(); for(Booktrain t:booktrain) {
	 * mp.put("value1", t.getFullname()); }
	 * model.addAttribute("listofbooktrain",booktrain); ModelAndView mv=new
	 * ModelAndView("DetailOfBooktrain",mp);
	 * 
	 * return mv; }
	 */
	@RequestMapping("/detailofbooktrain")
	public String modify(Model model) {
		List<Booktrain> booktrain = serviceforall.getbookticketvalue();

		model.addAttribute("listofbooktrain", booktrain);
		return "DetailofBooktrain";
	}

	@RequestMapping("/deleteofticket")
	public String updatetrain(@RequestParam("bookid") int theid, Model model, HttpSession session) {
		String email = (String) session.getAttribute("username");
		System.out.println("session email in delteticket" + email);

		if (email != null) {
			serviceforall.deleteticket(theid);

			return "redirect:/detailofbooktrain";
		} else {
			model.addAttribute("delete", "plz login first");
			return "redirect:/";
		}
	}

	/*
	 * .........................admincontroller.....................................
	 * .....
	 */
	@RequestMapping("/adminlogin")
	public String AdminloginPage(Model model) {
		Admin admin = new Admin();
		model.addAttribute("forgetadminvalue", admin);

		model.addAttribute("adminvalue", admin);
		return "adminLogin";
	}

	@RequestMapping(value = "/adminpage")
	public String loginpage(@Valid @ModelAttribute("adminvalue") Admin admin,BindingResult bindingError, Model model, HttpSession session) {
		if(bindingError.hasErrors())
		{
			System.out.println("some error in value");
		}
		
		String email = admin.getUsername();
		String password = admin.getPassword();
	

		String flag = serviceforall.adminCheck(email, password);
		if (flag.equals("true")) {
			session.setAttribute("adminpassword", password);
			session.setAttribute("adminemail", email);
			return "updateAdmin";
		} else {
			session.setAttribute("message", "login detail are invalid");

			return "redirect:/adminlogin";
		}
	}

	@RequestMapping("/userPage")
	public String userhome(HttpSession session) {
		/*
		 * String email=(String) session.getAttribute("adminemail"); String
		 * password=(String) session.getAttribute("adminpassword"); if(email!=null &&
		 * password!=null) {
		 * 
		 * return "redirect:/adminpage"; } else {
		 */

		return "updatedUserPage";

	}

	@RequestMapping("/adminhome")
	public String adminhome(HttpSession session) {
		/*
		 * String email=(String) session.getAttribute("adminemail"); String
		 * password=(String) session.getAttribute("adminpassword"); if(email!=null &&
		 * password!=null) {
		 * 
		 * return "redirect:/adminpage"; } else {
		 */

		return "updateAdmin";

	}

	@RequestMapping(value = "/ShowAddTrain")
	public String showAddTrain(Model model) {
		   List<addtrain> list = (List<addtrain>)model.asMap().get("listoftrains");
		addtrain addtrain = new addtrain();
		model.addAttribute("addtrainform", addtrain);
		Map<String, String> Class = new HashMap<>();
		Class.put("Sleeper", "sleeper");
		Class.put("Ac", "Ac");
		Class.put("General", "Genaral");
		model.addAttribute("Class", Class);
	   /*List<addtrain> listoftrain = serviceforall.findallTrain();*/
		model.addAttribute("listoftrain", list);
		return "adminAddtrain";

	}

	@RequestMapping(value = "/historyoftrain")

	public List<addtrain> edit(Model model) {
		System.out.println("request come from ajax");
		System.out.println("practising..");
		addtrain addtrain = new addtrain();
		model.addAttribute("addtrainform", addtrain);
		Map<String, String> Class = new HashMap<>();
		Class.put("Sleeper", "sleeper");
		Class.put("Ac", "Ac");
		Class.put("General", "Genaral");
		model.addAttribute("Class", Class);

		List<addtrain> listoftrain = serviceforall.findallTrain();
		System.out.println("" + listoftrain.toString());
		model.addAttribute("listoftrain", listoftrain);
		return listoftrain;

	}

	@RequestMapping(value = "/addingTrain")
	public String Addtrain(@ModelAttribute("addtrainvalue") addtrain adtrain, Model model, HttpSession session,
			BindingResult binding) {
		if (binding.hasErrors()) {

			return "adminAddtrain";
		}

		String email = (String) session.getAttribute("adminemail");
		String password = (String) session.getAttribute("adminpassword");
		System.out.println("addtrain session of admin.. " + email);
		System.out.println("date.. " + adtrain.getTrainDate());
		if (email != null) {

			System.out.println("inside adding tran if" + email + "..password.." + password);
			System.out.println("inside addtrain method");
			serviceforall.addTrain(adtrain);
			return "redirect:/Modify";

		}
		return "redirect:/adminlogin";

	}

	@RequestMapping("/DetailofTrain")
	public String DeatilofTrains(Model model) {

		List<addtrain> listoftrain = serviceforall.findallTrain();

		model.addAttribute("listoftrain", listoftrain);
		return "DetailOfAddTrain";
	}

	@RequestMapping("/Modify")
	public String AdminModify(Model model) {
		List<addtrain> listoftrain = serviceforall.findallTrain();
		model.addAttribute("listoftrain", listoftrain);

		return "adminModifyPage";
	}

	@RequestMapping("/deleteTrain")
	public String deleteoper(@RequestParam("tid") int theid, Model model, HttpSession session) {

		String email = (String) session.getAttribute("adminemail");
		String password = (String) session.getAttribute("adminpassword");
		addtrain Addtrain = new addtrain();
		model.addAttribute("addtrainvalue", Addtrain);

		if (email != null) {
			serviceforall.deletetrain(theid);
			System.out.println("deleted with userid" + email);

			return "redirect:/Modify";
		} else {
			model.addAttribute("deletedmessage", "first login sir");
			return "redirect:/adminlogin";
		}
	}

	@RequestMapping("/updatetrains")
	public String updateTrain(@RequestParam("tid") int id, Model model, HttpSession session) {
		Map<String, String> Class = new HashMap<>();
		Class.put("Sleeper", "sleeper");
		Class.put("Ac", "Ac");
		Class.put("General", "Genaral");
		model.addAttribute("Class", Class);

		addtrain ad = new addtrain();
		model.addAttribute("addtrainvalue", ad);
		String email = (String) session.getAttribute("adminemail");
		if (email != null) {
			addtrain listoftrains = serviceforall.getTrain(id);
			model.addAttribute("addtrainvalue", listoftrains);
			System.out.println("you show train with detail for update" + email);

			return "update";
		} else {
			return "redirect:/adminlogin";
		}
	}

	@RequestMapping("/updatetrain")
	public String updateTrain(@ModelAttribute("addtrainvalue") addtrain update, HttpSession session) {

		String email = (String) session.getAttribute("adminemail");
		String password = (String) session.getAttribute("adminpassword");
		if (email != null) {
			serviceforall.updateTrain(update);
			return "redirect:/Modify";
		} else {
			return "redirect:/adminlogin";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpServletResponse response, HttpSession session) {

		session.invalidate();

		return "redirect:/";

	}

	@RequestMapping("/Contactus")
	public String contactus(@ModelAttribute("conctactvalue") contactUs contactva, Model model) {
		serviceforall.savecontact(contactva);
		model.addAttribute("msg", "succesfully send message to admin");
		return "redirect:/aboutus";
	}

	@RequestMapping("/forgetpassword")
	public String forgetpassword(@ModelAttribute("forgetvalue") UserRegistration uservalue) {
		String username = uservalue.getFirstname();
		String email = uservalue.getEmail();
		System.out.println("coming value for forgetpasword is" + username + "..." + email);
		List<UserRegistration> userpassword = serviceforall.findpassword(username, email);
		if (userpassword != null) {
			System.out.println("userpassword is" + userpassword);
			SimpleMailMessage message = new SimpleMailMessage();

			System.out.println("mail id :" + email);
			message.setTo(email);

			message.setSubject("Recovering password");
			message.setText("Succesfully you got your password..\n[" + email + "]..password is...." + userpassword);

			// Send Message!
			this.emailSender.send(message);
			System.out.println("succesfully sent");
		}

		else {
			SimpleMailMessage message = new SimpleMailMessage();

			System.out.println("mail id :" + email);
			message.setTo(email);

			message.setSubject("Recovering password");
			message.setText("Sorry u have not registered..");

			// Send Message!
			this.emailSender.send(message);
			System.out.println("succesfully sent");

		}

		return "redirect:/";
	}

	@RequestMapping("/forgetAdminpassword")
	public String forgetpassword(@RequestParam("username") String uservalue, @RequestParam("email") String email) {

		System.out.println("coming value for forgetpasword is" + uservalue + "..." + email + "" + uservalue);
		List<UserRegistration> userpassword = serviceforall.findadminpassword(uservalue);
		if (userpassword != null) {
			System.out.println("userpassword is" + userpassword);
			SimpleMailMessage message = new SimpleMailMessage();

			System.out.println("mail id :" + email);
			message.setTo(email);

			message.setSubject("Recovering password");
			message.setText("Succesfully you got your password..\n[" + email + "]..password is...." + userpassword);

			// Send Message!
			this.emailSender.send(message);
			System.out.println("succesfully sent");
		} else {
			SimpleMailMessage message = new SimpleMailMessage();

			System.out.println("mail id :" + email);
			message.setTo(email);

			message.setSubject("Recovering password");
			message.setText("Sorry u have not registered..");

			// Send Message!
			this.emailSender.send(message);
			System.out.println("succesfully sent");
		}
		return "redirect:/adminlogin";
	}

	@RequestMapping(value = "/report")
	public ModelAndView userListReport(HttpServletRequest req, HttpServletResponse res) {

		/*
		 * List<Booktrain> list = new ArrayList<Booktrain>(); List<Booktrain>
		 * lists=serviceforall.getbookticketvalue(); for(Booktrain va:lists) {
		 * list.add(new Booktrain(va.getTotalfare(), va.getFullname(), va.getEmail(),
		 * va.getNationality())); System.out.println("totalfare:"+va.getTotalfare()); }
		 */
		Integer trainnumber = null;
		String trainname = null;
		String fullname = null;
		Integer age = null;
		String idproof = null;
		Integer totalfare = null;
		List<Booktrain> lists = serviceforall.getbookticketvalue();
		for (Booktrain t : lists) {
			trainnumber = t.getTrainNumber();
			trainname = t.getTrainname();
			fullname = t.getFullname();
			age = t.getAge();
			idproof = t.getIdproof();
			totalfare = t.getTotalfare();

		}
		System.out.println("coming train name" + trainname);

		List<User> list = new ArrayList<User>();

		list.add(new User(trainnumber, trainname, fullname, age, idproof, totalfare));

		if (list != null) {
			return new ModelAndView(new PdfUserListReportView(), "userList", list);
		}

		return new ModelAndView("userListReport", "userList", list);
	}

	@RequestMapping("/Dashboard")
	public String dashBoard() {
		return "DashBoard";
	}

	@ResponseBody
	@RequestMapping(value = "/getDataFromServer")
	public String display(HttpServletRequest request) {

		String names = request.getParameter("namevalue");
		System.out.println("coming value from .." + names);

		return arrearList(names);

	}

	public String arrearList(String reader) {
		String consumerName = "null";
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/trainprojectversion2";

		String userid = "hbstudent";
		String password = "hbstudent";
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {

			connection = DriverManager.getConnection(connectionUrl, userid, password);
			statement = connection.createStatement();
			String sql = "select Consumer_name from daily_arrear_list where READER='" + reader + "'";
			/* String query = "SELECT * FROM daily_arrear_list D where D.READER= 'MR1'"; */
			/*
			 * String query =
			 * "SELECT Consumer_name FROM daily_arrear_list D where D.READER= 'MR1'";
			 */
			resultSet = statement.executeQuery(sql);
			int i = 0;

			while (resultSet.next()) {
				consumerName = resultSet.getString("Consumer_name");

				i++;
				System.out.println(consumerName);
			}
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return consumerName;
	}

	@RequestMapping("/pdfReader1")

	public String reader1() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/trainprojectversion2?useSSL=false", "hbstudent", "hbstudent");
			String path = "C:\\Users\\Sonu\\JaspersoftWorkspace\\JasperReportDemo\\ArrerReport.jrxml";
			JasperReport jasperReport = JasperCompileManager.compileReport(path);
			JasperPrint jp = JasperFillManager.fillReport(jasperReport, null, con);
			JasperViewer.viewReport(jp, false);

			con.close();
			System.out.println("compiled");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/Dashboard";

	}

	
    public int otp(HttpServletRequest request, HttpSession session, Model theModel) {

	
		String mobile_no = request.getParameter("phone");
		System.out.println("mobile no:" + mobile_no);

		System.out.println("hi i am in send otp");
		String authkey = "87768AwvjTXOyo567bef4e";
		// String authkey = "295983ACpQWY9W5d8c5744";

		Random rand = new Random();
		int otp = rand.nextInt(900000) + 100000;
		session.setAttribute("otp", otp);

		String senderId = "INGROI";

		String message = "your OTP is :" + otp;

		System.out.println("this is message" + message);

		String route = "4";

		URLConnection myURLConnection = null;
		URL myURL = null;
		BufferedReader reader = null;

		String encoded_message = URLEncoder.encode(message);

		// Send SMS API
		String mainUrl = "http://api.msg91.com/api/sendhttp.php?";
		/*
		 * String mainUrl ="https://control.msg91.com/api/sendotp.php?";
		 * ?otp=788585&otp_length=6&sender=igiinfo&message=788585&mobile=8095877414&
		 * authkey=295967AKtHn6sR5d8c4a56
		 */
		StringBuilder sbPostData = new StringBuilder(mainUrl);
		sbPostData.append("authkey=" + authkey);
		/*
		 * sbPostData.append("&email="+email); sbPostData.append("&pass="+pass);
		 * sbPostData.append("&name="+name);
		 */
		sbPostData.append("&mobiles=" + mobile_no);
		sbPostData.append("&message=" + encoded_message);
		sbPostData.append("&route=" + route);
		sbPostData.append("&sender=" + senderId);
		mainUrl = sbPostData.toString();
		try {
			System.out.println("in try");
			myURL = new URL(mainUrl);
			myURLConnection = myURL.openConnection();
			myURLConnection.connect();
			reader = new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
			String response;
			while ((response = reader.readLine()) != null)
				System.out.println("in res");
			System.out.println(response);
			reader.close();
		} catch (IOException e) {
			System.out.println("in catch");
			e.printStackTrace();
		}
		theModel.addAttribute("otpvalue",otp);
		System.out.println("actual otp:.." + otp);
		
		return otp;

	}
	

	@RequestMapping(value ="/ShowAddTrain/{pageid}")
	public String paginate(@PathVariable int pageid,Model model,RedirectAttributes redirectAttributes) {
		   int total=2;    
	        if(pageid==1){}    
	        else{    
	            pageid=(pageid-1)*total+1;    
	        } 
		System.out.println("pageid" + pageid);

		addtrain addtrain = new addtrain();
		model.addAttribute("addtrainform", addtrain);
		Map<String, String> Class = new HashMap<>();
		Class.put("Sleeper", "sleeper");
		Class.put("Ac", "Ac");
		Class.put("General", "Genaral");
		model.addAttribute("Class", Class);
		List<addtrain> listoftrain = serviceforall.findallTrain(pageid,total);
	/*	model.addAttribute("listoftrain", listoftrain);*/
		redirectAttributes.addFlashAttribute("listoftrains", listoftrain);
		return "redirect:/ShowAddTrain";
	}


}