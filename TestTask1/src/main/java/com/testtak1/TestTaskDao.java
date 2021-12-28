package com.testtak1;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.multipart.commons.CommonsMultipartFile;













public class TestTaskDao 
{
JdbcTemplate jdbcTemplate;
MailSender mailSender;
JavaMailSender javaMailSender;

public JavaMailSender getJavaMailSender() {
	return javaMailSender;
}


public List<Student> change(Student student) {
	List<Student> studentlist = jdbcTemplate.query("select * from sturegister where email='" + student.getStuEmail()
			+ "' and password='" + student.getStuPassword() + "'", new RowMapper<Student>() {

				@Override
				public Student mapRow(ResultSet rs, int arg1) throws SQLException {
					// TODO Auto-generated method stub
					Student student = new Student();
					student.setStuEmail(rs.getString("email"));
					student.setStuPassword(rs.getString("password"));

					return student;

				}

			});
	return studentlist.size() > 0 ? studentlist : null;
}


public void setJavaMailSender(JavaMailSender javaMailSender) {
	this.javaMailSender = javaMailSender;
}

public List<Student> newotpverify(String newotp, Student student) {
	return jdbcTemplate.query("select * from sturegister where otp='" + newotp + "'", new RowMapper<Student>() {

		@Override
		public Student mapRow(ResultSet rs, int arg1) throws SQLException {

			Student vedix = new Student();
			vedix.setStuEmail(rs.getString("email"));
			vedix.setStuPassword(rs.getString("password"));
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom("hstechtask@gmail.com");
			message.setTo(rs.getString("email"));
			message.setSubject("Email password Verification");
			message.setText("Your password is " + rs.getString("password"));
			mailSender.send(message);
			return vedix;
		}

	});

}



public MailSender getMailSender() {
	return mailSender;
}




public void setMailSender(MailSender mailSender) {
	this.mailSender = mailSender;
}




public JdbcTemplate getJdbcTemplate() {
	return jdbcTemplate;
}




public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
{
	this.jdbcTemplate = jdbcTemplate;
}

public List<Student> doLogin(UserModel user) {System.out.println("email:"+user.getUsername());System.out.println("email:"+user.getPassword());
	// TODO Auto-generated method stub
	List<Student> studentlist = jdbcTemplate.query("select * from sturegister where email='"+user.getUsername()
			+ "' and password='" + user.getPassword() + "' and status='1' ", new RowMapper<Student>() {

				@Override
				public Student mapRow(ResultSet rs, int arg1) throws SQLException {
					// TODO Auto-generated method stub
					Student student = new Student();
					student.setStuEmail(rs.getString("email"));
					student.setStuPassword(rs.getString("password"));

					return student;

				}

			});
	return studentlist.size() > 0 ? studentlist : null;
}

public int deleteremark(int id) {
	// TODO Auto-generated method stub
	String sql = "delete from taskdetail where id='" + id + "'";
	return jdbcTemplate.update(sql);
}
public List<Modaltask> editremark(int id) {
	return jdbcTemplate.query("select * from taskdetail where id='" + id + "'", new RowMapper<Modaltask>() {

		@Override
		public Modaltask mapRow(ResultSet rs, int arg1) throws SQLException {
			Modaltask modaltask = new Modaltask();
			modaltask.setId(rs.getInt(1));
			modaltask.setTask(rs.getString(2));
			modaltask.setTaskdetail(rs.getString(3));
			modaltask.setTasktime(rs.getString(4));
			modaltask.setUsername(rs.getString(5));
			return modaltask;
		}

	});
}
public void sendemail(Modaltask task) {
	SimpleMailMessage message = new SimpleMailMessage();
	message.setFrom("hstechtask@gmail.com");
	message.setTo(task.getUsername());
	message.setSubject("Hs-group Remark");
	message.setText("Your remark :" + task.getRemark());

	mailSender.send(message);

}
public int updatestatus(Modaltask task) {
	String sql = "update taskdetail set status = '1' where id='" + task.getId() + "'";
	return jdbcTemplate.update(sql);
}
public int addremark(Modaltask task) {
	String sql = "insert into addremark(id,task,taskdetail,tasktime,username,remark) values('" + task.getId()
			+ "','" + task.getTask() + "','" + task.getTaskdetail() + "','" + task.getTasktime() + "','"
			+ task.getUsername() + "','" + task.getRemark() + "') ";
	return jdbcTemplate.update(sql);
}

public List<Modaltask> admintbl() {
	return jdbcTemplate.query("select * from taskdetail where status = '0' ", new RowMapper<Modaltask>() {

		@Override
		public Modaltask mapRow(ResultSet rs, int arg1) throws SQLException {
			Modaltask modaltask = new Modaltask();
			modaltask.setId(rs.getInt(1));
			modaltask.setTask(rs.getString(2));
			modaltask.setTaskdetail(rs.getString(3));
			modaltask.setTasktime(rs.getString(4));
			modaltask.setUsername(rs.getString(5));
			modaltask.setFilename(rs.getString(6));
			return modaltask;
		}

	});
}
public void sendOTPtoEmail(Student student) {
	SimpleMailMessage message = new SimpleMailMessage();
	message.setFrom("hstechtask@gmail.com");
	message.setTo(student.getStuEmail());
	message.setSubject("Email Verification");
	message.setText("Your OTP is " + student.getOtp());
	mailSender.send(message);

}
public int updateotpotpformail(Student student, int otp) {
	String sql = "update sturegister set otp='" + student.getOtp() + "' where email='" + student.getStuEmail()
			+ "' ";

	return jdbcTemplate.update(sql);
}


public void uploadfile(Modaltask task, HttpSession session) {
	CommonsMultipartFile file = task.getFile();
	String filenameString = file.getOriginalFilename();
	// String pathString = "C:\\Users\\Owner\\Documents\\internship\\Eclipse
	// project\\hstask\\WebContent\\assets\\image";
	// String pathString = "C:\\Program Files\\Apache Software Foundation\\Tomcat
	// 8.5\\webapps\\upl";
	// String pathString="C:\\Program Files\\Apache Software Foundation\\Tomcat
	// 9.0\\webapps\\upl";
	String pathString = "cd //usr//local//tomcat9//webapps//upl";
	// String pathString =
	// session.getServletContext().getRealPath("/WEB-INF/upload11");
	File file2 = new File(pathString);
	if (!file2.exists()) {
		file2.mkdir();
	}
	System.out.println("" + pathString);
	try {

		byte barr[] = file.getBytes();
		BufferedOutputStream bout = new BufferedOutputStream(
				new FileOutputStream(new File(pathString + "/" + filenameString)));
		bout.write(barr);
		bout.flush();
		bout.close();

	} catch (Exception e) {
		// TODO: handle exception
	}
}
public int entertask(Modaltask task) {
	CommonsMultipartFile file = task.getFile();
	String filnameString = file.getOriginalFilename();
	String sql = "insert into taskdetail(task,taskdetail,tasktime,username,filename,status) values('"
			+ task.getTask() + "','" + task.getTaskdetail() + "','" + task.getTasktime() + "','"
			+ task.getUsername() + "','" + filnameString + "','0') ";
	return jdbcTemplate.update(sql);
}

public List<Student> usernametbl() {
	// TODO Auto-generated method stub
	return jdbcTemplate.query("select * from sturegister ", new RowMapper<Student>() {

		@Override
		public Student mapRow(ResultSet rs, int arg1) throws SQLException {
			Student student = new Student();
			student.setStuEmail(rs.getString("email"));
			return student;
		}

	});
}


public List<Student> checkemail(Student student) {
	System.out.println("inside check mail");
	List<Student> studentlist = jdbcTemplate.query(
			"select * from sturegister where email='" + student.getStuEmail() + "'", new RowMapper<Student>() {

				@Override
				public Student mapRow(ResultSet rs, int arg1) throws SQLException {
					// TODO Auto-generated method stub
					Student student = new Student();
					student.setStuEmail(rs.getString("email"));
					return student;

				}

			});
	return studentlist.size() > 0 ? studentlist : null;

}
public void sendverEmail(Student student) 
{System.out.println("inside send otp.");
	// TODO Auto-generated method stub
	SimpleMailMessage message = new SimpleMailMessage();
	message.setFrom("ketanurkude@gmail.com");
	message.setTo(student.getStuEmail());
	message.setSubject("Email Verification");
	message.setText("Your OTP is " + student.getOtp());
	mailSender.send(message);
}


public int addstudent(Student student) {System.out.println("inside add student;");
	java.lang.String sql = "insert into sturegister(name,email,phone,password,dob,address,subject,gender,city,otp,status) values('"
			+ student.getStuName() + "','" + student.getStuEmail() + "','" + student.getStuPhone() + "','"
			+ student.getStuPassword() + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null
			+ "','" + student.getOtp() + "','0')";
	return jdbcTemplate.update(sql);
}

public List<Student> adminlogin(UserModel user) {
	List<Student> studentlist = jdbcTemplate.query("select * from adminlogin where email='" + user.getUsername()
			+ "' and password='" + user.getPassword() + "'", new RowMapper<Student>() {

				@Override
				public Student mapRow(ResultSet rs, int arg1) throws SQLException {
					// TODO Auto-generated method stub
					Student student = new Student();
					student.setStuEmail(rs.getString("email"));
					student.setStuPassword(rs.getString("password"));

					return student;

				}

			});
	return studentlist.size() > 0 ? studentlist : null;
}

}

/*
public List<Student> getAllStudent() {
  String sql = "select * from table_studentdemo";
  return jdbcTemplate.query(sql,new RowMapper<Student>() {

   @Override
   public Student mapRow(ResultSet rs, int arg1) throws SQLException {
    Student student = new Student();
    
     student.setId(rs.getInt(1));
     student.setName(rs.getString(2));
     student.setAddress(rs.getString(3));
    
    return student;
   }
   
  });
 } 



public StuModel getStudentByID(int id) {
	  // TODO Auto-generated method stub
	  String sql = "select * from student_table where id='"+id+"'"; 
	  return jdbcTemplate.queryForObject(sql, new Object[] {},new BeanPropertyRowMapper<StuModel>(StuModel.class));
	 }
*/

