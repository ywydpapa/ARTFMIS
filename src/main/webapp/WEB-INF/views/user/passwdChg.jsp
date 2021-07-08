<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div class="container">
	<div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">암호변경</div>
                    <div class="card-body">
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">현재 암호</label>
                                <div class="col-md-4">
                                    <input type="password" id="presentPass" class="form-control" name="presentPass" required autofocus>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">새 암호</label>
                                <div class="col-md-4">
                                    <input type="password" id="newPass" class="form-control" name="newPass" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-6 offset-md-4">
                                    
                                </div>
                            </div>

                            <div class="col-md-6 offset-md-4">
                                <button onclick="changePasswd()" class="btn btn-primary">
                                    암호변경
                                </button>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

function changePasswd(){
		var Ppasswd=$("#presentPass").val();
		var Npasswd=$("#newPass").val();
		if(Ppasswd==""){
			alert("현재 암호를 입력해 주세요.");
			$("#presentPass").focus();
			return;
		}
		if(Npasswd==""){
				alert("새암호를 입력해 주세요.");
				$("#newPass").focus();
				return;
			}
			var userData = {};
			var uid = "${USER_LOGINID}";
			userData.USER_LOGINID = uid;
			userData.Ppasswd = $("#presentPass").val();
			userData.Npasswd = $("#newPass").val();
			console.log(userData);
			$.ajax({
				url : "${path}/user/updPasswd.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data : userData, // HTTP 요청과 함께 서버로 보낼 데이터 
				method : "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType : "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if (data.code == 10001) {
					location.href="${path}/user/logout.do";
					alert("암호변경 성공 !! 새로 로그인하십시오.");
				} else {
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) {
				alert("입력값을 확인해 주십시오!!");
			});
	}
	
</script>