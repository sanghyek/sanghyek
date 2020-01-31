/**
 * 
 */
  function login(){
	  if($('#userid').val()==null||$('#userid').val()==""){
		  $("#userid").focus();
		  alert("ID를 입력하세요");
		  return false;
	  }
	  else{
		  if($('#password').val()==null||$('#password').val()==""){
			  alert("비밀번호를 입력하세요");
			  return false;
		  }
		  else{
			  $.ajax({
					type : "post",
					url : "./LoginConfirm.jsp",
					data : {
							
						id : $('#userid').val(),
						
						password : $('#password').val()
						
					},
					
					success : function Success(resdata) {
						
						if(resdata==3){
							location.href="index.jsp"
							  return false;
						}
						else if(resdata==2){
							$('#password').val("");
							$('#password').focus();
							alert("비밀번호가 다릅니다");
							  return false;
						}
						else{
							$('#userid').val("");
							$('#userid').focus();
							alert("계정이 없습니다");
							return false;
						}
					  },
					error : Error
					})

					  return false;
		  }
	  }		
	} 
  
  function Error() {
	alert("Error");
	  return false;
  }