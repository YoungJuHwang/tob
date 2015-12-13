package purchase;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PurchaseVO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String purNum;
	private String sum;
	private String accountNum;
	private String userid;
	
	public PurchaseVO(){}
	
	public PurchaseVO(String purNum, String sum, String accountNum, String userid){
		this.purNum = purNum;
		this.sum = sum;
		this.accountNum = accountNum;
		this.userid = userid;
	}
	
	
	public String getPurNum() {
		return purNum;
	}
	public void setPurNum(String purNum) {
		/*Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		int seq = 1;
		seq++;
		String tag = String.format("%04d", seq);
		this.purNum = date + "-" + tag;*/
		this.purNum = purNum;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PurchaseVO [purNum=" + purNum + ", sum=" + sum + ", accountNum=" + accountNum + ", userid=" + userid
				+ "]";
	}
	
	
	
}
