package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import global.Command;
import global.DispatcherJson;
import global.DispatcherServlet;
import global.Seperator;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/member/Member.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//MemberService service = MemberServiceImpl.getInstance();
	// MemberVO member = new MemberVO();
	String userid, password;
	JSONObject obj = new JSONObject();
	Gson gson = new Gson();
	
	
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String path = request.getServletPath();
		System.out.println("패스 : " +path);
		Command command = Seperator.init(request, response);
		System.out.println("멤버컨트롤러 page : "+command.getPage());
		HttpSession session=request.getSession(); 
		
		
		switch (command.getPage()) {
		case "Member":
			break;
		case "login":
			userid = request.getParameter("userid");
			password = request.getParameter("password");
			//member = service.login(userid, password);
			//session.setAttribute("member", member);
			//obj.put("result", "success");
			//obj.put("userid", member.getUserid());
			DispatcherJson.sendJSONObject(response, obj);
			
			return;
		default:
			break;
		}
		DispatcherServlet.exam(request, response, command);
	}

}
