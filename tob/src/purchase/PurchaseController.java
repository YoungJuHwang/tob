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
import jdk.nashorn.api.scripting.JSObject;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/order/Order.do")
public class PurchaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PurchaseService purchaseservice = PurchaseServiceImpl.getInstance();
	String purNum,accountNum,userid;
	int sum;
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
		case "Order":
			break;
		case "pur_list":
			System.out.println("전체 주문번호 목록 진입");
			List list = new ArrayList();
			list = purchaseservice.getList();
			JsonElement element = gson.toJsonTree(list, new TypeToken<List>() {}.getType());
			JsonArray purList = element.getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(purList);
			
			return;
		case "acc_list":
			System.out.println("주문번호에 따른 목록 진입");
			List list2 = new ArrayList();
			list2 = purchaseservice.searchByAccNum("accountNum");
			JsonElement element2 = gson.toJsonTree(list2, new TypeToken<List>() {}.getType());
			JsonArray accList2 = element2.getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(accList2);
			
			return;
		case "user_list":
			System.out.println("아이디에 따른 목록 진입");
			List list3 = new ArrayList();
			
			return;
		default:
			break;
		}
		DispatcherServlet.exam(request, response, command);
	}

}
