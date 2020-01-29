package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mybatismodel.ActionInsert;
import Mybatismodel.ActionList;
import Mybatismodel.InfoandTipDto;


public class Insert implements Cominterface {
	static Insert ser = new Insert();
	public static Insert instance() {
		return ser;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionInsert model = ActionInsert.instance();
		ActionList mode2 = ActionList.instance();//�떛湲��넠 媛앹�?
		List<InfoandTipDto> list=mode2.boardlist();
		int num=list.size()+1;
		String category=request.getParameter("category");
		String title=request.getParameter("title");
		String writer=request.getParameter("writer");
		String contents=request.getParameter("contents");
		
		model.boardInsert(num, category, title, writer, contents);
		//System.out.println("controller"+"id="+i+"Name="+n+"PW="+p);
		return "InfoandTip.jsp";

	}
}
