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
	
	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java ?��?��?�� 찾아?��

	public void listorder(int num){
		InfoandTipDto list=new InfoandTipDto();
		list.setNum(num);		
		
		//System.out.println("MODEL listorder(): num="+num);
		
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete("listorder",list);//mapper�뿉�꽌 吏��젙�븳 id �꽔�뼱二쇨�?
		System.out.println("Listvalue: "+"num="+list.num);
		sqlSession.commit();
		sqlSession.close();
	}
	
}
