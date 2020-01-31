package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.WithMeDetailService;
import vo.ActionForward;
import vo.WithMeBean;

 public class WithMeDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int num=Integer.parseInt(request.getParameter("num"));
		//String page = request.getParameter("page");
		WithMeDetailService DetailService = new WithMeDetailService();
		WithMeBean article = DetailService.getArticle(num);
		ActionForward forward = new ActionForward();
		//request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/WithMeView.jsp");
   		return forward;

	 }
	 
}