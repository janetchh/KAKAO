package kakao.bean;

public class FaqBean {
	private int no;
	private String title;
	private String contents;
	private String regdate;
	private String writer;
	private String hit;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public FaqBean(int no, String title, String contents, String regdate, String writer, String hit) {
		super();
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.regdate = regdate;
		this.writer = writer;
		this.hit = hit;
	}
	public FaqBean() {
		super();
	}
	@Override
	public String toString() {
		return "FaqBean [no=" + no + ", title=" + title + ", contents=" + contents + ", regdate=" + regdate
				+ ", writer=" + writer + ", hit=" + hit + "]";
	}
	
}
