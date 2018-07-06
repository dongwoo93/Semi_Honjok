package honjok.web.dto;

public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String phone;
    private String email;
    private String zipcode;
    private String address;
    private String gender;
    private String portal;
	
    public MemberDTO() {
    	
    }
    
    
    
    public MemberDTO(String id, String pw, String name, String phone, String email, String zipcode, String address,
			String gender) {
		
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.zipcode = zipcode;
		this.address = address;
		this.gender = gender;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPw() {
		return pw;
	}



	public void setPw(String pw) {
		this.pw = pw;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getZipcode() {
		return zipcode;
	}



	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getPortal() {
		return portal;
	}



	public void setPortal(String portal) {
		this.portal = portal;
	}	
    
    
    
    
   
}
