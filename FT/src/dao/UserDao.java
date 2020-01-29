package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import vo.BoardDto;
import vo.UserDto;

public class UserDao {
	Connection conn=null; 
	Statement stmt=null;

	public UserDao(){
	try{//생성자로 드라이버 호출
		Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){
	}
}
	
	public Connection Drive(){
	try{//DB연결
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dataex?useSSL=false&useUnicode=true&characterEncoding=utf8","root","123456789a");
	}catch(Exception e){
		
	}
	return conn;
}
	
	public void close() {//DB닫는 함수
		try{
		
			
			stmt.close();
			
		}catch(Exception e) {
			
		}try{
			
			conn.close();
			
		}catch(Exception e) {
			
		}
			
	}
	
	public void Signup(String name,String id,String password,String email,String phone,String birth,String postcode,String addr1,String addr2){//DB에 회원가입정보 입력
	try {
		conn=Drive();
		stmt = conn.createStatement();
		String command = "insert into userinfo values('"+name+"','"+id+"','"+password+"','"+email+"','"+phone+"','"+birth+"','"+postcode+"','"+addr1+"','"+addr2+"');";
		//System.out.print(command);
		int rowNum = stmt.executeUpdate(command);
		if(rowNum<1)
		throw new Exception("데이터를 DB에 입력할 수 없습니다."); 
		
		stmt.close();
} catch (Exception e) {
	System.out.println(e);
}
	
close();
}

public void Userupdate(String id,String password,String email,String phone,String postcode,String addr1,String addr2) {//회원정보 수정
	try {
		conn=Drive();
		stmt = conn.createStatement();
		String command = "update userinfo set password='"+password+"',"+"email='"+phone+"',"+"postcode='"+postcode+"',"+"addr1='"+addr1+"',"+"addr2='"+addr2+"'"+"where id="+id+";";
		//System.out.print(command);
		int rowNum = stmt.executeUpdate(command);
		if(rowNum<1)
		throw new Exception("데이터를 DB에 입력할 수 없습니다."); 
		
		stmt.close();
} catch (Exception e) {
	System.out.println(e);
}
	
close();
}
public void UserDelete(String id) {//회원탈퇴
	try {
		conn=Drive();
		stmt = conn.createStatement();
		String command = "delete from userinfo where id='"+id+"';";
		//System.out.println(command);
		int rowNum = stmt.executeUpdate(command);
		if(rowNum<1) 
		throw new Exception("데이터를 DB에 입력할 수 없습니다."); 
		
		stmt.close();
} catch (Exception e) {
	System.out.println(e);
}
	
close();
}

public int Login(String id,String password) {//로그인
	int s = 0;
	try{
		conn=Drive();
		stmt=conn.createStatement();
		String command = "select * from userinfo where id='"+id+"';";
		ResultSet rs=stmt.executeQuery(command);
		//System.out.println(command);
		if(rs.next()){
			String ID = rs.getString("id");
			String PW = rs.getString("password");

			if(ID.equals(id)&&PW.equals(password)){
			s=3;//ID와 PW가 일치하면 0을 리턴
		    }

			else{
			 s=2;//ID는 일치하고 PW가 다르면1을 리턴
			}
}
		else {
			s=1;//ID가 없을경우 2를 리턴
		}

		stmt.close();
} catch (Exception e) {
	System.out.println(e);
}
	//System.out.println(s);
	return s;
}


public int ConfirmID(String id) {//ID 중복 체크
	int s = 0;
	try{
		conn=Drive();
		stmt=conn.createStatement();
		String command = "select * from userinfo where id ='" + id +"';";
		ResultSet rs=stmt.executeQuery(command);
		//System.out.println(command);
		if(rs.next()){   
			  s=1;	//id가있으면 1을 반환	  
		  }else{
			  s=0; //id가없으면 0을반환
		  }
		stmt.close();
} catch (Exception e) {
	System.out.println(e);
}
	return s;
}


public int ConfirmMail(String email) {//이메일 중복 체크
	int s = 0;
	try{
		conn=Drive();
		stmt=conn.createStatement();
		String command = "select * from userinfo where email ='" + email +"';";
		ResultSet rs=stmt.executeQuery(command);
		//System.out.println(command);
		if(rs.next()){   
			  s=1;	//email있으면 1ㄴ을반환  
		  }else{
			  s=0; //email가없으면 0을반환
		  }
		stmt.close();
} catch (Exception e) {
	System.out.println(e);
}
	//System.out.println(s);
	return s;
}


public String FindID(String name,String email) {//ID찾기
	String str=null;
	try{
	conn=Drive();
	stmt=conn.createStatement();
	String command = "select * from userinfo where name='"+name+"' and email='"+email+"';";
	ResultSet rs=stmt.executeQuery(command);
	//System.out.println(command);
	if(rs.next()){
		str = rs.getString("id");		
	}
	else{
	    str = "0";
	}

	stmt.close();
} catch (Exception e) {
System.out.println(e);
}
//System.out.println(str);
return str;
}


public ArrayList<UserDto> UserList(String id) {//ID로 일치하는회원 정보 출력
	ArrayList<UserDto> UserList=new ArrayList<UserDto>(); 
	try{
		conn=Drive();
	stmt=conn.createStatement();//게실글 전체출력으로 order by number desc 게시물번호로 내림차순으로 정렬
	String command = "select * from userinfo where id='"+id+"';";
	ResultSet rs=stmt.executeQuery(command);
	while(rs.next()) {	
		
		UserDto dto=new UserDto();
		dto.setName(rs.getString("name"));
		dto.setId(rs.getString("id"));
		dto.setEmail(rs.getString("email"));
		dto.setPhone(rs.getString("phone"));
		dto.setBirth(rs.getDate("birth"));
		dto.setPostcode(rs.getString("postcode"));
		dto.setAddr1(rs.getString("addr1"));
		dto.setAddr2(rs.getString("addr2"));
		
		UserList.add(dto);
	}
	stmt.close();
	} catch (Exception e) {
		System.out.println(e);
	}
	close();
	return UserList;
}

}
