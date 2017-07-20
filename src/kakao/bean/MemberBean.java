package kakao.bean;
//id, pw, name, address, tel, email, gender, birth, character
public class MemberBean {
	private String id;
	private String pw;
	private String name;
	private String address;
	private String tel;
	private String email;
	private String gender;
	private String birth;
	private String character;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getCharacter() {
		return character;
	}
	public void setCharacter(String character) {
		this.character = character;
	}
	public MemberBean(String id, String pw, String name, String address, String tel, String email, String gender,
			String birth, String character) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.character = character;
	}
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pw=" + pw + ", name=" + name + ", address=" + address + ", tel=" + tel
				+ ", email=" + email + ", gender=" + gender + ", birth=" + birth + ", character=" + character + "]";
	}
	
}
