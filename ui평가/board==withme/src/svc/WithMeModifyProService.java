package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.WithMeDao;
import vo.WithMeBean;

public class WithMeModifyProService {

	public boolean modifyArticle(WithMeBean article) throws Exception {
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		WithMeDao withmedao = WithMeDao.getInstance();
		withmedao.setConnection(con);
		int updateCount = withmedao.updateArticle(article);
		
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
