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
		withmeBean.setDate(Date.valueOf(multi.getParameter("date")));//투어일자(valueof로 String 타입인 파라미터를 date타입으로 변환 단 형식은 yyyy=mm=dd 이여야한다)	
		withmeBean.setPeople(Integer.parseInt(multi.getParameter("people")));//인원수(string 타입인 파라미터를 int타입으로 형변환)
		withmeBean.setLim(multi.getParameter("limit"));//제한조건
		withmeBean.setLimitdate(Date.valueOf(multi.getParameter("limitdate")));//예약최종마감일
		withmeBean.setWriter(multi.getParameter("writer"));//작성자
		withmeBean.setLocalcontent(multi.getParameter("localcontent"));//현지연락처
		withmeBean.setContents(multi.getParameter("contents"));//내용		
		
		withmeBean.setPhoto(multi.getFilesystemName("filedata0"));//메인사진
		withmeBean.setPic1(multi.getFilesystemName("filedata1"));//추가사진1
		withmeBean.setPic2(multi.getFilesystemName("filedata2"));//추가사진2
		withmeBean.setPic3(multi.getFilesystemName("filedata3"));//추가사진3
		withmeBean.setPic4(multi.getFilesystemName("filedata4"));//추가사진4
		
		WithMeWriteProService WriteProService = new WithMeWriteProService();
		boolean isWriteSuccess = WriteProService.registArticle(withmeBean);
		//System.out.println("proAction="+isWriteSuccess);
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
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