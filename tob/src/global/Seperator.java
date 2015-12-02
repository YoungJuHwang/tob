package global;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Seperator {
	static CommandFactory factory = new CommandFactory();
	public static Command command;
	public static Command init(HttpServletRequest request, HttpServletResponse response) 
	{
		String path = request.getServletPath();
		System.out.println("Seperator 진입, 경로 : " +path);
		String temp = path.split("/")[1]; 
		String action = temp.substring(0, temp.indexOf("."));
		String page = request.getParameter("page");
		
		System.out.println("분리된 action : "+action);
		System.out.println("분리된 page : "+page);
		
		if (action.equals("main")) {
			action = "global";
		}
		if (page == null) {
			page = "main";
		}
		return factory.createCommand(action, page);
	}
}
