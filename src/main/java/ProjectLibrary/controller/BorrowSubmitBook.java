package ProjectLibrary.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ProjectLibrary.dao.BorrowBookDao;

@WebServlet("/BorrowSubmitBook")
public class BorrowSubmitBook extends HttpServlet
{
   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 
	    
	    
	   int BookID = Integer.parseInt(req.getParameter("bookId"));
	   String semail = (String)req.getParameter("semail");
	   
	   
	   BorrowBookDao borrowBookDao = new BorrowBookDao();
	   
	   if(borrowBookDao.submit(semail, BookID)>0)
	   {
		   req.getRequestDispatcher("BorrowedBooks.jsp").include(req, resp);
	   }
	 
}
}
