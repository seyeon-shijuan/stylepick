package logic;

import java.util.Date;

public class Todolist {
	private int No;
	private Date duedate;
    private String content;
    private String fin;
    
    protected Todolist() {    }
    
    public Todolist(int No, Date duedate, String content, String fin) {
        super();
        this.No = No;
        this.duedate = duedate;
        this.content = content;
        this.fin = fin;
    }

	public int getNo() {
		return No;
	}
	public void setNo(int no) {
		No = no;
	}
	public Date getDuedate() {
		return duedate;
	}
	public void setDuedate(Date duedate) {
		this.duedate = duedate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFin() {
		return fin;
	}
	public void setFin(String fin) {
		this.fin = fin;
	}
	@Override
	public String toString() {
		return "Todolist [No=" + No + ", duedate=" + duedate + ", content=" + content + ", fin=" + fin + "]";
	}
    
	@Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + (int)(No ^ (No >>> 32));
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Todolist other = (Todolist) obj;
        if (No != other.No)
            return false;
        return true;
    }

	
}
