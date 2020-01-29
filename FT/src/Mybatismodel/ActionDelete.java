package Mybatismodel;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mybatis.Map;

public class ActionDelete {
	static ActionDelete model = new ActionDelete();
	public static ActionDelete instance(){
		return model;
	}


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java �뙆�씪�쓣 李얠븘�?��
	
	public void Delete(int num) {
	InfoandTipDto list=new InfoandTipDto();
	list.setNum(num);
	
	
	System.out.println("MODEL delete(): num="+num);
	
	SqlSession sqlSession = factory.openSession();
	sqlSession.delete("deleteDB",list);//mapper�뿉�꽌 吏��젙�븳 id �꽔�뼱二쇨�?
	System.out.println("Listvalue: "+"num="+list.num);
	sqlSession.commit();
	sqlSession.close();
	}
}
