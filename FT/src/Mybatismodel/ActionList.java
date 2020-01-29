package Mybatismodel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mybatis.Map;

public class ActionList {
	static ActionList model = new ActionList();
	public static ActionList instance(){
		return model;
	}


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java ?åå?ùº?ùÑ Ï∞æÏïÑ?ò¥

	public List<InfoandTipDto> boardlist(){
		List<InfoandTipDto> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("infoANDtip");//mapper?óê?Ñú Ïß??†ï?ïú id ?Ñ£?ñ¥Ï£ºÍ∏∞
		//System.out.println("aa"+list.size());
		sqlSession.close();
		return list;
	}
}



