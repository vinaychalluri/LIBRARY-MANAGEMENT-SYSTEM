package ProjectLibrary.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import ProjectLibrary.dto.Book;
import ProjectLibrary.dto.Student;
 

public class addbookDao
{
	
	public static EntityManager create()
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("vinay");
		EntityManager em = emf.createEntityManager();
		return em;
	}
	
	public boolean save(Book book)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		 
		Book b =  em.find(Book.class, book.getBookId());
		
		if(b==null)
		{
			et.begin();
			em.merge(book);
			et.commit();
			return true;
		}
		else
		{
			return false;
		}
	 
	}
	
	public List<Book> fetchAll()
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		Query query = em.createQuery("SELECT u FROM Book u");
        List<Book> book = query.getResultList();
        
        return book;
	}

	
	public Book fetch(int id)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		Book book = em.find(Book.class, id);
		
		return book;
		
	}
	
	public List<Book> search(String keyword)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		List<Book> books = null;
		
		

	    try {
	         
	    	String jpql = "SELECT b FROM Book b WHERE " +
	                "b.bookName LIKE :keyword OR " +
	                "b.author LIKE :keyword OR " +
	                "CAST(b.bookid AS string) LIKE :keyword";
			

	        TypedQuery<Book> query = em.createQuery(jpql, Book.class);
	        query.setParameter("keyword", "%" + keyword + "%");
	        
	        books = query.getResultList();
	    } finally {
	        em.close();
	    }

	    return books;
		
	}
	
	
	public int update(Book book)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		Book book1 = em.find(Book.class, book.getBookId());
		
		if(book1!=null)
		{
			et.begin();
			em.merge(book);
			et.commit();
			
			return 1;
		}
		else
		{
			return 0;
		}
	}
	
	
	public int delete(int id) {
	    EntityManager em = create();
	    EntityTransaction et = em.getTransaction();
	    et.begin();
	    // Disassociate borrowdata records from the book
	    Query query = em.createQuery("UPDATE BorrowData b SET b.b = NULL WHERE b.b.bookid = :bookId");
	    query.setParameter("bookId", id);
	    query.executeUpdate();
	    
	    // Now, delete the book
	    Book book = em.find(Book.class, id);
	    if (book != null) {
	        
	        em.remove(book);
	        et.commit();
	        return 1;
	    } else {
	        return 0;
	    }
	}

	

}
