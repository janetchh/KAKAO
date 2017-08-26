package kakao.bean;

public class ProductOrderBean {
	private String ordernumber;
	private String id;
	private String name;
	private String email;
	private String tel;
	private String address;
	private String orderinfo;
	private String picture;
	private String proname;
	private int price;
	private int count;
	private String ordertime;
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOrderinfo() {
		return orderinfo;
	}
	public void setOrderinfo(String orderinfo) {
		this.orderinfo = orderinfo;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
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
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public ProductOrderBean(String ordernumber, String id, String name, String email, String tel, String address,
			String orderinfo, String picture, String proname, int price, int count, String ordertime) {
		super();
		this.ordernumber = ordernumber;
		this.id = id;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.address = address;
		this.orderinfo = orderinfo;
		this.picture = picture;
		this.proname = proname;
		this.price = price;
		this.count = count;
		this.ordertime = ordertime;
	}
	public ProductOrderBean() {
		super();
	}
	@Override
	public String toString() {
		return "ProductOrderBean [ordernumber=" + ordernumber + ", id=" + id + ", name=" + name + ", email=" + email
				+ ", tel=" + tel + ", address=" + address + ", orderinfo=" + orderinfo + ", picture=" + picture
				+ ", proname=" + proname + ", price=" + price + ", count=" + count + ", ordertime=" + ordertime + "]";
	}
}
