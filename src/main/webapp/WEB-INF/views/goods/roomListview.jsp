<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<style>

  .listrooms {
        width: 100%;
        height: 100%;
        padding : 20px;
        background: white;
      }
        .detailroom {
        width: 100%;
        height: 100%;
        padding : 20px;
        background: white;
      }
      

.h-container:after{ clear: both; display: block; content: '' }
.h-container .item {
	float: left;
	width: 40%;
	height: 100%;
	text-align: center;
	border-right: 1px solid #ddd;
}
.h-container .item.cont {
	float: left;
	width: 58%;
	border-right: none;
	text-align: center;
}
</style>
<div class="listrooms">
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					<h3 style="text-align:center;">호실등록</h3>
				</div>
			</div>
		</div>
	</div>
</div>
	<table class="table  table-bordered nowrap"
		style="width: 100%;">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<td style="vertical-align:middle;background-color:#E6F8E0; text-align:center;">시설구분</td>
			<td style="vertical-align:middle"><select name="FROOM_TYP" id="FROOM_TYP"
				class="form-control form-control-sm">
					<option value="1">분향실</option>
					<option value="2">안치실</option>
					<option value="3">입관실</option>
					<option value="4">발인실</option>
					<option value="5">게스트룸</option>
					<option value="6">종교시설</option>
					<option value="7">기타</option>
			</select></td>
		</tr>
</table>
<hr>
	<div class="h-container">
					<div class="item">
			<table class="table table-bordered table-hover"
							id="roomTable">
				<thead>
					<tr style="vertical-align:middle;text-align:center;background-color:#E6F8E0">
						<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">호실명</th>
						<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">수용인원</th>
						<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">임시호실명</th>
						<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td style="vertical-align:middle;text-align:center;"><a href="javascript:fnSetRoomdetail('${path}/goods/detailRoom/${row.FROOM_ID}')">${row.FROOM_TITLE}</a></td>
							<td style="vertical-align:middle;text-align:right;">${row.FROOM_MAX_PERS}</td>
							<td style="vertical-align:middle;text-align:center;">${row.FROOM_ALIS}</td>
							<td style="vertical-align:middle;text-align:center;"><c:if test="${row.FROOM_USE_YN eq 'Y'}">사용</c:if><c:if test="${row.FROOM_USE_YN eq 'N'}">미사용</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="item cont">
		<div id="detailroom" class="detailroom" style="padding:0 12px;"></div>
		</div>
	</div>

			</div>
<script>


$("#FROOM_TYP").change(function(){
	var url ="${path}/goods/listroom/"+$("#FROOM_TYP").val();
	tableListLoad(url);
	var newname = $('#FROOM_TYP').text();
	$('#typename').val(newname);
});

function fnSetRoomlist(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#roomTable").empty();
		$("#roomTable").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}



function fnSetRoomdetail(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#detailroom").empty();
		$("#detailroom").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}

function fn_setinsertmode(){
	var newname = $('#FROOM_TYP').val();
	$('#FROOM_ID').val(newname);
	$('#udtbtn').hide();
	$('#insbtn').show();
	fn_setclear();
}

function fn_setclear(){
	$("#roomCap").val("");
	$("#roomTitle").val("");
	$("#priceDay").val("");
	$("#roomType2").val("");
	$("#priceHour").val("");
	$("#roomSize").val("");
	$("#pyungSize").val("");
	$("#useYn").val("");
	$("#pcTitle").val("");
	$("#orderNo").val("10");
	$("#temproomTitle").val("");
	$("#imsiYn").val("");
	$("#roomDesc").val("");
	
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function numberWitioutCommas(x) {
	  return x.toString().replace(/[\D\s\._\-]+/g, "");
}

///////////////////////////////////////////////////////////
function fn_Updateroom() {
	var roomData = {};
	roomData.FROOM_ID		= $("#FROOM_ID").val();
	roomData.FROOM_TYP		= $("#FROOM_TYP").val(); 
	var roomtyp = $('#FROOM_TYP').val();
	
	var filesTempArr = [];
	var formData = new FormData();
	var fileInput = document.getElementById("altarImage");
	var files = fileInput.files;
	var arr =Array.prototype.slice.call(files);
	
	filesTempArr = arr;
	
	var filesArrLen = arr.length;
	var filesTempArrLen = filesTempArr.length;
	
	if (roomtyp == '1')
		{
	roomData.FROOM_MAX_PERS	= $("#roomCap").val();
	roomData.FROOM_CAT 		= $("#roomType2").val();
	roomData.FROOM_AREA		= $("#roomSize").val();
	roomData.FROOM_AREA_KOR	= $("#pyungSize").val();
	roomData.FROOM_PC 		= $("#pcTitle").val();
	roomData.FROOM_ALIS		= $("#temproomTitle").val();
	roomData.IMSI_YN 		= $("#imsiYn").val();
		}
	roomData.FROOM_TITLE	= $("#roomTitle").val();
	roomData.FROOM_DAY_PRICE	= $("#priceDay").val().replace(/[\D\s\._\-]+/g, "");
	roomData.FROOM_TIME_PRICE 		= $("#priceHour").val().replace(/[\D\s\._\-]+/g, "");
	roomData.FROOM_USE_YN	= $("#useYn").val();
	roomData.FROOM_ORDNO	= $("#orderNo").val();
	roomData.FROOM_REMARK	= $("#roomDesc").val();
	roomData.INC_YN	= $("#incYn").val();
	roomData.FROOM_IMAGE = $("#uploadServerImageName").val();
	console.log(roomData);
	$.ajax({ url: "${path}/goods/updateRoom.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: roomData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("입력값을 확인해 주십시오!");
			});
	if(arr != null){
		for(var i=0, filesTempArrLen = filesTempArr.length; i<filesTempArrLen; i++) {
			 formData.append('file', arr[i]);
			var test1 = $("#FROOM_ID").val();
			formData.append('FROOM_IDX', test1);
			$.ajax({
				url : "${path}/goods/updatefiledata.do",
				method : "POST",
				enctype:'multipart/form-data',
				data : formData,
				contentType : false,
				processData : false
			}).done(function(result){
				if(result.code == 10001){
					console,log("파일 업로드 성공");
				}else {
					alert('파일 업로드 실패');
				};
			}).fail(function(xhr, status, errorThrown) {
			});
			var formData = new FormData(); 
		}
	};
	location.href="javascript:fnSetPage('/artfms/goods/listroomview.do')";
	//var url ="${path}/goods/listroom/"+$("#FROOM_TYP").val();
	//fnSetRoomlist(url);
};
///////////////////////////////////////////////////////////////////
function fn_Insertroom() {
	var roomData = {};
	roomData.FROOM_TYP		= $("#FROOM_TYP").val(); 
	
	var filesTempArr = [];
	var formData = new FormData();
	var fileInput = document.getElementById("altarImage");
	var files = fileInput.files;
	var arr =Array.prototype.slice.call(files);
	
	filesTempArr = arr;
	
	var filesArrLen = arr.length;
	var filesTempArrLen = filesTempArr.length;
	
	var roomtyp = $('#FROOM_TYP').val();
	if (roomtyp == '1')
		{
	roomData.FROOM_MAX_PERS	= $("#roomCap").val();
	roomData.FROOM_CAT 		= $("#roomType2").val();
	roomData.FROOM_AREA		= $("#roomSize").val();
	roomData.FROOM_AREA_KOR	= $("#pyungSize").val();
	roomData.FROOM_PC 		= $("#pcTitle").val();
	roomData.FROOM_ALIS		= $("#temproomTitle").val();
	roomData.IMSI_YN 		= $("#imsiYn").val();
		}
	roomData.FROOM_TITLE	= $("#roomTitle").val();
	roomData.FROOM_DAY_PRICE	= $("#priceDay").val().replace(/[\D\s\._\-]+/g, "");
	roomData.FROOM_TIME_PRICE 		= $("#priceHour").val().replace(/[\D\s\._\-]+/g, "");
	roomData.FROOM_USE_YN	= $("#useYn").val();
	roomData.FROOM_ORDNO	= $("#orderNo").val();
	roomData.FROOM_REMARK	= $("#roomDesc").val();
	roomData.INC_YN	= $("#incYn").val();
	roomData.FROOM_IMAGE = $("#uploadServerImageName").val();
	console.log(roomData);
	$.ajax({ url: "${path}/goods/roominsert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: roomData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("입력값을 확인해 주십시오!");
			});
	
	if(arr != null){
		for(var i=0, filesTempArrLen = filesTempArr.length; i<filesTempArrLen; i++) {
			formData.append('FROOM_TITLE', $("#roomTitle").val());
			formData.append('file', arr[i]);
			$.ajax({
				url : "${path}/goods/roomfileinsert.do",
				method : "POST",
				enctype:'multipart/form-data',
				data : formData,
				contentType : false,
				processData : false
			}).done(function(result){
				if(result.code == 10001){
					console.log("파일 업로드 성공");
				}else {
					alert('파일 업로드 실패');
				};
			}).fail(function(xhr, status, errorThrown) {
			});
			var formData = new FormData(); 
		}
	};
	location.href="javascript:fnSetPage('/artfms/goods/listroomview.do')";
	//var url ="${path}/goods/listroom/"+$("#FROOM_TYP").val();
	//fnSetRoomlist(url);
};

function tableListLoad(url){
	$.ajax({
		type: "GET",
		url : url,
		dataType : "html",
		success : function(html){
			$("#roomTable").empty();
			$("#roomTable").append(html);		
			console.log("상세정보 로딩중")
			tableDetailLoad();
		},
		error : function(xhr){
			console.log(xhr);
		}
	});
}

function tableDetailLoad(){
	console.log( $("#roomTable > tbody > tr > td > a").length );
	console.log( $("#goodsTable > tbody > tr > td > a").length );
	
	var $target;
	var num1 = $("#roomTable > tbody > tr > td > a").length;
	var num2 = $("#goodsTable > tbody > tr > td > a").length;
	if (num1 > 0 || num2 > 0){
		if (num1 > 0){
			$target = $("#roomTable > tbody > tr > td > a");
		} else {
			$target = $("#goodsTable > tbody > tr > td > a");
		}
	}
	
	if (num1 > 0 || num2 > 0){
		var tempArr = $target.eq(0).attr('href').split('/');
		var num = tempArr[tempArr.length - 1].replace(')','').replace('"','').replace('\'','');
		var url ="${path}/goods/detailRoom/"+num;
		$.ajax({
			type: "GET",
			url : url,
			dataType : "html",
			success : function(html){
				$("#detailroom").empty();
				$("#detailroom").append(html);
			},
			error : function(xhr){
				console.log(xhr);
			}
		});
	} else {
		fn_setclear();
		var newname = $("#FROOM_TYP option:selected").text();
		$('#typename').val(newname);
	}
}

function recal() {
	var sum1 = parseInt(numberWitioutCommas($("#priceDay").val()) || 0);
	var sum2 = parseInt(numberWitioutCommas($("#priceHour").val()) || 0);
	$("#priceDay").val(numberWithCommas(sum1));
	$("#priceHour").val(numberWithCommas(sum2));
}

$(".CHK").change(function(){
	recal();  
});

$(document).ready(function(){
	tableDetailLoad();
});

	
</script>
