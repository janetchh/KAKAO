package kakao.bean;
//no, title, contents, writer, regdate, filename, hit
public class NoticeBean {
	private int no;
	private String title;
	private String contents;
	private String writer;
	private String regdate;
	private String filename;
	private int hit;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public NoticeBean(int no, String title, String contents, String writer, String regdate, String filename, int hit) {
		super();
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.regdate = regdate;
		this.filename = filename;
		this.hit = hit;
	}
	public NoticeBean() {
		super();
	}
	@Override
	public String toString() {
		return "NoticeBean [no=" + no + ", title=" + title + ", contents=" + contents + ", writer=" + writer
				+ ", regdate=" + regdate + ", filename=" + filename + ", hit=" + hit + "]";
	}
}
