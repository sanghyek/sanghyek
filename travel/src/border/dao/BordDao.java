package border.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import border.bean.BordDto;

public class BordDao {
	Connection conn=null; 
	Statement stmt=null;

	BordDao(){
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){
		
	}
}
	public void Driver() {
	try{
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dataex","root","123456789a");
	}catch(Exception e){
		
	}
}
	
	public void close() {
		try{
			
			stmt.close();
			
		}catch(Exception e) {
			
		}try{
			
			conn.close();
			
		}catch(Exception e) {
			
		}
			
	}
	public ArrayList<BordDto> List() {
		
		ArrayList<BordDto> borderlist=new ArrayList<BordDto>(); 
		try{
			Driver();
		stmt=conn.createStatement();
		String command = "select * from border;";
		ResultSet rs=stmt.executeQuery(command);
		while(rs.next()) {
			
			BordDto dto=new BordDto();
			dto.setNumber(rs.getInt("num"));
			dto.setCategory(rs.getString("category"));
			dto.setTitle(rs.getString("title"));
			dto.setWritter(rs.getString("writter"));
			dto.setDate(rs.getTimestamp("date"));
			dto.setHits(rs.getInt("hits"));
			
			borderlist.add(dto);
		}
		}catch (Exception igException) {
			
		}
		return borderlist;
	}
}




