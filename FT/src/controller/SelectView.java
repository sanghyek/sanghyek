package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mybatismodel.ActionListView;
import Mybatismodel.InfoandTipDto;

public class SelectView implements Cominterface {
	static SelectView ser = new SelectView();
	public static SelectView instance() {
		return ser;
	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionListView model = ActionListView.instance(); //?���??�� 객체
		int num=Integer.parseInt(request.getParameter("num"));
		ArrayList<InfoandTipDto> list = (ArrayList<InfoandTipDto>)model.boardlist(num);
		request.setAttribute("data", list);
		System.out.println("bb"+list.size());
		return "InfoandTipView.jsp";

}
}
