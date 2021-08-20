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
						<div class="table-responsive" style="overflow-x:hidden">
							<table class="table  table-bordered nowrap">
								<tr style="vertical-align:middle; text-align: left;background-color:#EFFBF8">
									<th style="vertical-align:middle;">매점품목 추가주문</th>
									<th style="float:right"><button class="btn btn-md btn-primary" onClick="fn_addStore()">추가주문</button></th>
								</tr>
							</table>
						</div>
						<div class="table-responsive" style="overflow-x:hidden">
							<table class="table  table-bordered nowrap">
								<colgroup>
									<col width="10%" />
									<col width="25%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="20%" />
								</colgroup>
								<tr>
									<th colspan="2" style="text-align: center;">분류</th>
									<th colspan="8" style="text-align: center;">상세정보</th>
								</tr>
								<tr style="text-align: center;">
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">종류</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">제품명</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">단위</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">개당단가</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">기본금액</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">주문수량</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">주문금액</th>
								</tr>
								<tbody>
									<c:forEach var="row" items="${doslist3}">
										<tr>
											<td style="vertical-align:middle; text-align: center; background-color:#EFFBF8" class="first">${row.CAT_TITLE}</td>
											<td><input type="hidden" class="FRID" value="${frid}"><input
												type="hidden" class="GID" value="${row.GOODS_ID}">${row.GOODS_TITLE}</td>
											<td>${row.GOODS_UNIT}</td>
											<td style="text-align: right;"><fmt:formatNumber
													value="${row.GOODS_NET_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;" class="infoS"><fmt:formatNumber
													value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
											<td class="table-warning" style="text-align: right;"><input class="from-control SA table-warning" oninput="calculateS()"
												style="border: none; text-align: right;" type="text" min="0" max="100" value="<c:if test="${row.STORE_GOODS_ADD_QTY eq null }">0</c:if><c:if test="${row.STORE_GOODS_ADD_QTY ne null }">${row.STORE_GOODS_ADD_QTY}</c:if>"
												required></td>
											<td class="SB" style="text-align: right;"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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

	function calculateS() {
		var $infoarr = $(".infoS");
		var $Aarr = $(".SA");
		var $Barr = $(".SB");
		for (var i = 0; i < $infoarr.length; i++) {
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			$Barr[i].innerText = numberWithCommas(Number($Aarr[i].value) * t1);
		}
		chkcalS();
	}
	
	function chkcalS() {
		var $Barr = $(".SB");
		var chksum = 0;
		for (var i = 0; i < $Barr.length; i++) {
			var b1 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			chksum = chksum + b1;
		}
		$('#storegrandtotal').val(numberWithCommas(chksum));
	}
	
	$(".SB, .SA").change(function() {
		calculateS();
		chkcalS();
	});
	
	$(document).ready(function(){
		calculateS();
		chkcalS();
	})

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function fn_addStore(){
			var CONid = $("#contid").val();
			if (CONid != ""){
			var froomid = $('#frid').val();
			var $Gidarr =  $(".GID");
			var $Aarr =  $(".SA");
			var $Barr =  $(".SB");
			var $infoarr =  $(".infoS");
			for (var i=0; i<$Aarr.length; i++){
			if($Aarr[i].value > 0){
			var contp7data = {};
			contp7data.CONTRACT_ID = CONid;
			contp7data.ROOM_TITLE = froomid;
			contp7data.GOODS_CODE = $Gidarr[i].value;
			contp7data.NET_PRICE = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
			contp7data.ORD_QUTY = $Aarr[i].value;
			contp7data.ORD_TYPE = "2";
			contp7data.ORD_AMOUNT = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
			console.log(contp7data);
			$.ajax({
				url : "${path}/cont/insertP7.do",  
				data : contp7data,  
				method : "POST",  
				dataType : "json"  
			})
			.done(function(data) {
			});
			}
			}
			alert("저장성공");
			}
			else
				{
				alert("계약사항을 먼저 확인해 주세요!!");
				}
		}		
	
	
	
</script>