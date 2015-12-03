package event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import global.Constants;
import global.DQL;
import global.DatabaseFactory;
import global.Vendor;

public class EventDAOImpl implements EventDAO {
	 private Connection con;
	 private Statement stmt;
	 private PreparedStatement pstmt;
	 private ResultSet rs;
	 private List<EventVO> list = new ArrayList<EventVO>();
	 private EventVO event = new EventVO();
	 
	 private static EventDAO instance = new EventDAOImpl();
	 public static EventDAO getInstance(){
		 return instance;
	 }
	 private EventDAOImpl(){
		 con = DatabaseFactory
		        .getDatabase(Vendor.ORACLE, Constants.ORACLE_ID, Constants.ORACLE_PASSWORD)
		        .getConnection();
	 }
	@Override
	public List<EventVO> selectAll() {
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(DQL.searchAll("event"));
			
			while (rs.next()) {
				EventVO temp = new EventVO();
				temp.setEvtId(rs.getString("evtId"));
				temp.setEvtName(rs.getString("evtName"));
				temp.setTerm(rs.getString("term"));
				list.add(temp);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public int insert(EventVO o) {
		int result = 0;
		
		try {
			String sql = "insert into event("
					+ "evtId,evtName,term) values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, o.getEvtId());
			pstmt.setString(2, o.getEvtName());
			pstmt.setString(3, o.getTerm());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 System.out.println("DAO 결과 : "+result);
		return result;
	}
	@Override
	public int update(EventVO event) {
		int result;
		
		try {
			String sql = "update event set";
			pstmt = con.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}
	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int delete(String key) {
		int result = 0;
		
		try {
			String sql = "delete from event where evtName = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, key);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	 
}
