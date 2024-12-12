package ProjectLibrary.controller;

 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ProjectLibrary.dao.addbookDao;
import ProjectLibrary.dto.Book;


@WebServlet("/AddBook")
public class AddBook extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		int id = Integer.parseInt(req.getParameter("bookId"));
		String bookName  = req.getParameter("bookName");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		String author = req.getParameter("author");
		 
		addbookDao addbookDao = new addbookDao();
		Book book = new Book(id, bookName, quantity, author);
		System.out.println(book);
		
		
		if(addbookDao.save(book))
		{
			req.setAttribute("book", "BOOK ADDED SUCCESFULLY");
		    req.getRequestDispatcher("addBook.jsp").include(req, resp);
		}
		else
		{
			req.setAttribute("book", "THE BOOK ALREADY ADDED PLEASE UPDATE THE QUANTITY");
			req.getRequestDispatcher("addBook.jsp").forward(req, resp);
		}
	}

}
