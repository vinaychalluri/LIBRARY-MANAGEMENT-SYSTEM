package ProjectLibrary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProjectLibrary.dao.facultyDao;
import ProjectLibrary.dto.Faculty;

@WebServlet("/FacultyLogin")
public class FacultyLogin extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		
		facultyDao facultydao = new facultyDao();
		
		Faculty faculty = facultydao.login(email);
		
		if(faculty!=null)
		{
			if(faculty.getPwd().equals(pwd))
			{
				HttpSession session = req.getSession();
				session.setAttribute("fname", faculty.getName());
				session.setAttribute("femail", faculty.getEmail());
				 
				req.getRequestDispatcher("facultyHome.jsp").forward(req, resp);
			}
			else
			{
				req.setAttribute("pwd", "Incorrect Password");
				req.getRequestDispatcher("facultyLogin.jsp").include(req, resp);
			}
		}
		else
		{
			req.setAttribute("email", "Incorrect Email");
			req.getRequestDispatcher("facultyLogin.jsp").include(req, resp);
		}
		
		 
		 
	}

}
