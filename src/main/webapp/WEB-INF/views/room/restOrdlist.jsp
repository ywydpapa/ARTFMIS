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
							<table class="table table-sm bst02">
								<tbody>
									<tr>
										<th scope="row">식당품목 선택</th>
										<td align="right"></td>
									</tr>
								</tbody>
							</table>
							<table class="table  table-bordered nowrap">
								<tr>
									<td style="text-align: right;background-color:#EFFBF8"><span>선택된 주문 총액 :</span><input
										type="text" id="messgrandtotal"
										style="text-align: right; border: none;background-color:#EFFBF8" readonly></td>
								</tr>
							</table>
						</div>
						<div class="table-responsive" style="overflow-x:hidden">
							<table id="MESS01"
								class="table  table-bordered nowrap">
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
									<c:forEach var="row" items="${doslist2}">
										<tr>
											<td style="vertical-align:middle; text-align: center; background-color:#EFFBF8" class="first">${row.CAT_TITLE}</td>
											<td><input type="hidden" class="FRID" value="${frid}"><input
												type="hidden" class="GID" value="${row.GOODS_ID}">${row.GOODS_TITLE}</td>
											<td>${row.GOODS_UNIT}</td>
											<td style="text-align: right;"><fmt:formatNumber
													value="${row.GOODS_NET_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;" class="infoM"><fmt:formatNumber
													value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;"><input
												class="from-control MA" oninput="calculateM()"
												style="border: none; text-align: right;" type="number"
												min="0" max="100"
												value="<c:if test="${row.MESSR_GOODS_ADD_QTY eq null }">0</c:if><c:if test="${row.MESSR_GOODS_ADD_QTY ne null }">${row.MESSR_GOODS_ADD_QTY}</c:if>"
												required></td>
											<td class="MB" style="text-align: right;"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="btn_wr text-right mt-3">
							<button class="btn btn-md btn-primary"
								onClick="fn_addRest()">추가주문</button>
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

	function calculateM() {
		var $infoarr = $(".infoM");
		var $Aarr = $(".MA");
		var $Barr = $(".MB");
		for (var i = 0; i < $infoarr.length; i++) {
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			$Barr[i].innerText = numberWithCommas(Number($Aarr[i].value)*t1);
		}
		chkcalM();
	}
	
	function chkcalM() {
		var $Barr = $(".MB");
		var chksum = 0;
		for (var i = 0; i < $Barr.length; i++) {
			var b1 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			chksum = chksum + b1;
		}
		$('#messgrandtotal').val(numberWithCommas(chksum));
	}
	
	
	$(".MB, .MA").change(function() {
		calculateM();
		chkcalM();
	});
	
	$(document).ready(function(){
		calculateM();
		chkcalM();
	})

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function fn_addRest(){
			var CONid = $("#contid").val();
			if (CONid != ""){
			var froomid = $('#frid').val();
			var $Gidarr =  $(".GID");
			var $Aarr =  $(".MA");
			var $Barr =  $(".MB");
			var $infoarr =  $(".infoM");
			for (var i=0; i<$Aarr.length; i++){
			if($Aarr[i].value > 0){
			var contp6data = {};
			contp6data.CONTRACT_ID = CONid;
			contp6data.ROOM_TITLE = froomid;
			contp6data.GOODS_CODE = $Gidarr[i].value;
			contp6data.NET_PRICE = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
			contp6data.ORD_TYPE = "2";
			contp6data.ORD_QUTY = $Aarr[i].value;
			contp6data.ORD_AMOUNT = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
			console.log(contp6data);
			$.ajax({
				url : "${path}/cont/insertP6.do",  
				data : contp6data,  
				method : "POST",  
				dataType : "json"  
			})
			.done(function(data) {
			});
			}
			}
			alert("저장성공");
			var urll ="${path}/room/orderlist/"+CONid; 
			fnSetPage(urll);
			}
			else
				{
				alert("계약사항을 확인해 주세요!!");
				}
		}		
	
</script>