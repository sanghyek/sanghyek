package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.WithMePeopleCountService;
import svc.WithMeWriteProService;
import vo.ActionForward;

public class WithMePeopleCountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		WithMePeopleCountService Peoplecount = new WithMePeopleCountService();
		int num=Integer.parseInt(request.getParameter("num"));
		//System.out.println(num);
		Peoplecount.peoplecount(num);
		ActionForward forward = new ActionForward();
		forward.setPath("/boardDetail.do");
		return forward;

	}

}
