package ProjectLibrary.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Book 
{
	@Id
	int bookid;
	String bookName;
	int quantity;
	String author;
	
	public Book()
	{
		
	}
	public Book(int bookid, String bookName, int quantity, String author) {
	 
		this.bookid = bookid;
		this.bookName = bookName;
		this.quantity = quantity;
		this.author = author;
	}
	public int getBookId() {
		return bookid;
	}
	public void setBookId(int bookid) {
		this.bookid = bookid;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	 
 
	@Override
	public String toString() {
		return "Book [bookid=" + bookid + ", bookName=" + bookName + ", quantity=" + quantity + ", author=" + author
				+ "]";
	}
	
	
	
	

}
