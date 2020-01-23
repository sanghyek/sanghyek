package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ActionDelete;
import model.Dto;

public class Delete implements Cominterface {
	static Delete ser = new Delete();
	public static Delete instance() {
		return ser;
	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionDelete model = ActionDelete.instance(); //�떛湲��넠 媛앹껜
		String i=request.getParameter("ID");
		
		model.Delete(i);
		System.out.println("controller"+"id="+i);
		return "index.html";
	}

}
