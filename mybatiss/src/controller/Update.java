package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ActionUpdate;

public class Update implements Cominterface{
	static Update ser = new Update();
	public static Update instance() {
		return ser;
	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionUpdate model = ActionUpdate.instance(); //�떛湲��넠 媛앹껜
		String i=request.getParameter("ID");
		String p=request.getParameter("PW");
		
		model.Update(i,p);
		System.out.println("controller"+"id="+i+"pw="+p);
		return "index.html";
	}
}
