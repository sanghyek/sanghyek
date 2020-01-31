package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.WithMeDao;

public class WithmeListorderService {

	public void listorder(int num) {//게시글 삭제후 사라진 글번호 메꾸기위에 삭제글 번호보다 큰번호의 게시글을 -1씩 내리기위한동작
		Connection con = getConnection();
		WithMeDao withmeDAO = WithMeDao.getInstance();
		withmeDAO.setConnection(con);
		int count=withmeDAO.listorder(num);
		
		if(count > 0){
			commit(con);
			//isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
	}
}
