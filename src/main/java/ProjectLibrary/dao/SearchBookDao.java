package ProjectLibrary.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.persistence.TypedQuery;

import ProjectLibrary.dto.Book;

public class SearchBookDao
{
	
	public static EntityManager create()
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("vinay");
		EntityManager em = emf.createEntityManager();
		
		return em;
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
	
	
	 

}
