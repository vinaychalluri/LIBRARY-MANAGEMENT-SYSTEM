package ProjectLibrary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ProjectLibrary.dao.addbookDao;
import ProjectLibrary.dto.Book;

@WebServlet("/UpdateBook")
public class UpdateBook extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		
		int id = Integer.parseInt(req.getParameter("bookId"));
		
		String name = req.getParameter("bookName");
		String author = req.getParameter("author");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		Book book = new Book(id,name,quantity,author);
		
		addbookDao bookDao = new addbookDao();
		
		if(bookDao.update(book)>0)
		{
			req.setAttribute("book", "BOOK UPDATED SUCCESSFUL");
			req.getRequestDispatcher("facultyHome.jsp").include(req, resp);;
		}
		else
		{
			req.setAttribute("book", "BOOK UPDATE NOT SUCCESSFULL");
			req.getRequestDispatcher("UpdateBook.jsp").include(req, resp);
		}
	}
	

}
