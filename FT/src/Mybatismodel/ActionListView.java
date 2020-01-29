package Mybatismodel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mybatis.Map;

public class ActionListView {
	static ActionListView model = new ActionListView();
	public static ActionListView instance(){
		return model;
	}


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java ?åå?ùº?ùÑ Ï∞æÏïÑ?ò¥

	public List<InfoandTipDto> boardlist(int num){
		List<InfoandTipDto> list = null;
		InfoandTipDto li=new InfoandTipDto();
		li.setNum(num);
		
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("infoANDtipView",li);//mapper?óê?Ñú Ïß??†ï?ïú id ?Ñ£?ñ¥Ï£ºÍ∏∞
		System.out.println("aa"+list.size());
		sqlSession.close();
		return list;
	}
}
