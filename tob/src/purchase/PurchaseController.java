package purchase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import global.Command;
import global.DispatcherServlet;
import global.Seperator;


/**
 * Servlet implementation class OrderController
 */
@WebServlet("/purchase/Purchase.do")
public class PurchaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PurchaseService service = PurchaseServiceImpl.getInstance();
	String purNum,sum,accountNum,userid;
	int result;
	PurchaseVO purchase = new PurchaseVO();
	JSONObject obj = new JSONObject();
	Gson gson = new Gson();
	
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String path = request.getServletPath();
		System.out.println("패스 : " +path);
		Command command = Seperator.init(request, response);
		System.out.println("오더컨트롤러 page : "+command.getPage());
		HttpSession session = request.getSession();
		
		switch (command.getPage()) {
		case "Purchase":
			break;
		case "cart":
			System.out.println("장바구니 서비스 진입");
			List list = new ArrayList();
			
			
			JsonElement element = gson.toJsonTree(list, new TypeToken<List>(){}.getType());
			JsonArray cartList = element.getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(cartList);
			System.out.println(cartList);
			
			return;
		case "regist":
			System.out.println("주문등록 서비스 진입");
			
			return;
			
		case "list":
			System.out.println("주문목록 서비스 진입");
			List list2 = new ArrayList();
			list2 = service.getList();
			JsonElement element2 = gson.toJsonTree(list2, new TypeToken<List>(){}.getType());
			JsonArray purList = element2.getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(purList);
			System.out.println(purList);
			return;
		case "change":
			System.out.println("change 진입");
			purNum = request.getParameter("purNum");
			sum = request.getParameter("sum");
			accountNum = request.getParameter("accountNum");
			userid = request.getParameter("userid");
			System.out.println("purNum : " + purNum);
			System.out.println("sum : " + sum);
			System.out.println("accountNum : " + accountNum);
			System.out.println("userid : " + userid);
			purchase = service.searchBypurNum(purNum);
			purchase.setPurNum(purNum);
			purchase.setSum(sum);
			purchase.setAccountNum(accountNum);
			purchase.setUserid(userid);
			result = service.change(purchase);
			obj.put("result", purNum+"에 대한 정보 수정 완료");
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(obj);
			obj.clear();
		
			return;
		case "delete":
			purNum = request.getParameter("purNum");
			System.out.println("delete에 넘어온 purNum : " + purNum);
			service.remove(purNum);
			System.out.println("삭제 완료.");
			obj.put("result", purNum + "에 대한 삭제를 완료.");
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(obj);
			obj.clear();
			return;
		default:
			break;
		}
		DispatcherServlet.exam(request, response, command);
	}

}
