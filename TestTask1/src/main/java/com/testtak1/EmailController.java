package com.testtak1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class EmailController 
{
@Autowired
 MailDao mailDao;
TestTaskDao testDao;

@RequestMapping("/mailexample")
public String sendMail()   
	{
	return "sendMail";
	}
@RequestMapping(value="/sendEmail",method=RequestMethod.POST)
public  String sendMaill(@ModelAttribute("mailmodel") MailModel mailmodel,Model model)
{System.out.println("front simple data:"+mailmodel.getTo());
	try {
		
		mailDao.sendEmail(mailmodel);	
	}catch(Exception e) {
		System.out.println(e.getMessage());	
	}
	
	model.addAttribute("emailmsg","Email Sent Successfully"); //$NON-NLS-1$
	return "SendEmail";
}


@RequestMapping(value="/sendEmailAttachment", method=RequestMethod.POST)
public String sendMailAttachment(@ModelAttribute("mailattach") MailModelAttachment mailattach,Model model)
{
	System.out.println("front data:"+mailattach.getTo());
	CommonsMultipartFile filename = mailattach.getFile();
	//String fname = filename.getOriginalFilename();
	mailDao.sendMailAttachment(mailattach,filename);
	model.addAttribute("msg", "<script>alert('Task Has been Sent Successfully..!');</script>");
	return "/WEB-INF/jsp/admin";
}
@RequestMapping("logout")
public String getlogout() {
	return "/index";
}

/*
 * @RequestMapping(value="check",method=RequestMethod.POST) public String
 * getcheck(@ModelAttribute("mailmodel") MailModelAttachment mailmodel,Model
 * model) { try { System.out.println("inside sendEmail");
 * mailDao.sendEmail(mailmodel); }catch(Exception e) {
 * System.out.println(e.getMessage()); }
 * 
 * model.addAttribute("emailmsg","Email Sent Successfully"); return "Index"; }
 */


}
