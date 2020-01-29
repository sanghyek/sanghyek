package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mybatismodel.ActionList;
import Mybatismodel.InfoandTipDto;

public class Select implements Cominterface{

	static Select ser = new Select();
	public static Select instance() {
		return ser;
	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionList model = ActionList.instance(); //?ã±Í∏??Ü§ Í∞ùÏ≤¥
		ArrayList<InfoandTipDto> list = (ArrayList<InfoandTipDto>)model.boardlist();
		request.setAttribute("data", list);
		//System.out.println("bb"+list.size());
		return "InfoandTip.jsp";

}
}
