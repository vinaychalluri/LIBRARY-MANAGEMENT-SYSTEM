package ProjectLibrary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ProjectLibrary.dao.StudentDao;
import ProjectLibrary.dto.Student;

@WebServlet("/updateStudent")
public class UpdateStudent extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		String borrow = req.getParameter("borrow");
		String year = req.getParameter("year");
		long phone = Long.parseLong(req.getParameter("phone"));
		String gender = req.getParameter("gender");
		
		Student student = new Student(name,email,pwd,phone,gender,year,borrow);
		
		StudentDao studentdao = new StudentDao();
		
		
		if(studentdao.update(student)>0)
		{
			req.setAttribute("update", "PROFILE UPDATE SUCCESSFULL");
			req.getRequestDispatcher("UpdateStudent.jsp").include(req, resp);
		}
		else
		{
			req.setAttribute("update", "UPDATE THE DETAILS CORRECTLY");
			req.getRequestDispatcher("UpdateStudent.jsp").include(req, resp);
		}
		
	}
	

}
