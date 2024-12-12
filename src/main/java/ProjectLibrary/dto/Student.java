package ProjectLibrary.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Student 
{
	
	String name;
	@Id
	String email;
	String pwd;
	long phone;
	String gender;
	String year;
	String borrow;
	
	public Student()
	{
		
	}
	
	
	public Student(String name, String email, String pwd, long phone, String gender, String year,String borrow) {
		 
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.phone = phone;
		this.gender = gender;
		this.year = year;
		this.borrow = borrow;
	}



	public String getBorrow() {
		return borrow;
	}


	public void setBorrow(String borrow) {
		this.borrow = borrow;
	}


	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPwd() {
		return pwd;
	}



	public void setPwd(String pwd) {
		this.pwd = pwd;
	}



	public long getPhone() {
		return phone;
	}



	public void setPhone(long phone) {
		this.phone = phone;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getYear() {
		return year;
	}



	public void setYear(String year) {
		this.year = year;
	}


	@Override
	public String toString() {
		return "Student [name=" + name + ", email=" + email + ", pwd=" + pwd + ", phone=" + phone + ", gender=" + gender
				+ ", year=" + year + ", borrow=" + borrow + "]";
	}



	 
	
	
	

}
