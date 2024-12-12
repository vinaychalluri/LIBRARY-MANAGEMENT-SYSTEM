package ProjectLibrary.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import ProjectLibrary.dto.Faculty;
import ProjectLibrary.dto.Student;

public class StudentDao
{
	public static EntityManager create()
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("vinay");
		EntityManager em = emf.createEntityManager();
		return em;
	}
	
	public boolean save(Student student)
	{
		 
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		Student stud = em.find(Student.class, student.getEmail());
		
		
		if(stud==null)
		{
			et.begin();
			em.persist(student);
			et.commit();
			return true;
		}
		else
		{
			return false;
		}
		
	}
	
	public Student login(String email)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		Student student = em.find(Student.class, email);
		
		if(student!=null)
		{
			return student;
		}
		else
		{
			return null;
		}
	}
	
	public List<Student> fetchAll()
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		
		Query query = em.createQuery(" SELECT s FROM Student s WHERE s.borrow = 'request' ");
        List<Student> student = query.getResultList();
        
        et.commit();
        
        return student;
	}

	
	public int request(String email)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		int updatedRows = 0;
		
		 et.begin(); 

		    Student student = em.find(Student.class, email);
		    System.out.println(student);
            
		    if(student!=null)
		    {
		    	 

		        Query query = em.createQuery("UPDATE Student s SET s.borrow = :newName WHERE s.email = :email");
		        query.setParameter("newName", "request");
		        query.setParameter("email", email);

		        updatedRows = query.executeUpdate();
		        System.out.println(updatedRows + " rows updated.");

		        et.commit();
		    }
		   return updatedRows;
		    
		 	}
	
	public int approve(String email)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		int updatedRows = 0;
		
		 et.begin(); 

		    Student student = em.find(Student.class, email);
		    System.out.println(student);
            
		    if(student!=null)
		    {
		    	 

		        Query query = em.createQuery("UPDATE Student s SET s.borrow = :newName WHERE s.email = :email");
		        query.setParameter("newName", "approved");
		        query.setParameter("email", email);

		        updatedRows = query.executeUpdate();
		        System.out.println(updatedRows + " rows updated.");

		        et.commit();
		    }
		   return updatedRows;
		    
		}
	
	public Student fetch(String email)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		 
		String jpql = "SELECT s FROM Student s WHERE s.email = :email";
        TypedQuery<Student> query = em.createQuery(jpql, Student.class);
        query.setParameter("email", email);
        return query.getSingleResult(); 
		
	}
	
	public int update(Student student)
	{
		EntityManager em = create();
		EntityTransaction et = em.getTransaction();
		
		Student student1 = em.find(Student.class, student.getEmail());
		
		if(student1!=null)
		{
			et.begin();
			em.merge(student);
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
		
		Student	student = em.find(Student.class, email);
		
		
		if(student!=null)
		{
			et.begin();
			em.remove(student);
			et.commit();
			return 1;
		}
		else
		{
			return 0;
		}
		
		
	}
}
