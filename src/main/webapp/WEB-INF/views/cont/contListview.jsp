<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.listcont {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

.detailcont {
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
	width: 15%;
	height: 100%;
	padding: 15px;
	text-align: center;
	background: white;
	border-right: 1px solid #ddd;
}

.h-container .item.cont {
	float: left;
	width: 78%;
	padding: 15px;
	border-right: none;
	text-align: center;
}
</style>
<div class="listcont">
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						<h5>계약관리</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<table class="table table-bordered nowrap"
		style="width: 50%;">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
		</colgroup>
		<tr style="display:none">
			<td>호실현황</td>
			<td><select name="FROOM_SEL" id="FROOM_SEL" class="form-control form-control-sm">
					<c:forEach var="row" items="${listFroom}">
					<option value="${path}/cont/write/${row.FROOM_ID}?FROOM_TITLE=${row.FROOM_TITLE}">${row.FROOM_TITLE}</option>
					</c:forEach>
				</select></td>
		</tr>
</table>
	<div class="h-container">
		<div class="item">
	<table class="table table-bordered nowrap" id="roomTable">
				<thead>
					<tr>
						<th scope="col" width="200" align="center">계약 단계</th>
					</tr>
				</thead>
				<tbody>
						<tr class="active">
							<td><a href="javascript:tab01active()">계약기본</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab02active()">분향실</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab03active()">제물상</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab04active()">장의용품</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab05active()">제단</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab06active()">식당</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab07active()">매점</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab08active()">기타시설</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab09active()">안내문</a></td>
						</tr>
				</tbody>
			</table>
		</div>
		<div class="item cont">
			<div id="detailftable" class="detailftable"></div>
		</div>
	</div>
</div>
<script>

function fnSetcontdetail(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#detailftable").empty();
		$("#detailftable").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
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


$("#FROOM_SEL").change(function(){
	var a = $("#FROOM_SEL option:selected").val();
	console.log(a);
	var url =a;
	fnSetcontdetail(url);
	var newname = $('#FROOM_SEL').text();
	$('#pagetitle').val(newname);
});


$(document).ready(function(){
			var a = $("#FROOM_SEL option:selected").val();
		console.log(a);
		var url =a;
		fnSetcontdetail(url);
		var newname = $('#FROOM_SEL').text();
		$('#pagetitle').val(newname);
});
	
</script>
