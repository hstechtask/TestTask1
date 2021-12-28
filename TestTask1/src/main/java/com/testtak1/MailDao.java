package com.testtak1;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.core.io.InputStreamSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.web.multipart.commons.CommonsMultipartFile;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;






public class MailDao
{JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
	return jdbcTemplate;
}

public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
	this.jdbcTemplate = jdbcTemplate;
}

public MailSender getMailSender() {
	return mailSender;
}

	MailSender mailSender;
	JavaMailSender javaMailSender;
	public JavaMailSender getJavaMailSender() {
		return javaMailSender;
	}

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	public void setMailSender(MailSender mailSender)
	{
		this.mailSender = mailSender;
	}

	public void sendEmail(MailModel mailmodel) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("hstechtask@gmail.com");
		message.setTo(mailmodel.getTo());
		message.setSubject(mailmodel.getMessage());
		message.setText(mailmodel.getMessage());
		mailSender.send(message);
		
	}
	
	
public String sendMailAttachment(MailModelAttachment mailattach, CommonsMultipartFile file) {
		
		javaMailSender.send(new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				 MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				 messageHelper.setFrom("hstechtask@gmail.com"); 
				 System.out.println("to :"+mailattach.getTo());
				 messageHelper.setTo(mailattach.getTo());
               messageHelper.setSubject(mailattach.getSubject());
               messageHelper.setText(mailattach.getMessage());
                
               // determines if there is an upload file, attach it to the e-mail
               java.lang.String attachName = file.getOriginalFilename();
               if (!file.equals("")) {

                   messageHelper.addAttachment(attachName, new InputStreamSource() {
                        
                       @Override
                       public InputStream getInputStream() throws IOException {
                           return file.getInputStream();
                       }
                   });
               }
     		}});

    //    return "Result";
		return null;
	
}

}
