package cart;

import java.io.Serializable;

public class CartVO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String bookId;
	private String purNum;
	private String userid;
	private int count;
	
	public CartVO(String bookId, String purNum, String userid, int count){
		this.bookId = bookId;
		this.purNum = purNum;
		this.userid = userid;
		this.count = count;
	}
	
	
	public String getBookId() {
		return bookId;
	}
	public String getPurNum() {
		return purNum;
	}
	public String getUserid() {
		return userid;
	}
	public int getCount() {
		return count;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public void setPurNum(String purNum) {
		this.purNum = purNum;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
