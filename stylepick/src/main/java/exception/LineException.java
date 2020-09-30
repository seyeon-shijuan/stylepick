package exception;

public class LineException extends RuntimeException{
	private String url;
	public LineException(String msg,String url) {
		super(msg);
		this.url =url;
	}
	public String getUrl() {
		return url;
	}
}
