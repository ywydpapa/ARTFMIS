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
			<td>사용자 관리</td>
			<td><select id="user_jon" class="form-control form-control-sm">
				<option value="1">생성</option>				
				<option value="2">권한관리</option>
			</select></td>
		</tr>
</table>
<hr>
	<div class="h-container">
		<div class="item">
			<table class="table table-striped table-bordered" id="listTable">
				<thead>
					<tr>
						<th class="table-info" style="text-align:center">로그인아이디</th>
						<th class="table-info" style="text-align:center">이름</th>
						<th class="table-info" style="text-align:center">권한</th>
						<th class="table-info" style="text-align:center">부서</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a href="javascript:fnSetupdetail('${path}/user/detail/${row.USER_ID}')">${row.USER_LOGINID}</a></td>
							<td>${row.USER_NAMK}</td>
							<td>${row.USER_RANK}</td>
							<td>${row.BCD_TITLE}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
		<div class="item cont" style="padding:0 20px;">
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

function tableDetailLoad2(){
	console.log( $("#listTable > tbody > tr > td > a").length );
	var $target;
	var num1 = $("#listTable > tbody > tr > td > a").length;
	if (num1 > 0){
			$target = $("#listTable > tbody > tr > td > a");
	}
	if (num1 > 0){
		var tempArr = $target.eq(0).attr('href').split('/');
		var num = tempArr[tempArr.length - 1].replace(')','').replace('"','').replace('\'','');
		var url ="${path}/user/detailRole/"+num;
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
		},
		error : function(xhr){
			console.log(xhr);
		}
	});
}

function tableListLoad2(url){
	$.ajax({
		type: "GET",
		url : url,
		dataType : "html",
		success : function(html){
			$("#listTable").empty();
			$("#listTable").append(html);	
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

function fn_Insertuser() {
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

function fn_Updateuser() {
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

function fn_UpdateRole() {
	var userData = {};
	userData.USER_LOGINID = $("#uId").val();
	userData.USER_ROLE1 = $("#Arole").val()+$("#Brole").val()+$("#Crole").val()+$("#Drole").val()+$("#Erole").val()+$("#Frole").val()+$("#Grole").val()+$("#Hrole").val()+$("#Irole").val()+$("#Jrole").val()+$("#Krole").val()+$("#Lrole").val()+$("#Mrole").val();
	$.ajax({
		url : "${path}/user/updRole.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : userData, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
	.done(function(data) {
		if (data.code == 10001) {
			alert("저장 성공");
			var url ="${path}/user/listrole.do";
			tableListLoad2(url);
		} else {
			alert("저장 실패");
		}
	}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
	.fail(function(xhr, status, errorThrown) {
		alert("통신 실패");
	});
}


$(document).ready(function() {
	var sele = $("#user_jon").val();
	if (sele == 1){
		setsheet1();
		tableDetailLoad();
	} 
	else if (sele == 2){
		setsheet2();
		tableDetailLoad2();
	}
	else{
		setsheet1();
		tableDetailLoad();
	}	
});

function setsheet1(){
	var url ="${path}/user/listuser.do";
	tableListLoad(url);
}

function setsheet2(){
	var url ="${path}/user/listrole.do";
	tableListLoad2(url);
}

function setsheet3(){
	var url ="${path}/user/listdept.do";
	tableListLoad(url);
}

$("#user_jon").change(function(){
	var sele = $("#user_jon").val();
	if (sele == 1){
		setsheet1();
		tableDetailLoad();
	} 
	else if (sele == 2){
		setsheet2();
		tableDetailLoad2();
	}
	else{
		setsheet3();
		tableDetailLoad();
	}
});
	
</script>