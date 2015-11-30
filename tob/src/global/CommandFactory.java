package global;

public class CommandFactory {
	public Command createCommand(String action, String page){
		System.out.println("팩토리 내부 action : " +action);
		System.out.println("팩토리 내부 page : " +page);
		return new Command(action, page);
	}
}
