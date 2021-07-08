<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html charset=UTF-8">
<!DOCTYPE html>
<html style="overflow-x: hidden;" lang="ko">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="djkim">
  <title>ARTFMS</title>
  <!-- Bootstrap core CSS -->
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <link href=”${path}/css/bootstrap.vertical-tabs.min.css” rel=”stylesheet”>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">

  <!-- Custom styles for this template -->
  <link href="${path}/css/modern-business.css" rel="stylesheet">
  <link href="${path}/css/artfms.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="${path}/">ARTFMS</a><input type="hidden" id="contid" value=""/><input type="hidden" id="frid" value=""/>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="${path}/">홈</a>
          </li>
          <li style="display: none" class="nav-item">
            <a class="nav-link" href="javascript:fnSetPage('${path}/room/orderlist/')" id= "listlink">주문현황</a>
          </li>
          <li style="display: none" class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              물품 추가 주문
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/room/restord.do')">식당물품 추가주문</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/room/storeord.do')">매점물품 추가주문</a>
            </div>
          </li>
          <li style="display: none" class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              주문 확인
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/room/addordlist.do')" id= "addlistlink">추가주문 목록</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/room/confirmord.do')" id= "cfnlistlink">주문 수령</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/room/confirminiord/')" id= "cfninilist">초도물품 수령 확인</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              ${USER_NAMK}
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
              <a class="dropdown-item" href="${path}/user/logout.do">로그아웃</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <header>
  </header>

  <!-- Page Content -->
  <div class="main_container" id="main_container">
     <br>
     <br>
  <!-- /.container -->
     <div class="row justify-content-md-center">
      <div class="col col-lg-3">
        <div class="card h-100">
          <h4 class="card-header">추가 주문(식당)</h4>
          <div class="card-body">
            <p class="card-text">분향실에서 필요한 물품을 주문하는 곳입니다. </p>
          </div>
          <div class="card-footer">
            <a href="javascript:fnSetPage('${path}/room/restord.do')" class="btn btn-primary">주문</a>
          </div>
        </div>
      </div>
      <div class="col col-lg-3">
        <div class="card h-100">
          <h4 class="card-header">추가 주문(매점)</h4>
          <div class="card-body">
            <p class="card-text">분향실에서 필요한 물품을 주문하는 곳입니다. </p>
          </div>
          <div class="card-footer">
            <a href="javascript:fnSetPage('${path}/room/storeord.do')" class="btn btn-primary">주문</a>
          </div>
        </div>
      </div>
      <div class="col col-lg-3">
        <div class="card h-100">
          <h4 class="card-header">주문 확인</h4>
          <div class="card-body">
            <p class="card-text"> 받은 물품을 수령 확인하는 곳입니다. </p>
          </div>
          <div class="card-footer">
            <a href=""  id = "cfnlistlink2" class="btn btn-primary">수령확인</a>
          </div>
        </div>
      </div>
    </div>
   </div>
  <!-- Bootstrap core JavaScript -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>

<script>
    function fnSetPage(url, data){
      <!-- $.LoadingOverlay("show", true); -->
      $("#main_container").empty();
      $("#carouselExampleIndicators").remove();
      $("#main_container").load(url, data, function(){
        setTimeout(function(){
        }, 500);
      });
    }
    
    $(document).ready(function(){
    	contcheck();
    });
    
    function contcheck(){
    	var froomid = ${USER_FROOM_ID};
    	let today = new Date();   
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		if(month < 10) month = '0'+month;
		let date = today.getDate();  // 날짜
		if(date < 10) date = '0'+date;
		let hours = today.getHours(); // 시
		if(hours < 10) hours = '0'+hours;
		let minutes = today.getMinutes();  // 분
		let seconds = today.getSeconds();  // 초
		var nowDate = year+'-'+month+'-'+date+'T'+hours+':00:00';
		var chkRdata = {};
		chkRdata.FROOM_ID = froomid;
		chkRdata.NOWDATE = nowDate;
		console.log(chkRdata);
		$.ajax({
			url : "${path}/cont/contCheck.do",  
			data : chkRdata,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
			if (data.code == 10001) {
				$("#contid").val(data.contid);
				$("#frid").val(${USER_FROOM_ID});
				var url1 = "javascript:fnSetPage('${path}/room/orderlist/" + data.contid + "')";
				var url2 = "javascript:fnSetPage('${path}/room/addorderlist/" + data.contid + "')";
				var url3 = "javascript:fnSetPage('${path}/room/confirmord/" + data.contid + "')";
				var url4 = "javascript:fnSetPage('${path}/room/confirminiord/" + data.contid + "')";
				$("#listlink").attr("href",url1);
				$("#addlistlink").attr("href",url2);
				$("#cfnlistlink").attr("href",url3);
				$("#cfnlistlink2").attr("href",url3);
				$("#cfninilist").attr("href",url4);
			} else {
				alert("계약이 안된 호실입니다.");
				history.go(-1);
			}	
		});
    }
  
  </script>
  
</body>

</html>
