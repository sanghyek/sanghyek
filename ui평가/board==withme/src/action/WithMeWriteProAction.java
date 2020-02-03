package action;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.WithMeWriteProService;
import vo.ActionForward;
import vo.WithMeBean;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WithMeWriteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{


		ActionForward forward=null;
		WithMeBean withmeBean = null;
		String realFolder="";
		String saveFolder="/upload";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		System.out.println("realFolder="+realFolder);
		System.out.println("savefolder="+saveFolder);
		
		withmeBean = new WithMeBean();
		withmeBean.setTitle(multi.getParameter("title"));
		withmeBean.setDate(Date.valueOf(multi.getParameter("date")));//��������(valueof�� String Ÿ���� �Ķ���͸� dateŸ������ ��ȯ �� ������ yyyy=mm=dd �̿����Ѵ�)	
		withmeBean.setPeople(Integer.parseInt(multi.getParameter("people")));//�ο���(string Ÿ���� �Ķ���͸� intŸ������ ����ȯ)
		withmeBean.setLim(multi.getParameter("limit"));//��������
		withmeBean.setLimitdate(Date.valueOf(multi.getParameter("limitdate")));//��������������
		withmeBean.setWriter(multi.getParameter("writer"));//�ۼ���
		withmeBean.setLocalcontent(multi.getParameter("localcontent"));//��������ó
		withmeBean.setContents(multi.getParameter("contents"));//����		
		
		withmeBean.setPhoto(multi.getFilesystemName("filedata0"));//���λ���
		withmeBean.setPic1(multi.getFilesystemName("filedata1"));//�߰�����1
		withmeBean.setPic2(multi.getFilesystemName("filedata2"));//�߰�����2
		withmeBean.setPic3(multi.getFilesystemName("filedata3"));//�߰�����3
		withmeBean.setPic4(multi.getFilesystemName("filedata4"));//�߰�����4
		
		WithMeWriteProService WriteProService = new WithMeWriteProService();
		boolean isWriteSuccess = WriteProService.registArticle(withmeBean);
		//System.out.println("proAction="+isWriteSuccess);
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��Ͻ���')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("WithMe.do");
		}

		return forward;
		
	}  	
	
}