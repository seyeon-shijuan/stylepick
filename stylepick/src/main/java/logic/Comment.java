package logic;

import java.util.Date;

public class Comment {
	private int sns_no;
	private int reply_no;
	private String userid;
	private String content;
	private Date regdate;
	public int getSns_no() {
		return sns_no;
	}
	public void setSns_no(int sns_no) {
		this.sns_no = sns_no;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
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
	@Override
	public String toString() {
		return "Comment [sns_no=" + sns_no + ", reply_no=" + reply_no + ", userid=" + userid + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}
	
}
