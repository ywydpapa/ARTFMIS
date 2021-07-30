<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="cnt_wr">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table class="table table-sm bst02">
						<colgroup>
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="20%" />
							<col width="15%" />
						</colgroup>
						<tbody>
							<tr>
								<th style="text-align: center" scope="row">장례식장명</th>
								<td><input type="text" class="form-control"
									id="fnamek" value="${list.FNR_NAMEK}" placeholder=""></td>
								<th style="text-align: center" scope="row">고유번호</th>
								<td><input class="form-control" type="text" id="fid" value="${list.FNR_ID}"></td>
								<td>
									<button style="text-align: right;" class="btn btn-md btn-success" value="추가"
										onClick="fn_setNewFnr()">장례식장 추가</button>
								</td>
							</tr>
							<tr>
								<th style="text-align: center" scope="row">대표번호</th>
								<td><input type="tel" class="form-control"
									value="${list.FNR_TELNO1}" id="ftel1"></td>
								<th style="text-align: center" scope="row">대표휴대폰번호</th>
								<td colspan="2"><input type="tel" class="form-control"
									value="${list.FNR_TELNO2}" id="ftel2"></td>
							</tr>
							<tr>
								<th style="text-align: center" scope="row">팩스번호</th>
								<td><input type="tel" class="form-control"
									value="${list.FNR_FAXNO}" id="ffax"></td>
								<th style="text-align: center" scope="row">홈페이지</th>
								<td colspan="2"><input type="url" class="form-control"
									value="${list.FNR_URL}" id="fwww"></td>
							</tr>
							<tr>
								<th style="text-align: center" scope="row">주소</th>
								<td><input type="text" id="fadd1" class="form-control" value="${list.FNR_ADDR1}"></td>
								<th style="text-align: center" scope="row" >상세주소</th>
								<td colspan="2"><input type="text" id="fadd2" class="form-control" value="${list.FNR_ADDR2}"></td>
							</tr>
							<tr>
								<th style="text-align: center" scope="row">이메일</th>
								<td><input type="email" class="form-control"
									value="${list.FNR_EMAIL}" id="femail"></td>
								<th style="text-align: center" scope="row">사업자 번호</th>
								<td colspan="2"><input type="text" class="form-control"
									value="${list.FNR_VATNO}" id="fvatno"></td>
							</tr>
							<tr>
								<th style="text-align: center" scope="row">로고</th>
								<td><input type="file" class="form-control"
									value="${list.FNR_EMAIL}" id="flogo"></td>
								<th style="text-align: center" scope="row">도장파일</th>
								<td colspan="2"><input type="file" class="form-control"
									value="${list.FNR_VATNO}" id="fstamp"></td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
			<c:if test="${not empty list.FNR_ID}">
				<div id="udtbtn">
					<button class="btn btn-md btn-primary " onClick="fn_Updatefnr()">저장</button>
				</div>
			</c:if>
			<c:if test="${empty list.FNR_ID}">
				<div id="istbtn">
					<button class="btn btn-md btn-primary " onClick="fn_Insertfnr()">새로
						저장</button>
				</div>
			</c:if>
			<br>
		</div>
	</div>
</div>
<style>
.card-body>div {
	background-size: contain;
	background-repeat: no-repeat;
	width: 100%;
	height: 0;
	padding-top: 66.64%;
}
</style>
<!--//상품등록-->

<script>
		$(document).ready(function() {
		});

</script>