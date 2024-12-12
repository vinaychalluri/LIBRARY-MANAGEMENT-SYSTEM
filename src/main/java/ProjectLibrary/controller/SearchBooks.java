package ProjectLibrary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ProjectLibrary.dao.SearchBookDao;
import ProjectLibrary.dao.addbookDao;

@WebServlet("/SearchBooks")
public class SearchBooks  extends HttpServlet
{
	 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		 String search = (String)req.getParameter("search");
		 
		 SearchBookDao searchBook = new  SearchBookDao();
		 addbookDao addbookdao = new addbookDao();
		 
		 
		 
		 if(searchBook.search(search)!=null)
		 {
			 req.getRequestDispatcher("BookSearch1.jsp").forward(req, resp);
		 }
		 else
		 {
			 req.setAttribute("search", "There is no book present with that data");
			 req.getRequestDispatcher("BookSearch1.jsp").include(req, resp);
		 }
		 
		 
	}

}
