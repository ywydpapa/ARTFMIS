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
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css"/>
  <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>
  
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
</script>

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <a class="navbar-brand" href="${path}/">ARTFMS</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="${path}/">홈</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              상담/계약관리
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/consult/listview.do')">상담 목록</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/cont/contlist.do')">계약 목록 *</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/cont/listview.do')">계약 등록*</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/room/addorderlistall.do')">호실주문 목록</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/cont/settlist.do')">정산 관리</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              물품등록/관리
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/goods/listgoods.do')">물품목록</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/goods/listroomview.do')">호실등록</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/goods/altarListview.do')">제단등록</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/goods/ftableListview.do')">제물상등록</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/goods/dosListview.do')">표준주문서등록</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              기타설정 관리
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/code/write.do')">코드설정</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/code/listview.do')">코드리스트뷰</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/code/bcodelistview.do')">베이스코드리스트뷰</a>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/cont/settleRule.do')">정산규칙설정</a>
			</div>
          </li>
           <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              ${USER_NAMK}
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/user/changepasswd.do')">암호변경</a>
              <a class="dropdown-item" href="${path}/user/logout.do">로그아웃</a>
            </div>
          </li>
          
        </ul>
      </div>
  </nav>

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="height: 80%; background-image: url('${path}/resources/image/flower4.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p>고인의 명복을 빕니다.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="height: 80%; background-image: url('${path}/resources/image/flower2.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>GHTECH ARTFMS</h3>
            <p>클라우드기반 장례식장 관리 프로그램</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="height: 80%; background-image: url('${path}/resources/image/flower3.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Page Content -->
  <div class="main_container" id="main_container">

<h1 class="my-4"><span>           </span> GHTECH 장례식장 관리</h1>

    <!-- Marketing Icons Section -->
    <div class="row justify-content-md-center">
      <div class="col col-lg-2">
        <div class="card h-100">
          <h4 class="card-header">추가 주문 현황</h4>
          <div class="card-body">
            <p class="card-text">기본 주문 물품 이외 추가로 호실에서 주문한 내역을 확인 하는 곳입니다. </p>
          </div>
          <div class="card-footer">
            <a href="javascript:fnSetPage('${path}/room/addorderlistall.do')" class="btn btn-primary">상세 정보</a>
          </div>
        </div>
      </div>
      <div class="col-md-auto">
        <div class="card h-100">
          <h4 class="card-header">계약 현황</h4>
          <div class="card-body">
            <p class="card-text">일자별 호실별 계약 내역을 확인하는 곳입니다.</p>
          </div>
          <div class="card-footer">
            <a href="javascript:fnSetPage('${path}/cont/contlist.do')" class="btn btn-primary">상세 정보</a>
          </div>
        </div>
      </div>
      <div class="col col-lg-2">
        <div class="card h-100">
          <h4 class="card-header">상담 현황</h4>
          <div class="card-body">
            <p class="card-text">상담 내역 및 계약 예상 내역을 일자별로 확인 관리하는 곳입니다</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">상세 정보</a>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

      <hr>

  </div>
  <!-- /.container -->
  <!-- Bootstrap core JavaScript -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
 <script type="text/javascript">
 </script> 
</body>

</html>
