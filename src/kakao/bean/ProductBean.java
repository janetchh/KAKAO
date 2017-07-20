package kakao.bean;

public class ProductBean {
	private String prono;
	private String proname;
	private int price;
	private String character;
	private String type;
	private String subtype;
	private String mainimg;
	private String detailimg1;
	private String detailimg2;
	private String datailimg3;
	private String notice;
	private String info;
	private int count;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCharacter() {
		return character;
	}
	public void setCharacter(String character) {
		this.character = character;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSubtype() {
		return subtype;
	}
	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}
	public String getMainimg() {
		return mainimg;
	}
	public void setMainimg(String mainimg) {
		this.mainimg = mainimg;
	}
	public String getDetailimg1() {
		return detailimg1;
	}
	public void setDetailimg1(String detailimg1) {
		this.detailimg1 = detailimg1;
	}
	public String getDetailimg2() {
		return detailimg2;
	}
	public void setDetailimg2(String detailimg2) {
		this.detailimg2 = detailimg2;
	}
	public String getDatailimg3() {
		return datailimg3;
	}
	public void setDatailimg3(String datailimg3) {
		this.datailimg3 = datailimg3;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public ProductBean() {
		super();
	}
	public ProductBean(String prono, String proname, int price, String character, String type, String subtype,
			String mainimg, String detailimg1, String detailimg2, String datailimg3, String notice, String info,
			int count) {
		super();
		this.prono = prono;
		this.proname = proname;
		this.price = price;
		this.character = character;
		this.type = type;
		this.subtype = subtype;
		this.mainimg = mainimg;
		this.detailimg1 = detailimg1;
		this.detailimg2 = detailimg2;
		this.datailimg3 = datailimg3;
		this.notice = notice;
		this.info = info;
		this.count = count;
	}
	@Override
	public String toString() {
		return "ProductBean [prono=" + prono + ", proname=" + proname + ", price=" + price + ", character=" + character
				+ ", type=" + type + ", subtype=" + subtype + ", mainimg=" + mainimg + ", detailimg1=" + detailimg1
				+ ", detailimg2=" + detailimg2 + ", datailimg3=" + datailimg3 + ", notice=" + notice + ", info=" + info
				+ ", count=" + count + "]";
	}
	
}
