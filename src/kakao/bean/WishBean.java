package kakao.bean;

public class WishBean {
	private String idProno;
	private String id;
	private String prono;
	private String proname;
	private String picture;
	private int price;
	private int count;
	public String getIdProno() {
		return idProno;
	}
	public void setIdProno(String idProno) {
		this.idProno = idProno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProno() {
		return prono;
	}
	public void setProno(String prono) {
		this.prono = prono;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public WishBean(String idProno, String id, String prono, String proname, String picture, int price, int count) {
		super();
		this.idProno = idProno;
		this.id = id;
		this.prono = prono;
		this.proname = proname;
		this.picture = picture;
		this.price = price;
		this.count = count;
	}
	public WishBean() {
		super();
	}
	@Override
	public String toString() {
		return "WishBean [idProno=" + idProno + ", id=" + id + ", prono=" + prono + ", proname=" + proname
				+ ", picture=" + picture + ", price=" + price + ", count=" + count + "]";
	}
}
