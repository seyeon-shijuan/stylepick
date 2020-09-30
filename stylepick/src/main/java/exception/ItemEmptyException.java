package exception;

public class ItemEmptyException extends RuntimeException{
	private String url;
	public ItemEmptyException(String msg,String url) {
		super(msg);
		this.url =url;
	}
	public String getUrl() {
		return url;
	}
}
