
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css"
	integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX"
	crossorigin="anonymous">

<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					<h4>품목 수정</h4>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="cnt_wr">
	<div class="row" align="center">
		<div class="col-lg-12">
			<div class="card_box sch_it">
				<form name="form1" id="form1">
					<table class="table  table-bordered nowrap">
						<tbody>
							<tr>
								<td scope="col" width="200">품목 구분<input type="hidden" id="GOODS_ID" name="GOODS_ID" value="${dto.GOODS_ID}"/></td>
								<td scope="col" width="200"><select id="CAT_01_ID"
									class="form-control form-control-sm"
									onchange="fnchange01(this.value);">
										<option value="3">매점품목</option>
								</select></td>
								<td scope="col" width="200"><select id="CAT_02_ID" name="CAT_02_ID" class="form-control form-control-sm">
									<c:forEach var="listData02" items="${listData0203}" >
										<option value="${listData02.CAT_ID}">${listData02.CAT_TITLE}</option>
									</c:forEach>
								</select></td>
								<td scope="col" width="200"><select id="CAT_03_ID"
									class="form-control form-control-sm">
										<option>-</option>
										<option>-</option>
								</select></td>
							</tr>
							<tr>
								<td>품명</td>
								<td colspan="3"><input type="text" class="form-control" required
									name="GOODS_TITLE" id="GOODS_TITLE" value="${dto.GOODS_TITLE}" /></td>
							</tr>
							<tr>
								<td>규격</td>
								<td colspan="3"><input type="text" class="form-control" required
									name="GOODS_SPEC" id="GOODS_SPEC" value="${dto.GOODS_SPEC}" /></td>
							</tr>
							<tr>
								<td>재질</td>
								<td colspan="3"><input type="text" class="form-control"
									name="" id="" placeholder="재질을 입력해 주세요" /></td>
							</tr>
							<tr>
								<td>단위당수량</td>
								<td><input type="number" class="form-control" style = "text-align:right;" required
									name="GOODS_SALE_UNIT" id="GOODS_SALE_UNIT" value="${dto.GOODS_SALE_UNIT}" /></td>
								<td>단위수량단위</td>
								<td><input type="text" class="form-control" required
									name="GOODS_UNIT_QTY" id="GOODS_UNIT_QTY" value="${dto.GOODS_UNIT_QTY}" /></td>
							</tr>
							<tr>
								<td>개당가격</td>
								<td><input type="number" class="form-control" style = "text-align:right;" required
									name="GOODS_NET_PRICE" id="GOODS_NET_PRICE" value="${dto.GOODS_NET_PRICE}" /></td>
								<td>기본수량</td>
								<td><input type="text" class="form-control" required
									name="GOODS_INT_QTY" id="GOODS_INT_QTY" value="${dto.GOODS_INT_QTY}"/></td>
							</tr>
							<tr>
								<td>판매단위</td>
								<td><input type="text" class="form-control" required
									name="GOODS_UNIT" id="GOODS_UNIT" value="${dto.GOODS_UNIT}"/></td>
 								<td>판매금액</td>
								<td><input type="number" class="form-control" style = "text-align:right;" required
									name="GOODS_SALE_PRICE" id="GOODS_SALE_PRICE" value="${dto.GOODS_SALE_PRICE}"/></td>
							</tr>
							<tr>
								<td>전통/현대식</td>
								<td><select class="form-control form-control-sm" id="MODERN_YN" name="MODERN_YN">
										<option value="TR">전통식</option>
										<option value="MD">현대식</option>
								</select></td>
								<td>보유부서</td>
								<td><select class="form-control form-control-sm" id="REG_DEPT" name="REG_DEPT">
										<option value="">등록부서</option>
								</select></td>
							</tr>
							<tr>
								<td>반품유무</td>
								<td><select class="form-control form-control-sm"
									id="GOODS_RETURN_YN" name="GOODS_RETURN_YN">
										<option value="Y">반품가능</option>
										<option value="N">반품불가</option>
								</select></td>
								<td>냉장고품목유무</td>
								<td><select class="form-control form-control-sm"
									id="GOODS_REFG_YN" name="GOODS_REFG_YN">
										<option value="Y">예</option>
										<option value="N">아니오</option>
								</select></td>
							</tr>
							<tr>
								<td>초도주문 여부</td>
								<td><select class="form-control form-control-sm" id="INIT_GOODS_YN" name="INIT_GOODS_YN" >
										<option value="Y">예</option>
										<option value="N">아니오</option>
								</select></td>
								<td>초도주문 자동선택</td>
								<td><select class="form-control form-control-sm"
									id="AUTO_INIT_ORD_YN" name="AUTO_INIT_ORD_YN">
										<option value="Y">예</option>
										<option value="N">아니오</option>
								</select></td>
							</tr>
							<tr>
								<td>추가주문가능 여부</td>
								<td><select class="form-control form-control-sm" id="ADD_ORD_YN" name="ADD_ORD_YN">
										<option value="1">예</option>
										<option value="2">아니오</option>
								</select></td>
								<td>판매방식</td>
								<td><select class="form-control form-control-sm"
									id="ORD_TYPE" name="ORD_TYPE">
										<option value="OR1">판매방식1</option>
										<option value="OR2">판매방식2</option>
								</select></td>
							</tr>
							<tr>
								<td>외부업체 유무</td>
								<td><select class="form-control form-control-sm"
									id="GOODS_3RDPTY_YN" name="GOODS_3RDPTY_YN">
										<option value="Y">예</option>
										<option value="N">아니오</option>
								</select></td>
								<td>주문프로그램표시 여부</td>
								<td><select class="form-control form-control-sm" id="ORD_PROG_YN" name="ORD_PROG_YN">
										<option value="Y">예</option>
										<option value="N">아니오</option>
								</select></td>
							</tr>
							<tr>
								<td>정렬순서</td>
								<td><input type="number" class="form-control" style="text-align:right;"
									name="GOODS_ORDER" id="GOODS_ORDER" value="${dto.GOODS_ORDER}" /></td>
								<td>사용유무</td>
								<td><select class="form-control form-control-sm" id="USE_YN" name="USE_YN" required>
										<option value="Y">예</option>
										<option value="N">아니오</option>
								</select></td>
									
							</tr>
							<tr>
								<td>상품설명</td>
								<td colspan="3"><textarea id="GOODS_REMARK" required
										name="GOODS_REMARK" rows="4" class="form-control">${dto.GOODS_REMARK}</textarea></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
				<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-primary" onClick="fn_goodsUpdate()">저장</button>
				<button class="btn btn-md btn-inverse" onClick="javascript:fnSetPage('${path}/goods/goods3list.do')">목록</button>
				</div>
		</div>
	</div>
</div>

<script>
	function fn_goodsUpdate() {
		var goodsData = {};
		goodsData.GOODS_ID 			= $("#GOODS_ID").val();
		goodsData.CAT_01_ID 		= $("#CAT_01_ID").val();
		goodsData.CAT_02_ID 		= $("#CAT_02_ID").val();
		goodsData.GOODS_TITLE 		= $("#GOODS_TITLE").val();
		goodsData.GOODS_SPEC 		= $("#GOODS_SPEC").val();
		goodsData.GOODS_UNIT 		= $("#GOODS_UNIT").val();
		goodsData.GOODS_UNIT_QTY 	= $("#GOODS_UNIT_QTY").val();
		goodsData.GOODS_SALE_UNIT 	= $("#GOODS_SALE_UNIT").val();
		goodsData.GOODS_SALE_PRICE	= $("#GOODS_SALE_PRICE").val();
		goodsData.GOODS_NET_PRICE 	= $("#GOODS_NET_PRICE").val();
		goodsData.GOODS_RETURN_YN 	= $("#GOODS_RETURN_YN").val();
		goodsData.GOODS_REFG_YN 	= $("#GOODS_REFG_YN").val();
		goodsData.GOODS_INIT_ORDER 	= $("#GOODS_INIT_ORDER").val();
		goodsData.GOODS_INIT_BASIC 	= $("#GOODS_INIT_BASIC").val();
		goodsData.GOODS_ADD_SALE 	= $("#GOODS_ADD_SALE").val();
		goodsData.GOODS_3RDPTY_YN 	= $("#GOODS_3RDPTY_YN").val();
		goodsData.GOODS_SALE_TYP 	= $("#GOODS_SALE_TYP").val();
		goodsData.GOODS_REMARK 		= $("#GOODS_REMARK").val();
		goodsData.GOODS_ORDER 		= $("#GOODS_ORDER").val();
		goodsData.GOODS_USE_YN 		= $("#USE_YN").val();
		goodsData.GOODS_REG_USER 	= $("#GOODS_REG_USER").val();

		if (!goodsData.CAT_01_ID) {
			alert("대분류를 선택해 주십시오.");
			return;
		} else if (!goodsData.GOODS_REMARK) {
			alert("메모를 입력해 주십시오.");
			return;
		}

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
				fnSetPage('${path}/goods/goods3list.do');
			} else {
				alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) {
			alert("입력값을 확인해 주십시오!!");
		});
	}
	
	$(document).ready(function(){
		$('#USE_YN').val('${dto.GOODS_USE_YN}').prop("selected",true);
		$('#GOODS_RETURN_YN').val('${dto.GOODS_RETURN_YN}').prop("selected",true);
		$('#GOODS_REFG_YN').val('${dto.GOODS_REFG_YN}').prop("selected",true);
		$('#GOODS_3RDPTY_YN').val('${dto.GOODS_3RDPTY_YN}').prop("selected",true);
	});

</script>

