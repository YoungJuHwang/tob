package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import global.Command;
import global.Constants;
import global.DispatcherJson;
import global.DispatcherServlet;
import global.ParamMap;
import global.Seperator;

/**
 * Servlet implementation class JsController
 */
@WebServlet("/member.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService service = MemberServiceImpl.getInstance();
	String userid, password, name, birth, phone, email, portal, gender;
	StringBuffer addr;
	int result;
	MemberVO member = new MemberVO();
	JSONObject obj = new JSONObject();
	Gson gson = new Gson();
	@SuppressWarnings("unchecked")
	
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		Command command = Seperator.init(request, response);
		HttpSession session = request.getSession();
		switch (command.getPage()) {
		case "join":
			break;
			
		case "joinMember":
			userid = request.getParameter("userid");
			password = request.getParameter("password");
			name = request.getParameter("name");
			birth = request.getParameter("birth");
			phone = request.getParameter("phone");
			email = request.getParameter("email");
			portal = request.getParameter("portal");
			gender = request.getParameter("gender");
			addr = ParamMap.getValuesBy(request, "addr");
			
			System.out.println("MC의 가입된 아이디 : "+userid);
			System.out.println("MC의 가입된 비번 : "+password);
			System.out.println("MC의 가입된 이름: "+name);
			System.out.println("MC의 가입된 생일: "+birth);
			System.out.println("MC의 가입된 폰번호: "+phone);
			System.out.println("MC의 가입된 이메일 : "+email);
			System.out.println("MC의 가입된 성별 : "+ gender);
			System.out.println("MC의 가입된 주소 : "+addr);
			
			member.setUserid(userid);
			member.setPassword(password);
			member.setName(name);
			member.setBirth(birth);
			member.setPhone(phone);
			member.setEmail(email+portal);
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
			System.out.println("멤버컨트롤러의 login 들어옴");
			userid = request.getParameter("userid");
			password = request.getParameter("password");
			
			member = service.login(userid, password);
			System.out.println("멤버컨트롤러 로그인  ID : "+ userid);
			System.out.println("멤버컨트롤러 로그인  이름 : "+ member.getName());
			obj.put("result", "success");
			obj.put("name", member.getName());
			obj.put("userid", member.getUserid());
			
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(obj); //이 두줄을 반복해서 쓰므로 DispatcherJson만듬.
			return;
		case "logined":
			userid = request.getParameter("userid");
			member = service.searchById(userid); //위 두줄은 로그인 하는순간 인스턴스로 공유됨.
			request.setAttribute("member", member);
			System.out.println("로그인된 아이디 : "+ userid);
			System.out.println("page : " + command.getPage());
			//logined.jsp 가 없기때문에 command의 view를 강제로 잡아준다.
			command.setAction("main");
			command.setPage("auth");
			break;
		case "logout":
			
			session.invalidate(); //session을 지우는 메소드.
			RequestDispatcher rd = request.getRequestDispatcher(Constants.VIEW+"global/main.jsp");
			rd.forward(request, response);
			return;
			// 커멘드 패턴 쓰지 않고 하드코딩을 때리는 것.
		case "mypage":
			userid = request.getParameter("userid");
			System.out.println("mypage에서 로그인된 아이디 : " + userid);
			member = service.searchById(userid);
			request.setAttribute("member", member);
			break;
		case "detail":
			System.out.println("멤버컨트롤러의 detail 들어옴");
			member = service.searchById(request.getParameter("userid"));
			System.out.println("detail의 멤버 birth : " + member.getBirth());
			System.out.println("detail의 멤버 phone : " + member.getPhone());
			System.out.println("detail의 멤버 email : " + member.getEmail());
			System.out.println("detail의 멤버 addr : " + member.getAddr());
			System.out.println("detail의 멤버 gender : " + member.getGender());
			String json = gson.toJson(member);
			System.out.println("detail의 json결과값 : " +json);
			//obj.put("result", "success");
			//obj.put("name", member.getName());
			//obj.put("userid", member.getUserid());
			
			/*response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(json);
			=> */DispatcherJson.sendGson(response, json);
			return; //AJAX
		case "remove":
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
		case "update":
			String password2 = request.getParameter("password");
			String upaddr = request.getParameter("addr");
			String upphone = request.getParameter("phone");
			String upemail = request.getParameter("email");
			System.out.println("MC의 업뎃 비번 : "+password2);
			System.out.println("MC의 업뎃 주소 : "+upaddr);
			System.out.println("MC의 업뎃 이메일: "+upemail);
			System.out.println("MC의 업뎃 폰 : "+upphone);
			
			member.setPassword(password2);
			member.setAddr(upaddr);
			member.setEmail(upemail);
			member.setPhone(upphone);

			if (service.change(member) == 1) {
				System.out.println("변경 성공");
				String changedMember = gson.toJson(member);
				DispatcherJson.sendGson(response, changedMember);
			} else {
				System.out.println("변경 실패");
			}
			
			return;
		default:
			break;
			//★★ AJAX인 부분은 DispatcherServlet이 없어야되서 return으로 처리 가능.
			//아닌 부분은 있어야 한다. => AJAX 통과할 경우는 return, 아니면 break 처리 후 맨 밑에 dispather놔두면 됨.
		}
		DispatcherServlet.exam(request, response, command);
	}

	
}
