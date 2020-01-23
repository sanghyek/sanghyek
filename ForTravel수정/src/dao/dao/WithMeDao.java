package dao.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import dto.bean.WithMeDto;

public class WithMeDao {
	Connection conn=null; 
	Statement stmt=null;

	public WithMeDao(){
	try{//�����ڷ� ����̹� ȣ��
		Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){
	}
}
	
	public Connection Drive(){
	try{//DB����
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dataex?useSSL=false&useUnicode=true&characterEncoding=utf8","root","123456789a");
	}catch(Exception e){
		
	}
	return conn;
}
	
	public void close() {//DB�ݴ� �Լ�
		try{
		
			
			stmt.close();
			
		}catch(Exception e) {
			
		}try{
			
			conn.close();
			
		}catch(Exception e) {
			
		}
			
	}
	
	public ArrayList<WithMeDto> List() {//�Խ��� ������� ���
		ArrayList<WithMeDto> boarderlist=new ArrayList<WithMeDto>(); 
		try{
			conn=Drive();
		stmt=conn.createStatement();//�ԽǱ� ��ü������� order by num desc �Խù���ȣ�� ������������ ����
		String command = "select * from withme order by num desc;";
		ResultSet rs=stmt.executeQuery(command);
		while(rs.next()) {
			
			WithMeDto dto=new WithMeDto();
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setDate(rs.getDate("date"));
			dto.setPeople(rs.getInt("people"));
			dto.setLimit(rs.getString("limit"));
			dto.setPhoto(rs.getString("photo"));
			dto.setWritedate(rs.getDate("writedate"));
			dto.setLimitdate(rs.getDate("limitdate"));
			dto.setWriter(rs.getString("writer"));
			dto.setLocalcontent(rs.getString("localcontent"));
			dto.setContents(rs.getString("contents"));
			
			
			boarderlist.add(dto);
		}
		stmt.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		close();
		return boarderlist;
	}
	
	
	public void WitheMeWrite(String title,String date,String people,String limit,String photo,String pic1,String pic2,String pic3,String pic4,String limitdate,String writer,String localcontent,String contents){//DB�� �Խñ� �Է�
		String s="now()";//�ۼ����� DB���� ����ð����� ó���ϱ����� now()��ɾ ��Ʈ�������� �־��ش�
		int pe=Integer.parseInt(people);
		ArrayList<WithMeDto> list=List();
		int num=list.size()+1;
		
	    //int hits=0;
	try {
		conn=Drive();
		stmt = conn.createStatement();
		String command = "insert into withme values("+num+",'"+title+"',"+date+","+pe+",'"+limit+"','"+photo+"','"+pic1+"','"+pic2+"','"+pic3+"','"+pic4+"',"+s+","+limitdate+",'"+writer+"','"+localcontent+"','"+contents+"');";
		System.out.print(command);
		int rowNum = stmt.executeUpdate(command);
		if(rowNum<1)
		throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�."); 
		
		stmt.close();
} catch (Exception e) {
	System.out.println(e);
}
	
close();
}
	
	
	public  ArrayList<WithMeDto> WithMeView(String num) {//�������� �Խñ۹�ȣ�� �޾Ƽ� ����Ʈ�� ���
		ArrayList<WithMeDto> boarderView = new ArrayList<WithMeDto>();
		int n=Integer.parseInt(num);
		try {
			conn=Drive();
		stmt = conn.createStatement();
			String command = "select * from withme where num="+n+";";
			ResultSet rs = stmt.executeQuery(command);	
			
			while(rs.next()){

				WithMeDto dto=new WithMeDto();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setDate(rs.getDate("date"));
				dto.setPeople(rs.getInt("people"));
				dto.setLimit(rs.getString("limit"));
				dto.setPhoto(rs.getString("photo"));
				dto.setWritedate(rs.getDate("writedate"));
				dto.setLimitdate(rs.getDate("limitdate"));
				dto.setWriter(rs.getString("writer"));
				dto.setLocalcontent(rs.getString("localcontent"));
				dto.setContents(rs.getString("contents"));
				
				boarderView.add(dto);
			}

			
			stmt.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		close();
return boarderView;
	}

}
