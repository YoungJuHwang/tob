package purchase;

import java.util.List;

public class PurchaseServiceImpl implements PurchaseService{
	private static PurchaseService instance = new PurchaseServiceImpl();
	public static PurchaseService getInstance(){
		return instance;
	}
	PurchaseDAO dao = PurchaseDAOImpl.getInstance();
	
	
	@Override
	public int regist(PurchaseVO o) {
		return dao.insert(o);
	}

	@Override
	public PurchaseVO searchBypurNum(String purNum) {
		
		return dao.selectBypurNum(purNum);
	}

	@Override
	public List<PurchaseVO> searchByAccNum(String accountNum) {
		return dao.selectByAccNum(accountNum);
	}

	@Override
	public List<PurchaseVO> getList() {
		return dao.selectAll();
	}

	@Override
	public int change(PurchaseVO o) {
		return dao.update(o);
	}

	@Override
	public int remove(String purNum) {
		return dao.delete(purNum);
	}
	
}
