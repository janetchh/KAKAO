package kakao.bean;

public class AddToCartBean {
	public String proname;
	public int totalPrice;
	public int totalCount;
	public String picture;
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public AddToCartBean(String proname, int totalPrice, int totalCount, String picture) {
		super();
		this.proname = proname;
		this.totalPrice = totalPrice;
		this.totalCount = totalCount;
		this.picture = picture;
	}
	
	public AddToCartBean() {
		super();
	}
	@Override
	public String toString() {
		return "AddToCartBean [proname=" + proname + ", totalPrice=" + totalPrice + ", totalCount=" + totalCount
				+ ", picture=" + picture + "]";
	}
}
