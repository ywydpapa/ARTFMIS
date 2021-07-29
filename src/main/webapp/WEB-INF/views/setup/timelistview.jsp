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
			<td>안내 위치</td>
			<td>분향실 주문 관리</td>
		</tr>
</table>
<hr>
	<div class="h-container">
		<div class="item">
			<table class="table table-striped table-bordered nowrap" id="listTable">
				<thead>
					<tr>
						<th scope="col" width="10%" style="text-align:center">구분</th>
						<th scope="col" width="15%" style="text-align:center">운영시작시간</th>
						<th scope="col" width="15%" style="text-align:center">운영종료시간</th>
						<th scope="col" width="30%" style="text-align:center">문구설명</th>
						<th scope="col" width="20%" style="text-align:center">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a href="javascript:fnSetupdetail('${path}/setup/timedetail/${row.SETUP_ID}')">${row.SETUP_TITLE}</a></td>
							<td>${row.START_TIME}</td>
							<td>${row.END_TIME}</td>
							<td>${row.SETUP_DESC}</td>
							<td><c:if test="${row.USE_YN eq 'Y'}">사용</c:if><c:if test="${row.USE_YN eq 'N'}">미사용</c:if></td>
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
		var url ="${path}/setup/timedetail/"+num;
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
		fn_setNewTime();
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

function fn_setNewTime(){

	url="${path}/setup/timedetailnew.do";
	fnSetupdetail(url);
		$("#SETUP_ID").val("");
		$("#setupTitle").val("");
		$("#setupContents").val("");
		$("#setupDesc").val("");
		$("#useYn").val("Y");
		$("#uptbtn").hide();
		$("#insbtn").show();
}

function fn_Insertsetuptime() {
	var setupData = {};
	setupData.SETUP_TITLE = $("#setupTitle").val();
	setupData.START_TIME = $("#stime").val();
	setupData.END_TIME = $("#etime").val();
	setupData.SETUP_DESC = $("#setupDesc").val();
	setupData.SETUP_TYPE = 'TIME';
	setupData.USE_YN = $("#useYn").val();
	console.log(setupData);
	$.ajax({
		url : "${path}/setup/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : setupData, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
	.done(function(data) {
		if (data.code == 10001) {
			alert("저장 성공");
			var url ="${path}/setup/timelistsetup.do";
			tableListLoad(url);
		} else {
			alert("저장 실패");
		}
	}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
	.fail(function(xhr, status, errorThrown) {
		alert("통신 실패");
	});
}

function fn_Updatesetuptime() {
	var setupData = {};
	setupData.SETUP_ID = $("#setupId").val();
	setupData.SETUP_TITLE = $("#setupTitle").val();
	setupData.START_TIME = $("#stime").val();
	setupData.END_TIME = $("#etime").val();
	setupData.SETUP_DESC = $("#setupDesc").val();
	setupData.USE_YN = $("#useYn").val();
	console.log(setupData);
	$.ajax({
		url : "${path}/setup/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : setupData, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
	.done(function(data) {
		if (data.code == 10001) {
			alert("저장 성공");
			var url ="${path}/setup/timelistsetup.do";
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
