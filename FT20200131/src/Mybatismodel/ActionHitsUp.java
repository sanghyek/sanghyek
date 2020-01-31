package Mybatismodel;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mybatis.Map;

public class ActionHitsUp {
	static ActionHitsUp model = new ActionHitsUp();
	public static ActionHitsUp instance(){
		return model;
	}
private SqlSessionFactory factory = Map.getSqlSession(); //Map.java �뙆�씪�쓣 李얠븘�?��
	
	public void HitsUp(int num,int hits) {
	InfoandTipDto list=new InfoandTipDto();
	list.setNum(num);
	list.setHits(hits);	
	
	//System.out.println("MODEL HitsUp(): num="+num+",hits="+hits);	
	SqlSession sqlSession = factory.openSession();
	sqlSession.delete("hitsupdate",list);//mapper�뿉�꽌 吏��젙�븳 id �꽔�뼱二쇨�?
	//System.out.println("Listvalue: "+"num="+list.num+",hits="+list.hits);
	sqlSession.commit();
	sqlSession.close();
	}
}
