<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline"></div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->
	<div class="cnt_wr">
	<!-- Row start -->
	<div class="row">
		<div class="col-lg-12 col-xl-12">
		<div class="table-responsive">
				<table class="table table-bordered nowrap">
					<tr>
						<td>
							<input id="frid" type="hidden" value = "${frid}">
							<input id="contid" type="hidden" value = "">
						</td>
					</tr>
				</table>
			</div>
			<div class="tab-content tabs m-t-20">
				<div class="tab-pane" id="tab02" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="room2" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
										<tr>
											<th scope="row">분향실 선택</th>
										</tr>
									</tbody>
								</table>
								<table class="table table-striped table-bordered nowrap" id="roomList">
									<colgroup>
										<col width="10%" />
										<col width="10%" />
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
										<tr>
											<th class="text-center">선택</th>
											<th class="text-center">호실명</th>
											<th class="text-center">사용유무</th>
											<th class="text-center">일일사용료</th>
											<th class="text-center">시간당사용료</th>
											<th class="text-center">면적(m<sup>2</sup>)
											</th>
											<th class="text-center">평수</th>
											<th class="text-center">수용인원</th>
											<th class="text-center">임시호실명</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="row" items="${listFroom}">
										<tr id="${row.FROOM_ID}">
											<td style="text-align: center;"><input type="checkbox" class="CHKroom form-control"  onclick="oneCheck(this);" <c:if test="${row.FROOM_TITLE eq selectoneFroom.RENT_NAME}">checked</c:if>/></td>
											<td>${row.FROOM_TITLE}</td>
											<td></td>
											<td class = "RMday"style="text-align: right;"><fmt:formatNumber value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
											<td class = "RMtime" style="text-align: right;"><fmt:formatNumber value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.FROOM_AREA}</td>
											<td style="text-align: right;">${row.FROOM_AREA_KOR}</td>
											<td style="text-align: right;">${row.FROOM_MAX_PERS}</td>
											<td style="text-align: center;">${row.FROOM_ALIS}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</form>
<%--							<br> <br>--%>
<%--							<table class="table table-striped table-bordered nowrap" id="SltdroomList">--%>
<%--									<colgroup>--%>
<%--										<col width="10%" />--%>
<%--										<col width="10%" />--%>
<%--										<col width="10%" />--%>
<%--										<col width="10%" />--%>
<%--										<col width="10%" />--%>
<%--										<col width="10%" />--%>
<%--										<col width="10%" />--%>
<%--										<col width="10%" />--%>
<%--										<col width="10%" />--%>
<%--									</colgroup>--%>
<%--									<thead>--%>
<%--										<tr>--%>
<%--											<th class="text-center">호실명</th>--%>
<%--											<th class="text-center">일일사용료</th>--%>
<%--											<th class="text-center">시간당사용료</th>--%>
<%--											<th class="text-center">사용일</th>--%>
<%--											<th class="text-center">사용시간</th>--%>
<%--											<th class="text-center">사용요금</th>--%>
<%--											<th style="display:none" class="text-center">선택</th>--%>
<%--										</tr>--%>
<%--									</thead>--%>
<%--									<tbody>--%>
<%--									<c:forEach var="row" items="${listFroom}">--%>
<%--										<tr>--%>
<%--											<td>${row.FROOM_TITLE}<input type="hidden" class = "FRMID" value = "${row.FROOM_ID}"></td>--%>
<%--											<td class = "RMday"style="text-align: right;"><fmt:formatNumber--%>
<%--													value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>--%>
<%--											<td class = "RMtime" style="text-align: right;"><fmt:formatNumber--%>
<%--													value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>--%>
<%--											<td class = "sRMd" style="text-align: right;">2</td>--%>
<%--											<td class = "sRMt" style="text-align: right;">0</td>--%>
<%--											<td class = "RMcharge" style="text-align: right;"><fmt:formatNumber--%>
<%--													value="" pattern="#,###" /></td>--%>
<%--											<td style="text-align: center; display:none"><input type="checkbox"--%>
<%--												class="CHKsrm form-control" /></td>--%>
<%--										</tr>--%>
<%--									</c:forEach>--%>
<%--									</tbody>--%>
<%--								</table>--%>
						</div>
					</div>
					<div class="btn_wr text-right mt-3">
						<button class="btn btn-md btn-primary" onClick="fn_cstInsertP2()">등록</button>
					</div>
				</div>
				<div class="tab-pane" id="tab03" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="form3" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
									<tr>
									<td><span> 제물상 </span></td>
									<td style="text-align: right;"></td>
									</tr>
									</tbody>
								</table>
								<div class="row">
									<table class="table  table-bordered nowrap"
										id="ftTable">
										<thead>
											<tr>
												<th scope="col" width="10%" align="center">구분</th>
												<th scope="col" width="10%" align="center">선택여부</th>
												<th scope="col" width="20%" align="center">금액</th>
												<th scope="col" width="10%" align="center">단위</th>
												<th scope="col" width="30%" align="center">상품이미지</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="row" items="${listFtable}">
												<tr>
													<td class="second">${row.BCD_TITLE}</td>
													<td><input type="checkbox" <c:if test="${row.FTABLE_CAT eq '24'}">onclick="oneCheckft(this);"</c:if> name = "FT${row.FTABLE_CAT}" class="CHKft form-control" /></td>
													<td style="text-align: right" class="TA"><fmt:formatNumber value="${row.FTABLE_AMOUNT}" pattern="#,###" /></td>
													<td style="text-align: right">${row.FTABLE_UNIT}</td>
													<td class="imagebx"><div id="ftImage"></div></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</form>
							<br> <br>
							<form name="form3-1" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
										<tr>
											<th scope="row">선택 목록(제물상)</th>
										</tr>
									</tbody>
								</table>
									<table class="table table-bordered nowrap"
										id="sFtable">
										<thead>
											<tr>
												<th scope="col" width="20%" style="text-align:center">구분</th>
												<th scope="col" width="20%" style="text-align:center">금액</th>
												<th scope="col" colspan="2" width="20%" style="text-align:center">단위</th>
												<th scope="col" width="30%" style="text-align:center">금액</th>
												<th style="display :none" scope="col" width="10%" style="text-align:center">선택</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="row" items="${listFtable}">
												<tr>
													<td>${row.BCD_TITLE}<input type="hidden" class = "sTid" value = "${row.FTABLE_ID}"/></td>
													<td style="text-align: right" class="sTA"><fmt:formatNumber value="${row.FTABLE_AMOUNT}" pattern="#,###" /></td>
													<td style="text-align: right; border-right:none"><input style="text-align:right;border:0px" type="number" class="sTB from-control" min="0" value = "1"></td><td style = "border-left:none">${row.FTABLE_UNIT}</td>
													<td style="text-align: right" class="sTC"><fmt:formatNumber value="" pattern="#,###" /></td>
													<td style="display :none"><input type="checkbox" class="sCHKft form-control" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
							</form>
							<hr>
							<div style="text-align:right"><span>선택된 제물상 총액 :</span><input type="text" id="P3total" style="text-align: right; border: none;" readonly>
							</div>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-primary" onClick="fn_cstInsertP3()">등록</button>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab04" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="form4" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
										<tr>
											<th scope="row">장의용품 선택</th>
											<td><select class="form-control" id="selMTR">
											<option value="M" selected>현대식</option>
											<option value="T">전통식</option>
											</select> </td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
								<table class="table table-striped table-bordered nowrap MOD">
									<colgroup>
										<col width="15%" />
										<col width="25%" />
										<col width="10%" />
										<col width="15%" />
										<col width="15%" />
										<col width="10%" />
										<col width="15%" />
									</colgroup>

									<tr>
										<th colspan="2" style="text-align: center;">분류(현대식)</th>
										<th colspan="8" style="text-align: center;">상세정보</th>
									</tr>
									<tr style="text-align: center;">
										<th>종류</th>
										<th>제품명</th>
										<th>단위</th>
										<th>개당단가</th>
										<th>기본금액</th>
										<th>주문수량</th>
										<th>주문금액</th>
									</tr>
									<tbody>
											<tr>
												<td>관</td>
												<td><select class="form-control m131 mgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM13}">
													<option value="${row.GOODS_ID}">${row.GOODS_TITLE}</option>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control m132">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM13}">
													<option value="${row.GOODS_NET_PRICE}"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control m133 infoG1">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM13}">
													<option value="${row.GOODS_SALE_PRICE}"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GA" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="1" required></td>
												<td class="GB from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>도복,원삼</td>
												<td><select class="form-control m141 mgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM14}">
													<option value="${row.GOODS_ID}">${row.GOODS_TITLE}</option>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control m142">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM14}">
													<option value="${row.GOODS_NET_PRICE}"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control m143 infoG1">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM14}">
													<option value="${row.GOODS_SALE_PRICE}"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GA" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="1" required></td>
												<td class="GB from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>영정</td>
												<td><select class="form-control m151 mgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM15}">
													<option value="${row.GOODS_ID}">${row.GOODS_TITLE}</option>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control m152">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM15}">
													<option value="${row.GOODS_NET_PRICE}"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control m153 infoG1">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM15}">
													<option value="${row.GOODS_SALE_PRICE}"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GA" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="1" required></td>
												<td class="GB from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>수의</td>
												<td><select class="form-control m161 mgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM16}">
													<option value="${row.GOODS_ID}">${row.GOODS_TITLE}</option>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control m162">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM16}">
													<option value="${row.GOODS_NET_PRICE}"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control m163 infoG1">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM16}">
													<option value="${row.GOODS_SALE_PRICE}"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GA" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="1" required></td>
												<td class="GB from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>염베</td>
												<td><select class="form-control m171 mgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM17}">
													<option value="${row.GOODS_ID}">${row.GOODS_TITLE}</option>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control m172">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM17}">
													<option value="${row.GOODS_NET_PRICE}"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control m173 infoG1">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM17}">
													<option value="${row.GOODS_SALE_PRICE}"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GA" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="1" required></td>
												<td class="GB from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>천금지금</td>
												<td><select class="form-control m181 mgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM18}">
													<option value="${row.GOODS_ID}">${row.GOODS_TITLE}</option>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control m182">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM18}">
													<option value="${row.GOODS_NET_PRICE}"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control m183 infoG1">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsM18}">
													<option value="${row.GOODS_SALE_PRICE}"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GA" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="1" required></td>
												<td class="GB from-control" style="text-align: right;"></td>
											</tr>
										<c:forEach var="row" items="${listFgoodsM}">
											<tr>
												<td class="first">${row.CAT_TITLE}</td>
												<td>${row.GOODS_TITLE}</td>
												<td>${row.GOODS_UNIT}<input type="hidden" class="FRID"
													value="${frid}"><input type="hidden" class="GIDm"
													value="${row.GOODS_ID}"></td>
												<td style="text-align: right;"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></td>
												<td style="text-align: right;" class="infoG2"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
												<td style="text-align: right;"><input
													class="from-control GC" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100"
													value="<c:if test="${row.FNRS_GOODS_INIT_QTY eq null }">1</c:if><c:if test="${row.FNRS_GOODS_INIT_QTY ne null }">${row.FNRS_GOODS_INIT_QTY}</c:if>"
													required></td>
												<td class="GD from-control" style="text-align: right;"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
									<table class="table table-striped table-bordered nowrap TRD">
 									<colgroup>
										<col width="15%" />
										<col width="25%" />
										<col width="10%" />
										<col width="15%" />
										<col width="15%" />
										<col width="10%" />
										<col width="15%" />
									</colgroup>

									<tr>
										<th colspan="2" style="text-align: center;">분류(전통식)</th>
										<th colspan="8" style="text-align: center;">상세정보</th>
									</tr>
									<tr style="text-align: center;">
										<th>종류</th>
										<th>제품명</th>
										<th>단위</th>
										<th>개당단가</th>
										<th>기본금액</th>
										<th>주문수량</th>
										<th>주문금액</th>
									</tr>
									<tbody>
									<tr>
												<td>관</td>
												<td><select class="form-control t131 tgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT13}">
													<option value="${row.GOODS_ID}">${row.GOODS_TITLE}</option>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control t132">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT13}">
													<option value="${row.GOODS_NET_PRICE}"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control t133 infoG3">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT13}">
													<option value="${row.GOODS_SALE_PRICE}"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GE" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="1" required></td>
												<td class="GF from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>도복,원삼</td>
												<td><select class="form-control t141 tgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT14}">
													<option value="${row.GOODS_ID}">${row.GOODS_TITLE}</option>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control t142">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT14}">
													<option value="${row.GOODS_NET_PRICE}"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control t143 infoG3">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT14}">
													<option value="${row.GOODS_SALE_PRICE}"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GE" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="1" required></td>
												<td class="GF from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>영정</td>
												<td><select class="form-control t151 tgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT15}">
													<option value="${row.GOODS_ID}">${row.GOODS_TITLE}</option>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control t152">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT15}">
													<option value="${row.GOODS_NET_PRICE}"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control t153 infoG3">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT15}">
													<option value="${row.GOODS_SALE_PRICE}"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GE" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="1" required></td>
												<td class="GF from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>수의</td>
												<td><select class="form-control t161 tgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT16}">
													<option value="${row.GOODS_ID}">${row.GOODS_TITLE}</option>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control t162">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT16}">
													<option value="${row.GOODS_NET_PRICE}"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control t163 infoG3">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT16}">
													<option value="${row.GOODS_SALE_PRICE}"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GE" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="1" required></td>
												<td class="GF from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>염베</td>
												<td><select class="form-control t171 tgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT17}">
													<option value="${row.GOODS_ID}">${row.GOODS_TITLE}</option>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control t172">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT17}">
													<option value="${row.GOODS_NET_PRICE}"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control t173 infoG3">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT17}">
													<option value="${row.GOODS_SALE_PRICE}"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GE" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="1" required></td>
												<td class="GF from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>천금지금</td>
												<td><select class="form-control t181 tgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT18}">
													<option value="${row.GOODS_ID}">${row.GOODS_TITLE}</option>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control t182">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT18}">
													<option value="${row.GOODS_NET_PRICE}"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control t183 infoG3">
													<option value="">선택</option>
													<c:forEach var="row" items="${listFgoodsT18}">
													<option value="${row.GOODS_SALE_PRICE}"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GE" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="1" required></td>
												<td class="GF from-control" style="text-align: right;"></td>
											</tr>
										<c:forEach var="row" items="${listFgoodsT}">
											<tr>
												<td class="first">${row.CAT_TITLE}</td>
												<td>${row.GOODS_TITLE}</td>
												<td>${row.GOODS_UNIT}<input type="hidden" class="FRID"
													value="${frid}"><input type="hidden" class="GIDt"
													value="${row.GOODS_ID}"></td>
												<td style="text-align: right;"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></td>
												<td style="text-align: right;" class="infoG4"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
												<td style="text-align: right;"><input
													class="from-control GG" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="1" max="100"
													value="<c:if test="${row.FNRS_GOODS_INIT_QTY eq null }">1</c:if><c:if test="${row.FNRS_GOODS_INIT_QTY ne null }">${row.FNRS_GOODS_INIT_QTY}</c:if>"
													required></td>
												<td class="GH from-control" style="text-align: right;"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div>
									<span>선택된 장의용품 총액 :</span><input	type="text" id="P4total" style="text-align: right; border: none;" readonly>								
								</div>
							</form>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-primary"
									onClick="fn_cstInsertP4()">등록</button>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab05" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="form5" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
										<tr>
											<th scope="row">제단 선택</th>
											<td style="text-align: right;"></td>
											
										</tr>
									</tbody>
								</table>
								<table class="table  table-bordered nowrap"
									id="altarTable">
									<thead>
										<tr>
											<th scope="col" width="10%" style="text-align:center">제단구분</th>
											<th scope="col" width="10%" style="text-align:center">선택여부</th>
											<th scope="col" width="15%" style="text-align:center">제단명</th>
											<th scope="col" width="10%" style="text-align:center">금액</th>
											<th scope="col" width="40%" style="text-align:center">이미지</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${listAltar}">
											<tr>
												<td class="second"><c:if test="${row.ALTAR_CAT eq '102'}">제단</c:if>
													<c:if test="${row.ALTAR_CAT eq '103'}">헌화</c:if></td>
												<td><input type="checkbox" onclick ="<c:if test="${row.ALTAR_CAT eq '102'}">oneCheckalt2(this)</c:if><c:if test="${row.ALTAR_CAT eq '103'}">oneCheckalt3(this)</c:if>" class="CHKalt form-control" name="ALTAR${row.ALTAR_CAT}" /></td>
												<td>${row.ALTAR_TITLE}<input type = "hidden" class = "Aid" value="${row.ALTAR_ID}"/></td>
												<td style="text-align: right" class="AA"><fmt:formatNumber value="${row.ALTAR_AMOUNT}" pattern="#,###" /></td>
												<td class="imagebx"><div id="altarImage"></div></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
							<br>
							<table class="table table-sm bst02">
								<tbody>
									<tr>
										<th scope="row">선택항목</th>
									</tr>
								</tbody>
							</table>
								<table class="table table-bordered nowrap"
									id="sAltarTable">
									<thead>
										<tr>
											<th scope="col" width="20%" align="center">제단구분</th>
											<th scope="col" width="20%" align="center">제단명</th>
											<th scope="col" width="20%" align="center">단가</th>
											<th scope="col" width="10%" align="center">수량</th>
											<th scope="col" width="20%" align="center">금액</th>
											<th style="display :none" scope="col" width="10%" align="center">선택여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${listAltar}">
											<tr>
												<td><c:if test="${row.ALTAR_CAT eq '102'}">제단</c:if>
													<c:if test="${row.ALTAR_CAT eq '103'}">헌화</c:if></td>
												<td>${row.ALTAR_TITLE}<input type = "hidden" class = "sAid" value="${row.ALTAR_ID}"/><input type = "hidden" class = "sAct" value="${row.ALTAR_CAT}"/></td>
												<td style="text-align: right" class="sAA"><fmt:formatNumber value="${row.ALTAR_NET_PRICE}" pattern="#,###" /></td>
												<td><input type="number" style="text-align:right;border:0px" class="sAB" min="0" value="${row.ALTAR_QTY}" ></td>
												<td style="text-align: right" class="sAC"><fmt:formatNumber value="" pattern="#,###" /></td>
												<td style="display :none" ><input type="checkbox" class="sCHKalt form-control" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<hr>
								<div style="text-align:right">
								<span>선택된 제단용품 총액 :</span><input type="text" id="P5total" style="text-align: right; border: none;" readonly>
								</div>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-primary"
									onClick="fn_cstInsertP5()">등록</button>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab08" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="form8" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
										<tr>
											<th scope="row">기타시설</th>
										</tr>
									</tbody>
								</table>
								<table class="table table-striped table-bordered nowrap" id="roomList">
									<colgroup>
										<col width="10%" />
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
										<tr>
											<th class="text-center">호실명</th>
											<th class="text-center">사용유무</th>
											<th class="text-center">일일사용료</th>
											<th class="text-center">시간당사용료</th>
											<th class="text-center">면적(m<sup>2</sup>)
											</th>
											<th class="text-center">평수</th>
											<th class="text-center">수용인원</th>
											<th class="text-center">선택</th>
										</tr>
									</thead>
									<c:forEach var="row" items="${listEtcroom}">
										<tr>
											<td>${row.FROOM_TITLE}</td>
											<td></td>
											<td class = "EA" style="text-align: right;"><fmt:formatNumber value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
											<td class = "EB" style="text-align: right;"><fmt:formatNumber value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.FROOM_AREA}</td>
											<td style="text-align: right;">${row.FROOM_AREA_KOR}</td>
											<td style="text-align: right;">${row.FROOM_MAX_PERS}</td>
											<td style="text-align: center;"><input type="checkbox" class="CHKe form-control" /></td>
										</tr>
									</c:forEach>
								</table>
							</form>
							<br>
							<br>
								<table class="table table-sm bst02">
									<tbody>
										<tr>
											<th scope="row">선택된 기타시설</th>
										</tr>
									</tbody>
								</table>
							<table class="table table-striped table-bordered nowrap" id="sEtcroom">
									<colgroup>
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="5%" />
										<col width="5%" />
										<col width="5%" />
										<col width="20%" />
										<col width="10%" />
									</colgroup>
									<thead>
										<tr>
											<th class="text-center">호실명</th>
											<th class="text-center">일일사용료</th>
											<th class="text-center">시간당사용료</th>
											<th class="text-center">회당사용료</th>
											<th class="text-center">사용일</th>
											<th class="text-center">사용시간</th>
											<th class="text-center">사용횟수</th>
											<th class="text-center">금액</th>
											<th style="display:none" class="text-center">선택</th>
										</tr>
									</thead>
									<c:forEach var="row" items="${listEtcroom}">
										<tr>
											<td>${row.FROOM_TITLE}</td>
											<td class = "sEA" style="text-align: right;"><fmt:formatNumber value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
											<td class = "sEB" style="text-align: right;"><fmt:formatNumber value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
											<td class = "sEC" style="text-align: right;"><fmt:formatNumber value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
											<td><input style="text-align: right;" class = "sED" type="number" min="0" value = "0"></td>
											<td><input style="text-align: right;" class = "sEE" type="number" min="0" value = "0"></td>
											<td><input style="text-align: right;" class = "sEF" type="number" min="0" value = "0"></td>
											<td class = "sEG" style="text-align: right;"><fmt:formatNumber value="" pattern="#,###" /></td>
											<td style="text-align:center; display:none"><input type="checkbox" class="sCHKe form-control" /></td>
										</tr>
									</c:forEach>
								</table>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-primary"
									onClick="fn_cstInsertP8()">등록</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Row end -->
		</div>
	</div>
</div>
<!--계약기본등록-->
<script>
	$('#contStatus').val('${dto.contStatus}').prop("selected", true);
	$('#contType').val('${dto.contType}').prop("selected", true);
	$('#contSource').val('${dto.contSource}').prop("selected", true);

	function fn_const_oldDeleteP2(){
		var data = {}
		data.RENT_ID = '${selectoneFroom.RENT_ID}';
		if(data.RENT_ID === ''){
			alert('기존 삭제할 데이터가 존재하지 않습니다. 새로고침을 하시거나 관리자(개발자)를 부르십시오');
		} else {
			$.ajax({
				url : "${path}/consult/deleteCSTRentfee.do",
				data : data,
				method : "POST",
				dataType : "json"
			})
			.done(function(data) {
			});
		}
	}

	function fn_cstInsertP2(){
		if('${selectoneFroom.RENT_ID}' !== ''){
			// 기존 데이터 삭제 먼저 진행
			fn_const_oldDeleteP2();
		}
		var data ={};
		var CONid = '${CONSULT_ID}';
		var roomCheck = $("#roomList .CHKroom:checked");
		if (CONid != "" && roomCheck.length === 1){
			data.CONSULT_ID = '${CONSULT_ID}';
			var roomNameOgn = roomCheck.parent().next()[0].innerText
			var roomNameTr =  $('#SltdroomList > tbody > tr:not([style*="display: none"])');
			if(roomNameOgn === roomNameTr.find('td:eq(1)')[0].innerText){
				data.RENT_TITLE =  roomNameTr.find('td:eq(1)')[0].innerText;
				// data.RENT_TYPE = null;
				data.RENT_NAME =  roomNameTr.find('td:eq(1)')[0].innerText;
				// data.CHARGE_TYPE = null;
				// data.CHARGE_YN = null;
				data.CHARGE_PERDAY = Number(roomNameTr.find('td:eq(2)')[0].innerText.replace(/[\D\s\._\-]+/g, ""));
				data.CHARGE_PERHOUR = Number(roomNameTr.find('td:eq(3)')[0].innerText.replace(/[\D\s\._\-]+/g, ""));
				data.RENT_DAYS = Number(roomNameTr.find('td:eq(4)')[0].children[0].value.replace(/[\D\s\._\-]+/g, ""));
				data.RENT_HOURS = Number(roomNameTr.find('td:eq(5)')[0].children[0].value.replace(/[\D\s\._\-]+/g, ""));
				data.RENT_AMOUNT = Number(roomNameTr.find('td:eq(6)')[0].innerText.replace(/[\D\s\._\-]+/g, ""));
				console.log(data);
			} else {
				alert('상담호실 > 분향실이 선택되지 않았습니다.'); return  false;
			}

			$.ajax({
				url : "${path}/consult/insertCSTRentfee.do",
				data : data,
				method : "POST",
				dataType : "json"
			})
			.done(function(data) {
				alert("저장성공");
			});
		} else if(roomCheck.length > 1){
			alert("분향실은 1개만 선택할수 있습니다.")
		} else {
			alert("계약기본사항을 먼저 저장해 주세요!!");
		}
	}

	function fn_contInsertP3() {
		var CONid = $("#contid").val();
		if (CONid != ""){
		var froomid = $('#frid').val();
		var $Chkarr = $(".sCHKft");
		var $Aarr =  $(".sTA");
		var $Barr =  $(".sTB");
		var $Carr =  $(".sTC");
		var $Tidarr =  $(".sTid");
		var contp3upd ={};
		contp3upd.CONSULT_ID = Number(CONid);
		console.log(contp3upd);
		$.ajax({
			url : "${path}/consult/updateP3.do",  
			data : contp3upd,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
		for (var i=0; i<$Aarr.length; i++){
		if($($Chkarr[i]).is(":checked")==true){
		var contp3data = {};
		contp3data.CONTRACT_ID = CONid;
		contp3data.ROOM_TITLE = froomid;
		contp3data.FTABLE_CODE = $Tidarr[i].value;
		contp3data.FTABLE_NET_PRICE = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		contp3data.QUTY = $Barr[i].value;
		contp3data.ORD_AMOUNT = Number($Carr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		console.log(contp3data);
		$.ajax({
			url : "${path}/cont/insertP3.do",  
			data : contp3data,  
			method : "POST",  
			dataType : "json"  
		});
		}
		}
		alert("저장성공");
		});
		}
		else
		{
			alert("계약기본사항을 먼저 저장해 주세요!!");	
		}
		
	}
	
	function fn_contInsertP4() {
		var CONid = $("#contid").val();
			if (CONid != ""){
				var froomid = $('#frid').val();
				var sel = $("#selMTR").val();
				var contp4upd ={};
				contp4upd.CONTRACT_ID = Number(CONid);
				console.log(contp4upd);
				$.ajax({
					url : "${path}/cont/updateP4.do",  
					data : contp4upd,  
					method : "POST",  
					dataType : "json"  
				})
				.done(function(data) {
					if (sel == "M"){
						var $mgidarr = $(".mgid");
						var $GAarr = $(".GA");
						var $GBarr = $(".GB");
						var $GCarr = $(".GC");
						var $GDarr = $(".GD");
						var $InfoG1arr = $(".infoG1");
						var $InfoG2arr = $(".infoG2");
						var $GMarr = $(".GIDm");
							for (var i=0; i<$GAarr.length; i++){
								if($($GAarr[i]).value != 0){
									var contp4data = {};
										contp4data.CONTRACT_ID = CONid;
										contp4data.ROOM_TITLE = froomid;
										contp4data.GOODS_CODE = $mgidarr[i].value;
										contp4data.ORD_TYPE = "1";
										contp4data.NET_PRICE = Number($InfoG1arr[i].value.replace(/[\D\s\._\-]+/g, ""));
										contp4data.ORD_QUTY = $GAarr[i].value;
										contp4data.ORD_AMOUNT = Number($GBarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
										console.log(contp4data);
								$.ajax({
									url : "${path}/cont/insertP4.do",  
									data : contp4data,  
									method : "POST",  
									dataType : "json"  
										})
									.done(function(data) {});
								}
							}
						for (var i=0; i<$GCarr.length; i++){
								if($($GCarr[i]).value != 0){
									var contp4data = {};
										contp4data.CONTRACT_ID = CONid;
										contp4data.ROOM_TITLE = froomid;
										contp4data.GOODS_CODE = $GMarr[i].value;
										contp4data.ORD_TYPE = "1";
										contp4data.NET_PRICE = Number($InfoG2arr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
										contp4data.ORD_QUTY = $GCarr[i].value;
										contp4data.ORD_AMOUNT = Number($GDarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
										console.log(contp4data);
								$.ajax({
									url : "${path}/cont/insertP4.do",  
									data : contp4data,  
									method : "POST",  
									dataType : "json"  
									})
									.done(function(data) {});
								}
							}
						}
				else
						{
							var $tgidarr = $(".tgid");
							var $GEarr = $(".GE");
							var $GFarr = $(".GF");
							var $GGarr = $(".GG");
							var $GHarr = $(".GH");
							var $InfoG3arr = $(".infoG3");
							var $InfoG4arr = $(".infoG4");
							var $GTarr = $(".GIDt");
								for (var i=0; i<$GEarr.length; i++){
									if($($GEarr[i]).value != 0){
										var contp4data = {};
											contp4data.CONTRACT_ID = CONid;
											contp4data.ROOM_TITLE = froomid;
											contp4data.GOODS_CODE = $tgidarr[i].value;
											contp4data.ORD_TYPE = "1";
											contp4data.NET_PRICE = Number($InfoG3arr[i].value.replace(/[\D\s\._\-]+/g, ""));
											contp4data.ORD_QUTY = $GEarr[i].value;
											contp4data.ORD_AMOUNT = Number($GFarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
											console.log(contp4data);
									$.ajax({
										url : "${path}/cont/insertP4.do",  
										data : contp4data,  
										method : "POST",  
										dataType : "json"  
										})
										.done(function(data) {});
									}
								}
							for (var i=0; i<$GGarr.length; i++){
								if($($GGarr[i]).value != 0){
									var contp4data = {};
										contp4data.CONTRACT_ID = CONid;
										contp4data.ROOM_TITLE = froomid;
										contp4data.GOODS_CODE = $GTarr[i].value;
										contp4data.ORD_TYPE = "1";
										contp4data.NET_PRICE = Number($InfoG4arr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
										contp4data.ORD_QUTY = $GGarr[i].value;
										contp4data.ORD_AMOUNT = Number($GHarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
										console.log(contp4data);
									$.ajax({
										url : "${path}/cont/insertP4.do",  
										data : contp4data,  
										method : "POST",  
										dataType : "json"  
										})
										.done(function(data) {});
									}
								}
							}
					});
					alert("저장성공");
				}
					else
					{
						alert("계약기본사항을 먼저 저장해 주세요!!");	
					}
				}

	
	function fn_contInsertP5() {
		var CONid = $("#contid").val();
		if (CONid != ""){
		var froomid = $('#frid').val();
		var $Chkarr = $(".sCHKalt");
		var $Actarr =  $(".sAct");
		var $Aarr =  $(".sAA");
		var $Barr =  $(".sAB");
		var $Carr =  $(".sAC");
		var $Aidarr =  $(".sAid");
		var P5tot = $("#P5total").val();
		if (P5tot == '0' && P5tot =="" )
			{
			alert ("선택된 항목이 없습니다.!!");
			return;
			}
		var contp5upd ={};
		contp5upd.CONTRACT_ID = Number(CONid);
		console.log(contp5upd);
		$.ajax({
			url : "${path}/cont/updateP5.do",  
			data : contp5upd,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
 		for (var i=0; i<$Aarr.length; i++){
		if($($Chkarr[i]).is(":checked")==true){
		var contp5data = {};
		contp5data.CONTRACT_ID = CONid;
		contp5data.ROOM_TITLE = froomid;
		contp5data.ALTAR_CAT = $Actarr[i].value;
		contp5data.ALTAR_ID = $Aidarr[i].value;
		contp5data.NET_PRICE = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		contp5data.QUTY = $Barr[i].value;
		contp5data.ORD_PRICE = Number($Carr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		console.log(contp5data);
		$.ajax({
			url : "${path}/cont/insertP5.do",  
			data : contp5data,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
		});
		}
		}
		alert("저장성공");
		});
		}
		else
		{
			alert("계약기본사항을 먼저 저장해 주세요!!");	
		}	
	}

	function fn_contInsertP6() {
		var CONid = $("#contid").val();
		if (CONid != ""){
		var froomid = $('#frid').val();
		var $Gidarr =  $(".GID");
		var $Aarr =  $(".MA");
		var $Barr =  $(".MB");
		var $infoarr =  $(".infoM");
		var contp6upd ={};
		contp6upd.CONTRACT_ID = Number(CONid);
		console.log(contp6upd);
		$.ajax({
			url : "${path}/cont/updateP6.do",  
			data : contp6upd,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
		for (var i=0; i<$Aarr.length; i++){
		if($Aarr[i].value > 0){
		var contp6data = {};
		contp6data.CONTRACT_ID = CONid;
		contp6data.ROOM_TITLE = froomid;
		contp6data.GOODS_CODE = $Gidarr[i].value;
		contp6data.NET_PRICE = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		contp6data.ORD_QUTY = $Aarr[i].value;
		contp6data.ORD_AMOUNT = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		console.log(contp6data);
		$.ajax({
			url : "${path}/cont/insertP6.do",  
			data : contp6data,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
		});
		}
		}
		alert("저장성공");
		});
		}
		else
			{
			alert("계약기본사항을 먼저 저장해 주세요!!");
			}
	}

	function fn_contInsertP7() {
		var CONid = $("#contid").val();
		if (CONid != ""){
		var froomid = $('#frid').val();
		var $Gidarr =  $(".GID");
		var $Aarr =  $(".SA");
		var $Barr =  $(".SB");
		var $infoarr =  $(".infoS");
		var contp7upd ={};
		contp7upd.CONTRACT_ID = Number(CONid);
		console.log(contp7upd);
		$.ajax({
			url : "${path}/cont/updateP7.do",  
			data : contp7upd,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
		for (var i=0; i<$Aarr.length; i++){
		if($Aarr[i].value > 0){
		var contp7data = {};
		contp7data.CONTRACT_ID = CONid;
		contp7data.ROOM_TITLE = froomid;
		contp7data.GOODS_CODE = $Gidarr[i].value;
		contp7data.NET_PRICE = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		contp7data.ORD_QUTY = $Aarr[i].value;
		contp7data.ORD_AMOUNT = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		console.log(contp7data);
		$.ajax({
			url : "${path}/cont/insertP7.do",  
			data : contp7data,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
		});
		}
		}
		alert("저장성공");
		});
		}
		else
			{
			alert("계약기본사항을 먼저 저장해 주세요!!");
			}
	}

	
	function calculateM() {
		var $infoarr = $(".infoM");
		var $Aarr = $(".MA");
		var $Barr = $(".MB");
		for (var i = 0; i < $infoarr.length; i++) {
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			$Barr[i].innerText = numberWithCommas(Number($Aarr[i].value)*t1);
		}
		chkcalM();
	}
	
	function calculateG() {
		var $infoarr1 = $(".infoG1");
		var $infoarr2 = $(".infoG2");
		var $infoarr3 = $(".infoG3");
		var $infoarr4 = $(".infoG4");
		var $Aarr = $(".GA");
		var $Barr = $(".GB");
		var $Carr = $(".GC");
		var $Darr = $(".GD");
		var $Earr = $(".GE");
		var $Farr = $(".GF");
		var $Garr = $(".GG");
		var $Harr = $(".GH");
		for (var i = 0; i < $infoarr1.length; i++) {
			var t1 = Number($infoarr1[i].value.replace(/[\D\s\._\-]+/g, ""));
			$Barr[i].innerText = numberWithCommas(Number($Aarr[i].value) * t1);
		}
		for (var i = 0; i < $infoarr2.length; i++) {
			var t2 = Number($infoarr2[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			$Darr[i].innerText = numberWithCommas(Number($Carr[i].value) * t2);
		}
		for (var i = 0; i < $infoarr3.length; i++) {
			var t3 = Number($infoarr3[i].value.replace(/[\D\s\._\-]+/g, ""));
			$Farr[i].innerText = numberWithCommas(Number($Earr[i].value) * t3);
		}
		for (var i = 0; i < $infoarr4.length; i++) {
			var t4 = Number($infoarr4[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			$Harr[i].innerText = numberWithCommas(Number($Garr[i].value) * t4);
		}
		chkcalG();
	}

	function calculateS() {
		var $infoarr = $(".infoS");
		var $Aarr = $(".SA");
		var $Barr = $(".SB");
		for (var i = 0; i < $infoarr.length; i++) {
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			$Barr[i].innerText = numberWithCommas(Number($Aarr[i].value) * t1);
		}
		chkcalS();
	}
	
	function calculateT() {
		var $infoarr = $(".sCHKft");
		var $Aarr = $(".sTA");
		var $Barr = $(".sTB");
		var $Carr = $(".sTC");
		for (var i = 0; i < $infoarr.length; i++) {
			if($($infoarr[i]).is(":checked")==true){
			var Ttotal = 0;	
			var t1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Barr[i].value.replace(/[\D\s\._\-]+/g, ""));
			 Ttotal = (t1*t2);
			 $Carr[i].innerText = numberWithCommas(Ttotal);
			}
		}
	}
	

	function calculateA() {
		var $infoarr = $(".sCHKalt");
		var $Aarr = $(".sAA");
		var $Barr = $(".sAB");
		var $Carr = $(".sAC");
		for (var i = 0; i < $infoarr.length; i++) {
			if($($infoarr[i]).is(":checked")==true){
			var Ttotal = 0;			
			var t1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Barr[i].value.replace(/[\D\s\._\-]+/g, ""));
			Ttotal = (t1*t2);
			$Carr[i].innerText = numberWithCommas(Ttotal);
			}
		}
	}
	
	
	function calculateR() {
		var $infoarr = $(".CHKsrm");
		var $Aarr = $(".RMday");
		var $Barr = $(".RMtime");
		var $Carr = $(".sRMd");
		var $Darr = $(".sRMt");
		var $Earr = $(".RMcharge");
		var RMfee = 0;
		for (var i = 0; i < $Earr.length; i++) {
			var t1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t3 = Number($Carr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t4 = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			RMfee = (t1*t3)+(t2*t4);
			$Earr[i].innerText = numberWithCommas(RMfee);
		 }
	}

	function calculateE() {
		chkcalE();
	}
	
	$(".m131").change(function(){
		var idxm13 = $(".m131 option").index($(".m131 option:selected"));
		$(".m132").prop('selectedIndex',idxm13);
		$(".m133").prop('selectedIndex',idxm13);
	});
	
	$(".m141").change(function(){
		var idxm14 = $(".m141 option").index($(".m141 option:selected"));
		$(".m142").prop('selectedIndex',idxm14);
		$(".m143").prop('selectedIndex',idxm14);
	});

	$(".m151").change(function(){
		var idxm15 = $(".m151 option").index($(".m151 option:selected"));
		$(".m152").prop('selectedIndex',idxm15);
		$(".m153").prop('selectedIndex',idxm15);
	});

	$(".m161").change(function(){
		var idxm16 = $(".m161 option").index($(".m161 option:selected"));
		$(".m162").prop('selectedIndex',idxm16);
		$(".m163").prop('selectedIndex',idxm16);
	});

	$(".m171").change(function(){
		var idxm17 = $(".m171 option").index($(".m171 option:selected"));
		$(".m172").prop('selectedIndex',idxm17);
		$(".m173").prop('selectedIndex',idxm17);
	});

	$(".m181").change(function(){
		var idxm18 = $(".m181 option").index($(".m181 option:selected"));
		$(".m182").prop('selectedIndex',idxm18);
		$(".m183").prop('selectedIndex',idxm18);
	});

	$(".t131").change(function(){
 		var idxm13 = $(".t131 option").index($(".t131 option:selected"));
		$(".t132").prop('selectedIndex',idxm13);
		$(".t133").prop('selectedIndex',idxm13);
	});
	
	$(".t141").change(function(){
		var idxm14 = $(".t141 option").index($(".t141 option:selected"));
		$(".t142").prop('selectedIndex',idxm14);
		$(".t143").prop('selectedIndex',idxm14);
	});

	$(".t151").change(function(){
		var idxm15 = $(".t151 option").index($(".t151 option:selected"));
		$(".t152").prop('selectedIndex',idxm15);
		$(".t153").prop('selectedIndex',idxm15);
	});

	$(".t161").change(function(){
		var idxm16 = $(".t161 option").index($(".t161 option:selected"));
		$(".t162").prop('selectedIndex',idxm16);
		$(".t163").prop('selectedIndex',idxm16);
	});

	$(".t171").change(function(){
		var idxm17 = $(".t171 option").index($(".t171 option:selected"));
		$(".t172").prop('selectedIndex',idxm17);
		$(".t173").prop('selectedIndex',idxm17);
	});

	$(".t181").change(function(){
		var idxm18 = $(".t181 option").index($(".t181 option:selected"));
		$(".t182").prop('selectedIndex',idxm18);
		$(".t183").prop('selectedIndex',idxm18);
	});

	$(".Eday, .Etime").change(function() {
		chkEtcchange();
		calculateE();
		chkcalE();
	});

	$(".MB, .MA").change(function() {
		calculateM();
		chkcalM();
	});
	
	$(".SB, .SA").change(function() {
		calculateS();
		chkcalS();
	});
	
	$(".CHKroom, .sRMd , .sRMt").change(function() {
		chkRoomchange();
	});
	
	$(".sED, .sEE, .sEF, .CHKe").change(function() {
		chkEtcchange();
		calculateE();
		chkcalE();
	});

	$(".sAB, .CHKalt").change(function() {
		chkAltarchange();
		calculateA();
		chkcalA();
	});
	
	$(".sTB ,.sCHKft, .CHKft").change(function() {
		chkFtablechange();
		calculateT();
		chkcalT();
	});
	
	$("#contp1-02,#contp1-03").change(function(){
		SetDT();
	});
	
	$("#selMTR").change(function(){
		selectMT();
	});

	function selectMT(){
		var sel = $("#selMTR").val();
		if (sel == "M"){
			$(".MOD").show();
			$(".TRD").hide();
		}
		else
			{
			$(".TRD").show();
			$(".MOD").hide();
			}
		chkcalG();
	}
	
	function SetDT(){
	var contDay3 = $("#contp1-03").val();
	var contDay2 = $("#contp1-02").val();
	contDay3 = new Date(contDay3);
	contDay2 = new Date(contDay2);
	var contDay = parseInt((contDay3 - contDay2)/(1000*60*60*24));
	var contTime = parseInt(((contDay3 - contDay2)%(1000*60*60*24))/(1000*60*60));
	var $infoarr = $(".CHKsrm");
	var $Aarr = $(".sRMd");
	var $Barr = $(".sRMt");
	for (var i = 0; i < $infoarr.length; i++) {
		$Aarr[i].innerText = contDay;
		$Barr[i].innerText = contTime;
		}
	}
	

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function chkcalM() {
		var $Barr = $(".MB");
		var chksum = 0;
		for (var i = 0; i < $Barr.length; i++) {
			var b1 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			chksum = chksum + b1;
		}
		$('#messgrandtotal').val(numberWithCommas(chksum));
	}

	function chkcalG() {
		var sel = $("#selMTR").val();
		if (sel == "M"){
			var $Barr = $(".GB");
			var $Darr = $(".GD");
			var chksum = 0;
			for (var i = 0; i < $Barr.length; i++) {
				var b1 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
				chksum = chksum + b1;
			}
			for (var i = 0; i < $Darr.length; i++) {
				var d1 = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
				chksum = chksum + d1;
			}
			$('#P4total').val(numberWithCommas(chksum));
		}
		else
		{
			var $Farr = $(".GF");
			var $Harr = $(".GH");
			var chksum = 0;
			for (var i = 0; i < $Farr.length; i++) {
				var f1 = Number($Farr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
				chksum = chksum + f1;
			}
			for (var i = 0; i < $Harr.length; i++) {
				var g1 = Number($Harr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
				chksum = chksum + g1;
			}
			$('#P4total').val(numberWithCommas(chksum));
		}
	}
	
	function chkcalS() {
		var $Barr = $(".SB");
		var chksum = 0;
		for (var i = 0; i < $Barr.length; i++) {
			var b1 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			chksum = chksum + b1;
		}
		$('#storegrandtotal').val(numberWithCommas(chksum));
	}
	
	function chkcalR() {
		var $Barr = $(".RB");
		var chksum = 0;
		for (var i = 0; i < $Barr.length; i++) {
			var b1 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			chksum = chksum + b1;
		}
		$('#Roomgrandtotal').val(numberWithCommas(chksum));
	}

	function chkcalE() {
		var $Aarr = $(".EA");
		var $Barr = $(".EB");
		var $Carr = $(".Eday");
		var $Darr = $(".Etime");
		var $Earr = $(".Esum");
		for (var i = 0; i < $Earr.length; i++) {
			var chksum = 0;	
			var b1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var b2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var c1 = Number($Carr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var c2 = Number($Darr[i].value.replace(/[\D\s\._\-]+/g, ""));
			chksum = (b1*c1)+(b2*c2);
			$Earr[i].innerText = numberWithCommas(chksum);
		}
	}
	
	function chkcalA() {
		var $infoarr = $(".sCHKalt");
		var $Aarr = $(".sAC");
		var chksum = 0;
		for (var i = 0; i < $Aarr.length; i++) {
			if($($infoarr[i]).is(":checked")==true){
			var b1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			chksum = chksum + b1;
			}
		}
		$('#P5total').val(numberWithCommas(chksum));
	}
	
	function chkcalT() {
		var $infoarr = $(".sCHKft");
		var $Carr = $(".sTC");
		var chksum = 0;
		for (var i = 0; i < $infoarr.length; i++) {
			if($($infoarr[i]).is(":checked")==true){
			var t1 = Number($Carr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			chksum = chksum + (t1);
			}
		}
		console.log(chksum);
		$('#P3total').val(numberWithCommas(chksum));
	}

	function Setdate(){
		let today = new Date();   
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		if(month < 10) month = '0'+month;
		let date = today.getDate();  // 날짜
		if(date < 10) date = '0'+date;
		let hours = today.getHours(); // 시
		if(hours < 10) hours = '0'+hours;
		let minutes = today.getMinutes();  // 분
		let seconds = today.getSeconds();  // 초
		var from = year+'-'+month+'-'+date+'T'+hours+':00:00';
		let today2 = new Date();
		today2.setDate(today2.getDate() + 3);
		let year2 = today2.getFullYear(); // 년도
		let month2 = today2.getMonth() + 1;  // 월
		if(month2 < 10) month2 = '0'+month2;
		let date2 = today2.getDate();  // 날짜
		if(date2 < 10) date2 = '0'+date2;
		let hours2 = today2.getHours(); // 시
		if(hours2 < 10) hours2 = '0'+hours2;
		let minutes2 = today2.getMinutes();  // 분
		let seconds2 = today2.getSeconds();  // 초
		var to = year2+'-'+month2+'-'+date2+'T'+hours2+':00:00';
		$('#contp1-02').val(from);
		$('#contp1-03').val(to);				
	}
	
	function chkRoomchange(){
		var $infoarr = $(".CHKroom");
		var $sinfoarr = $(".CHKsrm");
		for (var i = 0; i < $infoarr.length; i++) {
			if($($infoarr[i]).is(":checked")==true){
			$($sinfoarr[i]).attr("checked",true);
			$($sinfoarr[i]).parent().parent().show();
			}
			else{
				$($sinfoarr[i]).attr("checked",false);
				$($sinfoarr[i]).parent().parent().hide();
			}
		}
	}

	function chkFtablechange(){
		var $infoarr = $(".CHKft");
		var $sinfoarr = $(".sCHKft");
		for (var i = 0; i < $infoarr.length; i++) {
			if($($infoarr[i]).is(":checked")==true){
			$($sinfoarr[i]).attr("checked",true);
			$($sinfoarr[i]).parent().parent().show();
			}
			else{
				$($sinfoarr[i]).attr("checked",false);
				$($sinfoarr[i]).parent().parent().hide();
			}
		}
	}

	function chkAltarchange(){
		var $infoarr = $(".CHKalt");
		var $sinfoarr = $(".sCHKalt");
		for (var i = 0; i < $infoarr.length; i++) {
			if($($infoarr[i]).is(":checked")==true){
			$($sinfoarr[i]).attr("checked",true);
			$($sinfoarr[i]).parent().parent().show();
			}
			else{
				$($sinfoarr[i]).attr("checked",false);
				$($sinfoarr[i]).parent().parent().hide();
			}
		}
	}
	
	function oneCheck(chk){
	    var obj = document.getElementsByClassName("CHKroom");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}

	function oneCheckft(chk){
	    var obj = document.getElementsByName("FT24");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}

	function oneCheckalt2(chk){
	    var obj = document.getElementsByName("ALTAR102");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}

	function oneCheckalt3(chk){
	    var obj = document.getElementsByName("ALTAR103");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	
	
	var i = 1;
	var str = undefined;
	var element = $(".second");
	var firstElement = undefined;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".second")[0].innerText;
			firstElement = $(".second")[0];
			return;
		}
		if (str == $(this).text()) {
			i++;
			console.dir('--> ' + i + $(this).text());
			$(this).remove();
		} else {
			$(firstElement).attr('rowspan', i);
			i = 1;
			str = $(this).text();
			firstElement = $(this);
		}
	});
	// 마지막꺼까지 반영
	$(firstElement).attr('rowspan', i);


	$(document).ready(function(){
		calculateT();
		chkcalT();
		calculateR();
		chkcalR();
		selectMT();
		calculateG();
		chkcalG();
		calculateA();
		chkcalA();
		chkRoomchange();
		chkFtablechange();
		chkAltarchange();
	})

	

</script>