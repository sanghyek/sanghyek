package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mybatismodel.ActionDelete;
import Mybatismodel.ActionListorder;

public class Delete implements Cominterface {
	static Delete ser = new Delete();
	public static Delete instance() {
		return ser;
	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionDelete model = ActionDelete.instance(); //delete action
		ActionListorder mode2 = ActionListorder.instance();//listorder 게시글 삭제후 삭제된 번호보다 큰 게시글번호를 1씩줄인다
		int i=Integer.parseInt(request.getParameter("num"));
		
		model.Delete(i);
		mode2.listorder(i);
		System.out.println("controller"+"num="+i);
		
		return "InfoandTip.my?command=list";
	}

}
