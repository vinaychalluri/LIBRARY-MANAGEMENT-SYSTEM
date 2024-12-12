package ProjectLibrary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ProjectLibrary.dao.facultyDao;
import ProjectLibrary.dto.Faculty;

@WebServlet("/updateFaculty")
public class UpdateFaculty extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		long phone = Long.parseLong(req.getParameter("phone"));
		String gender = req.getParameter("gender");
		
		Faculty faculty = new Faculty(name,email,pwd,phone,gender);
		
	    facultyDao facultyDao = new facultyDao();
		
		
		if(facultyDao.update(faculty)>0)
		{
			req.setAttribute("update", "PROFILE UPDATE SUCCESSFULL");
			req.getRequestDispatcher("facultyUpdate.jsp").include(req, resp);
		}
		else
		{
			req.setAttribute("update", "UPDATE THE DETAILS CORRECTLY");
			req.getRequestDispatcher("facultyUpdate.jsp").include(req, resp);
		}
		
	}
	

}
