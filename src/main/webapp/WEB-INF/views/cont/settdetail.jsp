<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.settle .item {
	float: left;
	width: 15%;
	height: 100%;
	text-align: center;
	background: white;
	border-right: 1px solid #ddd;
}

.settle .item.cont {
	float: left;
	width: 78%;
	padding: 10px;
	border-right: none;
	text-align: center;
}
</style>
	<div class="settle">
		<div class="item">
		<table class="table table-bordered nowrap" id="roomTable">
				<thead>
					<tr>
						<th scope="col" width="200" align="center">정산처리</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><a href="javascript:tab01active()">반품</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab02active()">조회</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab03active()">정산</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab04active()">퇴실</a></td>
						</tr>
				</tbody>
			</table>
		</div>
<div class="item cont" style="width:83%;margin-top:5px;">
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
				<td><input id="frid" type="hidden" value = "${frid}"><input id="contid" type="hidden" value = "${CONTid}">
				<input id="rmchk" type="hidden" value = "OK"><span>선택된 계약번호 : </span>${CONTid}</td>
				</tr>
				</table>
				</div>
			<div class="tab-content tabs m-t-20">
				<div class="tab-pane active" id="tab01" role="tabpanel">
					<div class="cnt_wr">
						<div class="row">
							<div class="col-sm-12">
								<div class="card-block table-border-style">
									<div class="table-responsive">
										<table class="table table-sm bst02">
											<tbody>
												<tr>
													<th scope="row">반품 처리</th>
												</tr>
											</tbody>
										</table>
										<table class="table table-sm bst02" id="basicTable">
											<colgroup>
											</colgroup>
											<thead>
											<tr>
											<th class="text-center">구분</th>
											<th class="text-center">단위</th>
											<th class="text-center">품명</th>
											<th class="text-center">단위수량</th>
											<th class="text-center">단가</th>
											<th class="text-center">주문량</th>
											<th class="text-center">주문금액</th>
											<th class="text-center">반품수량(개별)</th>
											<th class="text-center">반품금액</th>
											<th class="text-center">청구금액</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="row" items="${rtnpage7}">
											<tr>
											<td class="second" style="text-align: center;">${row.CAT_TITLE}</td>
											<td style="text-align: center;">${row.GOODS_UNIT}</td>
											<td style="text-align: center;">${row.GOODS_TITLE}</td>
											<td style="text-align: center;">${row.GOODS_SALE_UNIT}</td>
											<td style="text-align: right;" class="sprice"><fmt:formatNumber value="${row.GOODS_NET_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.ORD_QUTY}</td>	
											<td style="text-align: right;" class="ordamt"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
											<td style="text-align: right;"><input class="rquty" style="text-align:right; border:none" type="number" value="0" min="0" ></td>
											<td style="text-align: right;" class="ramount"></td>
											<td style="text-align: right;" class="remainT"></td>
											</tr>
											</c:forEach>
											<tr>
											<td style="text-align: center;"colspan="8">합             계</td>
											<td style="text-align: right;"><div><input style="text-align:right; border:none" type="text" id="rtnquty" value=""></div></td>
											<td style="text-align: right;"><div><input style="text-align:right; border:none" type="text" id="tamount" value=""></div></td>
											</tr>
											</tbody>
										</table>
									</div>
								</div>
<%--								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-primary"
										onClick="fn_UpdateReturn()">반품처리</button>
								</div>--%>
							</div>
						</div>
					</div>
					<!--//계약기본등록-->
				</div>
				<div class="tab-pane" id="tab02" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<table class="table table-sm bst02">
											<tbody>
												<tr>
													<th scope="row">(식당)주문목록</th>
												</tr>
											</tbody>
										</table>
										<table class="table table-sm bst02" id="Table6">
											<colgroup>
											</colgroup>
											<thead>
											<tr>
											<th class="text-center">주문일시</th>
											<th class="text-center">상품구분</th>
											<th class="text-center">단위</th>
											<th class="text-center">품명</th>
											<th class="text-center">단위수량</th>
											<th class="text-center">단가</th>
											<th class="text-center">주문량</th>
											<th class="text-center">주문금액</th>
											<th class="text-center">확인일자</th>
											<th class="text-center">주문구분</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="row" items="${spage6}">
											<tr>
											<td style="text-align: center;">${row.ORD_DATE}</td>
											<td class="second" style="text-align: center;">${row.CAT_TITLE}</td>
											<td style="text-align: center;">${row.GOODS_UNIT}</td>
											<td style="text-align: center;">${row.GOODS_TITLE}</td>
											<td style="text-align: center;">${row.GOODS_SALE_UNIT}</td>
											<td style="text-align: right;" class="netprice"><fmt:formatNumber value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.ORD_QUTY}</td>	
											<td style="text-align: right;" class="ordamount6"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.CONF_DATE}</td>
											<td style="text-align: center;"><c:if test="${row.ORD_TYPE eq 1}">초도주문</c:if><c:if test="${row.ORD_TYPE eq 2}">추가주문</c:if></td>
											</tr>
											</c:forEach>
											<tr>
											<td style="text-align: center;"colspan="9">식당 주문 합계</td>
											<td style="text-align: right;"><div><input style="text-align:right; border:none" type="text" id="tsum6" value=""></div></td>
											</tr>
											</tbody>
										</table>
										<br>
										<table class="table table-sm bst02">
											<tbody>
												<tr>
													<th scope="row">(매점)주문목록</th>
												</tr>
											</tbody>
										</table>
										<table class="table table-sm bst02" id="Table7">
											<colgroup>
											</colgroup>
											<thead>
											<tr>
											<th class="text-center">주문일시</th>
											<th class="text-center">상품구분</th>
											<th class="text-center">단위</th>
											<th class="text-center">품명</th>
											<th class="text-center">단위수량</th>
											<th class="text-center">단가</th>
											<th class="text-center">주문량</th>
											<th class="text-center">주문금액</th>
											<th class="text-center">확인일자</th>
											<th class="text-center">주문구분</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="row" items="${spage7}">
											<tr>
											<td style="text-align: center;">${row.ORD_DATE}</td>
											<td class="second" style="text-align: center;">${row.CAT_TITLE}</td>
											<td style="text-align: center;">${row.GOODS_UNIT}</td>
											<td style="text-align: center;">${row.GOODS_TITLE}</td>
											<td style="text-align: center;">${row.GOODS_SALE_UNIT}</td>
											<td style="text-align: right;" class="netprice"><fmt:formatNumber value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.ORD_QUTY}</td>	
											<td style="text-align: right;" class="ordamount7"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.CONF_DATE}</td>
											<td style="text-align: center;"><c:if test="${row.ORD_TYPE eq 1}">초도주문</c:if><c:if test="${row.ORD_TYPE eq 2}">추가주문</c:if></td>
											</tr>
											</c:forEach>
											<tr>
											<td style="text-align: center;"colspan="9">매점 주문 합계</td>
											<td style="text-align: right;"><div><input style="text-align:right; border:none" type="text" id="tsum7" value=""></div></td>
											</tr>
											</tbody>
										</table>
										<table class="table table-sm bst02" id="rtn">
											<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td style="text-align: center;">반품 합계</td>
											<td></td>
											<td></td>
											<td style="text-align: right;"><div><input style="text-align:right; border:none" type="text" id="sumrtn" value=""></div></td>
											</tr>
										</table>
										<table class="table table-sm bst02" id="tot">
											<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td style="text-align: center;">식당/매점 정산 합계</td>
											<td></td>
											<td></td>
											<td style="text-align: right;"><div><input style="text-align:right; border:none" type="text" id="summs" value=""></div></td>
											</tr>
										</table>
										
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab03" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="form3-1" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
										<tr>
											<th scope="row">주문 소계</th>
										</tr>
									</tbody>
								</table>
								<table class="table table-bordered nowrap" id="sFtable">
									<thead>
											<tr>
												<th scope="col" width="40%" style="text-align:center"><a href="javascript:dtlshow();">구</a><a href="javascript:dtlhide();">분</a></th>
												<th scope="col" width="15%" style="text-align:center">사용금액</th>
												<th scope="col" width="15%" style="text-align:center">추가금액</th>
												<th scope="col" width="15%" style="text-align:center">할인금액</th>
												<th scope="col" width="15%" style="text-align:center">외부정산금액</th>																								
											</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${spage2}">
											<tr class="hidedetail">
												<td>${row.FROOM_TITLE}<input type="hidden" class = "s2Tid" value = "${row.FROOM_ID}"/></td>
												<td style="text-align: right" class="price2"><fmt:formatNumber value="${row.RCHARGE}" pattern="#,###" /></td>
												<td style="text-align: right" class="addprice2"><fmt:formatNumber value="0" pattern="#,###" /></td>
												<td style="text-align: right; border-right:none"><input style="text-align:right;border:0px" type="text" class="discount2 from-control" value="0"></td>
												<td style="text-align: right" class="extprice2"><fmt:formatNumber value="0" pattern="#,###" /></td>
											</tr>
										</c:forEach>
											<tr><td style="background-color:lightgray; text-align:center">시설사용료</td>
											<td><input type="text" style="text-align:right;border:none" id="sum12" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum22" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum32"></td>
											<td><input type="text" style="text-align:right;border:none" id="sum42" disabled></td></tr>
										<c:forEach var="row" items="${spage4}">
											<tr class="hidedetail">
												<td>${row.GOODS_TITLE}<input type="hidden" class = "s4Tid" value = "${row.GOODS_ID}"/></td>
												<td style="text-align: right" class="price4"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
												<td style="text-align: right" class="addprice4"><fmt:formatNumber value="0" pattern="#,###" /></td>
												<td style="text-align: right; border-right:none"><input style="text-align:right;border:0px" type="text" class="discount4 from-control" value="0"></td>
												<td style="text-align: right" class="extprice4"><fmt:formatNumber value="0" pattern="#,###" /></td>
											</tr>
										</c:forEach>
											<tr><td style="background-color:lightgray; text-align:center">장의용품비</td>
											<td><input type="text" style="text-align:right;border:none" id="sum14" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum24" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum34"></td>
											<td><input type="text" style="text-align:right;border:none" id="sum44" disabled></td></tr>
										<c:forEach var="row" items="${spage3}">
											<tr class="hidedetail">
												<td>${row.BCD_TITLE}<input type="hidden" class = "s3Tid" value = "${row.FTABLE_ID}"/></td>
												<td style="text-align: right" class="price3"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
												<td style="text-align: right" class="addprice3"><fmt:formatNumber value="0" pattern="#,###" /></td>
												<td style="text-align: right; border-right:none"><input style="text-align:right;border:0px" type="text" class="discount3 from-control" value="0"></td>
												<td style="text-align: right" class="extprice3"><fmt:formatNumber value="0" pattern="#,###" /></td>
											</tr>
										</c:forEach>
											<tr><td style="background-color:lightgray; text-align:center">제물상비용</td>
											<td><input type="text" style="text-align:right;border:none" id="sum13" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum23" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum33"></td>
											<td><input type="text" style="text-align:right;border:none" id="sum43" disabled></td></tr>
										<c:forEach var="row" items="${spage5}">
											<tr class="hidedetail">
												<td>${row.ALTAR_TITLE}<input type="hidden" class = "s5Tid" value = "${row.ALTAR_ID}"/></td>
												<td style="text-align: right" class="price5"><fmt:formatNumber value="${row.ORD_PRICE}" pattern="#,###" /></td>
												<td style="text-align: right" class="addprice5"><fmt:formatNumber value="0" pattern="#,###" /></td>
												<td style="text-align: right; border-right:none"><input style="text-align:right;border:0px" type="text" class="discount5 from-control" value="0"></td>
												<td style="text-align: right" class="extprice5"><fmt:formatNumber value="0" pattern="#,###" /></td>
											</tr>
										</c:forEach>
											<tr><td style="background-color:lightgray; text-align:center">제단비용</td>
											<td><input type="text" style="text-align:right;border:none" id="sum15" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum25" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum35"></td>
											<td><input type="text" style="text-align:right;border:none" id="sum45" disabled></td></tr>
										<c:forEach var="row" items="${spage6}">
											<tr class="hidedetail">
												<td>${row.GOODS_TITLE}<input type="hidden" class = "s6Tid" value = "${row.GOODS_ID}"/></td>
												<td style="text-align: right" class="price6"><c:if test="${row.ORD_TYPE eq 1}"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></c:if><c:if test="${row.ORD_TYPE eq 2}"><fmt:formatNumber value="0" pattern="#,###" /></c:if></td>
												<td style="text-align: right" class="addprice6"><c:if test="${row.ORD_TYPE eq 2}"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></c:if><c:if test="${row.ORD_TYPE eq 1}"><fmt:formatNumber value="0" pattern="#,###" /></c:if></td>
												<td style="text-align: right; border-right:none"><input style="text-align:right;border:0px" type="text" class="discount6 from-control" value="0"></td>
												<td style="text-align: right" class="extprice6"><fmt:formatNumber value="0" pattern="#,###" /></td>
											</tr>
										</c:forEach>
											<tr><td style="background-color:lightgray; text-align:center">식사비용</td>
											<td><input type="text" style="text-align:right;border:none" id="sum16" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum26" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum36"></td>
											<td><input type="text" style="text-align:right;border:none" id="sum46" disabled></td></tr>
										<c:forEach var="row" items="${spage7}">
											<tr class="hidedetail">
												<td>${row.GOODS_TITLE}<input type="hidden" class = "s7Tid" value = "${row.GOODS_ID}"/></td>
												<td style="text-align: right" class="price7"><c:if test="${row.ORD_TYPE eq 1}"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></c:if><c:if test="${row.ORD_TYPE eq 2}"><fmt:formatNumber value="0" pattern="#,###" /></c:if></td>
												<td style="text-align: right" class="addprice7"><c:if test="${row.ORD_TYPE eq 2}"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></c:if><c:if test="${row.ORD_TYPE eq 1}"><fmt:formatNumber value="0" pattern="#,###" /></c:if></td>
												<td style="text-align: right; border-right:none"><input style="text-align:right;border:0px" type="text" class="discount7 from-control" value="0"></td>
												<td style="text-align: right" class="extprice7"><fmt:formatNumber value="0" pattern="#,###" /></td>
											</tr>
										</c:forEach>
											<tr><td style="background-color:lightgray; text-align:center">매점 비용</td>
											<td><input type="text" style="text-align:right;border:none" id="sum17" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum27" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum37"></td>
											<td><input type="text" style="text-align:right;border:none" id="sum47" disabled></td></tr>
										<c:forEach var="row" items="${spage8}">
											<tr class="hidedetail">
												<td>${row.GOODS_TITLE}<input type="hidden" class = "s8Tid" value = "${row.GOODS_ID}"/></td>
												<td style="text-align: right" class="price8"><c:if test="${row.ORD_TYPE eq 1}"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></c:if><c:if test="${row.ORD_TYPE eq 2}"><fmt:formatNumber value="0" pattern="#,###" /></c:if></td>
												<td style="text-align: right" class="addprice8"><c:if test="${row.ORD_TYPE eq 2}"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></c:if><c:if test="${row.ORD_TYPE eq 1}"><fmt:formatNumber value="0" pattern="#,###" /></c:if></td>
												<td style="text-align: right; border-right:none"><input style="text-align:right;border:0px" type="text" class="discount8 from-control" value="0"></td>
												<td style="text-align: right" class="extprice8"><fmt:formatNumber value="0" pattern="#,###" /></td>
											</tr>
										</c:forEach>
											<tr><td style="background-color:lightgray; text-align:center">기타 비용</td>
											<td><input type="text" style="text-align:right;border:none" id="sum18" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum28" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum38"></td>
											<td><input type="text" style="text-align:right;border:none" id="sum48" disabled></td></tr>
											<tr><td style="background-color:lightgray; text-align:center">기타 할인</td>
											<td colspan="2"><input type="text" style="text-align:center;border:none" value="할인명" disabled><input type="text" style="text-align:right;border:none" id="extdiscount" value=""></td>
											<td><input type="text" style="text-align:right;border:none" id="sum39"></td>
											<td><input type="text" style="text-align:right;border:none" id="sum49" disabled></td></tr>
											<tr><td style="background-color:lightgray; text-align:center">도우미 비용</td>
											<td colspan="3" style="text-align:center"><input type="number" style="text-align:center;border:none" id="sum1A" value="">명</td>
											<td><input type="text" style="text-align:right;border:none" id="sum4A" disabled></td></tr>											
											<tr><td style="background-color:lightgray; text-align:center">장의차 비용</td>
											<td colspan="3" style="text-align:center"><input type="text" style="text-align:center;border:none" id="sum1B" value="버스기사님께 직접 지불" disabled></td>
											<td><input type="text" style="text-align:right;border:none" id="sum4B"></td></tr>											
									</tbody>
								</table>
							</form>
							<hr>
							<div style="text-align:right"><span>총액 :</span><input type="text" id="sumPage3total" style="text-align: right; border: none;" readonly>
							</div>
							<div class="table-responsive">
								<table class="table table-sm bst02">
									<tbody>
									<tr>
										<th scope="row">장례 비용 총계</th>
									</tr>
									</tbody>
								</table>
								<table class="table table-sm bst02">
									<tbody>
									<tr>
										<td class="form-control">총 장례 비용 합계</td>
										<td><input style="text-align: right; border:none" class="form-control" type="text" id="page4grdsum" value=""></td>
									</tr>
									<tr>
										<td class="form-control">반품 금액 합계</td>
										<td><input style="text-align: right; border:none" class="form-control" type="text" id="page4rtn" value=""></td>
									</tr>
									<tr>
										<td class="form-control">할인 금액 합계</td>
										<td><input style="text-align: right; border:none" class="form-control" type="text" id="page4disc" value=""></td>
									</tr>
									<tr>
										<td class="form-control">업체에 직접 지불하실 비용 합계</td>
										<td><input style="text-align: right; border:none" class="form-control" type="text" id="page4ext" value=""></td>
									</tr>
									<tr>
										<td class="form-control"><input type="checkbox" id="cashbillchk"><span> </span> 현금영수증 발행 (발행용 전화번호 입력)</td>
										<td><input style="text-align: right; border:none" class="form-control" type="tel" id="page4cashbill" value=""></td>
									</tr>
									<tr>
										<td class="form-control">현금 수납 금액</td>
										<td><input style="text-align: right; border:none" class="form-control" type="text" id="page4cash" value="0"></td>
									</tr>
									<tr>
										<td class="form-control">카드 수납 금액</td>
										<td><input style="text-align: right; border:none" class="form-control" type="text" id="page4card" value="0"></td>
									</tr>
									<tr>
										<td class="form-control">추가 기재 사항</td>
										<td><textarea style="border:none" class="form-control" id="page4rmk"></textarea></td>
									</tr>
									</tbody>
								</table>
								<div style="text-align: right">
									<span>수납 대상 총액 :</span><input type="text" id="Conttotal"
																  style="text-align: right; border: none;" readonly>
								</div>
							</div>
						</div>
					</div>
				</div>
						<div class="tab-pane" id="tab04" role="tabpanel">
							<div class="card-block table-border-style">
								<div class="table-responsive">
									<div class="btn_wr text-right mt-3">
										<button class="btn btn-md btn-primary"
											onClick="fn_contFinish()">수납/퇴실처리 완료</button>
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
</div>

<!--계약기본등록-->
<script>
	$('input').on("keypress", function(e) {
	    if (e.keyCode == 13) {
	        var inputs = $(this).parents("tbody").eq(0).find(":input");
	        var idx = inputs.index(this);
	
	        if (idx == inputs.length - 1) {
	            inputs[0].select();
	        } else {
	            inputs[idx + 1].focus(); 
	            inputs[idx + 1].select();
	        }
	        return false;
	    }
	});
	
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
	
	
	function tab01active(){
		$('.tab-pane').removeClass('active');
		$('#tab01').addClass('active');
	}
	function tab02active(){
		$('.tab-pane').removeClass('active');
		$('#tab02').addClass('active');
	}
	function tab03active(){
		$('.tab-pane').removeClass('active');
		$('#tab03').addClass('active');
	}
	function tab04active(){
		$('.tab-pane').removeClass('active');
		$('#tab04').addClass('active');
	}

	$(document).ready(function(){
		calReturn();
		calsum6();
		calsum7();
		sumsmall();
		sumCont2();
		sumCont3();
		sumCont4();
		sumCont5();
		sumCont6();
		sumCont7();
		sumCont8();
		totalsum();
		$(".hidedetail").hide();
	})

	function calReturn() {
		var $infoarr = $(".sprice");
		var $Aarr = $(".rquty");
		var $Barr = $(".ramount");
		var $Carr = $(".remainT");
		var $Darr = $(".ordamt");
			var retTotal = 0;
			var sumTotal = 0;
		for (var i = 0; i < $infoarr.length; i++) {
			var Ttotal = 0;
			var Ttotal2 = 0;
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t3 = Number($Aarr[i].value.replace(/[\D\s\._\-]+/g, ""));
			Ttotal = (t1*t3);
			$Barr[i].innerText = numberWithCommas(Ttotal);
			Ttotal2 = t2-(t1*t3);
			$Carr[i].innerText = numberWithCommas(Ttotal2);
			retTotal = retTotal + Ttotal; 
			sumTotal = sumTotal + Ttotal2;
			}
		$('#rtnquty').val(numberWithCommas(retTotal));
		$('#sumrtn').val(numberWithCommas(retTotal*(-1)));
		$('#tamount').val(numberWithCommas(sumTotal));
		$('#page4rtn').val(numberWithCommas(retTotal*(-1)));
		$("#page4card").val("0");
		$("#page4cash").val("0");
		page4Reload();
	}
	
	
	
	function calsum6() {
		var $infoarr = $(".ordamount6");
			var sumTotal = 0;
		for (var i = 0; i < $infoarr.length; i++) {
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			sumTotal = sumTotal + t1;
			}
		$('#tsum6').val(numberWithCommas(sumTotal));
	}
	
	function calsum7() {
		var $infoarr = $(".ordamount7");
			var sumTotal = 0;
		for (var i = 0; i < $infoarr.length; i++) {
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			sumTotal = sumTotal + t1;
			}
		$('#tsum7').val(numberWithCommas(sumTotal));
	}
	
	function sumsmall() {
		var msum = Number($('#tsum6').val().replace(/[\D\s\._\-]+/g, ""));
		var ssum = Number($('#tsum7').val().replace(/[\D\s\._\-]+/g, ""));
		var rsum = Number($('#sumrtn').val().replace(/[\D\s\._\-]+/g, ""));
		var totsum = msum + ssum + rsum;
		$('#summs').val(numberWithCommas(totsum));
	}


	
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	$(".rquty").change(function(){
		calReturn();
		sumsmall();
	});


	function dtlhide(){
		$(".hidedetail").hide();
	}
	
	function dtlshow(){
		$(".hidedetail").show();
	}
	
	function fn_contFinish(){
		if(confirm("퇴실 처리 하시겠습니까?")){}
	}
	
	function sumCont2(){
		var $Aarr = $(".price2");
		var $Barr = $(".addprice2");
		var $Carr = $(".discount2");
		var $Darr = $(".extprice2");
			var Total12 = 0;
			var Total22 = 0;
			var Total32 = 0;
			var Total42 = 0;
		for (var i = 0; i < $Aarr.length; i++) {
			var t1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t3 = Number($Carr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var t4 = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			Total12 = Total12 + t1;
			Total22 = Total22 + t2;
			Total32 = Total32 + t3;
			Total42 = Total42 + t4;
		}
		$('#sum12').val(numberWithCommas(Total12));
		$('#sum22').val(numberWithCommas(Total22));
		$('#sum32').val(numberWithCommas(Total32));
		$('#sum42').val(numberWithCommas(Total42));
	}

	function sumCont3(){
		var $Aarr = $(".price3");
		var $Barr = $(".addprice3");
		var $Carr = $(".discount3");
		var $Darr = $(".extprice3");
			var Total13 = 0;
			var Total23 = 0;
			var Total33 = 0;
			var Total43 = 0;
		for (var i = 0; i < $Aarr.length; i++) {
			var t1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t3 = Number($Carr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var t4 = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			Total13 = Total13 + t1;
			Total23 = Total23 + t2;
			Total33 = Total33 + t3;
			Total43 = Total43 + t4;
		}
		$('#sum13').val(numberWithCommas(Total13));
		$('#sum23').val(numberWithCommas(Total23));
		$('#sum33').val(numberWithCommas(Total33));
		$('#sum43').val(numberWithCommas(Total43));
	}
	
	function sumCont4(){
		var $Aarr = $(".price4");
		var $Barr = $(".addprice4");
		var $Carr = $(".discount4");
		var $Darr = $(".extprice4");
			var Total14 = 0;
			var Total24 = 0;
			var Total34 = 0;
			var Total44 = 0;
		for (var i = 0; i < $Aarr.length; i++) {
			var t1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t3 = Number($Carr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var t4 = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			Total14 = Total14 + t1;
			Total24 = Total24 + t2;
			Total34 = Total34 + t3;
			Total44 = Total44 + t4;
		}
		$('#sum14').val(numberWithCommas(Total14));
		$('#sum24').val(numberWithCommas(Total24));
		$('#sum34').val(numberWithCommas(Total34));
		$('#sum44').val(numberWithCommas(Total44));
	}
	
	function sumCont5(){
		var $Aarr = $(".price5");
		var $Barr = $(".addprice5");
		var $Carr = $(".discount5");
		var $Darr = $(".extprice5");
			var Total15 = 0;
			var Total25 = 0;
			var Total35 = 0;
			var Total45 = 0;
		for (var i = 0; i < $Aarr.length; i++) {
			var t1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t3 = Number($Carr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var t4 = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			Total15 = Total15 + t1;
			Total25 = Total25 + t2;
			Total35 = Total35 + t3;
			Total45 = Total45 + t4;
		}
		$('#sum15').val(numberWithCommas(Total15));
		$('#sum25').val(numberWithCommas(Total25));
		$('#sum35').val(numberWithCommas(Total35));
		$('#sum45').val(numberWithCommas(Total45));
	}
	
	function sumCont6(){
		var $Aarr = $(".price6");
		var $Barr = $(".addprice6");
		var $Carr = $(".discount6");
		var $Darr = $(".extprice6");
			var Total16 = 0;
			var Total26 = 0;
			var Total36 = 0;
			var Total46 = 0;
		for (var i = 0; i < $Aarr.length; i++) {
			var t1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t3 = Number($Carr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var t4 = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			Total16 = Total16 + t1;
			Total26 = Total26 + t2;
			Total36 = Total36 + t3;
			Total46 = Total46 + t4;
		}
		$('#sum16').val(numberWithCommas(Total16));
		$('#sum26').val(numberWithCommas(Total26));
		$('#sum36').val(numberWithCommas(Total36));
		$('#sum46').val(numberWithCommas(Total46));
	}
	
	function sumCont7(){
		var $Aarr = $(".price7");
		var $Barr = $(".addprice7");
		var $Carr = $(".discount7");
		var $Darr = $(".extprice7");
			var Total17 = 0;
			var Total27 = 0;
			var Total37 = 0;
			var Total47 = 0;
		for (var i = 0; i < $Aarr.length; i++) {
			var t1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t3 = Number($Carr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var t4 = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			Total17 = Total17 + t1;
			Total27 = Total27 + t2;
			Total37 = Total37 + t3;
			Total47 = Total47 + t4;
		}
		$('#sum17').val(numberWithCommas(Total17));
		$('#sum27').val(numberWithCommas(Total27));
		$('#sum37').val(numberWithCommas(Total37));
		$('#sum47').val(numberWithCommas(Total47));
	}

	function sumCont8(){
		var $Aarr = $(".price8");
		var $Barr = $(".addprice8");
		var $Carr = $(".discount8");
		var $Darr = $(".extprice8");
			var Total18 = 0;
			var Total28 = 0;
			var Total38 = 0;
			var Total48 = 0;
		for (var i = 0; i < $Aarr.length; i++) {
			var t1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t3 = Number($Carr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var t4 = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			Total18 = Total18 + t1;
			Total28 = Total28 + t2;
			Total38 = Total38 + t3;
			Total48 = Total48 + t4;
		}
		$('#sum18').val(numberWithCommas(Total18));
		$('#sum28').val(numberWithCommas(Total28));
		$('#sum38').val(numberWithCommas(Total38));
		$('#sum48').val(numberWithCommas(Total48));
	}

	
	function fn_calPage3(){
		sumCont2();
		sumCont3();
		sumCont4();
		sumCont5();
		sumCont6();
		sumCont7();
		sumCont8();
		totalsum();
		page4Reload();
	}
	
	function totalsum(){
		var totsum1 = Number($('#sum12').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum13').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum14').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum15').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum16').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum17').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum18').val().replace(/[\D\s\._\-]+/g, ""));
		var totsum2 = Number($('#sum22').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum23').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum24').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum25').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum26').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum27').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum28').val().replace(/[\D\s\._\-]+/g, ""));
		var totsum3 = Number($('#sum32').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum33').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum34').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum35').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum36').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum37').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum38').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum39').val().replace(/[\D\s\._\-]+/g, ""));
		var totsum4 = Number($('#sum42').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum43').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum44').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum45').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum46').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum47').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum48').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum4A').val().replace(/[\D\s\._\-]+/g, ""))+Number($('#sum4B').val().replace(/[\D\s\._\-]+/g, ""));
		$("#sumPage3total").val(numberWithCommas(totsum1+totsum2-totsum3));
		$("#Conttotal").val(numberWithCommas(totsum1+totsum2-totsum3));
		$("#page4disc").val(numberWithCommas(totsum3*(-1)));
		$("#page4ext").val(numberWithCommas(totsum4));
		$("#page4grdsum").val(numberWithCommas(totsum1+totsum2+totsum4));
	}
	
	$("#sum32,#sum33,#sum34,#sum35,#sum36,#sum37,#sum38,#sum39").change(function(){
		totalsum();
		$("#sum32").val(numberWithCommas($("#sum32").val()));
		$("#sum33").val(numberWithCommas($("#sum33").val()));
		$("#sum34").val(numberWithCommas($("#sum34").val()));
		$("#sum35").val(numberWithCommas($("#sum35").val()));
		$("#sum36").val(numberWithCommas($("#sum36").val()));
		$("#sum37").val(numberWithCommas($("#sum37").val()));
		$("#sum38").val(numberWithCommas($("#sum38").val()));
		$("#sum39").val(numberWithCommas($("#sum39").val()));
		$("#page4card").val("0");
		$("#page4cash").val("0");
		page4Reload();
	});
	
	$("#sum4B").change(function(){
		totalsum();
		$("#sum4B").val(numberWithCommas($("#sum4B").val()));
	});
	
	$("#page4cash").change(function(){
		var t1 = Number($("#Conttotal").val().replace(/[\D\s\._\-]+/g, ""));
		var t2 = Number($("#page4cash").val().replace(/[\D\s\._\-]+/g, ""));
		$("#page4card").val(numberWithCommas(t1-t2));
		$("#page4cash").val(numberWithCommas($("#page4cash").val()));
	});
	
	$("#page4card").change(function(){
		var t1 = Number($("#Conttotal").val().replace(/[\D\s\._\-]+/g, ""));
		var t2 = Number($("#page4card").val().replace(/[\D\s\._\-]+/g, ""));
		$("#page4cash").val(numberWithCommas(t1-t2));
		$("#page4card").val(numberWithCommas($("#page4card").val()));
	});
	
	function page4Reload(){
		var t1 = Number($("#page4grdsum").val().replace(/[\D\s\._\-]+/g, ""));
		var t2 = Number($("#page4rtn").val().replace(/[\D\s\._\-]+/g, ""));
		var t3 = Number($("#page4disc").val().replace(/[\D\s\._\-]+/g, ""));
		var t4 = Number($("#page4ext").val().replace(/[\D\s\._\-]+/g, ""));
		$("#Conttotal").val(numberWithCommas(t1-t2-t3-t4));
	}

	function nextInput(data){

		let idx = $('Input').index();

		alert (idx);

	}

</script>