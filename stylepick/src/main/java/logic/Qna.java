package logic;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class Qna {
	private int qna_no;
	private int item_no;
	private int type;
	private String userid;
	private String content;
	private Date regdate;
	private int grp;
	private int grplevel;
	private int grpstep;
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	public int getGrplevel() {
		return grplevel;
	}
	public void setGrplevel(int grplevel) {
		this.grplevel = grplevel;
	}
	public int getGrpstep() {
		return grpstep;
	}
	public void setGrpstep(int grpstep) {
		this.grpstep = grpstep;
	}
	@Override
	public String toString() {
		return "Qna [qna_no=" + qna_no + ", item_no=" + item_no + ", type=" + type + ", userid=" + userid + ", content="
				+ content + ", regdate=" + regdate + ", grp=" + grp + ", grplevel=" + grplevel + ", grpstep=" + grpstep
				+ "]";
	}


}
