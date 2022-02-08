<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	height: 100px;
	padding: 15px;
	text-align: center;
	background: white;
	border-right: 1px solid #ddd;
}

.h-container .item.cont {
	width: 100%;
	padding: 15px;
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
					<!-- <table class="table  table-bordered nowrap">
						<tbody>
							<tr>
								<th scope="row">계약 목록</th>
							</tr>
						</tbody>
					</table> -->
					<div class="h-container">
						<div class="item">
							<div class="table-responsive table-bordered">
								<table id="" class="" style="margin-top: 10px; margin-bottom: 10px;">
									<tr>
										<td style="border:1px solid white;"> 
											<span> 입실중인 호실 </span>
											<select id = "contSelect" class="FRMID form-control-md">
											<c:forEach var="row" items="${listcont}">
												<c:if test="${empty row.SETT_DATE}"><option value="${path}/cont/settdetail/${row.CONTRACT_ID}?CONT_FROOM_ID=${row.FROOM_ID}">${row.FROOM_TITLE}</option></c:if>
											</c:forEach>
											</select>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="item cont" style="padding:0;">
							<div id="detailtable" class="detailtable"></div>
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
	function fnSetcontdetail(url, data) {
		$("#detailtable").empty();
		$("#detailtable").load(url, data, function() {
			setTimeout(function() {
			}, 500);
		});
	}

	$("#contSelect").change(function() {
		var url = $("#contSelect").val();
		fnSetcontdetail(url);
	});

	$(document).ready(function(){
		var url = $("#contSelect").val();
		fnSetcontdetail(url);
	});
</script>