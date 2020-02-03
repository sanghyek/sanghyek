package svc;

import java.sql.Connection;

import dao.WithMeDao;
import vo.WithMeBean;

import static db.JdbcUtil.*;
public class WithMeWriteProService {

	public boolean registArticle(WithMeBean withmeBean) throws Exception{
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		WithMeDao withmeDAO = WithMeDao.getInstance();
		withmeDAO.setConnection(con);
		int insertCount = withmeDAO.insertArticle(withmeBean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
