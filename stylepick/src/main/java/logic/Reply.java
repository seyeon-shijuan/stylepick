package logic;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Reply {
	private int rno;
	private int bno;
	private Date regtime;
	private String author;
	private String content;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getRegtime() {
		return new SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(regtime);
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", bno=" + bno + ", regtime=" + regtime + ", author=" + author + ", content="
				+ content + "]";
	}
	
	
}
