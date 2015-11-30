package global;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;

import member.MemberService;
import member.MemberServiceImpl;

/**
 * Servlet implementation class JsController
 */
@WebServlet("/main.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String path = request.getServletPath();
		System.out.println("패스 ㅣ: " +path);
		Command command = Seperator.init(request, response);
		MemberService service = MemberServiceImpl.getInstance();
		System.out.println("메인컨트롤러 page : "+command.getPage());
		switch (command.getPage()) {
		case "main":
			break;
		case "footer":
			break;
		case "jumbotron":
			break;
		case "header":
			break;
		case "auth":
			HttpSession session = request.getSession();
			String userid = request.getParameter("userid");
			session.setAttribute("member",service.searchById(userid)); //member를 sessionscope에 저장함.
			response.addCookie(new Cookie("member.cookie", "tomcat_member"));
			request.setAttribute("member", service.searchById(userid)); //member를 보내기만함.
			// ※ auth.jsp는 main이랑 같아서 있을 필요가 없음... 제거해볼까?
			command.setAction("main");
			command.setPage("null");
			break;
		case "admin": break;
		case "book": break;
		case "event": break;
		case "member": break;
		case "order": break;
		default:
			break;
		}
		DispatcherServlet.exam(request, response, command);
	}
}