package model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.Map;

public class ActionDelete {
	static ActionDelete model = new ActionDelete();
	public static ActionDelete instance(){
		return model;
	}


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java �뙆�씪�쓣 李얠븘�샂
	
	public void Delete(String id) {
	Dto list=new Dto();
	list.setId(id);
	
	
	System.out.println("MODEL delete(): id="+id);
	
	SqlSession sqlSession = factory.openSession();
	sqlSession.delete("delete_user",list);//mapper�뿉�꽌 吏��젙�븳 id �꽔�뼱二쇨린
	System.out.println("Listvalue: "+"id="+list.id);
	sqlSession.commit();
	sqlSession.close();
	}
}
