package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.Map;

public class ActionSignup {
	static ActionSignup model = new ActionSignup();
	public static ActionSignup instance(){
		return model;
	}


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java �뙆�씪�쓣 李얠븘�샂

	public void signup(String id,String name,String pw){

		Dto list=new Dto();
		list.setId(id);
		list.setName(name);
		list.setPw(pw);
		
		
		System.out.println("MODEL signup(): id="+id+"Name="+name+"PW="+pw);
		
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("insert_user",list);//mapper�뿉�꽌 吏��젙�븳 id �꽔�뼱二쇨린
		System.out.println("Listvalue: "+"id="+list.id+"Name="+list.name+"PW="+list.pw);
		sqlSession.commit();
		sqlSession.close();
	}
}
