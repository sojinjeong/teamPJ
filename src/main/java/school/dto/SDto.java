package school.dto;


//학생 정보 DB
public class SDto {
	
	private int id;
	private String pass;
	private String name;
	private String email;
	private String phoneNum;
	private String addr1;
	private String addr2;
	private String role;
	private int birth;
	private int stNum;
	private int lectureNum1;
	private int lectureNum2;
	private int lectureNum3;
	private int lectureNum4;
	private int zipcode;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStNum() {
		return stNum;
	}

	public void setStNum(int stNum) {
		this.stNum = stNum;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getphoneNum() {
		return phoneNum;
	}

	public void setphoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}	
	
	public int getLectureNum1() {
		return lectureNum1;
	}

	public void setLectureNum1(int lectureNum1) {
		this.lectureNum1 = lectureNum1;
	}	
	
	public int getLectureNum2() {
		return lectureNum2;
	}

	public void setLectureNum2(int lectureNum2) {
		this.lectureNum2 = lectureNum2;
	}

	public int getLectureNum3() {
		return lectureNum3;
	}

	public void setLectureNum3(int lectureNum3) {
		this.lectureNum3 = lectureNum3;
	}

	public int getLectureNum4() {
		return lectureNum4;
	}

	public void setLectureNum4(int lectureNum4) {
		this.lectureNum4 = lectureNum4;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	

	
	@Override
	public String toString() {
	     return "SDto [id=" + id + ", userid=" + stNum + ", userpass=" + pass + ", username=" + name
	           + ", useremail=" + email + ", usertel=" + phoneNum + ", zipcode=" + zipcode + ", addr1=" + addr1
	           + ", addr2=" + addr2 + ", role=" + role +"]";
	  }
	
	public SDto() {}

	public SDto(int id, int stNum, String pass, String name, String useremail, String phoneNum, String addr1,
			String addr2, String role, int birth, int zipcode) {
		super();
		this.id = id;
		this.stNum = stNum;
		this.pass = pass;
		this.name = name;
		this.email = useremail;
		this.phoneNum = phoneNum;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.role = role;
		this.birth = birth;
		this.zipcode = zipcode;
	}


}
