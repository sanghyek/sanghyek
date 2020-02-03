package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.WithMeDeleteProService;
import vo.ActionForward;

public class WithMeDeleteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward forward = null;
		int num=Integer.parseInt(request.getParameter("num"));
		//System.out.println("action num="+num);
		//String nowPage = request.getParameter("page");
		WithMeDeleteProService DeleteProService = new WithMeDeleteProService();
		DeleteProService.removeArticle(num);
	
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("WithMe.do");


		return forward;
	}

}