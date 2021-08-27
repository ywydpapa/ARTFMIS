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
					<div class="card h-40">
						<h5 class="card-header"> 분향실 : ${USER_NAMK}</h5>
						<div class="card-body">
							<div style="float:left">
							<p class="card-text"><h5>고인명 : ${cont.DPERSON_NAME}</h5></p>
							<p class="card-text"><h5>상주 : ${cont.SANGJU_NAME}</h5></p>
							</div>
							<div style="float:right">
							<canvas id="canvas" width="100" height="100" style="background-color:white"></canvas>
							</div>
						</div>
					</div>
				</div>
			</td>
			<td>
			<div class="col col-lg-12">
					<div class="card h-100">
						<h6 class="card-header"> 주문 시간 안내</h6>
						<div class="card-body">
							<div class="card-deck">
							<c:forEach var="row" items="${time}">
							<div style="float:left" class="card bg-light" style="max-width: 18rem;">
  								<div style="text-align:center" class="card-header"><h5>${row.SETUP_TITLE}</h5></div>
  								<div style="text-align:center" class="card-body">
    								<h5 class="card-title">${row.START_TIME}<span> ~ </span>${row.END_TIME}</h5>
  								</div>
							</div>
							</c:forEach>
							</div>
						</div>
					</div>
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
						<th class="align-middle text-center" >주문구분</th>
						<th class="align-middle text-center" >주문시간</th>
						<th class="align-middle text-center" >확인</th>
						<th class="align-middle text-center" >미확인</th>
						<th class="align-middle text-center" >취소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${ord}">
						<tr>
							<td class="align-middle text-center"><a href="javascript:fnSetupdetail('${path}/room/orddetail/${row.ORDDATE2}?CONTRACT_ID=${row.CONTRACT_ID}')">${row.ORDP}</a></td>
							<td class="align-middle text-center">${row.ORD_DATE}</td>
							<td class="align-middle text-center">${row.CCONFDATE}</td>
							<td class="align-middle text-center <c:if test="${row.CORDDATE ne '0'}">table-danger</c:if>"><c:if test="${row.CORDDATE eq '0'}"></c:if><c:if test="${row.CORDDATE ne '0'}">${row.CORDDATE}</c:if></td>
							<td class="align-middle text-center"><c:if test="${row.CCANCDATE eq '0'}"></c:if><c:if test="${row.CCANCDATE ne '0'}">${row.CCANCDATE}</c:if></td>
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
		var url ="${path}/room/orddetail/"+num;
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
	
var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");
var radius = canvas.height / 2;
ctx.translate(radius, radius);
radius = radius * 0.90
setInterval(drawClock, 1000);

function drawClock() {
  drawFace(ctx, radius);
  drawNumbers(ctx, radius);
  drawTime(ctx, radius);
}

function drawFace(ctx, radius) {
  var grad;
  ctx.beginPath();
  ctx.arc(0, 0, radius, 0, 2*Math.PI);
  ctx.fillStyle = 'white';
  ctx.fill();
  grad = ctx.createRadialGradient(0,0,radius*0.95, 0,0,radius*1.05);
  grad.addColorStop(0, '#333');
  grad.addColorStop(0.5, 'white');
  grad.addColorStop(1, '#333');
  ctx.strokeStyle = grad;
  ctx.lineWidth = radius*0.1;
  ctx.stroke();
  ctx.beginPath();
  ctx.arc(0, 0, radius*0.1, 0, 2*Math.PI);
  ctx.fillStyle = '#333';
  ctx.fill();
}

function drawNumbers(ctx, radius) {
  var ang;
  var num;
  ctx.font = radius*0.15 + "px arial";
  ctx.textBaseline="middle";
  ctx.textAlign="center";
  for(num = 1; num < 13; num++){
    ang = num * Math.PI / 6;
    ctx.rotate(ang);
    ctx.translate(0, -radius*0.85);
    ctx.rotate(-ang);
    ctx.fillText(num.toString(), 0, 0);
    ctx.rotate(ang);
    ctx.translate(0, radius*0.85);
    ctx.rotate(-ang);
  }
}

function drawTime(ctx, radius){
    var now = new Date();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var second = now.getSeconds();
    //hour
    hour=hour%12;
    hour=(hour*Math.PI/6)+
    (minute*Math.PI/(6*60))+
    (second*Math.PI/(360*60));
    drawHand(ctx, hour, radius*0.5, radius*0.07);
    //minute
    minute=(minute*Math.PI/30)+(second*Math.PI/(30*60));
    drawHand(ctx, minute, radius*0.8, radius*0.07);
    // second
    second=(second*Math.PI/30);
    drawHand(ctx, second, radius*0.9, radius*0.02);
}

function drawHand(ctx, pos, length, width) {
    ctx.beginPath();
    ctx.lineWidth = width;
    ctx.lineCap = "round";
    ctx.moveTo(0,0);
    ctx.rotate(pos);
    ctx.lineTo(0, -length);
    ctx.stroke();
    ctx.rotate(-pos);
}
</script>
