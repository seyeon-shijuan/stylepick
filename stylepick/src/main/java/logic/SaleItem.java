package logic;

public class SaleItem {
	private int order_no;
	private int seq;
	private int item_no;
	private int quantity;
	private Item item;
	private String item_option;
	private String size;
	private int reviewed;
	private int stat;
	private int amount;

	// 변수저장용
	private String userid;
	private int line_no;
	private String content;
	private long Evaluation;

	public SaleItem() {
	}

	public SaleItem(int order_no, int seq, ItemSet itemSet) {
		this.order_no = order_no;
		this.seq = seq;
		this.item = itemSet.getItem();
		this.item_no = item.getItem_no();
		this.quantity = itemSet.getQuantity();
		this.item_option = itemSet.getItem_option();
		this.size = itemSet.getSize();
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public String getItem_option() {
		return item_option;
	}

	public void setItem_option(String item_option) {
		this.item_option = item_option;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getStat() {
		return stat;
	}

	public void setStat(int stat) {
		this.stat = stat;
	}

	public int getReviewed() {
		return reviewed;
	}

	public void setReviewed(int reviewed) {
		this.reviewed = reviewed;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getAmount() {
		return item.getPrice() * quantity;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getLine_no() {
		return line_no;
	}

	public void setLine_no(int i) {
		this.line_no = i;
	}

	
	public long getEvaluation() {
		return Evaluation;
	}

	public void setEvaluation(long evaluation) {
		Evaluation = evaluation;
	}

	@Override
	public String toString() {
		return "SaleItem [order_no=" + order_no + ", seq=" + seq + ", item_no=" + item_no + ", quantity=" + quantity
				+ ", item=" + item + ", item_option=" + item_option + ", size=" + size + ", reviewed=" + reviewed
				+ ", stat=" + stat + ", amount=" + amount + ", userid=" + userid + ", line_no=" + line_no + ", content="
				+ content + ", Evaluation=" + Evaluation + "]";
	}

	

}
