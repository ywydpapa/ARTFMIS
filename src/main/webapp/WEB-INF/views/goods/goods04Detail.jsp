
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css"
	integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX"
	crossorigin="anonymous">

<div class="cnt_wr">
	<div class="row" align="center">
		<div class="col-lg-12">
			<div class="card_box sch_it">
				<form name="form1" id="form1" onSubmit="return false;">
					<table class="table table-bordered nowrap">
						<colgroup>
							<col width="15%" />
							<col width="20%" />
							<col width="15%" />
							<col width="20%" />
							<col width="15%" />
							<col width="20%" />

						</colgroup>
						<tbody>
							<tr>
								<td scope="col" width="200"><input type="hidden"
									id="GOODS_ID" name="GOODS_ID" value="${dto.GOODS_ID}" />품목 구분</td>
								<td scope="col" width="200"><input class="form-control"
									type="text" value="" id="GOODS_01TEXT" readonly></td>
								<td scope="col" width="200"><input type="text"
									class="form-control" value="" id="GOODS_02TEXT" readonly>
								</td>
								<td scope="col" width="200">
									<button class="btn btn-md btn-success" value="추가"
										onClick="fn_setinsertmode()">새항목 추가</button>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>품명</td>
								<td colspan="5"><input type="text" class="form-control"
									required name="GOODS_TITLE" id="GOODS_TITLE"
									value="${dto.GOODS_TITLE}" /></td>
							</tr>
							<tr>
								<td>규격</td>
								<td colspan="5"><input type="text" class="form-control"
									required name="GOODS_SPEC" id="GOODS_SPEC"
									value="${dto.GOODS_SPEC}" /></td>
							</tr>
							<tr>
								<td>단위당수량</td>
								<td><input type="number" class="form-control CHK"
									style="text-align: right;" required name="GOODS_SALE_UNIT"
									id="GOODS_SALE_UNIT" value="${dto.GOODS_SALE_UNIT}" /></td>
								<td>단위수량단위</td>
								<td><input type="text" class="form-control" required
									name="GOODS_UNIT_QTY" id="GOODS_UNIT_QTY"
									value="${dto.GOODS_UNIT_QTY}" /></td>
								<td>개당가격</td>
								<td><input type="text" class="form-control CHK"
									style="text-align: right;" required name="GOODS_NET_PRICE"
									id="GOODS_NET_PRICE" value="<fmt:formatNumber value="${dto.GOODS_NET_PRICE}" pattern="#,###"/>" /></td>
							</tr>
							<tr>
								<td>판매단위</td>
								<td><input type="text" class="form-control" required
									name="GOODS_UNIT" id="GOODS_UNIT" value="${dto.GOODS_UNIT}" /></td>
								<td>판매금액</td>
								<td colspan="3"><input type="text" class="form-control"
									style="text-align: right;" required name="GOODS_SALE_PRICE"
									id="GOODS_SALE_PRICE" value="<fmt:formatNumber value="${dto.GOODS_SALE_PRICE}" pattern="#,###"/>" readonly /></td>
							</tr>
							<tr>
								<td>전통/현대식</td>
								<td><select class="form-control form-control-sm"
									id="MODERN_YN" name="MODERN_YN">
										<option value="121">현대식</option>
										<option value="122">전통식</option>
										<option value="123">전통/현대 공용</option>
								</select></td>
								<td>보유부서</td>
								<td><select class="form-control form-control-sm"
									id="REG_DEPT" name="REG_DEPT">
										<c:forEach var="listdept" items="${listdept}">
											<option value="${listdept.BCD_ID}">${listdept.BCD_TITLE}</option>
										</c:forEach>
								</select></td>
								<td>반품유무</td>
								<td><select class="form-control form-control-sm"
									id="GOODS_RETURN_YN" name="GOODS_RETURN_YN">
										<option value="Y">반품가능</option>
										<option value="N">반품불가</option>
								</select></td>
							</tr>
							<tr>
								<td>초도주문 여부</td>
								<td><select class="form-control form-control-sm"
									id="INIT_GOODS_YN" name="INIT_GOODS_YN">
										<option value="Y">예</option>
										<option value="N">아니오</option>
								</select></td>
								<td>초도주문 자동선택</td>
								<td><select class="form-control form-control-sm"
									id="AUTO_INIT_ORD_YN" name="AUTO_INIT_ORD_YN">
										<option value="Y">예</option>
										<option value="N">아니오</option>
								</select></td>
								<td>추가주문가능 여부</td>
								<td><select class="form-control form-control-sm"
									id="ADD_ORD_YN" name="ADD_ORD_YN">
										<option value="Y">예</option>
										<option value="N">아니오</option>
								</select></td>

							</tr>
							<tr>
								<td>판매방식</td>
								<td><select class="form-control form-control-sm"
									id="ORD_TYPE" name="ORD_TYPE">
										<option value="OR1">판매</option>
										<option value="OR2">임대</option>
								</select></td>
								<td>외부업체 유무</td>
								<td><select class="form-control form-control-sm"
									id="GOODS_3RDPTY_YN" name="GOODS_3RDPTY_YN">
										<option value="Y">내부</option>
										<option value="N">외부</option>
								</select></td>
								<td>주문프로그램표시 여부</td>
								<td><select class="form-control form-control-sm"
									id="ORD_PROG_YN" name="ORD_PROG_YN">
										<option value="Y">예</option>
										<option value="N">아니오</option>
								</select></td>
							</tr>
							<tr>
								<td>정렬순서</td>
								<td><input type="number" class="form-control"
									style="text-align: right;" step="1" min = "0" onchange="this.value = Math.floor(Math.max(this.value,0))" name="GOODS_ORDER" id="GOODS_ORDER"
									value="${dto.GOODS_ORDER}" /></td>
								<td>사용유무</td>
								<td><select class="form-control form-control-sm"
									id="USE_YN" name="USE_YN" required>
										<option value="Y">사용</option>
										<option value="N">미사용</option>
								</select></td>
							</tr>
							<tr>
								<td>상품설명</td>
								<td colspan="5"><textarea id="GOODS_REMARK" required
										name="GOODS_REMARK" rows="4" class="form-control">${dto.GOODS_REMARK}</textarea></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="btn_wr text-right mt-3">
				<div id = "updbtn">
				<button class="btn btn-md btn-primary"  onClick="fn_goodsUpdate01()">저장</button>
				</div>
				<div id = "istbtn"> 
				<button class="btn btn-md btn-primary"  onClick="fn_goodsInsert01()">새항목 저장</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function numberWitioutCommas(x) {
	  return x.toString().replace(/[\D\s\._\-]+/g, "");
}

	function fn_goodsUpdate01() {
		var goodsData = {};
		goodsData.GOODS_ID = $("#GOODS_ID").val();
		goodsData.CAT_01_ID = $("#selcode01").val();
		goodsData.CAT_02_ID = $("#selcode02").val();
		goodsData.GOODS_TITLE = $("#GOODS_TITLE").val();
		goodsData.GOODS_SPEC = $("#GOODS_SPEC").val();
		goodsData.GOODS_UNIT = $("#GOODS_UNIT").val();
		goodsData.GOODS_UNIT_QTY = $("#GOODS_UNIT_QTY").val();
		goodsData.GOODS_SALE_UNIT = $("#GOODS_SALE_UNIT").val();
		goodsData.GOODS_SALE_PRICE = $("#GOODS_SALE_PRICE").val().replace(/[\D\s\._\-]+/g, "");;
		goodsData.GOODS_NET_PRICE = $("#GOODS_NET_PRICE").val().replace(/[\D\s\._\-]+/g, "");;
		goodsData.GOODS_RETURN_YN = $("#GOODS_RETURN_YN").val();
		goodsData.GOODS_INIT_ORDER = $("#AUTO_INIT_ORD_YN").val();
		goodsData.GOODS_INIT_BASIC = $("#INIT_GOODS_YN").val();
		goodsData.GOODS_ADD_SALE = $("#ADD_ORD_YN").val();
		goodsData.GOODS_3RDPTY_YN = $("#GOODS_3RDPTY_YN").val();
		goodsData.GOODS_SALE_TYP = $("#ORD_TYPE").val();
		goodsData.GOODS_REMARK = $("#GOODS_REMARK").val();
		goodsData.GOODS_ORDER = $("#GOODS_ORDER").val();
		goodsData.GOODS_USE_YN = $("#USE_YN").val();
		goodsData.GOODS_REG_DEPT = $("#REG_DEPT").val();
		goodsData.GOODS_MODERN = $("#MODERN_YN").val();
		goodsData.GOODS_FROOM_ORDER = $("#ORD_PROG_YN").val();
		console.log(goodsData);
		$.ajax({
			url : "${path}/goods/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
			data : goodsData, // HTTP 요청과 함께 서버로 보낼 데이터 
			method : "POST", // HTTP 요청 메소드(GET, POST 등) 
			dataType : "json" // 서버에서 보내줄 데이터의 타입 
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
		.done(function(data) {
			if (data.code == 10001) {
				alert("저장 성공");
				var url = "${path}/goods/listGoods04/" + $("#selcode02").val();
				fn_Reload03(url);
			} else {
				alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) {
			alert("입력값을 확인해 주십시오!!");
		});
	}

	function fn_goodsInsert01() {
		var goodsData = {};
		goodsData.GOODS_ID = $("#GOODS_ID").val();
		goodsData.CAT_01_ID = $("#selcode01").val();
		goodsData.CAT_02_ID = $("#selcode02").val();
		goodsData.GOODS_TITLE = $("#GOODS_TITLE").val();
		goodsData.GOODS_SPEC = $("#GOODS_SPEC").val();
		goodsData.GOODS_UNIT = $("#GOODS_UNIT").val();
		goodsData.GOODS_UNIT_QTY = $("#GOODS_UNIT_QTY").val();
		goodsData.GOODS_SALE_UNIT = $("#GOODS_SALE_UNIT").val();
		goodsData.GOODS_SALE_PRICE = $("#GOODS_SALE_PRICE").val().replace(/[\D\s\._\-]+/g, "");;
		goodsData.GOODS_NET_PRICE = $("#GOODS_NET_PRICE").val().replace(/[\D\s\._\-]+/g, "");;
		goodsData.GOODS_RETURN_YN = $("#GOODS_RETURN_YN").val();
		goodsData.GOODS_INIT_ORDER = $("#AUTO_INIT_ORD_YN").val();
		goodsData.GOODS_INIT_BASIC = $("#INIT_GOODS_YN").val();
		goodsData.GOODS_ADD_SALE = $("#ADD_ORD_YN").val();
		goodsData.GOODS_3RDPTY_YN = $("#GOODS_3RDPTY_YN").val();
		goodsData.GOODS_SALE_TYP = $("#ORD_TYPE").val();
		goodsData.GOODS_REMARK = $("#GOODS_REMARK").val();
		goodsData.GOODS_ORDER = $("#GOODS_ORDER").val();
		goodsData.GOODS_USE_YN = $("#USE_YN").val();
		goodsData.GOODS_REG_DEPT = $("#REG_DEPT").val();
		goodsData.GOODS_MODERN = $("#MODERN_YN").val();
		goodsData.GOODS_FROOM_ORDER = $("#ORD_PROG_YN").val();
		console.log(goodsData);
		$.ajax({
			url : "${path}/goods/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
			data : goodsData, // HTTP 요청과 함께 서버로 보낼 데이터 
			method : "POST", // HTTP 요청 메소드(GET, POST 등) 
			dataType : "json" // 서버에서 보내줄 데이터의 타입 
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
		.done(function(data) {
			if (data.code == 10001) {
				alert("저장 성공");
				var url = "${path}/goods/listGoods04/" + $("#selcode02").val();
				fn_Reload03(url);
			} else {
				alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) {
			alert("입력값을 확인해 주십시오!!");
		});
	}

	
	
	
	function fn_setinsertmode(){
		fn_newform();
		$("#updbtn").hide();
		$("#istbtn").show();
	}
	
	function fn_newform(){
		$("#GOODS_TITLE").val("");
		$("#GOODS_ID").val("");
		$("#GOODS_SPEC").val("");
		$("#GOODS_UNIT").val("");
		$("#GOODS_UNIT_QTY").val("");
		$("#GOODS_SALE_UNIT").val("");
		$("#GOODS_SALE_PRICE").val("");
		$("#GOODS_NET_PRICE").val("");
		$("#GOODS_RETURN_YN").val("");
		$("#GOODS_INIT_ORDER").val("");
		$("#GOODS_INIT_BASIC").val("");
		$("#GOODS_ADD_SALE").val("");
		$("#GOODS_3RDPTY_YN").val("");
		$("#GOODS_SALE_TYP").val("");
		$("#GOODS_REMARK").val("");
		$("#GOODS_ORDER").val("10");
		$("#USE_YN").val("");
	};
	
	
	function setclear(){
		fn_newform();
		var text02 = $('#selcode02 option:selected').text();
		console.log(text02);
		$('#GOODS_02TEXT').val(text02);
	}

	
	  function recal() {
			var sum1 = parseInt(numberWitioutCommas($("#GOODS_NET_PRICE").val()) || 0);
			var sum2 = parseInt(numberWitioutCommas($("#GOODS_SALE_UNIT").val()) || 0);
			var sum = sum1 * sum2;
			$("#GOODS_SALE_PRICE").val(numberWithCommas(sum));
			$("#GOODS_NET_PRICE").val(numberWithCommas(sum1));
	  }
	  
	  $(".CHK").change(function(){
			recal();  
	  });
	
	$(document).ready(
			function() {
				$('#REG_DEPT').val('${dto.GOODS_REG_DEPT}').prop("selected",
						true);
				$('#INIT_GOODS_YN').val('${dto.GOODS_INIT_BASIC}').prop("selected",
						true);
				$('#AUTO_INIT_ORDER_YN').val('${dto.GOODS_INIT_ORDER}').prop("selected",
						true);
				$('#ADD_ORD_YN').val('${dto.GOODS_ADD_SALE}').prop("selected",
						true);
				$('#USE_YN').val('${dto.GOODS_USE_YN}').prop("selected", true);
				$('#GOODS_RETURN_YN').val('${dto.GOODS_RETURN_YN}').prop(
						"selected", true);
				$('#GOODS_REFG_YN').val('${dto.GOODS_REFG_YN}').prop(
						"selected", true);
				$('#GOODS_3RDPTY_YN').val('${dto.GOODS_3RDPTY_YN}').prop(
						"selected", true);
				$('#ORD_PROG_YN').val('${dto.GOODS_FROOM_ORDER}').prop(
						"selected", true);
				$('#ORD_TYPE').val('${dto.GOODS_SALE_TYP}').prop(
						"selected", true);
				$('#CAT_02_ID').val('${dto.CAT_02_ID}').prop("selected", true);
				var selcode1 = $('#selcode01 option:selected').text();
				$('#GOODS_01TEXT').val(selcode1);
				var selcode2 = $('#selcode02 option:selected').text();
				$('#GOODS_02TEXT').val(selcode2);
				$("#istbtn").hide();
				$('#MODERN_YN').val('${dto.GOODS_MODERN}').prop(
						"selected", true);
			});
</script>

