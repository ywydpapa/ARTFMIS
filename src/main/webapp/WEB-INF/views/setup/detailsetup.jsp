<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!--제물상/제단 등록-->
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
								<th>구분</th>
								<td><input class = "from-control" id="typename" value="" readonly></td>
								<th scope="row">문구<input type="hidden" id="setupID" value="${dto.SETUP_ID}"></th>
								<td ><input type="text"
									class="form-control"
									id="setupTitle" name="setupTitle" value="${dto.SETUP_TITLE}" placeholder="">
									</td>
									<td>
									<button style="text-align:right;" class="btn btn-md btn-success" value="추가" onClick="fn_setinsert()">새항목 추가</button>
									</td>
							</tr>
							<tr>
								<th scope="row">문구내용</th>
								<td colspan="4"><textarea id="setupcontents"
										rows="8" class="form-control">${dto.SETUP_CONTENTS}</textarea></td>
							</tr>
							<tr>
								<th scope="row">문구설명</th>
								<td colspan="4"><textarea id="setupdesc"
										rows="8" class="form-control">${dto.SETUP_DESC}</textarea></td>
							</tr>
							<tr>
								<th scope="row">사용여부</th>
								<td><select name="useYn" id="useYn"
									class="form-control form-control-sm">
										<option value="Y">사용</option>
										<option value="N">미사용</option>
								</select></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="udtbtn">
				<button class="btn btn-md btn-primary " onClick="fn_Updatesetup()">저장</button>
			</div>
			<div id="istbtn">
				<button class="btn btn-md btn-primary " onClick="fn_Insertsetup()">새로 저장</button>
			</div>
			<br>
		</div>
	</div>
</div>
<style>
	.card-body > div {
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