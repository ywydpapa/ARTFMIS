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

.h-container:after {
	clear: both;
	display: block;
	content: ''
}

.h-container .item {
	float: left;
	width: 20%;
	height: 100%;
	text-align: center;
	background: white;
	border-right: 1px solid #ddd;
}

.h-container .item.cont {
	float: left;
	width: 78%;
	border-right: none;
	text-align: center;
}
</style>
<div class="listcont">
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						<h3>상담관리</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="h-container">
		<div class="item">
			<table class="table table-bordered nowrap"
				id="roomTable">
				<thead>
					<tr>
      			<th scope="col" width="150" align="center">환자명</th>
      			<th scope="col" width="300" align="center">상담일자</th>
					</tr>
				</thead>
				<tbody>
    <c:forEach var="row" items="${listconsult}">
    <tr>
      <td><a href="javascript:fnSetftabledetail('${path}/consult/detailConsult/${row.CONSULT_ID}')">${row.PATI_NAME}</a></td>
      <td style="text-align : right">${row.CONSULT_DATE}</td>
    </tr>
    </c:forEach>
				</tbody>
			</table>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success" value="추가"
					onClick="fn_newConsult()">추가</button>
			</div>

		</div>
		<div class="item cont">
			<div id="detailftable" class="detailftable"></div>
		</div>
	</div>
</div>
<script>

function fnSetftabledetail(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#detailftable").empty();
		$("#detailftable").load(url, data, function(){
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
		consultData.PATI_NAME 		= "환자명";
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
	
</script>
