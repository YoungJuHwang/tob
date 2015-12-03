package event;

import java.io.Serializable;

public class EventVO  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String evtId;
	private String evtName;
	private String term;
	
	public static EventVO instance = new EventVO();
	public static EventVO getInstance(){
		return instance;
	}
	public EventVO() {
		// TODO Auto-generated constructor stub
	}
	public EventVO(String evtId,String evtName,String term) {
		this.evtId = evtId;
		this.evtName = evtName;
		this.term = term;
	}
	public String getEvtId() {
		return evtId;
	}
	public String getEvtName() {
		return evtName;
	}
	public String getTerm() {
		return term;
	}
	public void setEvtId(String evtId) {
		this.evtId = evtId;
	}
	public void setEvtName(String evtName) {
		this.evtName = evtName;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	@Override
	public String toString() {
		return "이벤트 [당첨자ID=" + evtId + ", 이벤트명=" + evtName + ", 기간=" + term + "]";
	}
	
	
}
