package logic;

import java.util.Date;
// admin 페이지 통계용 VO
public class Statistics {
	private long salesvolume;
	private long numofusers;
	private Date regdate;
	private String category;
	private String com_name;
	public long getSalesvolume() {
		return salesvolume;
	}
	public void setSalesvolume(long salesvolume) {
		this.salesvolume = salesvolume;
	}
	public long getNumofusers() {
		return numofusers;
	}
	public void setNumofusers(long numofusers) {
		this.numofusers = numofusers;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	@Override
	public String toString() {
		return "Statistics [salesvolume=" + salesvolume + ", numofusers=" + numofusers + ", regdate=" + regdate
				+ ", category=" + category + ", com_name=" + com_name + "]";
	}
	
	
}
