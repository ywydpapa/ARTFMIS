<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- <div class="btn_wr text-right mt-6" id="udtbtn">
	<button class="btn btn-md btn-primary" onClick="fn_Updateroom()">저장</button>
</div> -->
<div class="btn_wr text-right mt-6" id="insbtn">
	<button class="btn btn-md btn-primary" onClick="fn_Insertroom()">새로저장</button>
</div>
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
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row"><input type="hidden" id="FROOM_ID"
				value="${dtoRoom.FROOM_ID}"> 시설구분</th>
			<td style="vertical-align: middle"><input type="text" readonly
				value="" id="typename" class="form-control"></td>
			<td
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				class="Bset">호실타입</td>
			<td class="Bset"><select name="roomType2" id="roomType2"
				class="Bset form-control">
					<c:forEach var="menu008" items="${listroom}">
						<option value="${menu008.BCD_ID}">${menu008.BCD_TITLE}</option>
					</c:forEach>
			</select></td>
			<td style="vertical-align: middle; text-align: center">
				<button class="btn btn-md btn-success" value="추가" onClick="fn_setinsertmode()">새호실 추가</button>
				<button class="btn btn-md btn-primary" onClick="fn_Updateroom()">저장</button>
			</td>
		</tr>
		<tr>
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">호실명</th>
			<td colspan="4"><input type="text"
				class="form-control form-control-sm" id="roomTitle" name="roomTitle"
				value="${dtoRoom.FROOM_TITLE}"></td>
		<tr>
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">일일사용료</th>
			<td><input type="text" style="text-align: right;"
				class="form-control form-control-sm CHKcal" name="priceDay"
				id="priceDay"
				value="<fmt:formatNumber value="${dtoRoom.FROOM_DAY_PRICE}" pattern="#,###"/>">
			</td>
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">시간당사용료</th>
			<td colspan="2"><input type="text" id="priceHour"
				name="priceHour" style="text-align: right;"
				class="form-control form-control-sm CHKcal" name="priceHour"
				value="<fmt:formatNumber value="${dtoRoom.FROOM_TIME_PRICE}" pattern="#,###"/>">
			</td>
		</tr>
		<tr class="Bset">
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">면적(m<sup>2</sup>)
			</th>
			<td><input type="text" data-type="number" style="text-align: right"
				class="Bset form-control form-control-sm" id="roomSize"
				name="roomSize" value="${dtoRoom.FROOM_AREA}"></td>
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">평수</th>
			<td colspan="2"><input type="text" data-type="number" style="text-align: right;"
				class="Bset form-control form-control-sm" name="pyungSize"
				id="pyungSize" value="${dtoRoom.FROOM_AREA_KOR}"></td>
		</tr>
		<tr class="Bset">
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">수용인원수</th>
			<td><input name="roomCap" id="roomCap"
				style="text-align: right;" class="Bset form-control form-control-sm"
				type="text" data-type="number" value="${dtoRoom.FROOM_MAX_PERS}"></td>
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">컴퓨터이름</th>
			<td colspan="2"><input type="text"
				class="Bset form-control form-control-sm" id="pcTitle"
				name="pcTitle" value="${dtoRoom.FROOM_PC}"></td>
		</tr>
		<tr class="Bset">
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">임시호실명</th>
			<td><input type="text" class="Bset form-control form-control-sm"
				id="temproomTitle" name="temproomTitle"
				value="${dtoRoom.FROOM_ALIS}"></td>
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">임시호실사용여부</th>
			<td colspan="1"><select name="imsiYn" id="imsiYn"
				class="Bset form-control form-control-sm">
					<option value="Y">사용</option>
					<option value="N">미사용</option>
			</select></td>
			<td>
			<button id="imsiBtn" class="btn btn-md btn-success form-control-sm" style="line-height: 5px;" <c:if test="${dtoRoom.IMSI_YN eq 'N'}">disabled</c:if>>임시호실 생성</button>
			</td>
		</tr>
		<tr>
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">정렬순서</th>
			<td><input type="text" data-type="number" style="text-align: right;"
				class="form-control form-control-sm" id="orderNo" name="orderNo"
				value="${dtoRoom.FROOM_ORDNO}"></td>
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">사용여부</th>
			<td colspan="2"><select name="useYn" id="useYn"
				class="form-control form-control-sm">
					<option value="Y">사용</option>
					<option value="N">미사용</option>
			</select></td>
		</tr>
		<tr>
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">이미지등록</th>
			<td>
				<form id="uploadForm" style="margin-bottom: -10px;" enctype="multipart/form-data" method="post">
					<input type="hidden" id="uploadServerImageName_old" value="${dtoRoom.FROOM_IMAGE}"> 
					<input type="hidden" id="uploadServerImageName" value="">
					<input type="file" style="text-align: right; height:120%;"multiple="multiple"  class="form-control form-control-sm" name="altarImage" id="altarImage">
				</form>
			</td>
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0">부가사용료
				설정</th>
			<td colspan="2">
				<button class="btn btn-primary form-control" data-toggle="modal"
					data-target=".bd-example-modal-lg">상세설정</button>
				<div class="modal fade bd-example-modal-lg" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="padding: 10px">
						<div class="modal-content" style="padding: 15px">
							<table class="table table-bordered">
								<colgroup>
									<col width="30%">
									<col width="15%">
									<col width="15%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<thead>
									<tr>
										<th class="text-center table-info" colspan="5">기타품목 부가사용료 설정</th>
									</tr>
									<tr>
										<th class="text-center">품목</th>
										<th class="text-center">부과방법</th>
										<th class="text-center">부과금액</th>
										<th class="text-center">비용부과여부</th>
										<th class="text-center">시설사용료 포함</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${etcsetl}">
										<tr>
											<td class="align-middle setltitl"><input type="hidden"
												class="modalid" value="${row.BCD_ID}"><input
												type="hidden" class="setlid" value="${row.SETL_ID}">
												${row.BCD_TITLE}</td>
											<td><select class="form-control modal1type">
													<option value="T"
														<c:if test="${row.SETL_TYPE eq 'T'}">selected</c:if>>시간당</option>
													<option value="E"
														<c:if test="${row.SETL_TYPE eq 'E'}">selected</c:if>>회당</option>
											</select></td>
											<td class="align-middle table-warning"><input
												type="text"
												oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
												class="form-control text-right table-warning modalprice"
												onchange="this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');"
												style="border: none"
												value="<c:if test="${empty row.SETL_PRICE}">0</c:if><c:if test="${not empty row.SETL_PRICE}"><fmt:formatNumber value="${row.SETL_PRICE}" pattern="#,###"/></c:if>"></td>
											<td><select style="text-align: right"
												class="form-control modal1yn">
													<option value="Y"
														<c:if test="${row.PAY_YN eq 'Y'}">selected</c:if>>부과</option>
													<option value="N"
														<c:if test="${row.PAY_YN eq 'N'}">selected</c:if>>미부과</option>
											</select></td>
											<td><select style="text-align: right"
												class="form-control modal2yn">
													<option value="Y"
														<c:if test="${row.INCADD_YN eq 'Y'}">selected</c:if>>포함</option>
													<option value="N"
														<c:if test="${row.INCADD_YN eq 'N'}">selected</c:if>>미포함</option>
											</select></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="btn_wr text-right mt-6">
								<button class="btn btn-primary" onclick="saveEtc();">저장</button>
								<span> </span>
								<button class="btn btn-success" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th
				style="vertical-align: middle; text-align: center; background-color: #E6F8E0"
				scope="row">내용</th>
			<td colspan="4"><textarea name="roomDesc" id="roomDesc" rows="8"
					class="form-control">${dtoRoom.FROOM_REMARK}</textarea></td>
		</tr>
	</tbody>
</table>
<br>
<div class="col-md-auto">
	<div class="card h-80">
		<h5 class="card-header">상품이미지</h5>
		<div class="card-body" id="oldImage">
			<c:forEach var="row" items="${dtoRoom2}" varStatus="c">
				<input type="hidden" name="fileId" id="fileId" value="${c.count}">
				<input type="hidden" name="fileId" id="fileId" value="${row.fileId}">
				<input type="hidden" name="fileId" id="fileId" value="${row.fileContent}">
				<img src="${path}/goods/image1.do/${row.fileId}" style="width: 350px; height: 300px;"/><br>
				<span style="margin-right: 5px;">${row.fileName}</span><button class="btn btn-sm btn-success" onclick="javascript:filedelete('${row.fileId}');">삭제</button><br><br>
			</c:forEach>
			<!--<c:if test="${dtoRoom.FROOM_IMAGE ne null && dtoRoom.FROOM_IMAGE ne ''}">
				<div id="imagebefore" style="height: 100%; background-image: url('${path}/resources/image/local/${dtoRoom.FROOM_IMAGE}')"></div>
			</c:if>-->
		</div>
		
		<div class="card-body" id="newImage">
		</div>
			<div id="preview">
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
<script src="${path}/js/onloadScript.js"></script>
<script>
	$("input[type='text']").each(function(index, item){
		if($(item).data("type") === "number"){
			$(item).attr("maxlength", 6);
			$(item).attr("onKeyup", "this.value = this.value.replace(/[^0-9]/g, '');");
			$(item).attr("style", "text-align:right;");
		}
	});
	
	$(document).ready(function() {
		$('#useYn').val('${dtoRoom.FROOM_USE_YN}').prop("selected", true);
		$('#roomType').val('${dtoRoom.FROOM_TYP}').prop("selected", true);
		$('#imsiYn').val('${dtoRoom.IMSI_YN}').prop("selected", true);
		$('#incYn').val('${dtoRoom.INC_YN}').prop("selected", true);
		$('#roomType2').val('${dtoRoom.FROOM_CAT}').prop("selected", true);
		var typname = $('#FROOM_TYP option:selected').text();
		$('#typename').val(typname);
		$('#insbtn').hide();
		var roomtyp = $('#FROOM_TYP').val();
		$('.Bset').show();
		if (roomtyp != '1') {
			$('.Bset').attr('readOnly', true);
			$('.Bset').attr('disabled', true);
			$('.Bset').css('background-color', '#E6E6FA');
		} else {
			$('.Bset').attr('readOnly', false);
			$('.Bset').attr('disabled', false);
			$('.Bset').css('background-color', '#FFFFFF');
		}
	});

	function recal() {
		var sum1 = parseInt(numberWitioutCommas($("#priceDay").val()) || 0);
		var sum2 = parseInt(numberWitioutCommas($("#priceHour").val()) || 0);
		$("#priceDay").val(numberWithCommas(sum1));
		$("#priceHour").val(numberWithCommas(sum2));
		var roomtyp = $('#FROOM_TYP').val();
		if (roomtyp == '1') {
			var sum3 = parseInt(numberWitioutCommas($("#cleanCharge").val()) || 0);
			$("#cleanCharge").val(numberWithCommas(sum3));
		}
	}
	$(".CHKcal").change(function() {
		recal();
	});

	$("#altarImage").change(function(event) {

		 //var formData = new FormData(document.getElementById("uploadForm"));
		var formData = new FormData();
		var fileInput = document.getElementById("altarImage");
		var files = fileInput.files;
		var arr =Array.prototype.slice.call(files);
		 
		//과거 이미지 파일 없애고.
		$("#oldImage").remove();
		 
		arr.forEach(function(f){
		        
			//파일명이 길면 파일명...으로 처리
			var fileName = f.name;
			if(fileName.length > 10){
			fileName = fileName.substring(0,12)+"...";
			}

		    //div에 이미지 추가
		    var str = '<div style="display: inline-flex; padding: 10px;"><li>';
		    str += '<span>'+fileName+'</span><br>';
	     	//이미지 파일 미리보기
		    if(f.type.match('image.*')){
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
		   		reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
		        	str += '<img style="width: 100%;" src=\'' + e.target.result + '\' />';
		            $(str).appendTo('#preview');
		            $("#uploadServerImageName").attr('value', fileName);
		          } 
		          reader.readAsDataURL(f);
		        }else{
		        	alert("이미지 파일이 아닙니다.");
		        	$("input[type='file']").val("");  //파일 초기화
		        	return false;
		        }
		 
		})
		 
		 // 기존에 존재하는 이미지 미리보기 임.
		 /* if (this.files && this.files[0]) {
			var reader = new FileReader();
			reader.onload = function(data) {
				$("#oldImage").remove();
				$("#newImage").show();
				$("#imagenow").attr("src", data.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}  */
			$.ajax({
				type : "post",
				url : '${path}/file/upload',
				data : formData,
				contentType : false,
				processData : false,
				success : function(e) {
					//console.log(e);
					//$("#uploadServerImageName").val(e);
					console.log('이미지 업로드 성공');
				}
			})
			//초기화
/* 			var formData = new FormData();
		} */
	});

	function saveEtc() {
		$Aarr = $(".modalid");
		$Barr = $(".modal1type");
		$Carr = $(".modalprice");
		$Darr = $(".modal1yn");
		$Earr = $(".modal2yn");
		$Farr = $(".setlid");
		$Garr = $(".setltitl");
		for (var i = 0; i < $Aarr.length; i++) {
			setlData = {};
			setlData.SETL_FROOM_ID = $("#FROOM_ID").val();
			setlData.SETL_TITLE = $Garr[i].innerText;
			setlData.SETL_TYPE = $Barr[i].value;
			setlData.SETL_PRICE = $Carr[i].value.replace(/[\D\s\._\-]+/g, "");
			setlData.PAY_YN = $Darr[i].value;
			setlData.INCADD_YN = $Darr[i].value;
			setlData.SETL_ID = $Farr[i].value;
			setlData.SETL_REMARK = $Aarr[i].value;
			console.log(setlData);
			if ($Farr[i].value == "") {
				//insert
				$.ajax({
					url : "${path}/setup/insfroomsetl.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data : setlData, // HTTP 요청과 함께 서버로 보낼 데이터 
					method : "POST", // HTTP 요청 메소드(GET, POST 등) 
					dataType : "json" // 서버에서 보내줄 데이터의 타입 
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if (data.code == 10001) {
					} else {
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
				.fail(function(xhr, status, errorThrown) {
					alert("입력값을 확인해 주십시오!!(insert)");
				});
			} else {
				$.ajax({
					url : "${path}/setup/updfroomsetl.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data : setlData, // HTTP 요청과 함께 서버로 보낼 데이터 
					method : "POST", // HTTP 요청 메소드(GET, POST 등) 
					dataType : "json" // 서버에서 보내줄 데이터의 타입 
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if (data.code == 10001) {
					} else {
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
				.fail(function(xhr, status, errorThrown) {
					alert("입력값을 확인해 주십시오!!(update)");
				});
			}
		}
		alert("저장 완료");
	}
	
	$("#imsiYn").change(function(){
		var imsival = $("#imsiYn").val();
		const target = document.getElementById('imsiBtn');
		if (imsival == "Y"){
			target.disabled = false;
		}else{
			target.disabled = true;	
		}
		
	});
	
	function filedelete(fileId) {
		var deleteData = {};
		deleteData.fileId = fileId;
		
		$.ajax({
			url : "${path}/goods/deletefiledata.do/",
			method : "POST",
			data : deleteData
		}).done(function(result, status, xhr){
			if(result.code == 10001){
				alert("파일 삭제 성공");
				location.href="javascript:fnSetPage('/artfms/goods/listroomview.do')";
			}else {
				alert("파일 삭제 실패");
			};
		}).fail(function(xhr, status, errorThrown) {
			alert("test진행중 실패");
		});
		
	}
</script>