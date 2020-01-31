package Mybatismodel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mybatis.Map;

public class ActionListorder {
	static ActionListorder model = new ActionListorder();
	public static ActionListorder instance(){
		return model;
	}
	
	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java ?ŒŒ?¼?„ ì°¾ì•„?˜´

	public void listorder(int num){
		InfoandTipDto list=new InfoandTipDto();
		list.setNum(num);		
		
		//System.out.println("MODEL listorder(): num="+num);
		
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete("listorder",list);//mapperï¿½ë¿‰ï¿½ê½Œ ï§ï¿½ï¿½ì ™ï¿½ë¸³ id ï¿½ê½”ï¿½ë¼±äºŒì‡¨ë¦?
		System.out.println("Listvalue: "+"num="+list.num);
		sqlSession.commit();
		sqlSession.close();
	}
	
}
