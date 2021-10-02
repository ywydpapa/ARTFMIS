<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<head>
    <title>ARTFMS 로그인 </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="#">
    <meta name="keywords" content="Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="#">
   <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>

<body style="overflow:hidden">

<nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
    <div class="container">
        <a class="navbar-brand" href="#"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#"></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"></a>
                </li>
            </ul>

        </div>
    </div>
</nav>

<main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">ARTFMIS 로그인</div>
                    <div class="card-body">
                        <form id="form1" name="form1" method="post">
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">로그인 아이디</label>
                                <div class="col-md-4">
                                    <input type="text" id="USER_LOGINID" class="form-control" name="USER_LOGINID" required autofocus>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">암호</label>
                                <div class="col-md-4">
                                    <input type="password" id="USER_PASSWD" class="form-control" name="USER_PASSWD" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-6 offset-md-4">
                                    
                                </div>
                            </div>

                            <div class="col-md-6 offset-md-4">
                                <button id="btnlogin" type="submit" class="btn btn-primary">
                                    로그인
                                </button>
                            </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</main>

</body>
<script>
$(document).ready(function(){
	<c:if test="${msg eq 'Fail'}">alert("아이디와 암호를 확인해 주세요.");</c:if>
	$("#btnlogin").click(function(){
		var USER_LOGINID=$("#USER_LOGINID").val();
		var USER_PASSWD=$("#USER_PASSWD").val();
		if(USER_LOGINID==""){
			alert("아이디를 입력해 주세요.");
			$("#USER_LOGINID").focus();
			return;
		}
		if(USER_PASSWD==""){
				alert("암호를 입력해 주세요.");
				$("#USER_PASSWD").focus();
				return;
			}
		document.form1.action="${path}/user/login_check.do";
		document.form1.submit();
	});
});
</script>

</html>

