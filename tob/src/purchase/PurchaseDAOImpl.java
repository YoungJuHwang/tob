package purchase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import global.Constants;
import global.DatabaseFactory;
import global.Vendor;
import oracle.net.aso.p;


public class PurchaseDAOImpl implements PurchaseDAO{

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private PurchaseVO purchase = new PurchaseVO();

	private static PurchaseDAO instance = new PurchaseDAOImpl();
	public static PurchaseDAO getInstance(){
		return instance;
	};
	
	public PurchaseDAOImpl() {
		con = DatabaseFactory.getDatabase(Vendor.ORACLE, Constants.ORACLE_ID, Constants.ORACLE_PASSWORD)
				.getConnection();
	}
	
	@Override
	public int insert(PurchaseVO o) {
		int result = 0;
		try {
			String sql ="INSERT INTO PURCHASE(pur_num,sum,account_num,userid)"
					+ " VALUES(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, o.getPurNum());
			pstmt.setString(2, o.getSum());
			pstmt.setString(3, o.getAccountNum());
			pstmt.setString(4, o.getUserid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("주문결제 완료 PurchaseDAO : " + result);
		return result;
	}

	@Override
	public int delete(String purNum) {
		int result = 0;
		try {
			String sql = "DETETE FROM PURCHASE WHERE PUR_NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, purNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("pur_num 삭제 성공 : " +result);
		return result;
	}

	@Override
	public PurchaseVO selectBypurNum(String purNum) {
		PurchaseVO temp = new PurchaseVO();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT * FROM PURCHASE WHERE PUR_NUM = '"+purNum+"'");
			
			while (rs.next()) {
				
				temp.setPurNum(rs.getString("pur_num"));
				temp.setSum(rs.getString("sum"));
				temp.setAccountNum(rs.getString("account_num"));
				temp.setUserid(rs.getString("userid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("purNum으로 검색(입력받은 purNum) : "+temp.getPurNum());
		return temp;
	}

	@Override
	public List<PurchaseVO> selectByAccNum(String accountNum) {
		List<PurchaseVO> list = new ArrayList<PurchaseVO>();
		try {
			String sql = "SELECT * FROM PURCHASE WHERE ACCOUNT_NUM = '"+accountNum+"'";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				PurchaseVO temp = new PurchaseVO();
				temp.setPurNum(rs.getString("pur_num"));
				temp.setSum(rs.getString("sum"));
				temp.setAccountNum(rs.getString("account_num"));
				temp.setUserid(rs.getString("userid"));
				list.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<PurchaseVO> selectAll() {
		List<PurchaseVO> list = new ArrayList<PurchaseVO>();
		String sql = "SELECT * FROM PURCHASE";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				PurchaseVO temp = new PurchaseVO();
				temp.setPurNum(rs.getString("pur_num"));
				temp.setSum(rs.getString("sum"));
				temp.setAccountNum(rs.getString("account_num"));
				temp.setUserid(rs.getString("userid"));
				list.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int update(PurchaseVO o) {
		int result = 0;
		
		String sql = "UPDATE PURCHASE SET SUM = ?, ACCOUNT_NUM = ?, USERID = ? WHERE PUR_NUM = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, o.getSum());
			pstmt.setString(2, o.getAccountNum());
			pstmt.setString(3, o.getUserid());
			pstmt.setString(4, o.getPurNum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Purchase 변경 완료" +result);
		return result;
	}
	
}
