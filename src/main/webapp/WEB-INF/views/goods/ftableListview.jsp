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

.detailftable {
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

	<table class="table table-bordered "
		style="width: 100%;">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<td style="vertical-align:middle;text-align:center;background-color:#E6F8E0">제물상 구분</td>
			<td><select name="FTABLE_CAT" id="FTABLE_CAT" class="form-control">
			<c:forEach var="row" items="${listftab}">
			<option value="${row.BCD_ID}">${row.BCD_TITLE}</option>
			</c:forEach>
			</select></td>
		</tr>
</table>
<hr>
	<div class="h-container">
		<div class="item">
			<table class="table table-bordered table-hover"
				id="ftablelist">
				<thead>
					<tr>
      <th class="table-secondary text-center">구분</th>
      <th class="table-secondary text-center">금액</th>
      <th class="table-secondary text-center">단위</th>
      <th class="table-secondary text-center">사용여부</th>
					</tr>
				</thead>
				<tbody>
    <c:forEach var="row" items="${list}">
    <tr>
      <td class="first align-middle text-center">${row.BCD_TITLE}</td>
      <td style="text-align : right"><a href="javascript:fnSetftabledetail('${path}/goods/detailFtable/${row.FTABLE_ID}')"><fmt:formatNumber value="${row.FTABLE_AMOUNT}" pattern="#,###" /></a></td>
      <td style="text-align : right">${row.FTABLE_UNIT}</td>
      <td class="text-center"><c:if test="${row.FTABLE_USE_YN eq 'Y'}">사용</c:if><c:if test="${row.FTABLE_USE_YN eq 'N'}">미사용</c:if></td>
    </tr>
    </c:forEach>
				</tbody>
			</table>

		</div>
		<div class="item cont">
			<div id="detailftable" class="detailftable" style="padding:0 12px;"></div>
		</div>
	</div>
</div>
<script>

$('#FTABLE_CAT').change(function(){
	var url ="${path}/goods/ftablelist/"+$("#FTABLE_CAT").val();
	fnSetTablelist(url);
	setclear();
	tableListLoad(url);
	
	var newname = $('#FTABLE_CAT').text();
});

function fnSetftabledetail(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#detailftable").empty();
		$("#detailftable").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}

function fnSetTablelist(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#ftablelist").empty();
		$("#ftablelist").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}


function fn_newFtable(){
	var roomData = {};
	roomData.FTABLE_TITLE 		= "New";
	roomData.FTABLE_REMARK 	= "-";
	roomData.FTABLE_USE_YN 	= "Y";
	console.log(roomData);
	$.ajax({ url: "${path}/goods/insertFtable.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: roomData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					fnSetPage('${path}/goods/ftableListview.do');
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
};

function tableListLoad(url){
	$.ajax({
		type: "GET",
		url : url,
		dataType : "html",
		success : function(html){
			$("#ftablelist").empty();
			$("#ftablelist").append(html);		
			tableDetailLoad();
		},
		error : function(xhr){
			console.log(xhr);
		}
	});
}

function tableDetailLoad(){

	var $target;
	var num1 = $("#ftablelist > tbody > tr > td > a").length;
	var num2 = $("#goodsTable > tbody > tr > td > a").length;
	if (num1 > 0 || num2 > 0){
		if (num1 > 0){
			$target = $("#ftablelist > tbody > tr > td > a");
		} else {
			$target = $("#goodsTable > tbody > tr > td > a");
		}
	}
	
	if (num1 > 0 || num2 > 0){
		var tempArr = $target.eq(0).attr('href').split('/');
		var num = tempArr[tempArr.length - 1].replace(')','').replace('"','').replace('\'','');
		var url ="${path}/goods/detailFtable/"+num;
		$.ajax({
			type: "GET",
			url : url,
			dataType : "html",
			success : function(html){
				$("#detailftable").empty();
				$("#detailftable").append(html);
			},
			error : function(xhr){
				console.log(xhr);
			}
		});
	} else {
		fn_setclear();
	}
}

function fn_setclear(){
	$("#altarTitle").val("");
	$("#priceNet").val("");
	$("#intQty").val("");
	$("#ftableID").val("");
	$("#priceSale").val("");
	$("input[name=altarImage]").val("");
	$("#useYn").val("Y");
	$("#altarRemark").val("");	
	$('#typename').val("");
	var name = $('#FTABLE_CAT option:selected').text();
	$('#typename').val(name);
}

$(".first").each(function() {
	  var rows = $(".first:contains('" + $(this).text() + "')");
	  if (rows.length > 1) {
	    rows.eq(0).attr("rowspan", rows.length);
	    rows.not(":eq(0)").remove();
	  }
	});


$(document).ready(function(){
	tableDetailLoad();
});

</script>
