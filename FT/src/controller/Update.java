package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mybatismodel.ActionUpdate;

public class Update implements Cominterface{
	static Update ser = new Update();
	public static Update instance() {
		return ser;
	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionUpdate model = ActionUpdate.instance(); //�떛湲��넠 媛앹�?
		int num=Integer.parseInt(request.getParameter("num"));
		String title=request.getParameter("title");
		String contents=request.getParameter("contents");
		
		model.Update(num, title, contents);
		System.out.println("controller"+"num="+num+"title="+title+"conetnts="+contents);
		return "InfoandTip.jsp";
	}
}
