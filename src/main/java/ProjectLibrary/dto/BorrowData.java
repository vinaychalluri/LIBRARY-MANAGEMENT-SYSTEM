package ProjectLibrary.dto;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class BorrowData 
{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	 
	LocalDateTime borrowDate;
	LocalDateTime submitDate;
	
	@ManyToOne
	Student s;
	@ManyToOne
	Book b;
	
	
	
	public BorrowData()
	{
		
	}
	public BorrowData(Student s, Book b) {
		 
		
		this.borrowDate = LocalDateTime.now();
		this.submitDate = null;
		this.s = s;
		this.b = b;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDateTime getBorrowDate() {
		return borrowDate;
	}
	public void setBorrowDate(LocalDateTime borrowDate) {
		this.borrowDate = LocalDateTime.now();
	}
	public LocalDateTime getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(LocalDateTime submitDate) {
		this.submitDate = null;
	}
	public Student getS() {
		return s;
	}
	public void setS(Student s) {
		this.s = s;
	}
	public Book getB() {
		return b;
	}
	public void setB(Book b) {
		this.b = b;
	}
	@Override
	public String toString() 
	{
		return "BorrowData [id=" + id + ", borrowDate=" + borrowDate + ", submitDate=" + submitDate + ", s=" + s
				+ ", b=" + b + "]";
	}
	
	
	
	
	
	

}
