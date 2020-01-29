package svc;

import java.sql.Connection;

import dao.WithMeDao;
import vo.WithMeBean;

import static db.JdbcUtil.*;

public class WithMeDetailService {

	public WithMeBean getArticle(int num) throws Exception{
		// TODO Auto-generated method stub
		
		WithMeBean article = null;
		Connection con = getConnection();
		WithMeDao withmeDAO = WithMeDao.getInstance();
		withmeDAO.setConnection(con);
	/*	int updateCount = boardDAO.updateReadCount(board_num);
		
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}*/
		
		article = withmeDAO.selectArticle(num);
		close(con);
		return article;
		
	}

}
