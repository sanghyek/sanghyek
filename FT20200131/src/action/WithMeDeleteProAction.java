package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.WithMeDeleteProService;
import svc.WithmeListorderService;
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
		WithmeListorderService listorder = new WithmeListorderService();
		listorder.listorder(num);
	/*	boolean isArticleWriter =boardDeleteProService.isArticleWriter(board_num, request.getParameter("BOARD_PASS"));

		if(!isArticleWriter){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		else{*/
		/*	
			boolean isDeleteSuccess = boardDeleteProService.removeArticle(board_num);

			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('삭제실패');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			else{*/
				
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("WithMe.do");


		return forward;
	}

}