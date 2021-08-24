<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.swcCard {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}
}
</style>
<div class="card-block table-border-style swcCard">
	<div class="table-responsive" style="overflow-x: hidden">
		<table class="table  table-bordered nowrap">
			<tr
				style="vertical-align: middle; text-align: left; background-color: #EFFBF8">
				<th style="vertical-align: middle;">매점품목 추가주문</th>
				<th style="float: right"><button class="btn btn-md btn-primary"
						onClick="fn_addStore()">추가주문</button></th>
			</tr>
		</table>
	</div>
	<div>
		<div style="float: left; width: 20%; padding: 10px">
			<table id="MESST" class="table table-bordered">
				<colgroup>
					<col width="10%" />
					<col width="90%" />
				</colgroup>
				<tr>
					<td class="align-middle"><input type="radio" class="selRad"
						name="cat02" value="999" checked></td>
					<td class="align-middle">전체</td>
				</tr>
				<c:forEach var="row" items="${list2n}">
					<tr>
						<td class="align-middle"><input type="radio" name="cat02"
							class="selRad" value="${row.CAT_ID}"></td>
						<td class="align-middle">${row.CAT_TITLE}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="table-responsive"
			style="overflow-x: hidden; float: left; width: 40%; padding: 10px">
			<table id="STORE01" class="table table-bordered">
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
					<c:forEach var="row" items="${doslist3}">
						<tr class="TRA">
							<td><input type="hidden" class="FRIDa" value="${frid}"><input
								type="hidden" class="GIDa" value="${row.GOODS_ID}">${row.GOODS_TITLE}
								<input type="hidden" class="CATa" value="${row.CAT_02_ID}"></td>
							<td>${row.GOODS_UNIT}</td>
							<td style="text-align: right;" class="infoSa"><fmt:formatNumber
									value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
							<td class="table-warning" style="text-align: right;"><input
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
								class="from-control SA table-warning"
								style="border: none; text-align: right;" type="text" min="0"
								max="100" value="0"
								step="<c:if test="${row.STORE_GOODS_ADD_QTY ne null }">${row.STORE_GOODS_ADD_QTY}</c:if>"
								required></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="table-responsive"
			style="overflow-x: hidden; float: left; width: 40%; padding: 10px">
			<table id="STORE02" class="table table-bordered">
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
					<c:forEach var="row" items="${doslist3}">
						<tr class="TRB">
							<td
								style="vertical-align: middle; text-align: center; background-color: #EFFBF8"
								class="second">${row.CAT_TITLE}</td>
							<td><input type="hidden" class="FRID" value="${frid}"><input
								type="hidden" class="GID" value="${row.GOODS_ID}">${row.GOODS_TITLE}</td>
							<td>${row.GOODS_UNIT}</td>
							<td style="text-align: right;" class="infoS"><fmt:formatNumber
									value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
							<td style="text-align: right;"><input
								class="from-control SB" style="border: none; text-align: right;"
								type="text" min="0" max="100" readonly
								value="<c:if test="${row.STORE_GOODS_ADD_QTY eq null }">0</c:if><c:if test="${row.STORE_GOODS_ADD_QTY ne null }">${row.STORE_GOODS_ADD_QTY}</c:if>"
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
	var str = undefined;
	var element = $(".first");
	var firstElement = undefined;
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


	$(".SB, .SA").change(function() {
		setSb();
		zeroView();
	});
	
	$(".selRad").change(function() {
		catView();
	});

	$(document).ready(function() {
		setSb();
		zeroView();
		catView();
	})
	
	function setSb(){
		$Aarr = $(".SA");
		$Barr = $(".SB");
		for (var i = 0; i < $Aarr.length; i++) {
			$Barr[i].value = $Aarr[i].value; 
		}
	}
	
	function setZero(){
		$Aarr = $(".SA");
		$Barr = $(".SB");
		for (var i = 0; i < $Aarr.length; i++) {
			$Barr[i].value = 0;
			$Aarr[i].value = 0;
		}
		zeroView();
	}

	
	function zeroView(){
		$Aarr = $(".TRB");
		$Barr = $(".SB");
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
		var selRadio = $('input[name="cat02"]:checked').val();
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

	function fn_addStore() {
		var CONid = $("#contid").val();
		if (CONid != "") {
			var froomid = $('#frid').val();
			var $Gidarr = $(".GID");
			var $Barr = $(".SB");
			var $infoarr = $(".infoS");
			for (var i = 0; i < $infoarr.length; i++) {
				if ($Barr[i].value > 0) {
					var contp7data = {};
					contp7data.CONTRACT_ID = CONid;
					contp7data.ROOM_TITLE = froomid;
					contp7data.GOODS_CODE = $Gidarr[i].value;
					contp7data.NET_PRICE = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
					contp7data.ORD_TYPE = "2";
					contp7data.ORD_QUTY = $Barr[i].value;
					var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
					var t2 = Number($Barr[i].value);
					var t3 = t1*t2;
					contp7data.ORD_AMOUNT = t3; 
					console.log(contp7data);
					$.ajax({
						url : "${path}/cont/insertP7.do",
						data : contp7data,
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
</script>