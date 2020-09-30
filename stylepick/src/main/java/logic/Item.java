package logic;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Item {
	private int item_no; //상품번호
	private String userid; //판매자 아이디
	private int category; //카테고리
	private String code; //상품 코드
	private String subject; //상품 제목
	private String item_name; //상품이름
	private int price; //상품 가격
	private String keyword; //키워드
	private String pictureUrl;	//상품사진
	private MultipartFile imgurl; //상품사진
	private String content; //상품내용
	private Date regdate; //등록일
	private int readcnt; //조회수
	
	//옵션은 추후 db에 할지 한번에 할지 정함
	private String item_option; //옵션
	private String size;	//사이즈
	
	//판매자명
	private String name;
	
	//문의
	private int qna;

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
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public MultipartFile getImgurl() {
		return imgurl;
	}
	public void setImgurl(MultipartFile imgurl) {
		this.imgurl = imgurl;
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

	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQna() {
		return qna;
	}
	public void setQna(int qna) {
		this.qna = qna;
	}

	@Override
	public String toString() {
		return "Item [item_no=" + item_no + ", userid=" + userid + ", category=" + category + ", code=" + code
				+ ", subject=" + subject + ", item_name=" + item_name + ", price=" + price + ", keyword=" + keyword
				+ ", pictureUrl=" + pictureUrl + ", imgurl=" + imgurl + ", content=" + content + ", regdate=" + regdate
				+ ", readcnt=" + readcnt + ", item_option=" + item_option + ", size=" + size + ", name=" + name
				+ ", qna=" + qna + "]";
	}

}
