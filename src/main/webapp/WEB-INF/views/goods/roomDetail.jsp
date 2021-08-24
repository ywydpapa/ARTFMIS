<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<table class="table table-sm bst02">
	<colgroup>
		<col width="15%" />
		<col width="30%" />
		<col width="15%" />
		<col width="10%" />
		<col width="20%" />
	</colgroup>
	<tbody>
		<tr>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row"><input type="hidden" id="FROOM_ID"
				value="${dtoRoom.FROOM_ID}"> 시설구분</th>
			<td style="vertical-align:middle"><input type="text" readonly value="" id="typename" class="form-control"></td>
			<td style="vertical-align:middle;text-align:center;background-color:#E6F8E0" class="Bset">호실타입</td>
			<td class="Bset"><select name="roomType2" id="roomType2" class="Bset form-control">
					<c:forEach var="menu008" items="${listroom}">
						<option value="${menu008.BCD_ID}">${menu008.BCD_TITLE}</option>
					</c:forEach>
			</select></td>
			<td style="vertical-align:middle;text-align:center">
				<button class="btn btn-md btn-success" value="추가"
					onClick="fn_setinsertmode()">새호실 추가</button>
			</td>
		</tr>
		<tr>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">호실명</th>
			<td colspan="4"><input type="text"
				class="form-control form-control-sm" id="roomTitle" name="roomTitle"
				value="${dtoRoom.FROOM_TITLE}"></td>
		<tr>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">일일사용료</th>
			<td><input type="text" style="text-align: right;"
				class="form-control form-control-sm CHKcal" name="priceDay"
				id="priceDay"
				value="<fmt:formatNumber value="${dtoRoom.FROOM_DAY_PRICE}" pattern="#,###"/>">
			</td>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">시간당사용료</th>
			<td colspan="2"><input type="text" id="priceHour"
				name="priceHour" style="text-align: right;"
				class="form-control form-control-sm CHKcal" name="priceHour"
				value="<fmt:formatNumber value="${dtoRoom.FROOM_TIME_PRICE}" pattern="#,###"/>">
			</td>
		</tr>
		<tr class="Bset">
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">면적(m<sup>2</sup>)
			</th>
			<td><input type="number" style="text-align:right" 
				class="Bset form-control form-control-sm" id="roomSize"
				name="roomSize" value="${dtoRoom.FROOM_AREA}"></td>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">평수</th>
			<td colspan="2"><input type="number" style="text-align: right;"
				class="Bset form-control form-control-sm" name="pyungSize"
				id="pyungSize" value="${dtoRoom.FROOM_AREA_KOR}"></td>
		</tr>
		<tr class="Bset">
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">수용인원수</th>
			<td><input name="roomCap" id="roomCap"
				style="text-align: right;" class="Bset form-control form-control-sm"
				type="number" value="${dtoRoom.FROOM_MAX_PERS}"></td>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">컴퓨터이름</th>
			<td colspan="2"><input type="text"
				class="Bset form-control form-control-sm" id="pcTitle"
				name="pcTitle" value="${dtoRoom.FROOM_PC}"></td>
		</tr>
		<tr class="Bset">
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">임시호실명</th>
			<td><input type="text" class="Bset form-control form-control-sm"
				id="temproomTitle" name="temproomTitle"
				value="${dtoRoom.FROOM_ALIS}"></td>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">임시호실사용여부</th>
			<td colspan="2"><select name="imsiYn" id="imsiYn"
				class="Bset form-control form-control-sm">
					<option value="Y">사용</option>
					<option value="N">미사용</option>
			</select></td>
		</tr>
		<tr>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">정렬순서</th>
			<td><input type="number" style="text-align: right;"
				class="form-control form-control-sm" id="orderNo" name="orderNo"
				value="${dtoRoom.FROOM_ORDNO}"></td>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">사용여부</th>
			<td colspan="2"><select name="useYn" id="useYn"
				class="form-control form-control-sm">
					<option value="Y">사용</option>
					<option value="N">미사용</option>
			</select></td>
		</tr>
		<tr>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">이미지등록</th>
			<td>
				<form id="uploadForm" enctype="multipart/form-data" method="post">
					<input type="hidden" id="uploadServerImageName"
						value="${dtoRoom.FROOM_IMAGE}"> <input type="file"
						style="text-align: right;" class="form-control form-control-sm"
						name="altarImage" id="altarImage">
				</form>
			</td>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">시설사용료 설정</th>
			<td colspan="2">
			<button class="btn btn-primary form-control" data-toggle="modal" data-target=".bd-example-modal-lg">상세설정</button>
			<div class="modal fade bd-example-modal-lg" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="padding:10px">
						<div class="modal-content">
						<table class="table table-bordered">
						<colgroup>
						<col width="">
						<col width="">
						<col width="">
						<col width="">
						<col width="">
						</colgroup>
						<thead>
						<tr><th class="text-center table-info" colspan="5">기타품목 시설 사용료 설정</th></tr>
						<tr>
						<th class="text-center">품목</th>
						<th class="text-center">부과방법</th>
						<th class="text-center">부과금액</th>
						<th class="text-center">부가사용료 등록여부</th>
						<th class="text-center">시설사용료 포함여부</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="row" items="${etcfee}">
						<tr>
						<td class="align-middle"><input type="hidden" value="${row.BCD_ID}">${row.BCD_TITLE}</td>
						<td>
						<select class="form-control">
						<option value="T">시간당</option>
						<option value="E">회당</option>
						</select>
						</td>
						<td class="align-middle table-warning"><input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control text-right table-warning" style="border:none" value=""></td>
						<td>
						<select style="text-align:right" class="form-control">
						<option value="Y">등록</option>
						<option value="N">미등록</option>
						</select>
						</td>
						<td>
						<select style="text-align:right" class="form-control">
						<option value="Y">포함</option>
						<option value="N">불포함</option>
						</select>
						</td>
						</tr>
						</c:forEach>
						</tbody>
						</table>
						<div class="btn_wr text-right mt-6"><button class="btn btn-success" data-dismiss="modal">적용/닫기</button></div>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0" scope="row">내용</th>
			<td colspan="4"><textarea name="roomDesc" id="roomDesc" rows="8"
					class="form-control">${dtoRoom.FROOM_REMARK}</textarea></td>
		</tr>
	</tbody>
</table>
<div class="btn_wr text-right mt-6" id="udtbtn">
	<button class="btn btn-md btn-primary" onClick="fn_Updateroom()">저장</button>
</div>
<div class="btn_wr text-right mt-6" id="insbtn">
	<button class="btn btn-md btn-primary" onClick="fn_Insertroom()">새로저장</button>
</div>
<br>
<div class="col-md-auto">
	<div class="card h-80">
		<h5 class="card-header">상품이미지</h5>
		<div class="card-body" id="oldImage">
			<c:if
				test="${dtoRoom.FROOM_IMAGE ne null && dtoRoom.FROOM_IMAGE ne ''}">
				<div id="imagebefore"
					style="height: 100%; background-image: url('${path}/resources/image/local/${dtoRoom.FROOM_IMAGE}')"></div>
			</c:if>
		</div>
		<div class="card-body" id="newImage" style="display: none">
			<img id="imagenow" style="width: 100%;">
		</div>
	</div>
</div>
<style>
.card-body>div {
	background-size: contain;
	background-repeat: no-repeat;
	width: 100%;
	height: 0;
	padding-top: 66.64%;
}
</style>
<script>
		
		$(document).ready(function(){
			$('#useYn').val('${dtoRoom.FROOM_USE_YN}').prop("selected",true);
			$('#roomType').val('${dtoRoom.FROOM_TYP}').prop("selected",true);
			$('#imsiYn').val('${dtoRoom.IMSI_YN}').prop("selected",true);
			$('#incYn').val('${dtoRoom.INC_YN}').prop("selected",true);
			$('#roomType2').val('${dtoRoom.FROOM_CAT}').prop("selected",true);
			var typname = $('#FROOM_TYP option:selected').text();
			$('#typename').val(typname);
			$('#insbtn').hide();
			var roomtyp = $('#FROOM_TYP').val();
			$('.Bset').show();
			if (roomtyp != '1')
				{
				$('.Bset').attr('readOnly', true);
				$('.Bset').attr('disabled', true);
				$('.Bset').css('background-color','#E6E6FA');
				}
			else
				{
				$('.Bset').attr('readOnly', false);
				$('.Bset').attr('disabled', false);
				$('.Bset').css('background-color','#FFFFFF');
				}
		});

		function recal() {
			var sum1 = parseInt(numberWitioutCommas($("#priceDay").val()) || 0);
			var sum2 = parseInt(numberWitioutCommas($("#priceHour").val()) || 0);
			$("#priceDay").val(numberWithCommas(sum1));
			$("#priceHour").val(numberWithCommas(sum2));
			var roomtyp = $('#FROOM_TYP').val();
			if (roomtyp == '1'){
			var sum3 = parseInt(numberWitioutCommas($("#cleanCharge").val()) || 0);
			$("#cleanCharge").val(numberWithCommas(sum3));
			}
		}
		$(".CHKcal").change(function(){
			recal();  
		});

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
	</script>
