package logic;

public class SnsItem {
	private int sns_no;
	private int seq;
	private String category;
	private String detail;
	private int isshopitem;
	public SnsItem() {}
	public SnsItem(int sns_no,int seq,String category,String detail,int item_no) {
		this.sns_no = sns_no;
		this.seq = seq;
		this.category = category;
		this.detail = detail;
		this.isshopitem = item_no;
		
	}
	public int getSns_no() {
		return sns_no;
	}
	public void setSns_no(int sns_no) {
		this.sns_no = sns_no;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getIsshopitem() {
		return isshopitem;
	}
	public void setIsshopitem(int isshopitem) {
		this.isshopitem = isshopitem;
	}
	@Override
	public String toString() {
		return "SnsItem [sns_no=" + sns_no + ", seq=" + seq + ", category=" + category + ", detail=" + detail
				+ ", isshopitem=" + isshopitem + "]";
	}
	
	
}
