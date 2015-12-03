package admin;

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
 * Servlet implementation class AdminController
 */
@WebServlet("/admin/Admin.do")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String path = request.getServletPath();
		System.out.println("패스 : " +path);
		Command command = Seperator.init(request, response);
		System.out.println("어드민컨트롤러 page : "+command.getPage());
		switch (command.getPage()) {
		case "Admin":
			break;

		default:
			break;
		}
		DispatcherServlet.exam(request, response, command);
	}

}
