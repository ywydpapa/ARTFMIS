<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
					<div class="cnt_wr">
						<div class="row">
							<div class="col-sm-12">
								<div class="card-block table-border-style">
									<div class="table-responsive">
										<table class="table table-sm bst02">
											<tbody>
												<tr>
													<th scope="row">기본사항</th>
												</tr>
											</tbody>
										</table>
										<table class="table table-sm bst02">
											<tbody>
											<tr>
											<td style="text-align:center">상담일자</td>
											<td style="text-align:center">${cst.CONSULT_DATE}</td>
											<td></td>
											<td></td>
											</tr>
											<tr>
											<td style="text-align:center">환자성명</td>
											<td style="text-align:center"><input type="text" class="form-control" id="patiName" value="${cst.PATI_NAME}"></td>
											<td style="text-align:center">병원</td>
											<td style="text-align:center"><input type="text" class="form-control" id="hospital" value="${cst.HOSPITAL}"></td>
											</tr>
											<tr>
											<td style="text-align:center">보호자성명</td>
											<td style="text-align:center"><input type="text" class="form-control" id="bfamilyName" value="${cst.BFAMILY_NAME}"></td>
											<td style="text-align:center">연락처</td>
											<td style="text-align:center"><input type="text" class="form-control phone" id="telNo" value="${cst.TEL_NO}" maxlength="13"></td>
											</tr>
											<tr>
											<td style="text-align:center">종교</td>
											<td style="text-align:center">
												<select class="form-control" id="religion">
												<c:forEach var="regc" items="${regioncode}">
													<option value="${regc.BCD_ID}">${regc.BCD_TITLE}</option>
												</c:forEach>
												</select>
											</td>
											<td>화장/매장 구분</td>
													<td>
													<select class="form-control" id="buriYn">
															<option value="1">화장</option>
															<option value="2">매장</option>
															<option value="9">기타</option>
													</select>
													</td>
											</tr>
											<tr>
											<td style="text-align:center">메모</td>
											<td colspan="3"><textarea id="remark"
											rows="4" class="form-control">${list.REMARK}</textarea>
											</td>
											</tr>
											<tr>
											<td>상담호실</td>
											<td colspan="3"><table><tr><td>11</td></tr></table></td>
											</tr>
											<c:forEach var="row" items="${setu}">
											<tr>
											<td style="text-align:center">${row.SETUP_TITLE}</td>
											<td colspan="3"><textarea rows="2" style="border: none"class="form-control">${row.SETUP_CONTENTS}</textarea></td>
											</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-primary"
										onClick="fn_UpdconsultP1()">저장</button>
								</div>
							</div>
						</div>
					</div>
<script>
$('.phone').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this);
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 8) {
            $text.val($text.val() + '-');
        }
    }
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
	});
	
</script>					