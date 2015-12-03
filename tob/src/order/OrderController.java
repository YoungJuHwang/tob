package order;

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
 * Servlet implementation class OrderController
 */
@WebServlet("/order/Order.do")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String path = request.getServletPath();
		System.out.println("패스 : " +path);
		Command command = Seperator.init(request, response);
		System.out.println("오더컨트롤러 page : "+command.getPage());
		switch (command.getPage()) {
		case "Order":
			break;

		default:
			break;
		}
		DispatcherServlet.exam(request, response, command);
	}

}
