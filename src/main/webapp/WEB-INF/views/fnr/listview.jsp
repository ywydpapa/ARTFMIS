<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.listrooms {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

.detailaltar {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

.h-container:after {
	clear: both;
	display: block;
	content: ''
}

.h-container .item {
	float: left;
	width: 40%;
	height: 100%;
	padding: 20px;
	text-align: center;
	border-right: 1px solid #ddd;
}

.h-container .item.cont {
	float: left;
	width: 58%;
	padding: 20px;
	border-right: none;
	text-align: center;
}
</style>
<div class="listcategory">
		<table class="table table-bordered nowrap"
		style="width: 50%;">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<td>장례식장 관리</td>
			<td></td>
		</tr>
</table>
<hr>
	<div class="h-container">
		<div class="item">
			<table class="table table-striped table-bordered nowrap" id="listTable">
				<thead>
					<tr>
						<th scope="col" width="25%" style="text-align:center">고유번호</th>
						<th scope="col" width="25%" style="text-align:center">장례식장명</th>
						<th scope="col" width="25%" style="text-align:center">권한</th>
						<th scope="col" width="25%" style="text-align:center">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a href="javascript:fnSetupdetail('${path}/fnr/detail/${row.FNR_ID}')">${row.FNR_ID}</a></td>
							<td>${row.FNR_NAMEK}</td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
		<div class="item cont">
			<div id="detailTable" class="detailTable"></div>
		</div>
	</div>
</div>

<script>

function tableDetailLoad(){
	console.log( $("#listTable > tbody > tr > td > a").length );
	var $target;
	var num1 = $("#listTable > tbody > tr > td > a").length;
	if (num1 > 0){
			$target = $("#listTable > tbody > tr > td > a");
	}
	if (num1 > 0){
		var tempArr = $target.eq(0).attr('href').split('/');
		var num = tempArr[tempArr.length - 1].replace(')','').replace('"','').replace('\'','');
		var url ="${path}/user/detail/"+num;
		$.ajax({
			type: "GET",
			url : url,
			dataType : "html",
			success : function(html){
				$("#detailTable").empty();
				$("#detailTable").append(html);
				$("#insbtn").hide();
				$("#udtbtn").show();
			},
			error : function(xhr){
				console.log(xhr);
			}
		});
	} else {
		fn_setNew();
	}
}

function tableListLoad(url){
	$.ajax({
		type: "GET",
		url : url,
		dataType : "html",
		success : function(html){
			$("#listTable").empty();
			$("#listTable").append(html);	
			tableDetailLoad();
		},
		error : function(xhr){
			console.log(xhr);
		}
	});
}

function fnSetupdetail(url, data){

	$("#detailTable").empty();
	$("#detailTable").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}

function fn_setNewuser(){

	url="${path}/user/detailnew.do";
	fnSetupdetail(url);

}

function fn_Insertfnr() {
	var userData = {};
	userData.USER_LOGINID = $("#uId").val();
	userData.USER_NAMK = $("#unamk").val();
	userData.USER_RANK = $("#urank").val();
	userData.USER_DEPT = $("#udept").val();
	userData.USER_TELNO = $("#utel").val();
	userData.USER_MOBNO = $("#umob").val();
	userData.USER_ADDR1 = $("#uadd1").val();
	userData.USER_ADDR2 = $("#uadd2").val();
	userData.USER_INDAT = $("#uindate").val();
	userData.USER_EMAIL = $("#uemail").val();
	userData.FROOM_ID = $("#ufroom").val();
	userData.FNR_ID = "10000";
	console.log(userData);
	$.ajax({
		url : "${path}/user/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : userData, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
	.done(function(data) {
		if (data.code == 10001) {
			alert("저장 성공");
			var url ="${path}/user/listuser.do";
			tableListLoad(url);
		} else {
			alert("저장 실패");
		}
	}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
	.fail(function(xhr, status, errorThrown) {
		alert("통신 실패");
	});
}

function fn_Updatefnr() {
	var userData = {};
	userData.USER_LOGINID = $("#uId").val();
	userData.USER_NAMK = $("#unamk").val();
	userData.USER_RANK = $("#urank").val();
	userData.USER_DEPT = $("#udept").val();
	userData.USER_TELNO = $("#utel").val();
	userData.USER_MOBNO = $("#umob").val();
	userData.USER_ADDR1 = $("#uadd1").val();
	userData.USER_ADDR2 = $("#uadd2").val();
	userData.USER_INDAT = $("#uindate").val();
	userData.USER_EMAIL = $("#uemail").val();
	userData.FROOM_ID = $("#ufroom").val();
	$.ajax({
		url : "${path}/user/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : userData, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
	.done(function(data) {
		if (data.code == 10001) {
			alert("저장 성공");
			var url ="${path}/fnr/listuser.do";
			tableListLoad(url);
		} else {
			alert("저장 실패");
		}
	}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
	.fail(function(xhr, status, errorThrown) {
		alert("통신 실패");
	});
}

$(document).ready(function() {
	tableDetailLoad();	
});

 </script>
