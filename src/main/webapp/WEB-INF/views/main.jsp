<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="path" value ="${pageContext.request.contextPath}"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>    
<meta http-equiv="Content-Type" content="text/html charset=UTF-8">
<!DOCTYPE html>
<html style="overflow-x: hidden;" lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="djkim">
  <title>ARTFMIS</title>
  <!-- Bootstrap core CSS -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href=”${path}/css/bootstrap.vertical-tabs.min.css” rel=”stylesheet”>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

  <!-- Custom styles for this template -->
  <link href="${path}/css/modern-business.css" rel="stylesheet">
  <link href="${path}/css/artfms.css?=ver1" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css"/>
  <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
  
<script>
function customAutoRolad(url){
    let urlArr = url.split("/");
    if(urlArr[2] === "consult"){
        if(urlArr[3] === "listview.do"){
            var element = $("#consult_list");
            if(element.length){
                var option = element.find("option:selected");
                if(option.length > 0){
                    var index = option[0].value;
                    var a = "${path}/consult/detailConsult/"+index;
                    fnSetConsultdetail(a);
                    var b = "${path}/consult/defaultConsult/"+index;
                    fnSetConsultdefault(b);
                }
            }
        }
    } else if(urlArr[2] === "cont"){
        if(urlArr[3] === "contlist.do"){
            var element = $("#consult_contract_list_table");
            if(element.length){
                var a = element.find("tbody tr:eq(0) > td:eq(1) > a");
                if(a.length){
                  a[0].click();
                }
            }
        } else if(urlArr[3] === "listview.do'"){
            var element = $("#roomTable");
            if(element.length){
                var a = element.find("tbody tr:eq(0) > td:eq(0) > a")
                if(a.length){
                    a[0].click();
                }
            }
        } else if(urlArr[3] === "settlistview.do"){
            var element = $("#consult_sett_list_table");
            if(element.length){
                var a = element.find("tbody tr:eq(0) > td:eq(1) > a");
                if(a.length){
                   a[0].click();
                }
            }
        }
    } else if(urlArr[2] === "room"){

    } else if(urlArr[2] === "goods"){
        if(urlArr[3] === "listgoods.do"){

        } else if(urlArr[3] === "listroomview.do"){

        } else if(urlArr[3] === "altarListview.do"){

        } else if(urlArr[3] === "ftableListview.do"){

        } else if(urlArr[3] === "dosListview.do"){

        }
    }
}

function fnSetPage(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#main_container").empty();
	    $("#carouselExampleIndicators").remove();
		$("#main_container").load(url, data, function(){
			setTimeout(function(){
                customAutoRolad(url);
			}, 500);
	});
}
</script>
  <style>
      #listTable > tbody > tr.active{
         background-color: #9fcdff;
      }
      
      #ordlistTable > table > tbody > tr.active{
         background-color: #9fcdff;
      }
      
       #ftablelist > tbody > tr.active{
         background-color: #9fcdff;
      }
      
      #consult_contract_list_table > tbody > tr.active {
         background-color: #9fcdff;
      }

      #roomTable > tbody > tr.active{
         background-color: #9fcdff;
      }

      #consult_sett_list_table > tbody > tr.active {
         background-color: #9fcdff;
      }

      #goodslist > tbody > tr > td.active {
         background-color: #9fcdff;
      }

  </style>
  <style>
    /* font-size:0을 사용하여 img_area영역 안에 여백을 없앤다. */
    .imagebx{height:300px; font-size:0;}
    .imagebx:after{display:inline-block; height:100%; content:""; vertical-align:middle;}
    .imagebx img{vertical-align:middle;}
  </style>

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <a class="navbar-brand" href="${path}/">ARTFMIS</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="${path}/">홈</a>
            <c:set var = "role1" value = "${USER_ROLE1}" />
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              상담/계약관리
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <c:if test = "${not fn:contains(role1, 'A0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/consult/listview.do')">상담 목록</a></c:if>
              <c:if test = "${not fn:contains(role1, 'B0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/cont/contlist.do')">계약 목록 *</a></c:if>
              <c:if test = "${not fn:contains(role1, 'B0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/cont/conttrlist.do')">호실 이동 *</a></c:if>
              <c:if test = "${not fn:contains(role1, 'C0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/cont/listview.do')">계약 등록*</a></c:if>
              <a class="dropdown-item" href="javascript:fnSetPage('${path}/room/addorderlistall.do')">호실주문 목록</a>
              <c:if test = "${not fn:contains(role1, 'D0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/cont/settlistview.do')">정산 관리</a></c:if>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              물품등록/관리
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <c:if test = "${not fn:contains(role1, 'E0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/goods/listgoods.do')">물품목록</a></c:if>
              <c:if test = "${not fn:contains(role1, 'F0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/goods/listroomview.do')">호실등록</a></c:if>
              <c:if test = "${not fn:contains(role1, 'G0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/goods/altarListview.do')">제단등록</a></c:if>
              <c:if test = "${not fn:contains(role1, 'H0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/goods/ftableListview.do')">제물상등록</a></c:if>
              <c:if test = "${not fn:contains(role1, 'I0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/goods/dosListview.do')">표준주문서등록</a></c:if>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              기타설정 관리
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
              <c:if test = "${not fn:contains(role1, 'J0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/code/write.do')">코드설정</a></c:if>
              <c:if test = "${not fn:contains(role1, 'J0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/code/listview.do')">코드리스트뷰</a></c:if>
              <c:if test = "${not fn:contains(role1, 'J0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/code/bcodelistview.do')">베이스코드리스트뷰</a></c:if>
              <c:if test = "${not fn:contains(role1, 'K0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/setup/listview.do')">상담문구설정</a></c:if>
              <c:if test = "${not fn:contains(role1, 'K0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/setup/timelistview.do')">운영시간안내설정</a></c:if>
              <c:if test = "${not fn:contains(role1, 'K0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/setup/infolistview.do')">안내문설정</a></c:if>
              <c:if test = "${not fn:contains(role1, 'L0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/cont/settleRule.do')">정산규칙설정</a></c:if>
              <c:if test = "${not fn:contains(role1, 'M0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/user/listview.do')">사용자 관련설정</a></c:if>
              <c:if test = "${not fn:contains(role1, 'M0')}"><a class="dropdown-item" href="javascript:fnSetPage('${path}/fnr/listview.do')">장례식장 관련설정</a></c:if>
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
        <div class="carousel-item active" style="height: 60%; background-image: url('${path}/resources/image/main_back_1.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p>고인의 명복을 빕니다.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="height: 60%; background-image: url('${path}/resources/image/main_back_2.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>GHTECH ARTFMS</h3>
            <p>클라우드기반 장례식장 관리 프로그램</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="height: 60%; background-image: url('${path}/resources/image/main_back_3.jpg')">
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

	<div id="" class="main_box">

		<h1 class="my-5 main_h1" style="text-align:center"><span></span> GHTECH 장례식장 관리</h1>

			<!-- Marketing Icons Section -->
			<div class="row justify-content-md-center">

			  <div class="col col-lg-2">
					<a href="javascript:fnSetPage('${path}/room/addorderlistall.do')"><img src="${path}/resources/image/main_button_1.png" alt="추가주문현황" class="m_i"></a>
			  </div>
			  <div class="col col-lg-2">
					<a href="javascript:fnSetPage('${path}/cont/contlist.do')"><img src="${path}/resources/image/main_button_2.png" alt="계약현황"  class="m_i"></a>
			  </div>
			  <div class="col col-lg-2">
					<a href="javascript:fnSetPage('${path}/consult/listview.do')"><img src="${path}/resources/image/main_button_3.png" alt="상담현황"  class="m_i"></a>
			  </div>

			</div>
			<!-- /.row -->
			<br><br>
			<hr>


      </div>

  </div>
  <!-- /.container -->
  <!-- Bootstrap core JavaScript -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
  <script src="${path}/js/customTabJs.js"></script>
  <script src="${path}/js/customTableClickJs.js"></script>  
</body>

</html>
