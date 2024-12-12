package ProjectLibrary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProjectLibrary.dao.StudentDao;
import ProjectLibrary.dto.Student;

@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet
{
	
	 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
	String email = req.getParameter("email");
	String pwd = req.getParameter("pwd");
		
       StudentDao studentdao = new StudentDao();
		
	   Student student = studentdao.login(email);
	   System.out.println(student);
		
		if(student!=null)
		{
			if(student.getPwd().equals(pwd))
			{
				
				
				if(student.getBorrow().equals("approved"))
				{
					HttpSession session = req.getSession();
					session.setAttribute("sname", student.getName());
					session.setAttribute("semail", student.getEmail());
					 
					
					req.getRequestDispatcher("StudentHome.jsp").forward(req, resp);	
				}
				else if(student.getBorrow().equals("request"))
				{
					req.setAttribute("request1", "Your account is under procces by ADMIN"); 
					req.getRequestDispatcher("studentLogin.jsp").include(req, resp);
				}
				
				else
				{
					req.setAttribute("request", "Your account was not yet Verified");
					req.getRequestDispatcher("studentLogin.jsp").include(req, resp);
				}
				 
				
			}
			else
			{
				req.setAttribute("pwd", "Incorrect Password");
				req.getRequestDispatcher("studentLogin.jsp").include(req, resp);
			}
		}
		else
		{
			req.setAttribute("email", "Incorrect Email");
			req.getRequestDispatcher("studentLogin.jsp").include(req, resp);
		}
		
		 
		
	}

}
