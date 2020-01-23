package model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.Map;

public class ActionUpdate {
	static ActionUpdate model = new ActionUpdate();
	public static ActionUpdate instance(){
		return model;
	}


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java �뙆�씪�쓣 李얠븘�샂
	
	public void Update(String id,String pw) {
	Dto list=new Dto();
	list.setId(id);
	list.setPw(pw);
	
	
	System.out.println("MODEL update(): id="+id+"pw="+pw);
	
	SqlSession sqlSession = factory.openSession();
	sqlSession.update("update_user",list);//mapper�뿉�꽌 吏��젙�븳 id �꽔�뼱二쇨린
	System.out.println("Listvalue: "+"id="+list.id+"pw="+list.pw);
	sqlSession.commit();
	sqlSession.close();
	}
}
