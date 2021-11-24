<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<style>
.swcCard {
        width: 100%;
        height: 100%;
        padding : 20px;
        background: white;
}

.h-container .item {
	float: left;
	width: 30%;
	height: 100%;
	padding: 20px;
	text-align: center;
	background: white;
	border-right: 1px solid #ddd;
}

.h-container .item.cont {
	float: left;
	width: 70%;
	padding: 20px;
	border-right: none;
	text-align: center;
}
</style>
<div class="cnt_wr swcCard">
	<!-- Row start -->
	<div class="row">
		<div class="col-lg-12 col-xl-12">
			<div class="tab-content tabs m-t-20">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table table-bordered nowrap">
							<tbody>
								<tr>
									<th scope="row">계약 목록</th>
								</tr>
							</tbody>
						</table>
						<div class="h-container">
						<div class="item">
						<table id="consult_contract_list_table" class="table table-bordered nowrap">
							<colgroup>
								<col width="15%" />
								<col width="30%" />
								<col width="15%" />
								<col width="20%" />
								<col width="20%" />
							</colgroup>
							<thead>
							<tr style="vertical-align:middle;text-align:center;">
								<th style="vertical-align:middle;text-align:center;">호실</th>
								<th style="vertical-align:middle;text-align:center;">계약일자</th>
								<th style="vertical-align:middle;text-align:center;">입실</th>
								<th style="vertical-align:middle;text-align:center;">고인</th>
								<th style="vertical-align:middle;text-align:center;">상주</th>
							</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${listcont}">
									<tr>
										<td style="vertical-align:middle;text-align:center;">${row.FROOM_TITLE}<input type="hidden" class = "FRMID" value = "${row.FROOM_ID}"></td>
										<td class = "CONTPERIOD"style="vertical-align:middle;text-align:center;">
										<a href="<c:if test="${row.CONTRACT_ID eq 0 }">#</c:if><c:if test="${row.CONTRACT_ID ne 0 }">javascript:fnSetContdetail('${path}/cont/detailconttr/${row.CONTRACT_ID}?CONT_FROOM_ID=${row.FROOM_ID}')</c:if>">${row.STDATE}<span> ~ </span>
										${row.EDDATE}</a></td>
										<td class = "INOUT" style="vertical-align:middle;text-align: center;">${row.inRoom}</td>
										<td class = "DPNAME" style="vertical-align:middle;text-align: center;">${row.DPERSON_NAME}</td>
										<td class = "SJNAME" style="vertical-align:middle;text-align: center;">${row.SANGJU_NAME}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
						<div class="item cont">
							<div id="detailcont" class="detailcont">
							</div>
						</div>
						</div>
					</div>
				</div>
				<!-- Row end -->
			</div>
		</div>
	</div>
</div>
<!--계약기본등록-->
<script>
function fnSetContdetail(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#detailcont").empty();
		$("#detailcont").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}
	
</script>