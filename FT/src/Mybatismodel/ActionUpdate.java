package Mybatismodel;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mybatis.Map;

public class ActionUpdate {
	static ActionUpdate model = new ActionUpdate();
	public static ActionUpdate instance(){
		return model;
	}


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java �뙆�씪�쓣 李얠븘�?��
	
	public void Update(int num,String title,String contents) {
	InfoandTipDto list=new InfoandTipDto();
	list.setNum(num);
	list.setTitle(title);
	list.setContents(contents);
	
	System.out.println("MODEL update(): num="+num+"title="+title+"contents="+contents);
	
	SqlSession sqlSession = factory.openSession();
	sqlSession.update("updateDB",list);//mapper�뿉�꽌 吏��젙�븳 id �꽔�뼱二쇨�?
	System.out.println("Listvalue: "+"title="+list.title+"pw="+list.contents);
	sqlSession.commit();
	sqlSession.close();
	}
}
