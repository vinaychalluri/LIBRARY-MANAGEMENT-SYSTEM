package ProjectLibrary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProjectLibrary.dao.BorrowBookDao;
import ProjectLibrary.dao.StudentDao;
import ProjectLibrary.dao.addbookDao;
import ProjectLibrary.dto.Book;
import ProjectLibrary.dto.BorrowData;
import ProjectLibrary.dto.Student;


@WebServlet("/BorrowBook")
public class BorrowBook extends HttpServlet
{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
	   int id = Integer.parseInt(req.getParameter("bookid"));
		
	   HttpSession session = req.getSession();
	
	   String email = (String) session.getAttribute("semail");
	   
	   addbookDao addbookDao = new addbookDao();
	   
	   StudentDao studentDao = new StudentDao();
	   
	   Book book = addbookDao.fetch(id);
	   
	   Student student = studentDao.login(email);
	   
	   BorrowBookDao borrowbookDao = new BorrowBookDao();
	   
	   BorrowData borrowData = new BorrowData(student, book);
	   
	   if(borrowbookDao.save(borrowData))
	   {
		   req.getRequestDispatcher("StudentHome.jsp").forward(req, resp);
	   }
	   else
	   {
		   req.setAttribute("book", "The book is not available in the library");
		   req.getRequestDispatcher("StudentHome.jsp").include(req, resp);
	   }
	 
	   
	   
	}
	

}
