package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ActionSignup;
import model.Dto;

public class Signup implements Cominterface {
	static Signup ser = new Signup();
	public static Signup instance() {
		return ser;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionSignup model = ActionSignup.instance(); //�떛湲��넠 媛앹껜
		String i=request.getParameter("ID");
		String n=request.getParameter("Name");
		String p=request.getParameter("PW");
		
		model.signup(i,n,p);
		//System.out.println("controller"+"id="+i+"Name="+n+"PW="+p);
		return "index.html";

	}
}
