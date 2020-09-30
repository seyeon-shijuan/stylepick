package logic;

import java.util.Date;

public class Line {
	private int line_no ;  //한줄평 no
	private int item_no;	//아이템 작성할 곳 no
	private String userid;	//작성자 아이디
	private String content;	//내용
	private long evaluation;	//평점
	private Date regdate;	//등록시간
	
	private String com_name;
	
	private int order_no;  //sale
	private int seq;		//saleitem

	
	public int getLine_no() {
		return line_no;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public void setLine_no(int line_no) {
		this.line_no = line_no;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public long getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(long evaluation) {
		this.evaluation = evaluation;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	@Override
	public String toString() {
		return "Line [line_no=" + line_no + ", item_no=" + item_no + ", userid=" + userid + ", content=" + content
				+ ", evaluation=" + evaluation + ", regdate=" + regdate + ", com_name=" + com_name + ", order_no="
				+ order_no + ", seq=" + seq + "]";
	}

}
