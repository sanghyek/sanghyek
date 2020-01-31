package Mybatismodel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mybatis.Map;

public class ActionInsert {
	static ActionInsert model = new ActionInsert();
	public static ActionInsert instance(){
		return model;
	}


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java �뙆�씪�쓣 李얠븘�?��

	public void boardInsert(int num,String category,String title,String writer,String contents){

		InfoandTipDto list=new InfoandTipDto();
		list.setNum(num);
		list.setCategory(category);
		list.setTitle(title);
		list.setWriter(writer);
		list.setContents(contents);
		
		
		//System.out.println("MODEL Insert(): num="+num+"category="+category+"title="+title+"writer="+writer+"contents="+contents);
		
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("insertDB",list);//mapper�뿉�꽌 吏��젙�븳 id �꽔�뼱二쇨�?
		System.out.println("Listvalue: "+"num="+list.num+"category="+list.category+"title="+list.title+"writer="+list.writer+"contents="+list.contents);
		sqlSession.commit();
		sqlSession.close();
	}
}
