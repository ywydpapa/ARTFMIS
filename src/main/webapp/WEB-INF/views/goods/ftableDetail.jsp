<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

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
								<th scope="row">제물상구분</th>
								<td><input type="text"
									class="form-control"
									id="typename" name="typename" value="" readonly placeholder=""></td>
								<td></td>
								<td style="text-align:right;"><button class="btn btn-md btn-success" onClick="fn_setinsert()">새항목 추가</button></td>
								</tr>
								<tr class="alt_B">
								<th scope="row">금액</th>
								<td><input type="text" style="text-align: right;"
									class="form-control num_only num_comma num_sum CHK" id="priceSale"
									name="priceSale" value="<fmt:formatNumber value="${dto.FTABLE_AMOUNT}" pattern="#,###"/>" placeholder="">
									<input type="hidden" id="ftableID" value="${dto.FTABLE_ID}">
								</td>
								<th scope="row">단위</th>
								<td><input type="text" style="text-align: right;"
									class="form-control num_only num_comma num_sum CHK" id="intUnit"
									name="intUnit" value="${dto.FTABLE_UNIT}" placeholder="">
								</td>
							</tr>
							<tr>
								<th scope="row">설명</th>
								<td colspan="3"><textarea name="altarRemark" id="altarRemark"
										rows="8" class="form-control">${dto.FTABLE_REMARK}</textarea></td>
							</tr>
							<tr>
								<th scope="row">정렬순서</th>
								<td><input type="number" style="text-align: right;"
									class="form-control num_only num_comma num_sum CHK" id="sortNo"
									name="sortNo" value="${dto.FTABLE_ORDER}"  min="0" max="1000" placeholder="">
								</td>
								<th scope="row">사용여부</th>
								<td><select name="useYn" id="useYn"
									class="form-control form-control-sm">
										<option value="Y">사용</option>
										<option value="N">미사용</option>
								</select></td>
							</tr>
							<tr>
								<th scope="row">이미지등록</th>
								<td>
									<form id="uploadForm" enctype="multipart/form-data" method="post">
										<input type="hidden" id="uploadServerImageName" value="${dto.FTABLE_IMAGE}">
										<input type="file" style="text-align: right;" class="form-control form-control-sm" name="altarImage" id="altarImage">
									</form>
								</td>
								<th></th>
								<td></td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
			<div id="udtbtn">
				<button class="btn btn-md btn-primary alt_D" onClick="fn_Updateftable()">저장</button>
			</div>
			<div id="istbtn">
				<button class="btn btn-md btn-primary alt_D" onClick="fn_Inserttable()">새로 저장</button>
			</div>
			<br>
			<div class="col-md-auto">
        		<div class="card h-80">
					<h5 class="card-header">상품이미지</h5>
					<div class="card-body" id="oldImage">
						<c:if test="${dto.FTABLE_IMAGE ne null && dto.FTABLE_IMAGE ne ''}">
							<div id="imagebefore" style="height: 100%; background-image: url('${path}/resources/image/local/${dto.FTABLE_IMAGE}')"></div>
						</c:if>
					</div>
					<div class="card-body" id="newImage" style="display: none">
						<img id="imagenow" style="width: 100%;">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<style>
	.card-body > div {
		background-size: contain;
		background-repeat: no-repeat;
		width: 100%;
		height: 0;
		padding-top: 66.64%;
	}
</style>
<!--//상품등록-->

	<script>
		function fn_Updateftable() {
			var altarData = {};
			altarData.FTABLE_ID = $("#ftableID").val();
			altarData.FTABLE_CAT = $("#FTABLE_CAT").val();
			/* altarData.FTABLE_TITLE = $("#altarTitle").val(); */
			altarData.FTABLE_AMOUNT = $("#priceSale").val().replace(/[\D\s\._\-]+/g, "");
			altarData.FTABLE_USE_YN = $("#useYn").val();
			altarData.FTABLE_REMARK = $("#altarRemark").val();
			altarData.FTABLE_UNIT = $("#intUnit").val();
			altarData.FTABLE_ORDER = $("#sortNo").val();
			altarData.FTABLE_IMAGE = $("#uploadServerImageName").val();
			console.log(altarData);
			$.ajax({
				url : "${path}/goods/updateFtable.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data : altarData, // HTTP 요청과 함께 서버로 보낼 데이터 
				method : "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType : "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if (data.code == 10001) {
					alert("저장 성공");
					var url ="${path}/goods/ftablelist/"+$("#FTABLE_CAT").val();
					fnSetTablelist(url);
				} else {
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}
		
		
		function fn_Inserttable() {
			var altarData = {};
			altarData.FTABLE_CAT = $("#FTABLE_CAT").val();
			/* altarData.FTABLE_TITLE = $("#altarTitle").val(); */
			altarData.FTABLE_AMOUNT = $("#priceSale").val().replace(/[\D\s\._\-]+/g, "");
			altarData.FTABLE_USE_YN = $("#useYn").val();
			altarData.FTABLE_REMARK = $("#altarRemark").val();
			altarData.FTABLE_UNIT = $("#intUnit").val();
			altarData.FTABLE_ORDER = $("#sortNo").val();
			altarData.FTABLE_IMAGE = $("#uploadServerImageName").val();
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
					var url ="${path}/goods/ftablelist/"+$("#FTABLE_CAT").val();
					fnSetTablelist(url);
				} else {
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		function numberWitioutCommas(x) {
			  return x.toString().replace(/[\D\s\._\-]+/g, "");
		}

		  function recal() {
				var sum1 = parseInt(($("#priceSale").val().replace(/[\D\s\._\-]+/g, "")) || 0);
				$("#priceSale").val(numberWithCommas(sum1));
		  }

		  $(".CHK").change(function(){
				recal();
		  });
		

		function fn_setinsert(){
			$('#udtbtn').hide();
			$('#istbtn').show();
			setclear();			
		}

		function setclear(){
			$("#ftableID").val("");
			$("#altarTitle").val("");
			$("#priceSale").val("");
			$("#useYn").val("");
			$("#altarRemark").val("");
			$("#priceNet").val("");
 			$("#intQty").val("");
 			$('#typename').val("");
			var name = $('#FTABLE_CAT option:selected').text();
			$('#typename').val(name);
		}

		$("#altarImage").change(function (event) {
			var formData = new FormData(document.getElementById("uploadForm"));

			if(this.files && this.files[0]){
				var reader = new FileReader();
				reader.onload = function (data) {
					$("#oldImage").remove();
					$("#newImage").show();
					$("#imagenow").attr("src", data.target.result);
				}
				reader.readAsDataURL(this.files[0]);
			}

			$.ajax({
				type: "post",
				url	:'${path}/file/upload',
				data: formData,
				contentType: false,
				processData: false,
				success:function (data){
					console.log(data);
					$("#uploadServerImageName").val(data);
					console.log('이미지 업로드 성공');
				}
			})
		})
		
		$(document).ready(function() {
			$('#USE_YN').val('${dto.FTABLE_USE_YN}').prop("selected",true);
			$('#altarTypea').val('${dto.FTABLE_CAT}').prop("selected",true);
			$('#istbtn').hide();
			var name = $('#FTABLE_CAT option:selected').text();
			console.log(name);
			$('#typename').val(name);
		});
</script>