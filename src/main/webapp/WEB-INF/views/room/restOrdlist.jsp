<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
  .swcCard {
        width: 100%;
        height: 100%;
        padding : 20px;
        background: white;
      }
}
</style>
<div class="card-block table-border-style swcCard">
	<div class="table-responsive" style="overflow-x: hidden">
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
		<table class="table  table-bordered nowrap">
				<colgroup>
				<col width="20%" />
				<col width="20%" />
				<col width="60%" />
				</colgroup>
			<tr
				style="vertical-align: middle; text-align: left; background-color: #EFFBF8">
				<th style="vertical-align: middle;">식당품목 추가주문</th>
				<th style="vertical-align: middle;">
				<select class="form-control selRad" name="cat02" id="selCat02">
				<option value="999">전체 항목</option>
				<c:forEach var="row" items="${list2n}">
					<option value="${row.CAT_ID}"> ${row.CAT_TITLE}</option>
				</c:forEach>
				</select>
				</th>
				<th style="float: right"><button class="btn btn-md btn-primary"
						onClick="fn_addRest()">추가주문</button></th>
			</tr>
		</table>
	</div>
	<div>
		<div class="table-responsive" style="overflow-x: hidden;float:left;width:50%;padding:10px">
			<table id="MESS01" class="table table-bordered">
				<colgroup>
					<col width="20%" />
					<col width="25%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<tr style="text-align: center;">
					<th
						style="vertical-align: middle; text-align: center; background-color: #CED8F6">제품명</th>
					<th
						style="vertical-align: middle; text-align: center; background-color: #CED8F6">단위</th>
					<th
						style="vertical-align: middle; text-align: center; background-color: #CED8F6">기본금액</th>
					<th
						style="vertical-align: middle; text-align: center; background-color: #CED8F6">주문수량</th>
				</tr>
				<tbody>
					<c:forEach var="row" items="${doslist2}">
						<tr class="TRA">
							<td><input type="hidden" class="FRIDa" value="${frid}"><input
								type="hidden" class="GIDa" value="${row.GOODS_ID}">${row.GOODS_TITLE}
								<input type="hidden" class="CATa" value="${row.CAT_02_ID}">
								</td>
							<td>${row.GOODS_UNIT}</td>
							<td style="text-align: right;" class="infoMa"><fmt:formatNumber
									value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
							<td class="table-warning" style="text-align: right;"><input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
								class="from-control MA table-warning" 
								style="border: none; text-align: right;" type="text" min="0"
								max="100" step="<c:if test="${row.MESSR_GOODS_ADD_QTY ne null }">${row.MESSR_GOODS_ADD_QTY}</c:if>" value="0"
								required></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="table-responsive" style="overflow-x: hidden;float:left;width:50%;padding:10px">
			<table id="MESS02" class="table table-bordered">
				<colgroup>
					<col width="20%" />
					<col width="25%" />
					<col width="15%" />
					<col width="15%" />
					<col width="10%" />
				</colgroup>
				<tr style="text-align: center;">
					<th
						style="vertical-align: middle; text-align: center; background-color: #CED8F6">종류</th>
					<th
						style="vertical-align: middle; text-align: center; background-color: #CED8F6">제품명</th>
					<th
						style="vertical-align: middle; text-align: center; background-color: #CED8F6">단위</th>
					<th
						style="vertical-align: middle; text-align: center; background-color: #CED8F6">기본금액</th>
					<th
						style="vertical-align: middle; text-align: center; background-color: #CED8F6">추가주문수량</th>
				</tr>
				<tbody>
					<c:forEach var="row" items="${doslist2}">
						<tr class="TRB">
							<td
								style="vertical-align: middle; text-align: center; background-color: #EFFBF8"
								class="second">${row.CAT_TITLE}</td>
							<td><input type="hidden" class="FRID" value="${frid}"><input
								type="hidden" class="GID" value="${row.GOODS_ID}">${row.GOODS_TITLE}</td>
							<td>${row.GOODS_UNIT}</td>
							<td style="text-align: right;" class="infoM"><fmt:formatNumber
									value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
							<td style="text-align: right;"><input 
								class="from-control MB" 
								style="border: none; text-align: right;" type="text" min="0"
								max="100" readonly
								value="<c:if test="${row.MESSR_GOODS_ADD_QTY eq null }">0</c:if><c:if test="${row.MESSR_GOODS_ADD_QTY ne null }">${row.MESSR_GOODS_ADD_QTY}</c:if>"
								required></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	var i = 1;
	var str;
	var element = $(".first");
	var firstElement;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".first")[0].innerText;
			firstElement = $(".first")[0];
			return;
		}
		if (str == $(this).text()) {
			i++;
			console.dir('--> ' + i + $(this).text());
			$(this).remove();
		} else {
			$(firstElement).attr('rowspan', i);
			i = 1;
			str = $(this).text();
			firstElement = $(this);
		}
	});
	$(firstElement).attr('rowspan', i);
	
	function setSecond(){
		var k = 1;
		var str2;
		var element2 = $(".second");
		var firstElement2;
		element2.each(function() {
			if (str2 == undefined && firstElement2 == undefined) {
				str2 = $(".second")[0].innerText;
				firstElement2 = $(".first")[0];
				return;
			}
			if (str2 == $(this).text()) {
				k++;
				$(this).remove();
			} else {
				$(firstElement2).attr('rowspan', i);
				k = 1;
				str2 = $(this).text();
				firstElement2 = $(this);
			}
		});
		$(firstElement2).attr('rowspan', k);
	}


	$(document).ready(function() {
		setMb();
		zeroView();
		catView();
	})
	
	$(".MB, .MA").change(function() {
		setMb();
		zeroView();
	});
	
	$(".selRad").change(function() {
		catView();
	});
	
	function setMb(){
		$Aarr = $(".MA");
		$Barr = $(".MB");
		for (var i = 0; i < $Aarr.length; i++) {
			$Barr[i].value = $Aarr[i].value; 
		}
	}
	
	function setZero(){
		$Aarr = $(".MA");
		$Barr = $(".MB");
		for (var i = 0; i < $Aarr.length; i++) {
			$Barr[i].value = 0;
			$Aarr[i].value = 0;
		}
		zeroView();
	}

	
	function zeroView(){
		$Aarr = $(".TRB");
		$Barr = $(".MB");
		for (var i = 0; i < $Aarr.length; i++) {
			if ($Barr[i].value == 0){
				$Aarr[i].style.display='none';
			}
			else
				{
				$Aarr[i].style.display='';
				}
		}
	}
	
	function catView(){
		var selRadio = $('#selCat02').val();
		$Aarr= $(".TRA");
		$Barr= $(".CATa");
		for (var i = 0; i < $Aarr.length; i++) {
			if ($Barr[i].value == selRadio || selRadio == 999)
				{
				$Aarr[i].style.display='';
				}
			else
				{
				$Aarr[i].style.display='none';
				}
		}
	}

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function fn_addRest() {
		var CONid = $("#contid").val();
		if (CONid != "") {
			var froomid = $('#frid').val();
			var $Gidarr = $(".GID");
			var $Barr = $(".MB");
			var $infoarr = $(".infoM");
			for (var i = 0; i < $infoarr.length; i++) {
				if ($Barr[i].value > 0) {
					var contp6data = {};
					contp6data.CONTRACT_ID = CONid;
					contp6data.ROOM_TITLE = froomid;
					contp6data.GOODS_CODE = $Gidarr[i].value;
					contp6data.NET_PRICE = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
					contp6data.ORD_TYPE = "2";
					contp6data.ORD_QUTY = $Barr[i].value;
					var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
					var t2 = Number($Barr[i].value);
					var t3 = t1*t2;
					contp6data.ORD_AMOUNT = t3; 
					console.log(contp6data);
					$.ajax({
						url : "${path}/cont/insertP6.do",
						data : contp6data,
						method : "POST",
						dataType : "json"
					}).done(function(data) {
					});
				}
			}
			alert("저장성공");
			setZero();
		} else {
			alert("계약사항을 확인해 주세요!!");
		}
	}
	
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