package logic;

import java.text.SimpleDateFormat;
import java.util.Date;


public class Buy {
	private int order_no;
	private String userid;
	private String name;
	private String address;
	private long tel;
	private Date orderdate;
	private int stat;
	private int amount;
	private String memo;
	
	private String weeks_ago;
	private String month;
	private Date regdate;
	private int category;
	private String com_name;
	private String item_name;
	
	//오더번호, 판매일, 스토어, 대표 품명, 금액, 상태, 배송지
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getAddress_qu() {
		int idx = this.address.indexOf("구");
		String rtn = this.address.substring(0, idx);
		return rtn;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCategoryinString() {
		String rtn = "";
		switch (category) {
			case 1 : rtn="모자";break;
			case 2 : rtn="아우터";break;
			case 3 : rtn="원피스";break;
			case 4 : rtn="상의";break;
			case 5 : rtn="하의";break;
			case 6 : rtn="가방";break;
			case 7 : rtn="신발";break;
			default : rtn="시계";
		}
		/*
		 *모자
			아우터
			원피스
			상의
			하의
			가방
			신발
			시계 
		 */
		
		return rtn;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getRegdateinString() {
		//Date from = new Date();
		//SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM");
		//String to = transFormat.format(regdate);
		//return to;
		return new SimpleDateFormat("yyyy-MM").format(regdate);
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getWeeks_ago() {
		if (this.weeks_ago.equals("0")) return "이번주";
		else return weeks_ago+"주전";
	}
	public void setWeeks_ago(String weeks_ago) {
		this.weeks_ago = weeks_ago;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public long getTel() {
		return tel;
	}
	public void setTel(long tel) {
		this.tel = tel;
	}
	
	public String getOrderdateinString() {
		return new SimpleDateFormat("yyyy-MM-dd").format(orderdate);
	}
	
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public int getStat() {
		return stat;
	}
	public void setStat(int stat) {
		this.stat = stat;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	@Override
	public String toString() {
		return "Buy [order_no=" + order_no + ", userid=" + userid + ", name=" + name + ", address=" + address + ", tel="
				+ tel + ", orderdate=" + orderdate + ", stat=" + stat + ", amount=" + amount + ", memo=" + memo
				+ ", weeks_ago=" + weeks_ago + ", month=" + month + ", regdate=" + regdate + ", category=" + category
				+ ", com_name=" + com_name + ", item_name=" + item_name + "]";
	}
	

	
}


/*
 * CREATE TABLE buy
(
	-- 주문번호
	order_no int(100) NOT NULL COMMENT '주문번호',
	-- 회원아이디
	userid int(100) NOT NULL COMMENT '회원아이디',
	-- 수령자이름
	name varchar(20) NOT NULL COMMENT '수령자이름',
	-- 수령지주소
	address varchar(100) NOT NULL COMMENT '수령지주소',
	-- 수령자번호
	tel varchar(30) NOT NULL COMMENT '수령자번호',
	-- 주문날짜
	orderdate datetime NOT NULL COMMENT '주문날짜',
	-- 출고여부
	stat int NOT NULL COMMENT '출고여부',
	-- 총 금액
	amount int(100) NOT NULL COMMENT '총 금액',
	-- 배송메모
	memo varchar(200) COMMENT '배송메모',
	PRIMARY KEY (order_no)
);
 */
