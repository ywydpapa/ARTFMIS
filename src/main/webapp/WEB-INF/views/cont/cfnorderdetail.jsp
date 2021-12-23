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
						<div class="table-responsive">
							<table class="table  table-bordered nowrap">
								<tr>
									<th style="text-align: right;">
										<!-- <button class="btn btn-primary" onclick="chkall()">전체선택</button>
										<button class="btn btn-primary" onclick="chkun()">전체선택해제</button> -->
										<button class="btn btn-danger" onclick="canccheckupdR()">주문취소</button>
									</th>
								</tr>
							</table>
						</div>
						<div class="table-responsive" style="overflow-x:hidden">
							<table id="MESS01"
								class="table table-bordered nowrap">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="5%" />
									<col width="10%" />
									<col width="10%" />
								</colgroup>
								<tr style="text-align: center;">
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">종류</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">제품명</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">단위</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">단가</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">주문수량</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">주문금액</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6"><a href="javascript:void(0);" onclick="chkall();">V</a>/<a href="javascript:void(0);" onclick="chkun();">X</a></th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">확인일자</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">취소일자</th>
								</tr>
								<tbody>
									<c:forEach var="row" items="${orddtl}">
										<tr>
											<td style="vertical-align:middle; text-align: center; background-color:#EFFBF8" class="first">${row.CAT_TITLE}</td>
											<td style="vertical-align:middle;"><input type="hidden" class="GID" value="${row.REST_ORD_ID}"/>${row.GOODS_TITLE}</td>
											<td style="vertical-align:middle;"><input type="hidden" class="ORDP" value="${row.ORDP}"/>${row.GOODS_UNIT}</td>
											<td style="text-align: right;vertical-align:middle;" class="infoM"><fmt:formatNumber
													value="${row.NET_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;vertical-align:middle;"><input
												class="MA" oninput="calculateM()"
												style="border: none; text-align: right;" type="number"
												min="0" max="100"
												value="${row.ORD_QUTY}" required readonly></td>
											<td class="MB" style="text-align: right;vertical-align:middle;"><fmt:formatNumber
													value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
											<td style="text-align:center;vertical-align:middle;"><input type="checkbox" <c:if test="${not empty row.CANC_DATE}">checked disabled</c:if> class="form-control CHKcfnR"><input class="ordRid" type="hidden" value="${row.REST_ORD_ID}"></td>													
											<td <c:if test="${empty row.CONF_DATE}">class="table-danger"</c:if> style="text-align:right;vertical-align:middle;">${row.CONF_DATE}</td>
											<td style="vertical-align:middle;text-align:center; <c:if test="${not empty row.CANC_DATE}">background-color :#F7FE2E;color:#FF0000 </c:if>">${row.CANC_DATE}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="btn_wr text-right mt-3">
						</div>
</div>
<script>					
	var i = 1;
	var str = undefined;
	var element = $(".first");
	var firstElement = undefined;
	element.each(function() {
		/* console.dir(i + $(this).text()); */
		if (str == undefined && firstElement == undefined) {
			str = $(".first")[0].innerText;
			firstElement = $(".first")[0];
			return;
		}
		if (str == $(this).text()) {
			i++;
			/* console.dir('--> ' + i + $(this).text()); */
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
	
	
	$(document).ready(function(){
		calculateM();
		chkcalM();
	})

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
	function chkun() {
		var $Sarr = $(".CHKcfnR");
		for (var i = 0; i < $Sarr.length; i++) {
			if($($Sarr[i]).is(":disabled")==false){
			$($Sarr[i]).prop("checked",false);
			}
		}
	}

	function chkall() {
		var $Marr = $(".CHKcfnR");
		for (var i = 0; i < $Marr.length; i++) {
			$($Marr[i]).prop("checked",true);			
		}
	}

	function cfncheckupdR(data){
		if(confirm("물품 수령을 확정하시겠습니까?")){
			var ques = prompt('주문암호를 입력해 주십시오.','주문암호');
			var opt = "1234";
			if(ques == opt){
			var $Aarr = $(".CHKcfnR");
			var $Barr = $(".ordRid");
			var $Carr = $(".ORDP");
			for (var i = 0; i < $Aarr.length; i++) {
				
				if($($Aarr[i]).is(":disabled")==false){
				if($($Aarr[i]).is(":checked")==true){
					if ($Carr[i].value == 'M'){
						var rData = {};
						rData.REST_ORD_ID = $Barr[i].value;	
						$.ajax({
							url : "${path}/room/updRord.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
							data : rData, // HTTP 요청과 함께 서버로 보낼 데이터 
							method : "POST", // HTTP 요청 메소드(GET, POST 등) 
							dataType : "json" // 서버에서 보내줄 데이터의 타입 
						}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
						.done(function(data) {
							
						})
						.fail(function(xhr, status, errorThrown) {
							alert("통신 실패");
						});
					}
					else if ($Carr[i].value == 'S'){
						var rData = {};
						rData.STORE_ORD_ID = $Barr[i].value;	
						$.ajax({
							url : "${path}/room/updSord.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
							data : rData, // HTTP 요청과 함께 서버로 보낼 데이터 
							method : "POST", // HTTP 요청 메소드(GET, POST 등) 
							dataType : "json" // 서버에서 보내줄 데이터의 타입 
						}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
						.done(function(data) {
						})
						.fail(function(xhr, status, errorThrown) {
							alert("통신 실패");
						});
					}
			}
				}
				else{}
			}
				var cid = $("#contid").val();
				tableListLoad("${path}/room/orderlistall.do");
	}else{
		alert("주문암호가 다릅니다.");
		return;
	}
			}
	}
	
	function canccheckupdR(data){
		if(confirm("물품 주문을 취소하시겠습니까?")){
			var $Aarr = $(".CHKcfnR");
			var $Barr = $(".ordRid");
			var $Carr = $(".ORDP");
			for (var i = 0; i < $Aarr.length; i++) {
				if($($Aarr[i]).is(":disabled")==false){
				if($($Aarr[i]).is(":checked")==true){
					if ($Carr[i].value == 'M'){
						var rData = {};
						rData.REST_ORD_ID = $Barr[i].value;	
						$.ajax({
							url : "${path}/room/cancRord.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
							data : rData, // HTTP 요청과 함께 서버로 보낼 데이터 
							method : "POST", // HTTP 요청 메소드(GET, POST 등) 
							dataType : "json" // 서버에서 보내줄 데이터의 타입 
						}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
						.done(function(data) {
						})
						.fail(function(xhr, status, errorThrown) {
							alert("통신 실패");
						});
					}
					else if ($Carr[i].value == 'S'){
						var rData = {};
						rData.STORE_ORD_ID = $Barr[i].value;	
						$.ajax({
							url : "${path}/room/cancSord.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
							data : rData, // HTTP 요청과 함께 서버로 보낼 데이터 
							method : "POST", // HTTP 요청 메소드(GET, POST 등) 
							dataType : "json" // 서버에서 보내줄 데이터의 타입 
						}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
						.done(function(data) {
						})
						.fail(function(xhr, status, errorThrown) {
							alert("통신 실패");
						});
					}
			}
				}
				else{}
			}
				var cid = $("#contid").val();
				tableListLoad("${path}/room/orderlistall.do",function(){selectedroom();});
				/* tableDetailLoad1(); */
			}
	}
	

</script>

