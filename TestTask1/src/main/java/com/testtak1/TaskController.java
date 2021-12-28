package com.testtak1;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;















@Controller
public class TaskController {
	@Autowired
	TestTaskDao testDao;
	 MailDao mailDao;
	String msg = null;
	
	@RequestMapping("register")
	public String getUsersignuppage() {
		return "/WEB-INF/jsp/userregistration1";
	}

	
	@RequestMapping("/home")
	public String homepage()
	{
		return "index";
	}
	@RequestMapping(value = "sendemail", method = RequestMethod.POST)
	public String getsendemail(@ModelAttribute("task") Modaltask task, HttpSession session, Model model) {
	System.out.println("inside sendmail ketan");
		int status = testDao.addremark(task);
		testDao.sendemail(task);
		session.setAttribute("sendemail", "sendemail");
		int status1 = testDao.updatestatus(task);
		model.addAttribute("msg", "<script>alert('Remark Has been Sent Successfully..!');</script>");
		return "redirect:/admin";
	}
	@RequestMapping(value="check")
	public String getcheck(Model model) {
		model.addAttribute("msg","check password");
		return "/index";
	}
	@RequestMapping("admin")
	public String getadmin(HttpSession session) {
		List<Modaltask> task = testDao.admintbl();
		session.setAttribute("task", task);
		List<Student> task2 = testDao.usernametbl();
		session.setAttribute("task2", task2);
		return "/WEB-INF/jsp/admin";
	}
	@RequestMapping(value = "studentregistration", method = RequestMethod.POST)
	public String getStudentRegistration(@ModelAttribute("student") Student student, HttpSession session, Model model) {
		System.out.println("inside stu registration ttt");
		List<Student> emaillist = testDao.checkemail(student);
		System.out.println("inside stu registration"+emaillist);
		if (emaillist == null) {
	System.out.println("inside stu register ");
			Random random = new Random();
			int num = random.nextInt(899999);
			int otp = num + 100000;
			student.setOtp(otp);
			int status = testDao.addstudent(student);
			System.out.println("inside stu register otp"+otp);
			testDao.sendverEmail(student);
			session.setAttribute("sesreg", "success");
			return "/WEB-INF/jsp/otppage";

		} else {
model.addAttribute("msg","You are Already Registered..");
			session.setAttribute("checkemail", "checkemail");
			return "/WEB-INF/jsp/userregistration1";
		}

	}
	@RequestMapping(value = "change", method = RequestMethod.POST)
	public String getchange(@ModelAttribute("student") Student student, HttpSession session) {
		List<Student> studentlist = testDao.change(student);
		if (studentlist == null) {
			session.setAttribute("nopassword", "nopassword");
			return "/WEB-INF/jsp/changepass";
		} else {

			session.setAttribute("loginsuccess", student.getStuEmail());
			return "/WEB-INF/jsp/changepassword";
		}

	}

	@RequestMapping("changepass")
	public String getchagepass() {
		return "/WEB-INF/jsp/changepass";
	}
	
	@RequestMapping(value = "taskdetail", method = RequestMethod.POST)
	public String gettaskdetail(@ModelAttribute("task") Modaltask task, HttpSession session) {
		testDao.entertask(task);
		testDao.uploadfile(task, session);
		session.setAttribute("taskd", "taskd");
		return "redirect:/reguser";

	}
	@RequestMapping("/editremark/{id}")
	public String geteditramark(@PathVariable("id") int id, Model model) {
		List<Modaltask> modaltasks = testDao.editremark(id);
		model.addAttribute("command", modaltasks);
		model.addAttribute("handlers", modaltasks);
		return "/WEB-INF/jsp/editremark";
	}
	@RequestMapping(value = " /viewimage/{filename:.+}")
	public String getview(@PathVariable("filename") String filename, HttpSession session) {
		// List<Modaltask> modaltasks = dao.imgview(username);
		// session.setAttribute("modaltask", modaltasks);
		session.setAttribute("filename", filename);
		System.out.println("" + filename);
		return "/WEB-INF/jsp/viewimg";
	}
	@RequestMapping("/deleteremark/{id}")
	public String getdeleteramark(@PathVariable("id") int id, HttpSession session) {

		int status = testDao.deleteremark(id);
		session.setAttribute("taskd", "taskd");
		return "redirect:/admin";
	}

	@RequestMapping("reguser")
	public String getreguser() {
		return "/WEB-INF/jsp/check";
	}
	@RequestMapping(value = "dologin", method = RequestMethod.POST)
	public String doLogin(@ModelAttribute("user") UserModel user, Model model, HttpSession session) {
		List<Student> studentlist = testDao.doLogin(user);
		if (studentlist == null) {
			session.setAttribute("loginsuccess", "login failed");
			return "redirect:/check";
		} else {

			session.setAttribute("loginsuccess", user.getUsername());
			return "redirect:/reguser";
		}

	}
	@RequestMapping(value = "forgetpass")
	public String getForgetpass() {

		return "/WEB-INF/jsp/forgetpass";
	}
	@RequestMapping(value = "forget", method = RequestMethod.POST)
	public String getforget(@ModelAttribute("student") Student student, HttpSession session) {
		Random random = new Random();
		int num = random.nextInt(899999);
		int otp = num + 100000;
		student.setOtp(otp);
		int status = testDao.updateotpotpformail(student, otp);
		testDao.sendOTPtoEmail(student);
		session.setAttribute("updateotp", "updateotp");
		session.setAttribute("username", student.getStuEmail());
		return "/WEB-INF/jsp/forgetotppage";
	}

	@RequestMapping(value = "verifyotp", method = RequestMethod.POST)
	public String getOTPverify(@RequestParam("newotp") String newotp, HttpSession session) {
		//int status = testDao.updateotp(newotp);

		if (1 > 0) {
			session.setAttribute("sesreg", "success");
			return "redirect:/check";
		} else {

			session.setAttribute("sesreg", "success");
			return "otppage";
		}

	}
	@RequestMapping(value = "otpverify", method = RequestMethod.POST)
	public String getotpverify(@ModelAttribute("user") UserModel user, HttpSession session,
			@RequestParam("newotp") String newotp, @ModelAttribute("student") Student student) {
		List<Student> studentlist = testDao.newotpverify(newotp, student);

		if (studentlist == null) {
			session.setAttribute("nopassword", "nopassword");
			return "redirect:/check";
		} else {

			session.setAttribute("password", "password");
			session.setAttribute("loginsuccess", user.getUsername());
			return "redirect:/check";
		}
	}
	@RequestMapping(value = "adminlogin", method = RequestMethod.POST)
	public String adminlogin(@ModelAttribute("user") UserModel user, Model model, HttpSession session) {
		List<Student> studentlist = testDao.adminlogin(user);
		System.out.println("inside adminlogin mapping");
		if (studentlist == null) {
			session.setAttribute("loginsuccess", "login failed");
			return "redirect:/check";
		} else {

			session.setAttribute("loginsuccess", user.getUsername());
			return "redirect:/admin";
		}

	}
}
