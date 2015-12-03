package event;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import global.Command;
import global.DispatcherServlet;
import global.Seperator;

/**
 * Servlet implementation class EventController
 */
@WebServlet("/event/Event.do")
public class EventController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String path = request.getServletPath();
		System.out.println("패스 : " +path);
		Command command = Seperator.init(request, response);
		System.out.println("Event컨트롤러 page : "+command.getPage());
		switch (command.getPage()) {
		case "Event":
			break;
		case "event_form":
			break;
		case "event_up":
			break;
		case "event_de":
			break;
		default:
			break;
		}
		DispatcherServlet.exam(request, response, command);
	}
}
