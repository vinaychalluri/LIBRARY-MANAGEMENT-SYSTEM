package ProjectLibrary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ProjectLibrary.dao.addbookDao;


@WebServlet("/DeleteBook")
public class DeleteBook extends HttpServlet
{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		 int id = Integer.parseInt(req.getParameter("id"));
		 
		 addbookDao bookdao = new addbookDao();
		
		if(bookdao.delete(id)>0)
		{
			req.getRequestDispatcher("facultyHome.jsp").forward(req, resp);
		}
		else
		{
			req.getRequestDispatcher("facultyHome.jsp").forward(req, resp);
		}
	}

}
