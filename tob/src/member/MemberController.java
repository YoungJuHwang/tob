package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.SpringLayout.Constraints;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import global.Command;
import global.Constants;
import global.DispatcherServlet;
import global.ParamMap;
import global.DispatcherJson;
import global.Seperator;

/**
 * Servlet implementation class JsController
 */
@WebServlet({"member/Member.do"})
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService service = MemberServiceImpl.getInstance();
	String userid,password,name,email,birth,phone,gender,portal;
	StringBuffer addr;
	int result;
	MemberVO member = new MemberVO();
	JSONObject obj = new JSONObject();
	Gson gson = new Gson();
	
	@SuppressWarnings("unchecked")
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		Command command = Seperator.init(request,response); 
		HttpSession session=request.getSession(); 
		
		switch (command.getPage()) {
		case "join":
			break;
		case "join_member": 
			userid = request.getParameter("userid");
			System.out.println("아이디(텍스트)"+userid);
			password = request.getParameter("password");
			System.out.println("비번(텍스트)"+password);
			name = request.getParameter("name");
			System.out.println("이름(텍스트)"+name);
			email = request.getParameter("email");
			System.out.println("이메일(텍스트)"+email);
			portal = request.getParameter("portal");
			System.out.println("포탈(셀렉)"+portal);
			birth = request.getParameter("birth");
			System.out.println("생년(텍스트)"+birth);
			phone = request.getParameter("phone");
			System.out.println("전화번호(셀렉)"+phone);
			gender = request.getParameter("gender");
			System.out.println("성별(라디오)"+gender);
			addr = ParamMap.getValuesBy(request, "addr");
			System.out.println("주소(체크박스)"+addr); 
			
			member.setUserid(userid);
			member.setPassword(password);
			member.setName(name);
			member.setEmail(email+portal);
			member.setBirth(birth);
			member.setPhone(phone);
			member.setGender(gender);
			member.setAddr(addr.toString());
			int result2 = service.join(member);
			if (result2 == 1) {
				System.out.println("회원가입 성공");
				obj.put("result", "success");
				obj.put("name", member.getName());
				DispatcherJson.sendJSONObject(response, obj);
			} else {
				System.out.println("회원가입 실패");
				obj.put("result", "fail");
				DispatcherJson.sendJSONObject(response, obj);
			}
			return;
		case "login_form":
			break;
		case "login":
			userid = request.getParameter("userid");
			password = request.getParameter("password");
			member = service.login(userid, password);
			session.setAttribute("member", member);
			obj.put("result", "success");
			obj.put("name", member.getName());
			obj.put("userid", member.getUserid());
			DispatcherJson.sendJSONObject(response, obj);
			return; // ajax 통과시 return 종료
		case "logined":
			request.setAttribute("member", member);
			command.setAction("main");
			break;
		case "logout": 
            session.invalidate();  
            RequestDispatcher d = request.getRequestDispatcher(Constants.VIEW+"global/main.jsp");
            d.forward(request, response);
            return; // RequestDispatcher 사용때문에 return 종료
		case "mypage": 
			request.setAttribute("member", member);
			break;
		case "detail":
			String json = gson.toJson(session.getAttribute("member"));
			DispatcherJson.sendGson(response, json);
			return; // ajax  
		case "remove" : 
			userid = request.getParameter("userid");
			result = service.remove(userid);
			if (result == 1) {
				obj.put("result", "success");
				DispatcherJson.sendJSONObject(response, obj);
			} else {
				obj.put("result", "fail");
				DispatcherJson.sendJSONObject(response, obj);
			}		
			return;
		case "update" : 
			String password = request.getParameter("password");
			String addr = request.getParameter("addr");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			System.out.println("변경된 비번 :"+password);
			System.out.println("변경된 주소 :"+addr);
			System.out.println("변경된 전화번호 :"+phone);
			System.out.println("변경된 이메일 :"+email);
			member.setPassword(password);
			member.setAddr(addr);
			member.setPhone(phone);
			member.setEmail(email);
			int result = service.change(member);
			if (result == 1) {
				System.out.println("변경 성공");
				session.setAttribute("member", member);
				obj.put("userid",member.getUserid());
				DispatcherJson.sendJSONObject(response, obj);
			} else {
				System.out.println("변경 실패");
			}
			return; 
		default:break;
		}
		DispatcherServlet.exam(request, response, command);
	}
}
