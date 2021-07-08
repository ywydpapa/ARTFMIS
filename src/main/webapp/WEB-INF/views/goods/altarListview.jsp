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
	text-align: center;
	border-right: 1px solid #ddd;
}

.h-container .item.cont {
	float: left;
	width: 58%;
	border-right: none;
	text-align: center;
}
</style>
<div class="listrooms">
		<table class="table table-bordered nowrap"
		style="width: 50%;">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<td>제단구분</td>
			<td><select name="ALTAR_TYP" id="ALTAR_TYP"
				class="form-control form-control-sm">
				<c:forEach var ="row" items="${clist}">
				<option value="${row.BCD_ID}">${row.BCD_TITLE}</option>				
				</c:forEach>
			</select></td>
		</tr>
</table>
<hr>
	<div class="h-container">
		<div class="item">
			<table class="table table-striped table-bordered nowrap"
				id="roomTable">
				<thead>
					<tr>
						<th scope="col" width="100" align="center">제단구분</th>
						<th scope="col" width="200" align="center">제단명</th>
						<th scope="col" width="100" align="center">금액</th>
						<th scope="col" width="100" align="center">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td class="first"><c:if test="${row.ALTAR_CAT eq '102'}">제단</c:if><c:if test="${row.ALTAR_CAT eq '103'}">헌화</c:if> </td>
							<td><a href="javascript:fnSetAltardetail('${path}/goods/detailAltar/${row.ALTAR_ID}')">${row.ALTAR_TITLE}</a></td>
							<td style="text-align: right"><fmt:formatNumber value="${row.ALTAR_AMOUNT}" pattern="#,###" /></td>
							<td><c:if test="${row.ALTAR_USE_YN eq 'Y'}">사용</c:if><c:if test="${row.ALTAR_USE_YN eq 'N'}">미사용</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
		<div class="item cont">
			<div id="detailaltar" class="detailaltar"></div>
		</div>
	</div>
</div>
<script>
$("#ALTAR_TYP").change(function(){
	var url ="${path}/goods/listAltar/"+$("#ALTAR_TYP").val();
	tableListLoad(url);
	var newname = $('#ALTAR_TYP').text();
	$('#typename').val(newname);
});

function fnSetAltardetail(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#detailaltar").empty();
		$("#detailaltar").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}


function fn_Updatealtar() {
	var altarData = {};
	altarData.ALTAR_ID = $("#altarID").val();
	altarData.ALTAR_CAT = $("#ALTAR_TYP").val();
	altarData.ALTAR_TITLE = $("#altarTitle").val();
	altarData.ALTAR_AMOUNT = $("#priceSale").val().replace(/[\D\s\._\-]+/g, "");
	altarData.ALTAR_USE_YN = $("#useYn").val();
	altarData.ALTAR_REMARK = $("#altarRemark").val();
	altarData.ALTAR_NET_PRICE = $("#priceNet").val().replace(/[\D\s\._\-]+/g, "");
	altarData.ALTAR_QTY = $("#intQty").val();
	altarData.ALTAR_IMAGE = $("#uploadServerImageName").val();
	console.log(altarData);
	$.ajax({
		url : "${path}/goods/updateAltar.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : altarData, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
	.done(function(data) {
		if (data.code == 10001) {
			alert("저장 성공");
			var url ="${path}/goods/listAltar/"+$("#ALTAR_TYP").val();
			console.log(url);
			tableListLoad(url);
			} else {
			alert("저장 실패");
		}
	}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
	.fail(function(xhr, status, errorThrown) {
		alert("통신 실패");
	});
}

function fn_Insertaltar() {
	var altarData = {};
	altarData.ALTAR_CAT = $("#ALTAR_TYP").val();
	altarData.ALTAR_TITLE = $("#altarTitle").val();
	altarData.ALTAR_AMOUNT = $("#priceSale").val().replace(/[\D\s\._\-]+/g, "");
	altarData.ALTAR_USE_YN = $("#useYn").val();
	altarData.ALTAR_REMARK = $("#altarRemark").val();
	altarData.ALTAR_NET_PRICE = $("#priceNet").val().replace(/[\D\s\._\-]+/g, "");
	altarData.ALTAR_QTY = $("#intQty").val();
	altarData.ALTAR_IMAGE = $("#uploadServerImageName").val();
	console.log(altarData);
	$.ajax({
		url : "${path}/goods/insertAltar.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : altarData, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
	.done(function(data) {
		if (data.code == 10001) {
			alert("저장 성공");
			var url ="${path}/goods/listAltar/"+$("#ALTAR_TYP").val();
			console.log(url);
			tableListLoad(url);
		} else {
			alert("저장 실패");
		}
	}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
	.fail(function(xhr, status, errorThrown) {
		alert("통신 실패");
	});
}



function fn_setinsert(){
	$('#udtbtn').hide();
	$('#istbtn').show();
	fn_setclear();
}

function fn_setclear(){
	$("#altarTitle").val("");
	$("#priceSale").val("");
	$("input[name=altarImage]").val("");
	$("#useYn").val("Y");
	$("#altarRemark").val("");
	$('#priceNet').val("");
}


function tableListLoad(url){
	$.ajax({
		type: "GET",
		url : url,
		dataType : "html",
		success : function(html){
			$("#roomTable").empty();
			$("#roomTable").append(html);	
			tableDetailLoad();
		},
		error : function(xhr){
			console.log(xhr);
		}
	});
}

function tableDetailLoad(){
	console.log( $("#roomTable > tbody > tr > td > a").length );
	console.log( $("#goodsTable > tbody > tr > td > a").length );
	var $target;
	var num1 = $("#roomTable > tbody > tr > td > a").length;
	var num2 = $("#goodsTable > tbody > tr > td > a").length;
	if (num1 > 0 || num2 > 0){
		if (num1 > 0){
			$target = $("#roomTable > tbody > tr > td > a");
		} else {
			$target = $("#goodsTable > tbody > tr > td > a");
		}
	}
	
	if (num1 > 0 || num2 > 0){
		var tempArr = $target.eq(0).attr('href').split('/');
		var num = tempArr[tempArr.length - 1].replace(')','').replace('"','').replace('\'','');
		var url ="${path}/goods/detailAltar/"+num;
		$.ajax({
			type: "GET",
			url : url,
			dataType : "html",
			success : function(html){
				$("#detailaltar").empty();
				$("#detailaltar").append(html);
			},
			error : function(xhr){
				console.log(xhr);
			}
		});
	} else {
		fn_setclear();
	}
}

$(".first").each(function() {
	  var rows = $(".first:contains('" + $(this).text() + "')");
	  if (rows.length > 1) {
	    rows.eq(0).attr("rowspan", rows.length);
	    rows.not(":eq(0)").remove();
	  }
	});

$(document).ready(function(){
	tableDetailLoad();
});

</script>
