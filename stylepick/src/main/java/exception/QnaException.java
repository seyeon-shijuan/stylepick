package exception;

public class QnaException extends RuntimeException{
	private String url;
	public QnaException(String msg,String url) {
		super(msg);
		this.url =url;
	}
	public String getUrl() {
		return url;
	}
}
