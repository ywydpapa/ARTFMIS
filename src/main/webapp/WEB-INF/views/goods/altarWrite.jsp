<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
				  제물상/제단 등록 
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->

<!--제물상/제단 등록-->
<div class="cnt_wr">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table class="table table-sm bst02">
						<colgroup>
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제물상/제단 구분</th>
								<td><label class="checkbox-inline"> <input
										type="radio" name="type" value="altA" checked />제물상
								</label> <label class="checkbox-inline"> <input type="radio"
										name="type" value="altB" />제단
								</label></td>
								<th scope="row">상품 구분</th>
								<td><select name="altarTypeb" id="altarTypeb"
									class="form-control form-control-sm alt_C">
										<option value="">선택해주십시오.</option>
										<c:forEach var="listCodealtar" items="${listCodealtar}">
											<option value="${listCodealtar.CAT_ID}">${listCodealtar.CAT_TITLE}</option>
										</c:forEach>
								</select> <select name="altarTypea" id="altarTypea"
									class="form-control form-control-sm alt_D">
										<option value="">선택해주십시오.</option>
										<c:forEach var="listCodeftable" items="${listCodeftable}">
											<option value="${listCodeftable.CAT_ID}">${listCodeftable.CAT_TITLE}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr class="alt_B">
								<th scope="row">단가</th>
								<td><input type="text"
									class="form-control num_only num_comma num_sum" id="priceNet"
									name="priceNet" value="" placeholder="">
								</td>
								<th scope="row">기본수량</th>
								<td><input type="text"
									class="form-control num_only num_comma num_sum" id="intQty"
									name="intQty" value="" placeholder="">
								</td>
							</tr>
							<tr">
								<th scope="row">상품명</th>
								<td colspan="3"><input type="text"
									class="form-control"
									id="altarTitle" name="altarTitle" value="" placeholder="">
							</tr>
							<tr class="alt_A">
								<th scope="row">판매금액</th>
								<td colspan="3"><input type="text"
									class="form-control text-right font-weight-bold num_only num_comma num_sum"
									id="priceSale" name="priceSale" value="" placeholder="">
							</tr>
							<tr>
								<th scope="row">이미지등록</th>
								<td><input type="file" style="text-align: right;"
									class="form-control form-control-sm" name="altarImage">
								</td>
								<th scope="row">사용여부</th>
								<td><select name="useYn" id="useYn"
									class="form-control form-control-sm">
										<option value="Y">사용</option>
										<option value="N">미사용</option>
								</select></td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="3"><textarea name="altarRemark" id="altarRemark"
										rows="8" class="form-control"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-primary alt_C" onClick="fn_Insertaltar()">제물상저장</button>
				<button class="btn btn-md btn-primary alt_D" onClick="fn_Insertftable()">제단저장</button>
				<button class="btn btn-md btn-inverse alt_C" onclick="javasctipt:fnSetPage('${path}/goods/listAltar.do')">목록</button>
				<button class="btn btn-md btn-inverse alt_D" onclick="javasctipt:fnSetPage('${path}/goods/listFtable.do')">목록</button>
			</div>
		</div>
	</div>
</div>
<!--//상품등록-->

	<script>
		function fn_Insertaltar() {
			var altarData = {};
			altarData.ALTAR_CAT = $("#altarTypeb").val();
			altarData.ALTAR_TITLE = $("#altarTitle").val();
			altarData.ALTAR_AMOUNT = $("#priceSale").val();
			altarData.ALTAR_USE_YN = $("#useYn").val();
			altarData.ALTAR_REMARK = $("#altarRemark").val();
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
					fnSetPage('${path}/goods/listAltar.do');
				} else {
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

		function fn_Insertftable() {
			var altarData = {};
			altarData.FTABLE_CAT = $("#altarTypea").val();
			altarData.FTABLE_TITLE = $("#altarTitle").val();
			altarData.FTABLE_AMOUNT = $("#priceSale").val();
			altarData.FTABLE_USE_YN = $("#useYn").val();
			altarData.FTABLE_REMARK = $("#altarRemark").val();
			altarData.FTABLE_NET_PRICE = $("#priceNet").val();
			altarData.FTABLE_QTY = $("#intQty").val();
			console.log(altarData);
			$.ajax({
				url : "${path}/goods/insertFtable.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data : altarData, // HTTP 요청과 함께 서버로 보낼 데이터 
				method : "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType : "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if (data.code == 10001) {
					alert("저장 성공");
					fnSetPage('${path}/goods/listFtable.do');
				} else {
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

		
		$('input[name=type]').on('click', function() {
			if ($(this).val() == 'altA') {
				$('.alt_B').hide();
				$('.alt_C').show();
				$('.alt_D').hide();
			} else {
				$('.alt_B').show();
				$('.alt_D').show();
				$('.alt_C').hide();
			}
		});
		$('.alt_B').hide();

		$(document).ready(function() {
			$('.alt_C').show();
			$('.alt_D').hide();
		});

		$(function() {
			$("#priceNet,#intQty").on('keyup', function() {
				var sum1 = parseInt($("#priceNet").val() || 0);
				var sum2 = parseInt($("#intQty").val() || 0);
				var sum = sum1 * sum2;
				$("#priceSale").val(sum);
			});
		});
	</script>
