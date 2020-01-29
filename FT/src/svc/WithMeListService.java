package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.WithMeDao;
import vo.WithMeBean;

public class WithMeListService {

/*	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		WithMeDao boardDAO = WithMeDao.getInstance();
		boardDAO.setConnection(con);
		//listCount = boardDAO.selectListCount();
		close(con);
		return listCount;
		
	}*/

	public ArrayList<WithMeBean> getArticleList() throws Exception{
		
		ArrayList<WithMeBean> articleList = null;
		Connection con = getConnection();
		WithMeDao withmeDAO = WithMeDao.getInstance();
		withmeDAO.setConnection(con);
		articleList = withmeDAO.selectArticleList();
		close(con);
		return articleList;
		
	}

}
