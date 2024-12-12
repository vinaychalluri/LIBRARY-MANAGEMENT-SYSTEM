package ProjectLibrary.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import ProjectLibrary.dto.Faculty;
import ProjectLibrary.dto.Student;

public class facultyDao
{
	public static EntityManager create()
	{
		 EntityManagerFactory emf = Persistence.createEntityManagerFactory("vinay");
		 EntityManager em = emf.createEntityManager();
		 
		 return em;
		
	}
	 
	
	public boolean save(Faculty faculty)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		Faculty facul = em.find(Faculty.class, faculty.getEmail());
	 	if(facul==null)
		{
			et.begin();
			em.persist(faculty);
			et.commit();
			return true;
		}
		else
		{
			return false;
		} 
	 
	}
	
	public Faculty login(String email)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		Faculty faculty = em.find(Faculty.class, email);
		
		if(faculty!=null)
		{
			return faculty;
		}
		else
		{
			return null;
		}
	}
	
	public Faculty fetch(String email)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		 
		String jpql = "SELECT s FROM Faculty s WHERE s.email = :email";
        TypedQuery<Faculty> query = em.createQuery(jpql, Faculty.class);
        query.setParameter("email", email);
        
        return query.getSingleResult(); 
		
	}
	
	public int update(Faculty faculty)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		Faculty faculty1 = em.find(Faculty.class, faculty.getEmail());
		
		if(faculty1!=null)
		{
			et.begin();
			em.merge(faculty);
			et.commit();
			
			return 1;
		}
		else
		{
			return 0;
		}
	}
	
	
	public int delete(String email)
	{

		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		Faculty faculty = em.find(Faculty.class, email);
		
		
		if(faculty!=null)
		{
			et.begin();
			em.remove(faculty);
			et.commit();
			return 1;
		}
		else
		{
			return 0;
		}
		
		
	}
	

}
