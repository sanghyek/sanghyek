package Mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Map {
	private static SqlSessionFactory sqlSession;
	public static SqlSessionFactory getSqlSession(){
		return sqlSession;
	}

	static{
		try {
			String resource = "Mybatis/conn.xml"; //DBï¿½ë¿°å¯ƒê³ ë¸?ï¿½ë’— xml å¯ƒìˆì¤ˆï¿½?—¯ï¿½ì ° >>connï¿½ì“½ ï¿½ì˜„?Œ·?š­ï¿? ï¿½ë¿¬æ¹²ê³—ë¿? ï¿½ë–æ¹²ë‹¿ì¾?
			Reader reader = Resources.getResourceAsReader(resource);
			//System.out.println("?œ„?—="+reader);
			//System.out.println("sqlSession="+sqlSession);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSession = factory.build(reader);
			//System.out.println("?•„?˜="+reader);
			//System.out.print("?•„?˜sqlSession="+sqlSession);
		} catch (Exception e) {
			System.out.println("SqlMapConfig err : " + e);
		}
	}
}


