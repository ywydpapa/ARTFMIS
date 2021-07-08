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
}
</style>
<div class="cnt_wr swcCard">
	<!-- Row start -->
	<div class="row">
		<div class="col-lg-12 col-xl-12">
			<div class="tab-content tabs m-t-20">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table  table-bordered nowrap">
							<tbody>
								<tr>
									<th scope="row">계약 목록</th>
								</tr>
							</tbody>
						</table>
						<table class="table table-bordered nowrap">
							<colgroup>
								<col width="10%" />
								<col width="30%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
							</colgroup>
							<thead>
							<tr style="text-align:center;">
								<th >분향실</th>
								<th>계약일자</th>
								<th>고인성명</th>
								<th>상주성명</th>
								<th>선택상품</th>
								<th>계약금액</th>
								<th>추가금액</th>
								<th>정산</th>
							</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${listcont}">
										<tr>
											<td>${row.FROOM_TITLE}<input type="hidden" class = "FRMID" value = "${row.FROOM_ID}"></td>
											<td class = "CONTPERIOD"style="text-align: center;">
											<a href="<c:if test="${row.CONTRACT_ID eq 0 }">#</c:if><c:if test="${row.CONTRACT_ID ne 0 }">javascript:fnSetPage('${path}/cont/settdetail/${row.CONTRACT_ID}?CONT_FROOM_ID=${row.FROOM_ID}')</c:if>">${row.STDATE}<span> ~ </span>
											${row.EDDATE}</a></td>
											<td class = "DPNAME" style="text-align: center;">${row.DPERSON_NAME}</td>
											<td class = "SJNAME" style="text-align: center;">${row.SANGJU_NAME}</td>
											<td class = "sRMd" style="text-align: right;"></td>
											<td class = "CONTAMPUNT" style="text-align: right;"><fmt:formatNumber value="" pattern="#,###" /></td>
											<td class = "ADDAMOUNT" style="text-align: right;"><fmt:formatNumber value="" pattern="#,###" /></td>
											<td style="text-align: center; display:none"><input type="checkbox" class="CHKsrm form-control" /></td>
											<td style="text-align:center;"><input type="button" onclick="<c:if test="${row.CONTRACT_ID ne 0 }">javascript:fnSetPage('${path}/cont/settdetail/${row.CONTRACT_ID}?CONT_FROOM_ID=${row.FROOM_ID}')</c:if>" <c:if test="${!row.SETYN eq 'S'}"> disabled </c:if> value="정산"></td>
										</tr>
									</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- Row end -->
			</div>
		</div>
	</div>
</div>
<!--계약기본등록-->
<script>
	
</script>