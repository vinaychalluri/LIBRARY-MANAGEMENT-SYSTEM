package ProjectLibrary.dto;

import java.util.Random;

 
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Faculty
{
	 
	int id;
	String name;
	@Id
	String email;
	String pwd;
	long phone;
	String gender;
	
	Random r = new Random();
	public Faculty()
	{
		
	}
	public Faculty(String name, String email, String pwd, long phone, String gender) {
		 
		this.id = r.nextInt(999);
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.phone = phone;
		this.gender = gender;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
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


	@Override
	public String toString() {
		return "Faculty [id=" + id + ", name=" + name + ", email=" + email + ", pwd=" + pwd + ", phone=" + phone
				+ ", gender=" + gender + "]";
	}
	
	

}
