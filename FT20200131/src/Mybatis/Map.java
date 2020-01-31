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
			String resource = "Mybatis/conn.xml"; //DB�뿰寃고�?�뒗 xml 寃쎈줈�?���젰 >>conn�쓽 �옄?��?���? �뿬湲곗�? �떞湲닿�?
			Reader reader = Resources.getResourceAsReader(resource);
			//System.out.println("?��?��="+reader);
			//System.out.println("sqlSession="+sqlSession);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSession = factory.build(reader);
			//System.out.println("?��?��="+reader);
			//System.out.print("?��?��sqlSession="+sqlSession);
		} catch (Exception e) {
			System.out.println("SqlMapConfig err : " + e);
		}
	}
}


