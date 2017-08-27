package kakao.bean;

public class QnaBean {
	private String id;
	private String name;
	private String email;
	private String tel;
	private String type;
	private String title;
	private String contents;
	private String regdate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public QnaBean() {
		super();
	}
	public QnaBean(String id, String name, String email, String tel, String type, String title, String contents,
			String regdate) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.type = type;
		this.title = title;
		this.contents = contents;
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "QnaBean [id=" + id + ", name=" + name + ", email=" + email + ", tel=" + tel + ", type=" + type
				+ ", title=" + title + ", contents=" + contents + ", regdate=" + regdate + "]";
	}
	
}
