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
	
	public void Signup(String name,String id,String password,String email,String phone,String birth,String postcode,String addr1,String addr2){//DB�� ȸ���������� �Է�
	try {
		conn=Drive();
		stmt = conn.createStatement();
		String command = "insert into userinfo values('"+name+"','"+id+"','"+password+"','"+email+"','"+phone+"','"+birth+"','"+postcode+"','"+addr1+"','"+addr2+"');";
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

public void Userupdate(String id,String password,String email,String phone,String postcode,String addr1,String addr2) {//ȸ������ ����
	try {
		conn=Drive();
		stmt = conn.createStatement();
		String command = "update userinfo set password='"+password+"',"+"email='"+phone+"',"+"postcode='"+postcode+"',"+"addr1='"+addr1+"',"+"addr2='"+addr2+"'"+"where id="+id+";";
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
public void UserDelete(String id) {//ȸ��Ż��
	try {
		conn=Drive();
		stmt = conn.createStatement();
		String command = "delete from userinfo where id='"+id+"';";
		//System.out.println(command);
		int rowNum = stmt.executeUpdate(command);
		if(rowNum<1) 
		throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�."); 
		
		stmt.close();
} catch (Exception e) {
	System.out.println(e);
}
	
close();
}

public int Login(String id,String password) {//�α���
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
			s=3;//ID�� PW�� ��ġ�ϸ� 0�� ����
		    }

			else{
			 s=2;//ID�� ��ġ�ϰ� PW�� �ٸ���1�� ����
			}
}
		else {
			s=1;//ID�� ������� 2�� ����
		}

		stmt.close();
} catch (Exception e) {
	System.out.println(e);
}
	//System.out.println(s);
	return s;
}


public int ConfirmID(String id) {//ID �ߺ� üũ
	int s = 0;
	try{
		conn=Drive();
		stmt=conn.createStatement();
		String command = "select * from userinfo where id ='" + id +"';";
		ResultSet rs=stmt.executeQuery(command);
		//System.out.println(command);
		if(rs.next()){   
			  s=1;	//id�������� 1�� ��ȯ	  
		  }else{
			  s=0; //id�������� 0����ȯ
		  }
		stmt.close();
} catch (Exception e) {
	System.out.println(e);
}
	return s;
}


public int ConfirmMail(String email) {//�̸��� �ߺ� üũ
	int s = 0;
	try{
		conn=Drive();
		stmt=conn.createStatement();
		String command = "select * from userinfo where email ='" + email +"';";
		ResultSet rs=stmt.executeQuery(command);
		//System.out.println(command);
		if(rs.next()){   
			  s=1;	//email������ 1������ȯ  
		  }else{
			  s=0; //email�������� 0����ȯ
		  }
		stmt.close();
} catch (Exception e) {
	System.out.println(e);
}
	//System.out.println(s);
	return s;
}


public String FindID(String name,String email) {//IDã��
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


public ArrayList<UserDto> UserList(String id) {//ID�� ��ġ�ϴ�ȸ�� ���� ���
	ArrayList<UserDto> UserList=new ArrayList<UserDto>(); 
	try{
		conn=Drive();
	stmt=conn.createStatement();//�ԽǱ� ��ü������� order by number desc �Խù���ȣ�� ������������ ����
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
