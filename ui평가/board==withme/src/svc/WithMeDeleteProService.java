package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;
import java.sql.Connection;
import dao.WithMeDao;

public class WithMeDeleteProService {
/*
	public boolean isArticleWriter(int num) throws Exception {
		// TODO Auto-generated method stub
		
		//boolean isArticleWriter = false;
		Connection con = getConnection();
		WithMeDao boardDAO = WithMeDao.getInstance();
		boardDAO.setConnection(con);
		isArticleWriter = boardDAO.isArticleBoardWriter(num);
		close(con);
		return isArticleWriter;
		
	}*/

	public void removeArticle(int num) throws Exception{
		// TODO Auto-generated method stub
		
		//boolean isRemoveSuccess = false;
		Connection con = getConnection();
		WithMeDao withmeDAO = WithMeDao.getInstance();
		withmeDAO.setConnection(con);
		int deleteCount = withmeDAO.deleteArticle(num);
		
		if(deleteCount > 0){
			commit(con);
			//isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
	}

}
