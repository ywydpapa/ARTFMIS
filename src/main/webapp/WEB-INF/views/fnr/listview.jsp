<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.listrooms {
	width: 100%;
	padding: 20px;
	background: white;
}

.detailaltar {
	width: 100%;
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
		<table class="table"
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
			<table class="table" id="listTable">
				<thead>
					<tr>
						<th class="table-info" style="text-align:center">장례식장명</th>
						<th class="table-info" style="text-align:center">라이센스</th>
						<th class="table-info" style="text-align:center">사용자수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a href="javascript:fnSetupdetail('${path}/fnr/detail/${row.FNR_ID}')">${row.FNR_NAMEK}</a></td>
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
		var url ="${path}/fnr/detail/"+num;
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

function fn_setNewFnr(){
	url="${path}/fnr/detailnew.do";
	fnSetupdetail(url);
}

function fn_Insertfnr() {
	var fnrData = {};
	console.log(fnrData);
	alert("현재는 추가할 수 없습니다.");
	$.ajax({
		url : "${path}/fnr/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : fnrData, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
	.done(function(data) {
		if (data.code == 10001) {
			alert("저장 성공");
			var url ="${path}/fnr/listfnr.do";
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
	var fnrData = {};
	fnrData.FNR_ID = $("#fid").val();
	fnrData.FNR_NAMEK = $("#fnamek").val();
	fnrData.FNR_VATNO = $("#fvatno").val();
	fnrData.FNR_ADDR1 = $("#fadd1").val();
	fnrData.FNR_ADDR2 = $("#fadd2").val();
	fnrData.FNR_TELNO1 = $("#ftel1").val();
	fnrData.FNR_TELNO2 = $("#ftel2").val();
	fnrData.FNR_FAXNO = $("#ffax").val();
	fnrData.FNR_EMAIL = $("#femail").val();
	fnrData.FNR_URL = $("#fwww").val();
	fnrData.FNR_LOGO = $("#flogo").val();
	fnrData.FNR_STAMP = $("#fstamp").val();
	console.log(fnrData);
	$.ajax({
		url : "${path}/fnr/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : fnrData, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
	.done(function(data) {
		if (data.code == 10001) {
			alert("저장 성공");
			var url ="${path}/fnr/listfnr.do";
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
