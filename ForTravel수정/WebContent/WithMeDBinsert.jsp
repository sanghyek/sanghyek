<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.bean.WithMeDto"%>
<%@ page import="dao.dao.WithMeDao"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="WithMe" class="dao.dao.WithMeDao"/>
<%
	String uploadPath=request.getRealPath("/upload");
    out.println("절대경로 : " + uploadPath + "<br/>");
	int size = 10*1024*1024;
	String photo="";
	String pic1="";
	String pic2="";
	String pic3="";
	String pic4="";
	String origfilename0="";
	String origfilename1="";
	String origfilename2="";
	String origfilename3="";
	String origfilename4="";
	
	try{
		MultipartRequest multi=new MultipartRequest(request,
							uploadPath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());

		String title=multi.getParameter("title");//제목
		String date=multi.getParameter("date");//투어일자
		String people=multi.getParameter("people");//인원수
		String limit=multi.getParameter("limit");//제한조건
		String limitdate=multi.getParameter("limitdate");//예약최종마감일
		String writer=multi.getParameter("writer");//작성자
		String localcontent=multi.getParameter("localcontent");//현지연락처
		String contents=multi.getParameter("contents");//내용
		Enumeration files=multi.getFileNames();
		
		String file1 =(String)files.nextElement();
		photo=multi.getFilesystemName("filedata0");
		origfilename0= multi.getOriginalFileName("filedata0");
		
		String file2 =(String)files.nextElement();
		pic1=multi.getFilesystemName("filedata1");
		origfilename1=multi.getOriginalFileName("filedata1");
				
		String file3 =(String)files.nextElement();
		pic2=multi.getFilesystemName("filedata2");
		origfilename2=multi.getOriginalFileName("filedata2");

		String file4 =(String)files.nextElement();
		pic3=multi.getFilesystemName("filedata3");
		origfilename3=multi.getOriginalFileName("filedata3");

		String file5 =(String)files.nextElement();
		pic4=multi.getFilesystemName("filedata4"); 
		origfilename4=multi.getOriginalFileName("filedata4");
		
		out.println(title+","+date+","+people+","+photo+","+","+pic1+","+","+pic2+","+","+pic3+","+","+pic4+","+limit+","+limitdate+","+writer+","+localcontent+","+contents);
		WithMe.WitheMeWrite(title, date, people, limit, photo, pic1 , pic2 , pic3 , pic4 , limitdate, writer, localcontent, contents);
	}catch(Exception e){
		e.printStackTrace();
	}
	//out.print("<script>location.href='WithMe.jsp'</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WithMeWriteDBinsert</title>
</head>
<body>

<%
//String title=request.getParameter("title");//제목
//String date=request.getParameter("date");//투어일자
//String people=request.getParameter("people");//인원수
//String limit=request.getParameter("limit");//제한조건
//String photo=request.getParameter("photo");//메인사진
//String limitdate=request.getParameter("limitdate");//예약최종마감일
//String writer=request.getParameter("writer");//작성자
//String localcontent=request.getParameter("localcontent");//현지연락처
//String contents=request.getParameter("contents");//내용
//out.println(title+","+date+","+people+","+limit+","+limitdate+","+writer+","+localcontent+","+contents);
//WithMe.WitheMeWrite(title, date, people, limit, filename1, limitdate, writer, localcontent, contents);
//out.print("<script>location.href='Loginheader.jsp?pageChange=WithMe.jsp'</script>");
%>

</body>
</html>