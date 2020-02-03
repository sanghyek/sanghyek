package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import vo.HugiDto;

public class HugiDao {
	private static final int ArrayList = 0;
	private static final int BoardDto = 0;
	Connection conn=null; 
	Statement stmt=null;

	public HugiDao(){
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
	
	
	public ArrayList<HugiDto> List() {//�Խ��� ������� ���
		ArrayList<HugiDto> boarderlist=new ArrayList<HugiDto>(); 
		try{
			conn=Drive();
		stmt=conn.createStatement();//�ԽǱ� ��ü������� order by number desc �Խù���ȣ�� ������������ ����
		String command = "select * from hugi order by number desc;";
		ResultSet rs=stmt.executeQuery(command);
		while(rs.next()) {
			
			HugiDto dto=new HugiDto();
			dto.setNumber(rs.getInt("number"));
			dto.setCategory(rs.getString("category"));
			dto.setTitle(rs.getString("title"));
			dto.setWriter(rs.getString("writer"));
			dto.setDate(rs.getDate("date"));
			dto.setHits(rs.getInt("hits"));
			
			boarderlist.add(dto);
		}
		stmt.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		close();
		return boarderlist;
	}
	
	public ArrayList<HugiDto> List(String opt,String sel) {//�˻����ǰ� �˻������� �޾� ����Ʈ ���
		ArrayList<HugiDto> boarderlist=new ArrayList<HugiDto>();
		
		try{
			conn=Drive();
		if(opt.equals("none")) {
			stmt=conn.createStatement();//��ü �����Ϳ���(����,�۾���,����) DB�˻�
			String command = "select * from hugi where title like '%"+sel+"%' or writer like "+"'%"+sel+"%' or contents like "+"'%"+sel+"%' order by number desc;";
			//System.out.print(command);
			ResultSet rs=stmt.executeQuery(command);
			while(rs.next()) {
				
				HugiDto dto=new HugiDto();
				dto.setNumber(rs.getInt("number"));
				dto.setCategory(rs.getString("category"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setDate(rs.getDate("date"));
				dto.setHits(rs.getInt("hits"));
				
				boarderlist.add(dto);
			}
			}
		else if(opt.equals("title_contents")) {
			stmt=conn.createStatement();//����+�������� DB�˻�
			String command = "select * from hugi where title like '%"+sel+"%' or contents like '%"+sel+"%' order by number desc;";
			//System.out.print(command);
			ResultSet rs=stmt.executeQuery(command);
			while(rs.next()) {
				
				HugiDto dto=new HugiDto();
				dto.setNumber(rs.getInt("number"));
				dto.setCategory(rs.getString("category"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setDate(rs.getDate("date"));
				dto.setHits(rs.getInt("hits"));
				
				boarderlist.add(dto);
			}
			}
		else{
			stmt=conn.createStatement();//select�ɼǰ� �˻������ DB�˻� ���
			String command = "select * from hugi where "+opt+" like '%"+sel+"%' order by number desc;";
			//System.out.print(command);
			ResultSet rs=stmt.executeQuery(command);
			
			while(rs.next()) {
			
			HugiDto dto=new HugiDto();
			dto.setNumber(rs.getInt("number"));
			dto.setCategory(rs.getString("category"));
			dto.setTitle(rs.getString("title"));
			dto.setWriter(rs.getString("writer"));
			dto.setDate(rs.getDate("date"));
			dto.setHits(rs.getInt("hits"));
			
			boarderlist.add(dto);
		}
		}
		stmt.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		close();
		return boarderlist;
	}
	
	public int hits(String hits) {//�������� Ŭ���� ��ȸ�����޾� +1�� ���ؼ� ��ȯ
		int num=Integer.parseInt(hits)+1;
		return num;
	}
	
	public void hitsUpdate(String hits,String number) {//��ȸ�� ������Ʈ�ϱ����� ���� ��ȸ���� �Խñ۹�ȣ�� �޾ƿͼ� �Խñ۹�ȣ���ǿ��ش��ϴ� hits�� ������Ʈ�Ѵ�
		int num=hits(hits);//��ȸ���� ������Ʈ �ϱ����� hits�� �Ű������� �޾ƿ��ش�
		int NO=Integer.parseInt(number);
		try {
			conn=Drive();
			stmt = conn.createStatement();
			String command = "update hugi set hits="+num+" where number="+NO+";";
			//System.out.print(command);
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
			throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�."); 
			
			stmt.close();
	} catch (Exception e) {
		System.out.println(e);
	}
		
	close();
	}
	
	
	
	public  ArrayList<HugiDto> BoardContentsView(String number) {//�������� �Խñ۹�ȣ�� �޾Ƽ� ����Ʈ�� ���
		ArrayList<HugiDto> boarderView = new ArrayList<HugiDto>();
		int num;
		num=Integer.parseInt(number);
		try {
			conn=Drive();
		stmt = conn.createStatement();
			String command = "select * from hugi where number="+num+";";
			ResultSet rs = stmt.executeQuery(command);	
			
			while(rs.next()){
				HugiDto dto = new HugiDto();
				dto.setNumber(rs.getInt("number"));
				dto.setCategory(rs.getString("category"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setDate(rs.getDate("date"));
				dto.setHits(rs.getInt("hits"));
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
	
		
	public void BoardWrite(String category,String title,String writer,String contents){//DB�� �Խñ� �Է�
			String date="now()";//�ۼ����� DB���� ����ð����� ó���ϱ����� now()��ɾ ��Ʈ�������� �־��ش�
		    int hits=0;
		try {
			conn=Drive();
			stmt = conn.createStatement();
			String command = "insert into hugi (category,title,writer,date,hits,contents) values('"+category+"','"+title+"','"+writer+"',"+date+","+hits+",'"+contents+"');";
			System.out.println(command);
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
			throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�."); 
			
			stmt.close();
	} catch (Exception e) {
		System.out.println(e);
	}
		
	close();
}
	
	public void Boardupdate(String number,String category,String title,String contents) {//�Խñ� ������ DB ������Ʈ
		int num=Integer.parseInt(number);
		try {
			conn=Drive();
			stmt = conn.createStatement();
			String command = "update hugi set category='"+category+"',"+"title='"+title+"',"+"contents='"+contents+"'"+"where number="+num+";";
			System.out.println(command);
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
			throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�."); 
			
			stmt.close();
	} catch (Exception e) {
		System.out.println(e);
	}
		
	close();
	}
	

	
	public void BoardDelete(String number) {//�Խñ� ����
		int num=Integer.parseInt(number);
		try {
			conn=Drive();
			stmt = conn.createStatement();
			String command = "delete from hugi where number="+num+";";
			
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
			throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�."); 
			
			stmt.close();
	} catch (Exception e) {
		System.out.println(e);
	}
		
	close();
	}

}




