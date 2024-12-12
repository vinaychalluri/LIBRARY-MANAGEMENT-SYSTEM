package ProjectLibrary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ProjectLibrary.dao.StudentDao;
import ProjectLibrary.dto.Student;



@WebServlet("/studentRegister")
public class StudentRegistration extends HttpServlet
{
     
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		long phone = Long.parseLong(req.getParameter("phone"));
		String year = req.getParameter("year");
		String gender = req.getParameter("gender");
		String borrow = "NULL";
		
		StudentDao studentDao = new StudentDao();
		Student student = new Student(name, email, pwd, phone, gender, year,borrow);
		
		if(studentDao.save(student))
		{
			req.getRequestDispatcher("studentLogin.jsp").forward(req, resp);
		}
		else
		{
			req.setAttribute("studentR", "THE EMAIL IS ALREADY REGISTERED");
			req.getRequestDispatcher("studentRegister.jsp").include(req, resp);
		}
		
		
	}
}
