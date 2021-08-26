<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div class="cnt_wr">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
			<div class="btn_wr text-right mt-3">
				<div id="udtbtn">
					<button class="btn btn-md btn-primary " onClick="fn_UpdateRole()">저장</button>
				</div>
			</div>
			<hr>
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
								<th class="table-success" style="text-align: center" scope="row">사용자 이름<input
									type="hidden" id="userId" value="${list.USER_ID}">
									</th>
								<td><input type="text" class="form-control"
									id="unamk" value="${list.USER_NAMK}" readonly></td>
								<th class="table-success" style="text-align: center" scope="row">로그인아이디</th>
								<td colspan="2"><input class="form-control" type="text" id="uId" value="${list.USER_LOGINID}" readonly></td>
							</tr>
							<tr>
								<th class="table-success" style="text-align: center" scope="row">권한</th>
								<td><select class="urole form-control" id="urank" disabled>
										<option value="CUSER"
											<c:if test="${list.USER_RANK eq 'CUSER'}">selected</c:if>>일반
											사용자</option>
										<option value="ADMIN"
											<c:if test="${list.USER_RANK eq 'ADMIN'}">selected</c:if>>관리자</option>
										<option value="ROOM"
											<c:if test="${list.USER_RANK eq 'ROOM'}">selected</c:if>>분향실
											사용자</option>
										<option value="REST"
											<c:if test="${list.USER_RANK eq 'REST'}">selected</c:if>>식당
											사용자</option>
										<option value="STORE"
											<c:if test="${list.USER_RANK eq 'STORE'}">selected</c:if>>매점
											사용자</option>
										<option value="SUPP"
											<c:if test="${list.USER_RANK eq 'SUPP'}">selected</c:if>>외부업체
											사용자</option>
								</select></td>
								<th class="table-success" style="text-align: center" scope="row">부서</th>
								<td colspan="2"><select class="uDept form-control"
									id="udept" disabled>
										<c:forEach var="row" items="${dept}">
											<option value="${row.BCD_ID}"
												<c:if test="${list.USER_DEPT eq row.BCD_ID}">selected</c:if>>${row.BCD_TITLE}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">상담 관리(A)</th>
							<c:set var = "role1" value = "${list.USER_ROLE1}" />
							<td><select id="Arole" class="form-control">
							<option value="A2" <c:if test = "${fn : contains(role1, 'A2')}">selected</c:if> >읽기/쓰기</option>
							<option value="A1" <c:if test = "${fn : contains(role1, 'A1')}">selected</c:if> >읽기전용</option>
							<option value="A0"<c:if test = "${fn : contains(role1, 'A0')}">selected</c:if> >접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">계약 목록(B)</th>
							<td><select id="Brole" class="form-control">
							<option value="B2" <c:if test = "${fn : contains(role1, 'B2')}">selected</c:if>>읽기/쓰기</option>
							<option value="B1" <c:if test = "${fn : contains(role1, 'B1')}">selected</c:if>>읽기전용</option>
							<option value="B0" <c:if test = "${fn : contains(role1, 'B0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">계약 등록(C)</th>
							<td><select id="Crole" class="form-control">
							<option value="C2" <c:if test = "${fn : contains(role1, 'C2')}">selected</c:if>>읽기/쓰기</option>
							<option value="C1" <c:if test = "${fn : contains(role1, 'C1')}">selected</c:if>>읽기전용</option>
							<option value="C0" <c:if test = "${fn : contains(role1, 'C0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">정산 관리(D)</th>
							<td><select id="Drole" class="form-control">
							<option value="D2" <c:if test = "${fn : contains(role1, 'D2')}">selected</c:if>>읽기/쓰기</option>
							<option value="D1" <c:if test = "${fn : contains(role1, 'D1')}">selected</c:if>>읽기전용</option>
							<option value="D0" <c:if test = "${fn : contains(role1, 'D0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">물품 등록(E)</th>
							<td><select id="Erole" class="form-control">
							<option value="E2" <c:if test = "${fn : contains(role1, 'E2')}">selected</c:if>>읽기/쓰기</option>
							<option value="E1" <c:if test = "${fn : contains(role1, 'E1')}">selected</c:if>>읽기전용</option>
							<option value="E0" <c:if test = "${fn : contains(role1, 'E0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">호실 등록(F)</th>
							<td><select id="Frole" class="form-control">
							<option value="F2" <c:if test = "${fn : contains(role1, 'F2')}">selected</c:if>>읽기/쓰기</option>
							<option value="F1" <c:if test = "${fn : contains(role1, 'F1')}">selected</c:if>>읽기전용</option>
							<option value="F0" <c:if test = "${fn : contains(role1, 'F0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">제단 등록(G)</th>
							<td><select id="Grole" class="form-control">
							<option value="G2" <c:if test = "${fn : contains(role1, 'G2')}">selected</c:if>>읽기/쓰기</option>
							<option value="G1" <c:if test = "${fn : contains(role1, 'G1')}">selected</c:if>>읽기전용</option>
							<option value="G0" <c:if test = "${fn : contains(role1, 'G0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">제물상 등록(H)</th>
							<td><select id="Hrole" class="form-control">
							<option value="H2" <c:if test = "${fn : contains(role1, 'H2')}">selected</c:if>>읽기/쓰기</option>
							<option value="H1" <c:if test = "${fn : contains(role1, 'H1')}">selected</c:if>>읽기전용</option>
							<option value="H0" <c:if test = "${fn : contains(role1, 'H0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">표준 주문서 등록(I)</th>
							<td><select id="Irole" class="form-control">
							<option value="I2" <c:if test = "${fn : contains(role1, 'I2')}">selected</c:if>>읽기/쓰기</option>
							<option value="I1" <c:if test = "${fn : contains(role1, 'I1')}">selected</c:if>>읽기전용</option>
							<option value="I0" <c:if test = "${fn : contains(role1, 'I0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">코드 등록(J)</th>
							<td><select id="Jrole" class="form-control">
							<option value="J2" <c:if test = "${fn : contains(role1, 'J2')}">selected</c:if>>읽기/쓰기</option>
							<option value="J1" <c:if test = "${fn : contains(role1, 'J1')}">selected</c:if>>읽기전용</option>
							<option value="J0" <c:if test = "${fn : contains(role1, 'J0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">문구 등록(K)</th>
							<td><select id="Krole" class="form-control">
							<option value="K2" <c:if test = "${fn : contains(role1, 'K2')}">selected</c:if>>읽기/쓰기</option>
							<option value="K1" <c:if test = "${fn : contains(role1, 'K1')}">selected</c:if>>읽기전용</option>
							<option value="K0" <c:if test = "${fn : contains(role1, 'K0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">정산규칙 등록(L)</th>
							<td><select id="Lrole" class="form-control">
							<option value="L2" <c:if test = "${fn : contains(role1, 'L2')}">selected</c:if>>읽기/쓰기</option>
							<option value="L1" <c:if test = "${fn : contains(role1, 'L1')}">selected</c:if>>읽기전용</option>
							<option value="L0" <c:if test = "${fn : contains(role1, 'L0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th class="table-success" style="text-align: center" scope="row">설정 등록(M)</th>
							<td><select id="Mrole" class="form-control">
							<option value="M2" <c:if test = "${fn : contains(role1, 'M2')}">selected</c:if>>읽기/쓰기</option>
							<option value="M1" <c:if test = "${fn : contains(role1, 'M1')}">selected</c:if>>읽기전용</option>
							<option value="M0" <c:if test = "${fn : contains(role1, 'M0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
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