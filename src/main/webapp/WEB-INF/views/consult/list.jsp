<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->
<div class="cnt_wr">
	<!-- Row start -->
	<div class="row">
		<div class="col-lg-12 col-xl-12">
			<div class="tab-content tabs m-t-20">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="form5" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
										<tr>
											<th scope="row">계약목록 조회</th>
										</tr>
									</tbody>
								</table>
								<table class="table table-sm bst02">
									<colgroup>
										<col width="40%" />
										<col width="30%" />
										<col width="30%" />
									</colgroup>
									<thead>
										<th>계약일자</th>
										<th align="center">고인성명</th>
										<th align="center">호실</th>
									</thead>
									<tbody>
										<tr>
											<td align="center"><input type="date">
											<span> ~ </span>
											<input type="date">
											</td>
											<td><input class = "form-control" type="text"></td>
											<td>
											<select class = "form-control">
											<option value="">선택</option>
											<option value="10001">VIP룸</option>
											<option value="10002">일반실 A</option>
											</select>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-primary"
									onClick="fn_contUpdate()">검색</button>
									<button class="btn btn-md btn-inverse">초기화</button>
							</div>
								
							</form>
								<br>
								<table class="table table-sm bst02">
									<tbody>
										<tr>
											<th scope="row">계약 목록</th>
										</tr>
									</tbody>
								</table>
								<table class="table table-sm bst02">
									<colgroup>
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
									</colgroup>
									<thead>
										<th>계약번호</th>
										<th>계약일자</th>
										<th>고인성명</th>
										<th>상주성명</th>
										<th>선택상품</th>
										<th>계약금액</th>
										<th>추가금액</th>
										<th>정산완료여부</th>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
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