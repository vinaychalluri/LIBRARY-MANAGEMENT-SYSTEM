package ProjectLibrary.dao;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import ProjectLibrary.dto.BorrowData;

public class BorrowBookDao
{
	public static EntityManager create()
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("vinay");
		EntityManager em = emf.createEntityManager();
		
		return em;
	}
	
	public boolean  save(BorrowData borrowdata)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		if(borrowdata.getB().getQuantity()>0)
		{
			et.begin();
		    em.persist(borrowdata);
			et.commit();
			return true;
		}
		else
		{
			return false;
			
		}
		
		
		
	}
	
	public List<BorrowData> fetch(String email)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
        et.begin();
		System.out.println(email);
		Query query = em.createQuery(" SELECT s FROM BorrowData s WHERE s.s.email = :email ");
		query.setParameter("email", email);
		
        List<BorrowData> data = query.getResultList();
        
        et.commit();
		
        return data;
	}
	 
	public int submit(String email,int bookId)
	{
		System.out.println(email+" "+bookId);
		
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		LocalDateTime submitDate = LocalDateTime.now();
		System.out.println(submitDate);
		et.begin();
		 Query query = em.createQuery("UPDATE BorrowData s SET s.submitDate = :newName WHERE s.s.email = :email and s.b.bookid= :bookid ");
	     query.setParameter("newName", submitDate);
	     query.setParameter("email", email);
	     query.setParameter("bookid", bookId);
	   

	   int  updatedRows = query.executeUpdate();
	   et.commit();
	   
	   return updatedRows;
		
	}
	
	
	public List<BorrowData> fetchAll()
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		 
        List<BorrowData> data = null;

        try {
            String jpql = "SELECT b FROM BorrowData b";
            TypedQuery<BorrowData> query = em.createQuery(jpql, BorrowData.class);
            data = query.getResultList();
        } finally {
            em.close();
        }

        return data;
	}
	 

}
