<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<style>
.h-container:after{ clear: both; display: block; content: '' }
.h-container .item {
	float: left;
	width: 25%;
	height: 100%;
	text-align: center;
	border-right: 1px solid #fff;
}
.h-container .item.cont {
	float: left;
	width: 65%;
	border-right: none;
	text-align: center;
}
</style>

<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					<h3>베이스코드 목록</h3>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="h-container">
		<div class="item">
	<br>
	<br>
		<table id="list01table" class="table table-bordered">
			<thead>
				<tr align="center">
					<th>구분명</th>
				</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listconBcode/1')">제물상구분</a></td>
					</tr>
					<tr align="center">
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listconBcode/2')">호실타입</a></td>
					</tr>
					<tr align="center">
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listconBcode/3')">종교구분</a></td>
					</tr>
					<tr align="center">
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listconBcode/4')">사망종류</a></td>
					</tr>
					<tr align="center">
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listconBcode/5')">유족관계</a></td>
					</tr>
					<tr align="center">
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listconBcode/6')">화장/매장 구분</a></td>
					</tr>
					<tr align="center">
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listconBcode/7')">할인구분</a></td>
					</tr>
					<tr align="center">
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listconBcode/8')">사내부서코드</a></td>
					</tr>
					
			</tbody>
		</table>

	</div>
	<div class="item cont">
		<input type = "hidden" id="conType" value = "1">
		<table id="listtable" class="table table-bordered nowrap ">
			<colgroup>
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
			</colgroup>
			<thead>
				<tr>
					<th>코드명</th>
					<th>비고사항</th>
					<th>정렬순서</th>
					<th>사용여부</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach varStatus="status" var="row2" items="${list01}">
					<tr>
						<td>
						<input id="CAT0${status.index}" type="hidden" value="${row2.BCD_ID}">
						<input id="CAT1${status.index}" type="text" style="width:100%;hight:100%;border:0;" value="${row2.BCD_TITLE}"></td>
						<td><input id="CAT2${status.index}" type="text" style="width:100%;hight:100%;border:0;" value="${row2.BCD_REMARK}"></td>
						<td><input id="CAT3${status.index}" type="text" style="width:100%;hight:100%;border:0;" value="${row2.BCD_ORDER}"></td>
						<td>
						<select id="CAT4${status.index}" name="YN" class="form-control">
						<option value = "Y"<c:if test="${row2.BCD_USE_YN eq 'Y'}">selected</c:if>>사용</option>
						<option value = "N"<c:if test="${row2.BCD_USE_YN eq 'N'}">selected</c:if>>미사용</option>
						</select>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success" value="추가" id="btn-add-row">새라인 추가</button><input id="BTYPE" type="hidden" value="1">
			</div>
	</div>
</div> 
<script>

$('input[type=text]').change(function() {
	var keyid = $(this).attr('id');
	keyid = keyid.substr(4); 
	var catkey = "CAT0"+keyid;
	var catkey1 = "CAT1"+keyid;
	var catkey2 = "CAT2"+keyid;
	var catkey3 = "CAT3"+keyid;
	var catkey4 = "CAT4"+keyid;
	var keyvar0= $("#"+catkey).val();
	var keyvar1= $("#"+catkey1).val();
	var keyvar2= $("#"+catkey2).val();
	var keyvar3= $("#"+catkey3).val();
	var keyvar4= $("#"+catkey4).val();
	var codeData = {};
	codeData.BCD_ID 	= $("#"+catkey).val();
	codeData.BCD_TITLE 	= $("#"+catkey1).val();
	codeData.BCD_REMARK 	= $("#"+catkey2).val();
	codeData.BCD_ORDER 	= $("#"+catkey3).val();
	codeData.BCD_USE_YN 	= $("#"+catkey4).val();
	console.log(codeData);
	$.ajax({ url: "${path}/code/updatebCode.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
});


$('select').change(function(){
	var keyid = $(this).attr('id');
	keyid = keyid.substr(4); 
	var catkey = "CAT0"+keyid;
	var catkey1 = "CAT1"+keyid;
	var catkey2 = "CAT2"+keyid;
	var catkey3 = "CAT3"+keyid;
	var catkey4 = "CAT4"+keyid;
	var keyvar0= $("#"+catkey).val();
	var keyvar1= $("#"+catkey1).val();
	var keyvar2= $("#"+catkey2).val();
	var keyvar3= $("#"+catkey3).val();
	var keyvar4= $("#"+catkey4).val();
	var codeData = {};
	codeData.BCD_ID 	= $("#"+catkey).val();
	codeData.BCD_TITLE 	= $("#"+catkey1).val();
	codeData.BCD_REMARK 	= $("#"+catkey2).val();
	codeData.BCD_ORDER 	= $("#"+catkey3).val();
	codeData.BCD_USE_YN 	= $("#"+catkey4).val();
	console.log(codeData);

	$.ajax({ url: "${path}/code/updatebCode.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
});

function fn_Reload02(url, data){
	$("#listtable").empty();
	$("#listtable").load(url, data, function(){
		setTimeout(function(){
		}, 500);
	$("#BTYPE").val(url.slice(-1));
});
}

function fn_newLine(){
	var cattype= $("#BTYPE").val();
	var codeData = {};
	codeData.BCD_CAT 		= "-";
	codeData.BCD_CAT_TYPE   = $("#BTYPE").val();
	codeData.BCD_TITLE 		= "-";
	codeData.BCD_DETAIL 	= "-";
	codeData.BCD_EDIT_YN 	= "Y";
	codeData.BCD_USE_YN 	= "Y";
	codeData.BCD_ORDER 		= "10";
	codeData.BCD_REMARK 	= "새로운 라인";
	console.log(codeData);
	$.ajax({ url: "${path}/code/insertBcode.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
				var url = "${path}/code/listconBcode/" + cattype; 
				fn_Reload02(url);
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
};

$('#btn-add-row').click(function() {
	fn_newLine();
});
  
$(document).ready(function() {
    $('#listtable').DataTable(
    		{
    			"paging":false,
    			"info":false,
    			"lengthChange":false
    		}
    );
} );
</script>
