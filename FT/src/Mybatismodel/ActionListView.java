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


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java ??Ό? μ°Ύμ?΄

	public List<InfoandTipDto> boardlist(int num){
		List<InfoandTipDto> list = null;
		InfoandTipDto li=new InfoandTipDto();
		li.setNum(num);
		
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("infoANDtipView",li);//mapper?? μ§?? ? id ?£?΄μ£ΌκΈ°
		System.out.println("aa"+list.size());
		sqlSession.close();
		return list;
	}
}
