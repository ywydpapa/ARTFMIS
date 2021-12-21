<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.listrooms {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

.detailroom {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

.h-container:after {
	clear: both;
	display: block;
	content: ''
}

.h-container .item {
	float: left;
	width: 15%;
	height: 100%;
	text-align: center;
	border-right: 1px solid #ddd;
}

.h-container .item.cont {
	float: left;
	width: 85%;
	border-right: none;
	text-align: center;
}
</style>
<div class="listrooms">
	<div class="page-header2"></div>
	<table class="table table-bordered nowrap" style="width: 100%;">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<td>표준 주문서</td>
			<td><select name="DOS_TYP" id="DOS_TYP"
				class="form-control form-control-sm">
					<option value="1">장의용품</option>
					<option value="2">식당</option>
					<option value="3">매점</option>
			</select></td>
		</tr>
	</table>
	<hr>
	<div class="h-container">
		<div class="item">
			<table class="table table-bordered table-hover" id="roomTable">
				<thead>
					<tr>
						<th scope="col" width="200" align="center">구분</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a
								href="javascript:fnSetRoomdetail('${path}/goods/doslist${row.FROOM_ID}')">${row.FROOM_TITLE}</a></td>
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

$("#DOS_TYP").change(function(){
	var a = $("#DOS_TYP option:selected").val();
	console.log(a);
	if ( a =='1'){
		var url ="${path}/code/listconBcodedos1";
	}
	else if (a =='2'){
		var url ="${path}/goods/listfroom/1";	
	}
	else {
		var url ="${path}/goods/listfroom3/1";
	}
	tableListLoad(url);
	var newname = $('#DOS_TYP').text();
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
	$('#typename').val(newname);
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
	$("#cleanCharge").val("");
	$("#pyungSize").val("");
	$("#useYn").val("");
	$("#pcTitle").val("");
	$("#orderNo").val("10");
	$("#temproomTitle").val("");
	$("#imsiYn").val("");
	$("#roomDesc").val("");
	
}


function fn_Updateroom() {
	var roomData = {};
	roomData.FROOM_ID		= $("#FROOM_ID").val();
	roomData.FROOM_TYP		= $("#FROOM_TYP").val(); 
	roomData.FROOM_MAX_PERS	= $("#roomCap").val();
	roomData.FROOM_TITLE	= $("#roomTitle").val();
	roomData.FROOM_DAY_PRICE	= $("#priceDay").val();
	roomData.FROOM_CAT 		= $("#roomType2").val();
	roomData.FROOM_TIME_PRICE 		= $("#priceHour").val();
	roomData.FROOM_AREA		= $("#roomSize").val();
	roomData.CLEAN_CHARGE	= $("#cleanCharge").val();
	roomData.FROOM_AREA_KOR	= $("#pyungSize").val();
	roomData.FROOM_USE_YN	= $("#useYn").val();
	roomData.FROOM_PC 		= $("#pcTitle").val();
	roomData.FROOM_ORDNO	= $("#orderNo").val();
	roomData.FROOM_ALIS		= $("#temproomTitle").val();
	roomData.IMSI_YN 		= $("#imsiYn").val();
	roomData.FROOM_REMARK	= $("#roomDesc").val();
	console.log(roomData);
	$.ajax({ url: "${path}/goods/updateRoom.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: roomData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					var url ="${path}/goods/listroom/"+$("#FROOM_TYP").val();
					fnSetRoomlist(url);
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("입력값을 확인해 주십시오!");
			});
}

function fn_Insertroom() {
	var roomData = {};
	roomData.FROOM_TYP		= $("#FROOM_TYP").val(); 
	roomData.FROOM_MAX_PERS	= $("#roomCap").val();
	roomData.FROOM_TITLE	= $("#roomTitle").val();
	roomData.FROOM_DAY_PRICE	= $("#priceDay").val();
	roomData.FROOM_CAT 		= $("#roomType2").val();
	roomData.FROOM_TIME_PRICE 		= $("#priceHour").val();
	roomData.FROOM_AREA		= $("#roomSize").val();
	roomData.CLEAN_CHARGE	= $("#cleanCharge").val();
	roomData.FROOM_AREA_KOR	= $("#pyungSize").val();
	roomData.FROOM_USE_YN	= $("#useYn").val();
	roomData.FROOM_PC 		= $("#pcTitle").val();
	roomData.FROOM_ORDNO	= $("#orderNo").val();
	roomData.FROOM_ALIS		= $("#temproomTitle").val();
	roomData.IMSI_YN 		= $("#imsiYn").val();
	roomData.FROOM_REMARK	= $("#roomDesc").val();
	console.log(roomData);
	$.ajax({ url: "${path}/goods/roominsert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: roomData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					var url ="${path}/goods/listroom/"+$("#FROOM_TYP").val();
					fnSetRoomlist(url);
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("입력값을 확인해 주십시오!");
			});
}

function tableListLoad(url){
	$.ajax({
		type: "GET",
		url : url,
		dataType : "html",
		success : function(html){
			$("#roomTable").empty();
			$("#roomTable").append(html);		
			tableDetailLoad();
		},
		error : function(xhr){
			console.log(xhr);
		}
	});
}

function tableDetailLoad(){
	if ($("#roomTable > tbody > tr > td > a").length > 0){
		var tempArr = $("#roomTable > tbody > tr > td > a").eq(0).attr('href').split('/');
		var num = tempArr[tempArr.length - 1].replace(')','').replace('"','').replace('\'','');
		console.log(num);
		if ($("#DOS_TYP").val()==1){
			var url ="${path}/goods/"+num;
		}
		else
			{
			var url ="${path}/goods/doslist"+$("#DOS_TYP").val()+"/"+num;	
			}
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
		return false;
	}
}

function chkun() {
	var $Sarr = $(".CHK");
	for (var i = 0; i < $Sarr.length; i++) {
		$($Sarr[i]).prop("checked",false);
	chkcal();
	}
}

function chkall() {
	var $Marr = $(".CHK");
	for (var i = 0; i < $Marr.length; i++) {
		$($Marr[i]).prop("checked",true);			
	}
	chkcal();
}

$(document).ready(function(){
	tableDetailLoad();
	var url ="${path}/code/listconBcodedos1";
	tableListLoad(url);
});
</script>
