package exception;

public class AjaxException extends RuntimeException{
	private String url;
	public AjaxException(String msg,String url) {
		super(msg);
		this.url=url;
	}
	public String getUrl() {
		return url;
	}
}
