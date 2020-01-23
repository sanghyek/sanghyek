package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.Map;

public class Action1 {
	static Action1 model = new Action1();
	public static Action1 instance(){
		return model;
	}


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java 파일을 찾아옴

	public List<Dto> userlist(){
		List<Dto> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("all_user");//mapper에서 지정한 id 넣어주기
		System.out.println("aa"+list.size());
		sqlSession.close();
		return list;
	}
}



