<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>ARTFMS 로그인 </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="#">
    <meta name="keywords" content="Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="#">
    <!-- Favicon icon -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
      <!-- Bootstrap core CSS -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">

  <!-- Custom styles for this template -->
  <link href="${path}/css/modern-business.css" rel="stylesheet">
  <link href="${path}/css/artfms.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css"/>
  <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>
    
<script>
$(document).ready(function(){
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
</head>

<body class="fix-menu">
      <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container-fluid">
            <div class="row" align="center">
                <div class="col-sm-3" align="center">
                    <!-- Authentication card start -->
                    <div class="signin-card card-block auth-body" align="center">
                      <form name="form1" class="md-float-material" method="post">
                          <div class="text-center">
							<img src="${path}/images/logo.png" alt="ARTFMS">
                            <!--<img src="${path}/assets/images/auth/logo-dark.png" alt="logo.png">-->
                          </div>
								<div class="inwrap">
									<p class="text-inverse b-b-default text-center p-b-10">로그인 하십시오.</p>
									<div class="input-group">
										<input type="text" id="USER_LOGINID" name="USER_LOGINID" class="form-control" autocomplete="no" placeholder="사용자 아이디">
										<span class="md-line"></span>
									</div>
									<div class="input-group">
										<input type="password" id="USER_PASSWD" name="USER_PASSWD" class="form-control" autocomplete="no" placeholder="암호">
										<span class="md-line"></span>
									</div>
									<div class="row m-t-30">
										<div class="col-md-12">
											<button type="submit" id="btnlogin" name="btnlogin" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">LOGIN</button>
										</div>
									</div>
								</div>
                            </div>
                        </form>
                       <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
                        <!-- end of form -->
                        <script src="${path}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>


</html>
