<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>UserDelete</title>
</head>
<body>

  <% 
 String ses=null;
 ses=(String)session.getAttribute("ID");
 if(ses==null){%>
 <jsp:include page="header.jsp"/>
 <%} else{%>
 <jsp:include page="Loginheader.jsp"/>
 <%} %>
 
 
<script>
function del(){
	if($("#password").val()==null||$("#password").val()==""){
		$("#password").focus();
		alert("��й�ȣ�� �Է����ּ���");
	}
	else{
		$.ajax({
			type : "post",
			url : "./UserDeleteDB.jsp",
			data : {				
				id : $('#userid').val(),
				password : $('#password').val()
				},
				success : function Success(resdata) {					
						if(resdata==3){
							var result =confirm("������ Ż�� �Ͻðڽ��ϱ�?");
							if(result){
							$("#x").val(0);
							$("#userDel").attr("action","UserDeleteDB.jsp");
							$("#userDel").submit();
							}else{}
						}
						else{
							alert(resdata);
							$('#password').val("");
							$('#password').focus();
							alert("��й�ȣ�� �ٸ��ϴ�");
						}
					  },
					error : Error
					});
			}
}	

function Error(request,status,error) {
	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
}
		
</script>
<section>
<form  method="post" id="userDel">
<input type="hidden" id="x" name="x" value="">
<input type="text" id="userid" name="userid" value=${ID}>
<input type="password" id="password" name="password">
<input type="button" id="Delbtn" name="Delbtn" value="Ż��" onclick="del()">
</form>
</section>
</body>
</html>