<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.h-container:after {
	clear: both;
	display: block;
	content: ''
}

.h-container .item {
	float: left;
	width: 30%;
	height: 100%;
	text-align: center;
	padding:10px;
	border-right: 1px solid #ddd;
}

.h-container .item.cont {
	float: left;
	width: 70%;
	padding:10px;
	border-right: none;
	text-align: center;
}
</style>
<div class="listcategory">
	<table class="table nowrap">
		<colgroup>
			<col width="30%" />
			<col width="70%" />
		</colgroup>
		<tr>
			<td>
				<div class="col col-lg-12">
				분항실별 주문 내역
				</div>
			</td>
			<td>
			<div class="col col-lg-12">
					
				</div>
			</td>
		</tr>
	</table>
	<hr>
	<div class="h-container">
		<div class="item">
		<div id="ordlistTable">
			<table class="table table-hover table-bordered">
				<thead>
					<tr class="table-info">
						<th class="align-middle text-center" >주문호실</th>
						<th class="align-middle text-center" >주문구분</th>
						<th class="align-middle text-center" >주문시간</th>
						<th class="align-middle text-center" >확인</th>
						<th class="align-middle text-center" >미확인</th>
						<th class="align-middle text-center" >취소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${ordlist}">
						<tr>
							<td class="align-middle text-center">${row.FROOM_TITLE}</td>
							<td class="align-middle text-center"><a href="javascript:fnSetupdetail('${path}/room/orddetail2/${row.ORDDATE2}?CONTRACT_ID=${row.CONTRACT_ID}')">${row.ORDP}</a></td>
							<td class="align-middle text-center">${row.ORD_DATE}</td>
							<td class="align-middle text-center">${row.CCONFDATE}</td>
							<td class="align-middle text-center <c:if test="${row.CORDDATE ne '0'}">table-danger</c:if>"><c:if test="${row.CORDDATE eq '0'}"></c:if><c:if test="${row.CORDDATE ne '0'}">${row.CORDDATE}</c:if></td>
							<td class="align-middle text-center"<c:if test="${row.CCANCDATE eq '0'}"></c:if><c:if test="${row.CCANCDATE ne '0'}">style="background-color :#F7FE2E;color:#FF0000; font-weight:bolder"</c:if>><c:if test="${row.CCANCDATE ne '0'}">${row.CCANCDATE}</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<div class="item cont">
			<div id="detailTable" class="detailTable"></div>
		</div>
	</div>
</div>
<script>
function tableDetailLoad(){
	console.log( $("#ordlistTable > table > tbody > tr > td > a").length );
	var $target;
	var num1 = $("#ordlistTable > table > tbody > tr > td > a").length;
	if (num1 > 0){
			$target = $("#ordlistTable > table > tbody > tr > td > a");
	}
	if (num1 > 0){
		var tempArr = $target.eq(0).attr('href').split('/');
		var num = tempArr[tempArr.length - 1].replace(')','').replace('"','').replace('\'','');
		var url ="${path}/room/orddetail2/"+num;
		$.ajax({
			type: "GET",
			url : url,
			dataType : "html",
			success : function(html){
				$("#detailTable").empty();
				$("#detailTable").append(html);
			},
			error : function(xhr){
				console.log(xhr);
			}
		});
	} else {
	}
}

function tableListLoad(url){
	$.ajax({
		type: "GET",
		url : url,
		dataType : "html",
		success : function(html){
			$("#ordlistTable").empty();
			$("#ordlistTable").append(html);	
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

$(document).ready(function() {
	tableDetailLoad();	
});
	

</script>
