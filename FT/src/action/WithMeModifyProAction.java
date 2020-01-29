package action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.WithMeModifyProService;
import vo.ActionForward;
import vo.WithMeBean;

public class WithMeModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

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
		System.out.println("savefolder="+saveFolder);
		
		withmeBean = new WithMeBean();
		withmeBean.setNum(Integer.parseInt(multi.getParameter("num")));
		withmeBean.setTitle(multi.getParameter("title"));
		withmeBean.setDate(Date.valueOf(multi.getParameter("date")));//��������(valueof�� String Ÿ���� �Ķ���͸� dateŸ������ ��ȯ �� ������ yyyy=mm=dd �̿����Ѵ�)	
		withmeBean.setPeople(Integer.parseInt(multi.getParameter("people")));//�ο���(string Ÿ���� �Ķ���͸� intŸ������ ����ȯ)
		withmeBean.setLim(multi.getParameter("limit"));//��������
		withmeBean.setLimitdate(Date.valueOf(multi.getParameter("limitdate")));//��������������
		withmeBean.setWriter(multi.getParameter("writer"));//�ۼ���
		withmeBean.setLocalcontent(multi.getParameter("localcontent"));//��������ó
		withmeBean.setContents(multi.getParameter("contents"));//����		
		
		if(multi.getFilesystemName("filedata0")==null||multi.getFilesystemName("filedata0")==""){
			withmeBean.setPhoto(multi.getParameter("checkimg1"));
		}else {
			withmeBean.setPhoto(multi.getFilesystemName("filedata0"));//���λ���			
		}
		if(multi.getFilesystemName("filedata1")==null||multi.getFilesystemName("filedata1")==""){
			withmeBean.setPic1(multi.getParameter("checkimg2"));
		}else {
			withmeBean.setPic1(multi.getFilesystemName("filedata1"));//�߰�����1			
		}
		if(multi.getFilesystemName("filedata2")==null||multi.getFilesystemName("filedata2")==""){
			withmeBean.setPic2(multi.getParameter("checkimg3"));
		}else {
			withmeBean.setPic2(multi.getFilesystemName("filedata2"));//�߰�����2		
		}
		if(multi.getFilesystemName("filedata3")==null||multi.getFilesystemName("filedata3")==""){
			withmeBean.setPic3(multi.getParameter("checkimg4"));
		}else {
			withmeBean.setPic3(multi.getFilesystemName("filedata3"));//�߰�����3		
		}
		if(multi.getFilesystemName("filedata4")==null||multi.getFilesystemName("filedata4")==""){
			withmeBean.setPic4(multi.getParameter("checkimg5"));
		}else {
			withmeBean.setPic4(multi.getFilesystemName("filedata4"));//�߰�����4	
		}		
		
		WithMeModifyProService ModifyProService = new WithMeModifyProService();
		boolean isWriteSuccess = ModifyProService.modifyArticle(withmeBean);
		System.out.println("proAction="+isWriteSuccess);
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