<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<style>
.h-container:after{ clear: both; display: block; content: '' }
.h-container .item {
	float: left;
	width: 30%;
	height: 100%;
	padding:10px;
	text-align: center;
	border-right: 1px solid #ddd;
}
.h-container .item.cont {
	float: left;
	width: 70%;
	border-right: none;
	text-align: center;
}
</style>

<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					<h5>기초코드 목록</h5>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="h-container">
	<div class="item">
		<table id="list01table" class="table table-bordered">
			<colgroup>
				<col width="15%" />
				<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th class="table-secondary">분류명</th>
					<th class="table-secondary">설명</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="row2" items="${list01}">
					<tr>
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listcon02/${row2.CAT_ID}')">${row2.CAT_TITLE}</a></td>
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listcon02/${row2.CAT_ID}')">${row2.CAT_REMARK}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="item cont">
		<div class="btn_wr text-right mt-3">
			<button class="btn btn-md btn-success" value="추가" id="btn-add-row">새라인 추가</button>
		</div>
	<hr>
		<table id="listtable" class="table table-bordered">
			<colgroup>
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th class="table-secondary">분류명</th>
					<th class="table-secondary">설명</th>
					<th class="table-secondary">정렬순서</th>
					<th class="table-secondary">상세품목개별선택여부</th>
					<th class="table-secondary">사용여부</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach varStatus="status" var="row2" items="${list02}">
					<tr>
						<td><input id="CAT0${status.index}" type="hidden" style="width:100%; border:0;" value="${row2.CAT_ID}">
						<input id="CAT1${status.index}" type="text" style="width:100%; border:0;" value="${row2.CAT_TITLE}"></td>
						<td><input id="CAT2${status.index}" type="text" style="width:100%; border:0;" value="${row2.CAT_REMARK}"></td>
						<td><input id="CAT3${status.index}" type="text" style="width:100%; border:0;" value="${row2.CAT_ORDER}"></td>
						<td>
						<select id="CAT4${status.index}" class="form-control">
						<option value = "Y"<c:if test="${row2.CAT_03_YN eq 'Y'}">selected</c:if>>예</option>
						<option value = "N"<c:if test="${row2.CAT_03_YN eq 'N'}">selected</c:if>>아니오</option>
						</select>
						<input id="CATX${status.index}" type="hidden" value="${row2.CAT_01}">
						</td>
						<td>
						<select id="CAT5${status.index}" class="form-control">
						<option value = "Y"<c:if test="${row2.CAT_USE_YN eq 'Y'}">selected</c:if>>사용</option>
						<option value = "N"<c:if test="${row2.CAT_USE_YN eq 'N'}">selected</c:if>>미사용</option>
						</select>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div> 
<script>
$('input[name=c01type]').on('click', function() {
	var code = $(this).val();
	var url="${path}/code/listcon02/"+code;
	fn_Reload02(url);
});

function fn_Reload02(url, data){
	$("#listtable").empty();
	$("#listtable").load(url, data, function(){
		setTimeout(function(){
		}, 500);
});
}

$('#btn-add-row').click(function() {
	fn_newLine();
});

$('input[type=text]').change(function() {
	var keyid = $(this).attr('id');
	keyid = keyid.substr(4); 
	var catkey = "CAT0"+keyid;
	var catkey1 = "CAT1"+keyid;
	var catkey2 = "CAT2"+keyid;
	var catkey3 = "CAT3"+keyid;
	var catkey4 = "CAT4"+keyid;
	var catkey5 = "CAT5"+keyid;
	var codeData = {};
	codeData.CAT_ID 	= $("#"+catkey).val();
	codeData.CAT_TITLE 	= $("#"+catkey1).val();
	codeData.CAT_REMARK = $("#"+catkey2).val();
	codeData.CAT_ORDER	= $("#"+catkey3).val();
	codeData.CAT_03_YN	= $("#"+catkey4).val();
	codeData.CAT_USE_YN	= $("#"+catkey5).val();
	console.log(codeData);
	$.ajax({ url: "${path}/code/update02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
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
	var catkey5 = "CAT5"+keyid;
	var codeData = {};
	codeData.CAT_ID 	= $("#"+catkey).val();
	codeData.CAT_TITLE 	= $("#"+catkey1).val();
	codeData.CAT_REMARK = $("#"+catkey2).val();
	codeData.CAT_ORDER	= $("#"+catkey3).val();
	codeData.CAT_03_YN	= $("#"+catkey4).val();
	codeData.CAT_USE_YN	= $("#"+catkey5).val();
	console.log(codeData);
	$.ajax({ url: "${path}/code/update02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
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

function fn_newLine(){
	var cat01 = $("#CATX0").val();
	var codeData = {};
	codeData.CAT_01 		= $("#CATX0").val();
	codeData.CAT_TITLE 		= "-";
	codeData.CAT_REMARK 	= "-";
	codeData.CAT_USE_YN 	= "Y";
	codeData.CAT_ORDER	 	= "10";
	codeData.CAT_03_YN 		= "N";
	console.log(codeData);
	$.ajax({ url: "${path}/code/insert02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
				var url = "${path}/code/listcon02/"+cat01;
				fn_Reload02(url);
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
};

  
$(document).ready(function() {
/*     $('#listtable').DataTable(
    		{
    			"paging":false,
    			"info":false,
    			"lengthChange":false
    		}
    ); */
} );
</script>
