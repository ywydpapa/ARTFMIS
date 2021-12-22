<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.listcont {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

.detailcont {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

.defaultcont {
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
	width: 7%;
	height: 100%;
	text-align: center;
	background: white;
	border-right: 1px solid #ddd;
}

.h-container .item.dash {
	float: left;
	width: 50%;
	border-right: none;
	text-align: center;
} 

.h-container .item.cont {
	float: left;
	width: 43%;
	border-right: none;
	text-align: center;
}
</style>
<div class="listcont">
	<%-- <div class="listcategory">
		<table class="table table-bordered" style="width: 80%;">
		<colgroup>
			<col width="20%" />
			<col width="60%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<td style="text-align:center;vertical-align:middle">상담 조회</td>
			<td><select id="consult_list" class="form-control">
				<c:forEach var="row" items="${listconsult}">
				<option value="${row.CONSULT_ID}">${row.PATI_NAME}<span>  :  </span>${row.CONSULT_DATE}</option>
				</c:forEach>				
			</select></td>
			<td>
				<button class="btn btn-md btn-success" value="불러오기" onClick="fn_ReloadConsult()">불러오기</button>
				<button class="btn btn-md btn-success" value="추가" onClick="fn_NewConsult()">새상담</button>
			</td>
		</tr>
		</table>
	</div>			
<hr> --%>
	<div class="h-container">
		<div class="item">
		<table class="table table-bordered nowrap listcont" id="listTable">
				<thead>
					<tr>
						<th scope="col" width="200" align="center"></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><a href="javascript:tab01active()">[1] 상담기본</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab02active()">[2] 분향실</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab03active()">[3] 제물상</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab04active()">[4] 장의용품</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab05active()">[5] 제단</a></td>
						</tr>
						<!-- <tr>
							<td><a href="javascript:tab08active()">[6] 기타시설</a></td>
						</tr> -->
				</tbody>
			</table>		</div>
		<div class="item dash">
			<div id="defaultTable" class="defaultcont">
			</div>
		</div>
		<div class="item cont">
			<div id="detailTable" class="detailcont"></div>
		</div>
	</div>
</div>
<script>
$(document).off("dblclick").on("dblclick", "#consultSelect", function(){
	modal.hide();
	
	var id = $(this).attr("data-id");
	var pathDetail = "${path}/consult/detailConsult/" + id;
	var pathDefault = "${path}/consult/defaultConsult/" + id;
	
	fnSetConsultdefault(pathDefault);
	fnSetConsultdetail(pathDetail);
});
function fn_NewConsult(){
	var num=$("#consult_list").val();
	var url = "${path}/consult/detailConsultNew.do";
	var url2 = "${path}/consult/defaultConsultNew.do";
	fnSetConsultdefault(url2);
	fnSetConsultdetail(url);
}

function fn_ReloadConsult(){
	var num=$("#consult_list").val();
	var url = "${path}/consult/detailConsult/0";
	var url2 = "${path}/consult/defaultConsult/0";
	fnSetConsultdefault(url2);
	fnSetConsultdetail(url);
}
function fnSetConsultdetail(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#detailTable").empty();
		$("#detailTable").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}

function fnSetConsultdefault(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#defaultTable").empty();
		$("#defaultTable").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}

	function fn_newConsult(){
		var cstdate = new Date();
		var consultdate = leadingZeros(cstdate.getFullYear(), 4) + '-' +
		        leadingZeros(cstdate.getMonth() + 1, 2) + '-' +
		        leadingZeros(cstdate.getDate(), 2);
		var consultData = {};
		consultData.CONSULT_DATE	= consultdate;
		consultData.PATI_NAME 		= "";
		console.log(consultData);
		$.ajax({ url: "${path}/consult/insertConsult.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data: consultData , // HTTP 요청과 함께 서버로 보낼 데이터 
					method: "POST", // HTTP 요청 메소드(GET, POST 등) 
					dataType: "json" // 서버에서 보내줄 데이터의 타입 
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						fnSetPage('${path}/consult/listview.do');
					}else{
						alert("저장 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
				.fail(function(xhr, status, errorThrown) { 
					alert("통신 실패");
				});
	};

	function leadingZeros(n, digits) {
	    var zero = '';
	    n = n.toString();
	    if (n.length < digits) {
	        for (i = 0; i < digits - n.length; i++)
	            zero += '0';
	    }
	    return zero + n;
	}
 	/* function tab01active(){
		$('.tab-pane').removeClass('active');
		$('#tab01').addClass('active');
	}
	function tab02active(){
		$('.tab-pane').removeClass('active');
		$('#tab02').addClass('active');
	}
	function tab03active(){
		$('.tab-pane').removeClass('active');
		$('#tab03').addClass('active');
	}
	function tab04active(){
		$('.tab-pane').removeClass('active');
		$('#tab04').addClass('active');
	}
	function tab05active(){
		$('.tab-pane').removeClass('active');
		$('#tab05').addClass('active');
	}
	function tab08active(){
		$('.tab-pane').removeClass('active');
		$('#tab08').addClass('active');
	} */ 
	function fn_UpdconsultP1(consultId){
		var consultData = {};
		consultData.CONSULT_DATE = $("#consultDate").val();
		consultData.PATI_NAME = $("#patiName").val();
		consultData.BFAMILY_NAME = $("#bfamilyName").val();
		consultData.TEL_NO = $("#telNo").val();
		consultData.HOSPITAL = $("#hospital").val();
		consultData.RELIGION = $("#religion").val();
		consultData.BURI_YN = $("#buriYn").val();
		consultData.REMARK = $("#remark").val();
		consultData.CONSULT_ID = consultId; 
		console.log(consultData);
		$.ajax({ url: "${path}/consult/updateConsult.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data: consultData , // HTTP 요청과 함께 서버로 보낼 데이터 
					method: "POST", // HTTP 요청 메소드(GET, POST 등) 
					dataType: "json" // 서버에서 보내줄 데이터의 타입 
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					/* if(data.code == 10001){
						fnSetPage('${path}/consult/listview.do');
					}else{
						alert("저장 실패");
					}  */
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
				.fail(function(xhr, status, errorThrown) { 
					alert("통신 실패");
				});
		
	}
	
	function fn_InsertConsult(){
		var consultData = {};
		consultData.CONSULT_DATE = $("#consultDate").val();
		consultData.PATI_NAME = $("#patiName").val();
		consultData.BFAMILY_NAME = $("#bfamilyName").val();
		consultData.TEL_NO = $("#telNo").val();
		consultData.HOSPITAL = $("#hospital").val();
		consultData.RELIGION = $("#religion").val();
		consultData.BURI_YN = $("#buriYn").val();
		consultData.REMARK = $("#remark").val();
		$.ajax({ 
			url: "${path}/consult/insertConsult.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
			data: consultData , // HTTP 요청과 함께 서버로 보낼 데이터 
			method: "POST", // HTTP 요청 메소드(GET, POST 등) 
			dataType: "json" // 서버에서 보내줄 데이터의 타입 
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
		.done(function(data) {
			/* if(data.code == 10001){
				fnSetPage('${path}/consult/listview.do');
			}else{
				alert("저장 실패");
			}  */
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) { 
			alert("통신 실패");
		});
		
	}
</script>
