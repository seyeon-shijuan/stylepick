package logic;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private Integer no;
	private Integer count;
	private Integer seq;
	private String category;
	private String title;
	private String author;
	private Date regtime;
	private String stat;
	private Integer readcnt;
	private String content;
	private MultipartFile file1;
	private String fileurl;
	private String email;
	private int openstatus;
	private int mail;
	
	public Board() {
		
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getRegtime() {
		return new SimpleDateFormat("yyyy-MM-dd").format(regtime);
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getCategory() {
		return this.category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(Integer readcnt) {
		this.readcnt = readcnt;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	public String getFileurl() {
		return fileurl;
	}

	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getOpenstatus() {
		return openstatus;
	}

	public void setOpenstatus(int openstatus) {
		this.openstatus = openstatus;
	}

	public int getMail() {
		return mail;
	}

	public void setMail(int mail) {
		this.mail = mail;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", count=" + count + ", seq=" + seq + ", category=" + category + ", title=" + title
				+ ", author=" + author + ", regtime=" + regtime + ", stat=" + stat + ", readcnt=" + readcnt
				+ ", content=" + content + ", file1=" + file1 + ", fileurl=" + fileurl + ", email=" + email
				+ ", openstatus=" + openstatus + ", mail=" + mail + "]";
	}
	
}
