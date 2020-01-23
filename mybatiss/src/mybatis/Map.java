package mybatis;

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
			String resource = "mybatis/conn.xml"; //DB�뿰寃고븯�뒗 xml 寃쎈줈�엯�젰 >>conn�쓽 �옄猷뚭� �뿬湲곗뿉 �떞湲닿쾬
			Reader reader = Resources.getResourceAsReader(resource);
			//System.out.println("위에="+reader);
			//System.out.println("sqlSession="+sqlSession);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSession = factory.build(reader);
			//System.out.println("아래="+reader);
			//System.out.print("아래sqlSession="+sqlSession);
		} catch (Exception e) {
			System.out.println("SqlMapConfig err : " + e);
		}
	}
}


