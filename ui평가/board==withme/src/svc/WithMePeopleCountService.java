package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.WithMeDao;

public class WithMePeopleCountService {
	
	public boolean peoplecount(int num){
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		WithMeDao withmedao = WithMeDao.getInstance();
		withmedao.setConnection(con);
		int updateCount = withmedao.peopleCount(num);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
