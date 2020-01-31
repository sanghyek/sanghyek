package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import vo.WithMeBean;

public class WithMeDao {

	DataSource ds;
	Connection con;
	private static WithMeDao withmeDAO;

	private WithMeDao() {
		// TODO Auto-generated constructor stub
	}
	

	public static WithMeDao getInstance(){
		if(withmeDAO == null){
			withmeDAO = new WithMeDao();
		}
		return withmeDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	//글의 개수 구하기.
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			System.out.println("getConnection");
			pstmt=con.prepareStatement("select count(*) from withme");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){

		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	//글 목록 보기.	
	public ArrayList<WithMeBean> selectArticleList(int page,int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from withme order by num desc limit ?,8";
		ArrayList<WithMeBean> articleList = new ArrayList<WithMeBean>();
		WithMeBean board = null;
		int startrow=(page-1)*8; //읽기 시작할 row 번호..	

		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new WithMeBean();
				board.setNum(rs.getInt("num"));
				board.setTitle(rs.getString("title"));
				board.setDate(rs.getDate("date"));
				board.setPeople(rs.getInt("people"));
				board.setLim(rs.getString("lim"));
				board.setPhoto(rs.getString("photo"));
				board.setPic1(rs.getString("pic1"));
				board.setPic2(rs.getString("pic2"));
				board.setPic3(rs.getString("pic3"));
				board.setPic4(rs.getString("pic4"));
				board.setWritedate(rs.getDate("writedate"));
				board.setLimitdate(rs.getDate("limitdate"));
				board.setWriter(rs.getString("writer"));
				board.setLocalcontent(rs.getString("localcontent"));
				board.setContents(rs.getString("contents"));
				board.setPeoplecount(rs.getInt("peoplecount"));
				articleList.add(board);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		//System.out.println(articleList.size());
		return articleList;

	}

	//글 내용 보기.
		public WithMeBean selectArticle(int num){

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			WithMeBean board = null;

			try{
				pstmt = con.prepareStatement(
						"select * from withme where num = ?");
				pstmt.setInt(1, num);
				rs= pstmt.executeQuery();

				if(rs.next()){
					board = new WithMeBean();
					board.setNum(rs.getInt("num"));
					board.setTitle(rs.getString("title"));
					board.setDate(rs.getDate("date"));
					board.setPeople(rs.getInt("people"));
					board.setLim(rs.getString("lim"));
					board.setPhoto(rs.getString("photo"));
					board.setPic1(rs.getString("pic1"));
					board.setPic2(rs.getString("pic2"));
					board.setPic3(rs.getString("pic3"));
					board.setPic4(rs.getString("pic4"));
					board.setWritedate(rs.getDate("writedate"));
					board.setLimitdate(rs.getDate("limitdate"));
					board.setWriter(rs.getString("writer"));
					board.setLocalcontent(rs.getString("localcontent"));
					board.setContents(rs.getString("contents"));
					board.setPeoplecount(rs.getInt("peoplecount"));
					//System.out.println(rs.getString("Writer"));
					//System.out.println(rs.getDate("date"));
					
				}
			}catch(Exception ex){
			}finally{
				close(rs);
				close(pstmt);
			}
           //System.out.println(board.getWriter());
			return board;

		}
	

	//글 등록.
	public int insertArticle(WithMeBean article){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			int list=selectListCount();
			System.out.println(list);
			num=list+1;
			
			System.out.println(num);

			sql="insert into withme (num,title,date,people,lim,photo,pic1,pic2,pic3,pic4,limitdate,writer,localcontent,contents,peoplecount,writedate) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,now())";//pic1,pic2,pic3,pic4,writedate,limitdate,writer,localcontent,contents) values(?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
		    pstmt.setString(2, article.getTitle());
			pstmt.setDate(3, article.getDate());
			pstmt.setInt(4, article.getPeople());
			pstmt.setString(5, article.getLim());
		    pstmt.setString(6, article.getPhoto());
			pstmt.setString(7, article.getPic1());
			pstmt.setString(8, article.getPic2());
			pstmt.setString(9, article.getPic3());
			pstmt.setString(10, article.getPic4());
			pstmt.setDate(11, article.getLimitdate());
			pstmt.setString(12, article.getWriter());
			pstmt.setString(13, article.getLocalcontent());
			pstmt.setString(14, article.getContents());
			
			System.out.println("Query="+pstmt);

			insertCount=pstmt.executeUpdate();
			
			System.out.println("insertCount="+insertCount);

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	//글 삭제.
		public int deleteArticle(int num){

			PreparedStatement pstmt = null;
			String board_delete_sql="delete from withme where num=?";
			int deleteCount=0;

			try{
				pstmt=con.prepareStatement(board_delete_sql);
				pstmt.setInt(1, num);
				deleteCount=pstmt.executeUpdate();
			}catch(Exception ex){
			}	finally{
				close(pstmt);
			}

			return deleteCount;
			
		}
		
		//신청인원 업데이트
		public int peopleCount(int num) {
			int updateCount = 0;
			PreparedStatement pstmt = null;
			String sql="update withme set peoplecount=peoplecount+1 where num=?";
			
			try{
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				System.out.println(pstmt);
				
				updateCount = pstmt.executeUpdate();
				
			}catch(Exception ex){
			}finally{
				close(pstmt);
			}

			return updateCount;

		}

		//글 수정.
		public int updateArticle(WithMeBean article){

			int updateCount = 0;
			PreparedStatement pstmt = null;
			String sql="update withme set title=?,date=?,people=?,lim=?,photo=?,pic1=?,pic2=?,pic3=?,pic4=?,limitdate=?,localcontent=?,contents=? where num=?";

			try{
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, article.getTitle());
				pstmt.setDate(2, article.getDate());
				pstmt.setInt(3, article.getPeople());
				pstmt.setString(4, article.getLim());
				pstmt.setString(5, article.getPhoto());
				pstmt.setString(6, article.getPic1());
				pstmt.setString(7, article.getPic2());
				pstmt.setString(8, article.getPic3());
				pstmt.setString(9, article.getPic4());
				pstmt.setDate(10, article.getLimitdate());
				pstmt.setString(11, article.getLocalcontent());
				pstmt.setString(12, article.getContents());
				pstmt.setInt(13, article.getNum());
				//System.out.println(pstmt);
				updateCount = pstmt.executeUpdate();
			}catch(Exception ex){
			}finally{
				close(pstmt);
			}

			return updateCount;

		}
		
		//게시글 삭제후 리스트 번호 정렬
		public int listorder(int num) {
			int count = 0;
			PreparedStatement pstmt = null;
			String sql="update withme set num=num-1 where num>?";

			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				System.out.println(pstmt);
				count=pstmt.executeUpdate();
				
			}catch(Exception e) {
				
			}finally {
				close(pstmt);
			}
			return count;
		}

	

	}


	

