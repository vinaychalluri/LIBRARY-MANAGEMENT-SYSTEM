package ProjectLibrary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ProjectLibrary.dao.facultyDao;


@WebServlet("/facultyDelete")
public class FacultyDelete extends HttpServlet
{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		String email = req.getParameter("email");
		System.out.println(email);
		
		facultyDao facultydao = new facultyDao();
		
		if(facultydao.delete(email)>0)
		{
			req.getRequestDispatcher("facultyLogin.jsp").forward(req, resp);
		}
		else
		{
			req.getRequestDispatcher("facultyHome.jsp").forward(req, resp);
		}
	}

}
