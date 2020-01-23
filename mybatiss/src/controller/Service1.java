package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action1;
import model.Dto;

public class Service1 implements Cominterface{

	static Service1 ser = new Service1();
	public static Service1 instance() {
		return ser;
	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Action1 model = Action1.instance(); //싱글톤 객체
		ArrayList<Dto> list = (ArrayList<Dto>)model.userlist();
		request.setAttribute("data", list);
		System.out.println("bb"+list.size());
		return "userlist.jsp";

}
}
