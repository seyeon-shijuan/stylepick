package exception;

public class SnsException extends RuntimeException{
	private String url;
	public SnsException(String msg,String url) {
		super(msg);
		this.url=url;
	}
	public String getUrl() {
		return url;
	}
}
