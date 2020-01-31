package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.WithMeDao;

public class WithmeListorderService {

	public void listorder(int num) {//�Խñ� ������ ����� �۹�ȣ �޲ٱ����� ������ ��ȣ���� ū��ȣ�� �Խñ��� -1�� ���������ѵ���
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
