package global;

import com.google.gson.Gson;

import member.MemberService;
import member.MemberServiceImpl;
import member.MemberVO;

public class GsonTest {
	public static void main(String[] args) {
		MemberService service = MemberServiceImpl.getInstance();
		MemberVO member = new MemberVO();
		member = service.searchById("aaa");
		Gson gson = new Gson();
		System.out.println(gson.toJson(member));
	}
}
