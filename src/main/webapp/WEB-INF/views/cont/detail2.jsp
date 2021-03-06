<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	float: left;
	width: 15%;
	height: 100%;
	text-align: center;
	background: white;
	border-right: 1px solid #ddd;
}

.h-container .item.cont {
	float: left;
	width: 78%;
	padding: 10px;
	border-right: none;
	text-align: center;
}
</style>
<div class="listcont">
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						<h5>계약내용 관리</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="h-container">
		<div class="item">
		<table class="table table-bordered nowrap" id="roomTable">
				<thead>
					<tr>
						<th scope="col" width="200" align="center">계약 단계</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><a href="javascript:tab01active()">계약기본</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab02active()">분향실</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab03active()">제물상</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab04active()">장의용품</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab05active()">제단</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab06active()">식당</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab07active()">매점</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab08active()">기타시설</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab09active()">안내문</a></td>
						</tr>
				</tbody>
			</table>
		</div>
		<div class="item cont">
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
													<th scope="row">계약기본사항</th>
												</tr>
											</tbody>
										</table>
										<table class="table table-sm bst02" id="basicTable">
											<colgroup>
												<col width="12%" />
												<col width="10%" />
												<col width="18%" />
												<col width="8%" />
												<col width="12%" />
												<col width="12%" />
												<col width="12%" />
												<col width="12%" />
											</colgroup>
											<tbody>
												<tr align="center">
													<th>계약조회</th>
													<td>조회호실</td>
													<td><select class="form-control" id="contp1-01">
															<option value="">선택</option>
															<c:forEach var="contcombo" items="${contCombo}">
																<option value="${contcombo.CONTRACT_ID}?CONT_FROOM_ID=${contcombo.FROOM_ID}" <c:if test="${contcombo.FROOM_ID eq frid}">selected</c:if> >${contcombo.FROOM_TITLE}</option>
															</c:forEach>
													</select></td>
													<td>기간</td>
													<td><input type="date" class="form-control" id="contp1-02" name="contp1-02" value="${STDate}" disabled></td>
													<td><input type="date" class="form-control"	id="contp1-03" name="contp1-03" value="${ENDate}" disabled></td>
													<td><button onclick="fnSetPage('${path}/cont/listview.do');">새계약서 작성</button></td>
												</tr>
												<tr align="center">
													<th rowspan="5">고인</th>
													<td>성명</td>
													<td><input type="text" 
														class="form-control form-control-sm" id="contp1-07"
														name="contp1-07" value="${detailCont.DPERSON_NAME}" >
													</td>
													<td>주민등록번호</td>
													<td><input type="text" size="13" maxlength="14"
														class="form-control form-control-sm jumin" id="contp1-08"
														name="contp1-08" value="${detailCont.DPERSON_JMNO}"></td>
													<td>성별</td>
													<td>
														<select class="form-control form-control-sm" id="contp1-09">
														<option value = "">선택</option>
														<option value = "1">남</option>
														<option value = "2">여</option>
														</select>
														</td>
												</tr>
												<tr align="center">
												<td>주소</td>
													<td colspan="2"><input type="text" style="width:70%;float:left"
														class="form-control form-control-sm" id="contp1-10"
														name="contp1-10" value="${detailCont.DPERSON_ADDR1}" tabindex="7"><button onClick="execDaumPostcode();" style="width:29%;float:right">검색</button>
													</td>
													<td>본관</td>
													<td><input type="text"
														class="form-control form-control-sm" id="contp1-11"
														name="contp1-11" value=""></td>
												</tr>
												<tr align="center">
													<td>상세주소</td>
													<td colspan="2"><input type="text"
														class="form-control form-control-sm" id="contp1-12"
														name="contp1-12" value="${detailCont.DPERSON_ADDR2}" >
													</td>
													<td>종교</td>
													<td><select class="form-control" id="contp1-13">
															<option value="">선택</option>
															<c:forEach var="regc" items="${regioncode}">
																<option value="${regc.BCD_ID}">${regc.BCD_TITLE}</option>
															</c:forEach>
															</select></td>
												</tr>
												<tr align="center">
													<td>사망일시</td>
													<td><input type="date" class="form-control form-control-sm" id="contp1-14" name="contp1-14" value="">
													<input type="time" class="form-control form-control-sm" id="contp1-14-1" name="contp1-14-1" value="">
													</td>
													<td>나이</td>
													<td><input type="number" style="text-align:right"
														class="form-control form-control-sm" id="contp1-15" min="0" max="150"
														name="contp1-15" value="${detailCont.DPERSON_AGE}"></td>
													<td>사망종류</td>
													<td><select class="form-control" id="contp1-16">
															<option value="">선택</option>
															<option value="1">노환</option>
															<option value="2">병사</option>
													</select></td>
												</tr>
												<tr align="center">
													<td>사망장소</td>
													<td><input type="text"
														class="form-control form-control-sm" id="contp1-17"
														name="contp1-17" value="${detailCont.DPLACE}" >
													</td>
													<td>지역</td>
													<td><input type="text"
														class="form-control form-control-sm" id="contp1-18"
														name="contp1-18" value=""></td>
													<td>화장/매장</td>
													<td>
													<select class="form-control" id="contp1-19">
															<option value="">선택</option>
															<option value="1">화장</option>
															<option value="2">매장</option>
															<option value="9">기타</option>
													</select>
													</td>
												</tr>
												<tr align="center">
													<th rowspan="3">유족</th>
													<td>상주성명</td>
													<td><input type="text"
														class="form-control form-control-sm" id="contp1-20"
														name="contp1-20" value="${detailCont.SANGJU_NAME}" >
													</td>
													<td>주민등록번호</td>
													<td><input type="text" size="13" maxlength="14"
														class="form-control form-control-sm jumin" id="contp1-21" 
														name="contp1-21" value="${detailCont.SANGJU_JMNO}"></td>
													<td>관계</td>
													<td><select class="form-control" id="contp1-22">
															<option value="">선택</option>
															<c:forEach var="regc" items="${frelation}">
																<option value="${regc.BCD_ID}">${regc.BCD_TITLE}</option>
															</c:forEach>
													     </select></td>
												</tr>
												<tr align="center">
													<td>주소</td>
													<td colspan="2"><input type="text" style="width:70%;float:left" 
														class="form-control form-control-sm" id="contp1-23"
														name="contp1-23" value="${detailCont.SANGJU_ADDR1}" ><button style="width:29%;float:right" onClick="execDaumPostcode2();">검색</button> 
													</td>
													<td>연락처</td>
													<td><input type="text"
														class="form-control form-control-sm phone" id="contp1-24" maxlength="13"
														name="contp1-24" value="${detailCont.SANGJU_TEL}"></td>
												</tr>
												<tr align="center">
													<td>상세주소</td>
													<td colspan="2"><input type="text"
														class="form-control form-control-sm" id="contp1-25"
														name="contp1-25" value="${detailCont.SANGJU_ADDR2}" >
													</td>
													<td></td>
													<td></td>
												</tr>
												<tr align="center">
													<th rowspan="2">일정</th>
													<td>입실일시*</td>
													<td><input type="date" class="form-control form-control-sm" id="contp1-26" name="contp1-26" value="" >
													<input type="time" class="form-control form-control-sm" id="contp1-26-1" name="contp1-26-1" value="" >
													</td>
													<td>안치일시</td>
													<td colspan="2"><input type="date" class="form-control form-control-sm" id="contp1-27" name="contp1-27" value="">
													<input type="time" class="form-control form-control-sm" id="contp1-27-1" name="contp1-27-1" value="">
													</td>
												</tr>
												<tr align="center">
													<td>입관일시</td>
													<td><input type="date" class="form-control" id="contp1-28" name="contp1-28" value="" >
													<input type="time" class="form-control" id="contp1-28-1" name="contp1-28-1" value="" >
													</td>
													<td colspan="2">발인일시*</td>
													<td><input type="date" class="form-control form-control-sm" id="contp1-29" name="contp1-29" value="">
													<input type="time" class="form-control form-control-sm" id="contp1-29-1" name="contp1-29-1" value="">
													</td>
												</tr>
												<tr align="center">
													<td>장지</td>
													<td colspan="3"><input type="text"
														class="form-control form-control-sm" id="contp1-30"
														name="contp1-30" value="${detailCont.JANGJI}" >
													</td>
													<td></td>
													<td></td>
												</tr>
												<tr class="yujoklist" align="center">
													<th>유족정보</th>
													<td>
														<select class="form-control" id="contp1-31">
															<option value="">선택</option>
															<c:forEach var="regc" items="${frelation}">
																<option value="${regc.BCD_ID}">${regc.BCD_TITLE}</option>
															</c:forEach>
													     </select>
													</td>
													<td><input type="text"
														class="form-control form-control-sm" id="contp1-32"
														name="contp1-31" value="">
													</td>
													<td><button onclick="fn_addyujok()">추가</button></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
													<c:forEach var="yujok" items="${listYujok}">
													<tr id="sj${yujok.CONT_SANGJU_ID}">
													<td></td>
													<td>${yujok.RELATION_TITLE}</td>
													<td>${yujok.SANGJU_NAMEs}</td>
													<td><button onclick="fn_delyujok('${yujok.CONT_SANGJU_ID}')">삭제</button></td>
													</tr>	
													</c:forEach>
												<tr align="center">
													<td>비고</td>
													<td colspan="6"><input type="text"
														class="form-control form-control-sm" id="contp1-37"
														name="contp1-37" value="${detailCont.REMARK}"></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-primary"
										onClick="fn_contUpdateP1()">등록</button>
								</div>
							</div>
						</div>
					</div>
					<!--//계약기본등록-->
				</div>
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
								<table class="table  table-bordered nowrap"
									id="roomList">
									<colgroup>
										<col width="5%" />
										<col width="5%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
										<col width="20%" />
									</colgroup>
									<thead>
										<tr>
											<th class="text-center">선택</th>
											<th class="text-center">호실명</th>
											<th class="text-center">사용유무</th>
											<th class="text-center">일일사용료</th>
											<th class="text-center">시간당사용료</th>
											<th class="text-center">면적(m<sup>2</sup>)</th>
											<th class="text-center">평수</th>
											<th class="text-center">수용인원</th>
											<th class="text-center">이미지</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="row" items="${contpage2}">
										<tr>
											<td style="text-align: center;"><input type="checkbox" <c:if test="${not empty row.CONTRACT_ID}">disabled</c:if>
												class="CHKroom form-control" onclick="oneCheck(this);" <c:if test="${row.CHKED eq 'Y'}">checked</c:if> /></td>
											<td>${row.FROOM_TITLE}<input type="hidden" class = "FRMID" value = "${row.FROOM_ID}"></td>
											<td style="text-align: center;"><c:if test="${not empty row.CONTRACT_ID}">사용중</c:if></td>
											<td class = "RMday"style="text-align: right;"><fmt:formatNumber
													value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
											<td class = "RMtime" style="text-align: right;"><fmt:formatNumber
													value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.FROOM_AREA}</td>
											<td style="text-align: right;">${row.FROOM_AREA_KOR}</td>
											<td style="text-align: right;">${row.FROOM_MAX_PERS}</td>
											<td class="imagebx"><div id="froomImage">
											</div></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</form>
							<br> <br>
							<table class="table  table-bordered nowrap"
									id="SltdroomList">
									<colgroup>
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
											<th class="text-center">호실종류</th>
											<th class="text-center">호실명</th>
											<th class="text-center">일일사용료</th>
											<th class="text-center">시간당사용료</th>
											<th class="text-center">사용일</th>
											<th class="text-center">사용시간</th>
											<th class="text-center">사용요금</th>
											<th style="display:none" class="text-center">선택</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="row" items="${contpage2}">
										<tr>
											<td>분향실</td>
											<td>${row.FROOM_TITLE}<input type="hidden" class = "FRMID" value = "${row.FROOM_ID}"></td>
											<td class = "RMday"style="text-align: right;"><fmt:formatNumber
													value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
											<td class = "RMtime" style="text-align: right;"><fmt:formatNumber
													value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
											<td class = "sRMd" style="text-align: right;">${DAYS}</td>
											<td class = "sRMt" style="text-align: right;">${TIMEs}</td>
											<td class = "sRMcharge" style="text-align: right;"><fmt:formatNumber
													value="${RCHARGE}" pattern="#,###" /></td>
											<td style="text-align: center; display:none"><input type="checkbox"
												class="CHKsrm form-control" <c:if test="${row.CHKED eq 'Y'}">checked</c:if> /></td>
										</tr>
									</c:forEach>
									<c:forEach var="row" items="${listEtcroom}">
										<tr>
											<td class="second">부대시설</td>
											<td>${row.FROOM_TITLE}<input type="hidden" class="etcrid"value="${row.FROOM_ID}"></td>
											<td class = "EA" style="text-align: right;"><fmt:formatNumber value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
											<td class = "EB" style="text-align: right;"><fmt:formatNumber value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;"><input style="text-align: right"class="form-control Eday" type="number" min="0" max="30" value="0"/></td>
											<td style="text-align: right;"><input style="text-align: right"class="form-control Etime" type="number" min="0" max="30" value="0"/></td>
											<td class = "Esum" style="text-align: right;"><fmt:formatNumber value="0" pattern="#,###" /></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
						</div>
					</div>
					<div class="btn_wr text-right mt-3">
						<button class="btn btn-md btn-primary" onClick="fn_contInsertP2()">등록</button>
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
											<c:forEach var="row" items="${contpage3}">
												<tr>
													<td class="second">${row.BCD_TITLE}</td>
													<td><input type="checkbox" <c:if test="${row.FTABLE_CAT eq '24'}">onclick="oneCheckft(this);"</c:if> name = "FT${row.FTABLE_CAT}" class="CHKft form-control" <c:if test="${row.CHKED eq 'Y'}">checked</c:if> /></td>
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
											<c:forEach var="row" items="${contpage3}">
												<tr>
													<td>${row.BCD_TITLE}<input type="hidden" class = "sTid" value = "${row.FTABLE_ID}"/></td>
													<td style="text-align: right" class="sTA"><fmt:formatNumber value="${row.FTABLE_AMOUNT}" pattern="#,###" /></td>
													<td style="text-align: right; border-right:none"><input style="text-align:right;border:0px" type="number" class="sTB from-control" min="0" value = "1"></td><td style = "border-left:none">${row.FTABLE_UNIT}</td>
													<td style="text-align: right" class="sTC"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
													<td style="display :none"><input type="checkbox" class="sCHKft form-control" <c:if test="${row.CHKED eq 'Y'}">checked</c:if> /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
							</form>
							<hr>
							<div style="text-align:right"><span>선택된 제물상 총액 :</span><input type="text" id="P3total" style="text-align: right; border: none;" readonly>
							</div>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-primary" onClick="fn_contInsertP3()">등록</button>
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
											<td style="text-align: right;"></td>
										</tr>
									</tbody>
								</table>
								<table class="table  table-bordered nowrap MOD">
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
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 13}"><option value="${row.GOODS_ID}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> >${row.GOODS_TITLE}</option></c:if>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control m132" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 13}"><option value="${row.GOODS_NET_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control m133 infoG1" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 13}"><option value="${row.GOODS_SALE_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GA" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100" value="<c:forEach var="row" items="${contpage4m}"><c:if test="${row.CAT_02_ID eq 13}">${row.ORD_QUTY}</c:if></c:forEach>" required></td>
												<td class="GB from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>도복,원삼</td>
												<td><select class="form-control m141 mgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 14}"><option value="${row.GOODS_ID}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> >${row.GOODS_TITLE}</option></c:if>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control m142" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 14}"><option value="${row.GOODS_NET_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control m143 infoG1" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 14}"><option value="${row.GOODS_SALE_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GA" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100"
													value="<c:forEach var="row" items="${contpage4m}"><c:if test="${row.CAT_02_ID eq 14}">${row.ORD_QUTY}</c:if></c:forEach>" required></td>
												<td class="GB from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>영정</td>
												<td><select class="form-control m151 mgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 15}"><option value="${row.GOODS_ID}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> >${row.GOODS_TITLE}</option></c:if>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control m152" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 15}"><option value="${row.GOODS_NET_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control m153 infoG1" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 15}"><option value="${row.GOODS_SALE_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GA" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100"
													value="<c:forEach var="row" items="${contpage4m}"><c:if test="${row.CAT_02_ID eq 15}">${row.ORD_QUTY}</c:if></c:forEach>" required></td>
												<td class="GB from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>수의</td>
												<td><select class="form-control m161 mgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 16}"><option value="${row.GOODS_ID}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> >${row.GOODS_TITLE}</option></c:if>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control m162" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 16}"><option value="${row.GOODS_NET_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control m163 infoG1" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 16}"><option value="${row.GOODS_SALE_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GA" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100"
													value="<c:forEach var="row" items="${contpage4m}"><c:if test="${row.CAT_02_ID eq 16}">${row.ORD_QUTY}</c:if></c:forEach>" required></td>
												<td class="GB from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>염베</td>
												<td><select class="form-control m171 mgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 17}"><option value="${row.GOODS_ID}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> >${row.GOODS_TITLE}</option></c:if>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control m172" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 17}"><option value="${row.GOODS_NET_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control m173 infoG1" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 17}"><option value="${row.GOODS_SALE_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GA" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100"
													value="<c:forEach var="row" items="${contpage4m}"><c:if test="${row.CAT_02_ID eq 17}">${row.ORD_QUTY}</c:if></c:forEach>" required></td>
												<td class="GB from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>천금지금</td>
												<td><select class="form-control m181 mgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 18}"><option value="${row.GOODS_ID}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> >${row.GOODS_TITLE}</option></c:if>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control m182" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 18}"><option value="${row.GOODS_NET_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control m183 infoG1" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4m}">
													<c:if test="${row.CAT_02_ID eq 18}"><option value="${row.GOODS_SALE_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GA" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100"
													value="<c:forEach var="row" items="${contpage4m}"><c:if test="${row.CAT_02_ID eq 18}">${row.ORD_QUTY}</c:if></c:forEach>" required></td>
												<td class="GB from-control" style="text-align: right;"></td>
											</tr>
										<c:forEach var="row" items="${contpage4m}">
											<c:if test="${row.CAT_02_ID > 18}"><tr></c:if>
												<c:if test="${row.CAT_02_ID > 18}"><td class="first">${row.CAT_TITLE}</td></c:if>
												<c:if test="${row.CAT_02_ID > 18}"><td>${row.GOODS_TITLE}</td></c:if>
												<c:if test="${row.CAT_02_ID > 18}"><td>${row.GOODS_UNIT}<input type="hidden" class="FRID"
													value="${frid}"><input type="hidden" class="GIDm"
													value="${row.GOODS_ID}"></td></c:if>
												<c:if test="${row.CAT_02_ID > 18}"><td style="text-align: right;"><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></td></c:if>
												<c:if test="${row.CAT_02_ID > 18}"><td style="text-align: right;" class="infoG2"><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td></c:if>
												<c:if test="${row.CAT_02_ID > 18}"><td style="text-align: right;"><input
													class="from-control GC" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100" value="${row.ORD_QUTY}"></td></c:if>
												<c:if test="${row.CAT_02_ID > 18}"><td class="GD from-control" style="text-align: right;"></td></c:if>
											<c:if test="${row.CAT_02_ID > 18}"></tr></c:if>
										</c:forEach>
									</tbody>
								</table>
									<table class="table  table-bordered nowrap TRD">
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
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 13}"><option value="${row.GOODS_ID}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> >${row.GOODS_TITLE}</option></c:if>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control t132" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 13}"><option value="${row.GOODS_NET_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control t133 infoG3" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 13}"><option value="${row.GOODS_SALE_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GE" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100"
													value="<c:forEach var="row" items="${contpage4t}"><c:if test="${row.CAT_02_ID eq 13}">${row.ORD_QUTY}</c:if></c:forEach>" required></td>
												<td class="GF from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>도복,원삼</td>
												<td><select class="form-control t141 tgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 14}"><option value="${row.GOODS_ID}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> >${row.GOODS_TITLE}</option></c:if>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control t142" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 14}"><option value="${row.GOODS_NET_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control t143 infoG3" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 14}"><option value="${row.GOODS_SALE_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GE" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100"
													value="<c:forEach var="row" items="${contpage4t}"><c:if test="${row.CAT_02_ID eq 14}">${row.ORD_QUTY}</c:if></c:forEach>" required></td>
												<td class="GF from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>영정</td>
												<td><select class="form-control t151 tgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 15}"><option value="${row.GOODS_ID}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> >${row.GOODS_TITLE}</option></c:if>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control t152" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 15}"><option value="${row.GOODS_NET_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control t153 infoG3" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 15}"><option value="${row.GOODS_SALE_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GE" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100"
													value="<c:forEach var="row" items="${contpage4t}"><c:if test="${row.CAT_02_ID eq 15}">${row.ORD_QUTY}</c:if></c:forEach>" required></td>
												<td class="GF from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>수의</td>
												<td><select class="form-control t161 tgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 16}"><option value="${row.GOODS_ID}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> >${row.GOODS_TITLE}</option></c:if>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control t162" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 16}"><option value="${row.GOODS_NET_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control t163 infoG3" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 16}"><option value="${row.GOODS_SALE_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GE" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100"
													value="<c:forEach var="row" items="${contpage4t}"><c:if test="${row.CAT_02_ID eq 16}">${row.ORD_QUTY}</c:if></c:forEach>" required></td>
												<td class="GF from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>염베</td>
												<td><select class="form-control t171 tgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 17}"><option value="${row.GOODS_ID}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> >${row.GOODS_TITLE}</option></c:if>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control t172" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 17}"><option value="${row.GOODS_NET_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control t173 infoG3" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 17}"><option value="${row.GOODS_SALE_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GE" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100"
													value="<c:forEach var="row" items="${contpage4t}"><c:if test="${row.CAT_02_ID eq 17}">${row.ORD_QUTY}</c:if></c:forEach>" required></td>
												<td class="GF from-control" style="text-align: right;"></td>
											</tr>
											<tr>
												<td>천금지금</td>
												<td><select class="form-control t181 tgid">
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 18}"><option value="${row.GOODS_ID}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> >${row.GOODS_TITLE}</option></c:if>
													</c:forEach>
													</select>		
												</td>
												<td>EA</td>
												<td style="text-align: right;">
												<select class="form-control t182" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 18}"><option value="${row.GOODS_NET_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_NET_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;">
												<select class="form-control t183 infoG3" disabled>
													<option value="">선택</option>
													<c:forEach var="row" items="${contpage4t}">
													<c:if test="${row.CAT_02_ID eq 18}"><option value="${row.GOODS_SALE_PRICE}" <c:if test="${!empty row.ORD_QUTY}">selected</c:if> ><fmt:formatNumber
														value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></option></c:if>
													</c:forEach>
													</select>
												</td>
												<td style="text-align: right;"><input
													class="from-control GE" oninput="calculateG()"
													style="border: none; text-align: right;" type="number"
													min="0" max="100"
													value="<c:forEach var="row" items="${contpage4t}"><c:if test="${row.CAT_02_ID eq 18}">${row.ORD_QUTY}</c:if></c:forEach>" required></td>
												<td class="GF from-control" style="text-align: right;"></td>
											</tr>
										<c:forEach var="row" items="${contpage4t}">
											<tr>
												<td class="second">${row.CAT_TITLE}</td>
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
													min="0" max="100"
													value="<c:if test="${row.FNRS_GOODS_INIT_QTY eq null }">1</c:if><c:if test="${row.FNRS_GOODS_INIT_QTY ne null }">${row.FNRS_GOODS_INIT_QTY}</c:if>"
													required></td>
												<td class="GH from-control" style="text-align: right;"></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</form>
							<hr>
							<div style="text-align:right"><span>선택된 장의용품 총액 :</span><input type="text" id="P4total" style="text-align: right; border: none;" readonly></div>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-primary"
									onClick="fn_contInsertP4()">등록</button>
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
										<c:forEach var="row" items="${contpage5}">
											<tr>
												<td class="second"><c:if test="${row.ALTAR_CAT eq '102'}">제단</c:if>
													<c:if test="${row.ALTAR_CAT eq '103'}">헌화</c:if></td>
												<td><input type="checkbox" onclick ="<c:if test="${row.ALTAR_CAT eq '102'}">oneCheckalt2(this)</c:if><c:if test="${row.ALTAR_CAT eq '103'}">oneCheckalt3(this)</c:if>" class="CHKalt form-control" name="ALTAR${row.ALTAR_CAT}" <c:if test="${row.CHKED eq 'Y'}">checked</c:if>/></td>
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
										<c:forEach var="row" items="${contpage5}">
											<tr>
												<td><c:if test="${row.ALTAR_CAT eq '102'}">제단</c:if>
													<c:if test="${row.ALTAR_CAT eq '103'}">헌화</c:if></td>
												<td>${row.ALTAR_TITLE}<input type = "hidden" class = "sAid" value="${row.ALTAR_ID}"/><input type = "hidden" class = "sAct" value="${row.ALTAR_CAT}"/></td>
												<td style="text-align: right" class="sAA"><fmt:formatNumber value="${row.ALTAR_NET_PRICE}" pattern="#,###" /></td>
												<td><input type="number" style="text-align:right;border:0px" class="sAB" min="0" value="${row.ALTAR_QTY}" ></td>
												<td style="text-align: right" class="sAC"><fmt:formatNumber value="" pattern="#,###" /></td>
												<td style="display :none" ><input type="checkbox" class="sCHKalt form-control" <c:if test="${row.CHKED eq 'Y'}">checked</c:if> /></td>
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
									onClick="fn_contInsertP5()">등록</button>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab06" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<table class="table table-sm bst02">
								<tbody>
									<tr>
										<th scope="row">식당품목 선택</th>
										<td align="right"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="table-responsive">
							<table id="MESS01"
								class="table  table-bordered nowrap">
								<colgroup>
									<col width="10%"/>
									<col width="5%" />
									<col width="20%"/>
									<col width="15%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="20%"/>
								</colgroup>

								<tr>
									<th colspan="2" style="text-align: center;">분류(<a href="javascript:void(0);" onclick="chkallM();">V</a>/<a href="javascript:void(0);" onclick="chkunM();">X</a>)</th>
									<th colspan="8" style="text-align: center;">상세정보</th>
								</tr>
								<tr style="text-align: center;">
									<th>종류</th>
									<th>선택</th>
									<th>제품명</th>
									<th>단위</th>
									<th>개당단가</th>
									<th>기본금액</th>
									<th>주문수량</th>
									<th>주문금액</th>
								</tr>
								<tbody>
									<c:forEach var="row" items="${contpage6}">
										<tr>
											<td class="second"><input type="hidden" class="FRID" value="${frid}"/>${row.CAT_TITLE}</td>
											<td><input type="checkbox" class="CHKrest form-control" <c:if test="${not empty row.ORD_QUTY}">checked</c:if>/></td>
											<td><input type="hidden" class="RGID" value="${row.GOODS_ID}">${row.GOODS_TITLE}</td>
											<td>${row.GOODS_UNIT}</td>
											<td style="text-align: right;"><fmt:formatNumber value="${row.GOODS_NET_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;" class="infoM"><fmt:formatNumber value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;"><input class="from-control MA" oninput="calculateM()"
												style="border: none; text-align: right;" type="number" min="0" max="100"
												value="<c:if test="${row.ORD_QUTY eq null }">1</c:if><c:if test="${row.ORD_QUTY ne null }">${row.ORD_QUTY}</c:if>"
												required></td>
											<td class="MB" style="text-align: right;">${row.ORD_AMOUNT}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<table class="table  table-bordered nowrap" style="border:0px">
								<tr>
									<td style="border-right:none"></td>
									<td style="text-align: right;border-left:none"><span>선택된 주문 총액 :</span><input type="text" id="messgrandtotal"
										style="text-align: right; border: none;" readonly></td>
								</tr>
							</table>
						
						<div class="btn_wr text-right mt-3">
							<button class="btn btn-md btn-primary"
								onClick="fn_contInsertP6()">등록</button>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab07" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<table class="table table-sm bst02">
								<tbody>
									<tr>
										<th scope="row">매점품목 선택</th>
										<td align="right"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="table-responsive">
							<table class="table  table-bordered nowrap">
								<colgroup>
									<col width="10%" />
									<col width="5%" />
									<col width="20%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="20%" />
								</colgroup>
								<tr>
									<th colspan="2" style="text-align: center;">분류(<a href="javascript:void(0);" onclick="chkallS();">V</a>/<a href="javascript:void(0);" onclick="chkunS();">X</a>)</th>
									<th colspan="8" style="text-align: center;">상세정보</th>
								</tr>
								<tr style="text-align: center;">
									<th>종류</th>
									<th>선택</th>
									<th>제품명</th>
									<th>단위</th>
									<th>개당단가</th>
									<th>기본금액</th>
									<th>초도주문수량</th>
									<th>초도주문금액</th>
								</tr>
								<tbody>
									<c:forEach var="row" items="${contpage7}">
										<tr>
											<td class="second">${row.CAT_TITLE}</td>
											<td><input type="checkbox" class="CHKstore form-control" <c:if test="${not empty row.ORD_QUTY}">checked</c:if> /></td>
											<td><input type="hidden" class="FRID" value="${frid}"><input
												type="hidden" class="SGID" value="${row.GOODS_ID}">${row.GOODS_TITLE}</td>
											<td>${row.GOODS_UNIT}</td>
											<td style="text-align: right;"><fmt:formatNumber
													value="${row.GOODS_NET_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;" class="infoS"><fmt:formatNumber
													value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;"><input class="from-control SA" oninput="calculateS()"
												style="border: none; text-align: right;" type="number"
												min="0" max="100" value="<c:if test="${row.STORE_GOODS_INIT_QTY eq null }">1</c:if><c:if test="${row.STORE_GOODS_INIT_QTY ne null }">${row.STORE_GOODS_INIT_QTY}</c:if>"
												required></td>
											<td class="SB" style="text-align: right;"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<table class="table  table-bordered nowrap">
								<tr>
									<td style="border-right:none"></td>
									<td style="text-align: right;border-left:none"><span>선택된 주문 총액 :</span><input
										type="text" id="storegrandtotal"
										style="text-align: right; border: none;" readonly></td>
								</tr>
							</table>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-primary"
									onClick="fn_contInsertP7()">등록</button>
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
								<table class="table  table-bordered nowrap"
									id="roomList">
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
										<tr>
											<th class=0"text-center">선택</th>
											<th class="text-center">호실명</th>
											<th class="text-center">사용유무</th>
											<th class="text-center">일일사용료</th>
											<th class="text-center">시간당사용료</th>
											<th class="text-center">면적(m<sup>2</sup>)
											</th>
											<th class="text-center">평수</th>
											<th class="text-center">수용인원</th>
											
										</tr>
									</thead>
									<c:forEach var="row" items="${contpage8}">
										<tr>
											<td style="text-align: center;"><input type="checkbox" class="CHKe form-control" /></td>
											<td>${row.FROOM_TITLE}</td>
											<td></td>
											<td class = "EA" style="text-align: right;"><fmt:formatNumber value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
											<td class = "EB" style="text-align: right;"><fmt:formatNumber value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.FROOM_AREA}</td>
											<td style="text-align: right;">${row.FROOM_AREA_KOR}</td>
											<td style="text-align: right;">${row.FROOM_MAX_PERS}</td>
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
							<table class="table  table-bordered nowrap" id="sEtcroom">
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
									<c:forEach var="row" items="${contpage8}">
										<tr>
											<td><input type="hidden" class="sETCid" value="${row.FROOM_ID}>"/>${row.FROOM_TITLE}</td>
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
									onClick="fn_contInsertP8()">등록</button>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab09" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="form9" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
										<tr>
											<th scope="row">안내문</th>
										</tr>
									</tbody>
								</table>
								<table class="table table-sm bst02" id="guide">
									<colgroup>
										<col width="20%" />
										<col width="60%" />
										<col width="20%" />
									</colgroup>
									<thead>
										<tr>
											<th class="text-center"></th>
											<th class="text-center">안내문</th>
											<th class="text-center"></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td><textarea class="form-control" rows="20">
											1. 저희 장례식장에서는 외부음식 반입시 식중독 및 기타 불미한 사고가 발생될 수 
   있으므로 음식물 반입으로 인한 사고발생시 당 장례식장에서는 책임을 지지 
   않으며,모든 상차림(성복/발인제 등) 음식은 챙겨가지 않을 시 
   폐기처분하겠습니다. 그에 대한 책임은 해당 상가에 있습니다.

   ※ 시민장례식장은 식품안전 전문가와 정기적으로 위생을 진단관리하는 
      푸드 세이프티 존입니다.

2. 분향소 내에서는 화기 사용이 금지되어 있습니다(휴대용 가스버너 등)
   화기반입 적발시 해당화기는 사무실에 보관하도록 하며,
   퇴실(출상)시 찾아가실 수 있습니다.

3. MOU(업무협약)를 포함한 모든 할인은(기초수급자,국가유공자 등) 장례기간동안 
   관련증빙서류를 제출해주셔야 적용 가능하며,장례기간 이후에는 적용되지
   않습니다.(중복할인 불가)

4. 상가에 진열된 근조화환은 퇴실시 타 상가 입실준비 등에 불편함이 발생하므로
   장례식장에서 즉시 처리하도록 하겠습니다.

5. 위 사항을 위반시 장례식장에서는 서비스를 함에 있어 거부의사를 표현할 수 
   있으며,그에 따른 각종 협약 및 구두계약 상에 명시되어진(할인, 객실 등등) 
   모든 혜택들을 적용 받을 수 없습니다.

※ 거리두기 준수
1. 발열, 호흡기 증상(기침, 인후통 등)이 있거나 최근 14일 이내 해외여행을 
   한 경우 직접 조문 자제
2. 출입 시 증상 여부(발열, 호흡기 증상 등) 확인 및 명부작성 등 방역에 
   협조하며, 흐르는 물과 비누로 30초 이상 손을 씻거나 손 손독제로 손 소독하기
3. 다른 사람과 2m(최소1m)이상 거리를 두고, 침방울이 튀는 행위나 신체접촉 
   자제하기
4. 빈소에서 식사하는 경우 서로 마주보지 않고 한 방향을 보거나 지그재그로 
   식사하기
5. 반드시 마스크를 착용하고, 기침이나 재채기를 할 때는 휴지, 옷소매로 입과 
   코 가리기
※ 조문 예절 준수
1. 유족은 조문객을 맞이할 때 마스크를 착용하고, 악수보다는 목례로 인사하기
2. 조문객도 악수보다는 고개 숙여 위로의 마음을 표하기
3. 조문과 위로는 가급적 간략하게 하고, 30분 이상 머물지 않도록 권장하기
4. 가족 중심의 간소한 장례를 치르고, 입관 및 발인식 등 장례절차 진행시 최소 
   인원이 참여하며, 참여자간 1m 거리의 간격 유지하기
											</textarea></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td>위생시트금액 : <input type="number" class="finalCharge" value=""></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</form>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-primary"
									onClick="fn_contInsertP9()">최종 등록</button>
								<button class="btn btn-md btn-inverse">취소</button>
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
</div>

<!--계약기본등록-->
<script>
	function fn_contUpdateP1() {
		var contData = {};
		
		var chkr = $('#rmchk').val();
		if (chkr != "OK")
			{
			alert ("호실 선택을 확인해 주십시오.");
			return;
			}
		var froomid = $('#frid').val();
		var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    var insDATE = year + "-" + month + "-" + day;
	    contData.CONTRACT_ID		= CONid;
		contData.START_DATE			= $('#contp1-02').val();
		contData.END_DATE			= $('#contp1-03').val();
		contData.SANGJO				= $('#contp1-04').val();
		contData.DPERSON_NAME		= $('#contp1-07').val();
		contData.DPERSON_MW			= $('#contp1-09').val();
		contData.DPERSON_AGE		= $('#contp1-15').val();
		contData.DPERSON_JMNO		= $('#contp1-08').val();
		contData.DPERSON_ADDR1		= $('#contp1-10').val();
		contData.DPERSON_ADDR2		= $('#contp1-12').val();
		contData.DPERSON_ORI_NAME	= $('#contp1-11').val();
		contData.REGION				= $('#contp1-13').val();
		contData.DDATE				= $('#contp1-14').val()+" "+$('#contp1-14-1').val();
		contData.DPLACE				= $('#contp1-17').val();
		contData.DTYPE				= $('#contp1-16').val();
		contData.CREMATION_YN		= $('#contp1-19').val();
		contData.SANGJU_NAME		= $('#contp1-20').val();
		contData.SANGJU_JMNO		= $('#contp1-21').val();
		contData.SANGJU_POSTNO		= $('#contp1-01').val();
		contData.SANGJU_ADDR1		= $('#contp1-23').val();
		contData.SANGJU_ADDR2		= $('#contp1-25').val();
		contData.RELATION			= $('#contp1-22').val();
		contData.SANGJU_TEL			= $('#contp1-24').val();
		contData.ANCHI_REALDATE		= $('#contp1-26').val()+" "+$('#contp1-26-1').val();
		contData.ANCHI_DATE			= $('#contp1-27').val()+" "+$('#contp1-27-1').val();
		contData.COFFIN_DATE		= $('#contp1-28').val()+" "+$('#contp1-28-1').val();
		contData.DEPART_DATE		= $('#contp1-29').val()+" "+$('#contp1-29-1').val();
		contData.JANGJI				= $('#contp1-30').val();
		contData.REMARK				= $('#contp1-37').val();
		contData.FROOM_ID			= froomid;
		if(contData.DPERSON_NAME==""){
			alert("고인의 성함을 입력해 주세요.");
			$("#contp1-07").focus();
			return;
		}
		else if(contData.SANGJU_NAME==""){
			alert("상주 성함을 입력해 주세요.");
			$("#contp1-20").focus();
			return;
		}
		console.dir(contData);
		var CONid = $("#contid").val();
		if (CONid == ""){
		$.ajax({
			url : "${path}/cont/insertP1.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
			data : contData, // HTTP 요청과 함께 서버로 보낼 데이터 
			method : "POST", // HTTP 요청 메소드(GET, POST 등) 
			dataType : "json" // 서버에서 보내줄 데이터의 타입 
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
		.done(function(data) {
			if (data.code == 10001) {
				alert("저장 성공");
				$("#contid").val(data.contid);
			} else {
				alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
		}
		else
			{
			contData.CONTRACT_ID	= CONid;
			$.ajax({
				url : "${path}/cont/updateP1.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data : contData, // HTTP 요청과 함께 서버로 보낼 데이터 
				method : "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType : "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if (data.code == 10001) {
					alert("업데이트 성공");
				} else {
					alert("업데이트 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
			}
	}
	
	function fn_contInsertP2() {
		var CONid = $("#contid").val();
		if (CONid != ""){
		var froomid = $('#frid').val();
		var $Chkarr = $(".CHKsrm");
		var $Aarr =  $(".sRMd");
		var $Barr =  $(".sRMt");
		var $Carr =  $(".sRMCharge");
		var contp2upd ={};
		contp2upd.CONTRACT_ID = Number(CONid);
		console.log(contp2upd);
		$.ajax({
			url : "${path}/cont/updateP2.do",  
			data : contp2upd,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
		for (var i=0; i<$Aarr.length; i++){
		if($($Chkarr[i]).is(":checked")==true){
		var contp2data = {};
		contp2data.CONTRACT_ID = CONid;
		contp2data.FROOM_ID = froomid;
		contp2data.DAYS = $Aarr[i].innerText;
		contp2data.TIMES = $Barr[i].innerText;
		contp2data.RCHARGE = Number($Carr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		console.log(contp2data);
		$.ajax({
			url : "${path}/cont/insertP2.do",  
			data : contp2data,  
			method : "POST",  
			dataType : "json"  
		});
		}
		}
		var $EAarr = $(".etcrid");
		var $EBarr = $(".Eday");
		var $ECarr = $(".Etime");
		var $EDarr = $(".Esum");
		for (var i=0; i<$EAarr.length; i++){
		var contp2data = {};
		contp2data.CONTRACT_ID = CONid;
		contp2data.FROOM_ID = $EAarr[i].value;
		contp2data.DAYS = $EBarr[i].value;
		contp2data.TIMES = $ECarr[i].value;
		contp2data.RCHARGE = Number($EDarr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		console.log(contp2data);
		$.ajax({
			url : "${path}/cont/insertP2.do",  
			data : contp2data,  
			method : "POST",  
			dataType : "json"  
		});
		}
		alert("저장성공");
		});
		}
		else
		{
			alert("계약기본사항을 확인해 주세요!!");	
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
		contp3upd.CONTRACT_ID = Number(CONid);
		console.log(contp3upd);
		$.ajax({
			url : "${path}/cont/updateP3.do",  
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
							for (var i=0; i<$mgidarr.length; i++){
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
								for (var i=0; i<$tgidarr.length; i++){
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
		contp5data.ORD_TYPE = "1";
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
		var $Gidarr =  $(".RGID");
		var $Aarr =  $(".MA");
		var $Barr =  $(".MB");
		var $infoarr =  $(".infoM");
		var $CHKRarr =  $(".CHKrest");
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
		for (var i=0; i<$Gidarr.length; i++){
		if($($CHKRarr[i]).is(":checked")==true){
		var contp6data = {};
		contp6data.CONTRACT_ID = CONid;
		contp6data.ROOM_TITLE = froomid;
		contp6data.GOODS_CODE = $Gidarr[i].value;
		contp6data.NET_PRICE = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		contp6data.ORD_QUTY = $Aarr[i].value;
		contp6data.ORD_TYPE = "1";
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
		var $Gidarr =  $(".SGID");
		var $Aarr =  $(".SA");
		var $Barr =  $(".SB");
		var $infoarr =  $(".infoS");
		var $CHKSarr =  $(".CHKstore");
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
		for (var i=0; i<$Gidarr.length; i++){
		if($($CHKSarr[i]).is(":checked")==true){
		var contp7data = {};
		contp7data.CONTRACT_ID = CONid;
		contp7data.ROOM_TITLE = froomid;
		contp7data.GOODS_CODE = $Gidarr[i].value;
		contp7data.NET_PRICE = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		contp7data.ORD_QUTY = $Aarr[i].value;
		contp7data.ORD_TYPE = "1";
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

	function fn_contInsertP8() {
		var CONid = $("#contid").val();
		if (CONid != ""){
		var $Chkarr = $(".sCHKe");
		var $Aarr =  $(".sED");
		var $Barr =  $(".sEE");
		var $Carr =  $(".sEF");
		var $Darr =  $(".sEG");
		var $Harr =  $(".sETCid");
		var contp8upd ={};
		contp8upd.CONTRACT_ID = Number(CONid);
		console.log(contp8upd);
		$.ajax({
			url : "${path}/cont/updateP8.do",  
			data : contp8upd,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
		for (var i=0; i<$Aarr.length; i++){
		if($($Chkarr[i]).is(":checked")==true){
		var contp8data = {};
		contp8data.CONTRACT_ID = CONid;
		contp8data.FROOM_ID = $Harr[i].value;
		contp8data.DAYS = $Aarr[i].value;
		contp8data.TIMES = $Barr[i].value;
		contp8data.RCHARGE = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		console.log(contp8data);
		$.ajax({
			url : "${path}/cont/insertP8.do",  
			data : contp8data,  
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
			alert("계약기본사항을 확인해 주세요!!");	
		}
		
	}

	function setComboP1(){
		var p109val = ${detailCont.DPERSON_MW};
		var p113val = ${detailCont.REGION};
		var p116val = ${detailCont.DTYPE};
		var p119val = ${detailCont.CREMATION_YN};
		var p122val = ${detailCont.RELATION};
		var p102val = "${detailCont.START_DATE}";
		var p103val = "${detailCont.END_DATE}";
		var p114val = "${detailCont.DDATE}";
		var p1141val = "${detailCont.DDATE}";
		var p126val = "${detailCont.ANCHI_REALDATE}";
		var p1261val = "${detailCont.ANCHI_REALDATE}";
		var p127val = "${detailCont.ANCHI_DATE}";
		var p1271val = "${detailCont.ANCHI_DATE}";
		var p128val = "${detailCont.COFFIN_DATE}";
		var p1281val = "${detailCont.COFFIN_DATE}";
		var p129val = "${detailCont.DEPART_DATE}";
		var p1291val = "${detailCont.DEPART_DATE}";
		p102val = p102val.substr(0,10);
		p103val = p103val.substr(0,10);
		p114val = p114val.substr(0,10);
		p1141val = p1141val.substr(11,17);
		p126val = p126val.substr(0,10);
		p1261val = p1261val.substr(11,17);
		p127val = p127val.substr(0,10);
		p1271val = p1271val.substr(11,17);
		p128val = p128val.substr(0,10);
		p1281val = p1281val.substr(11,17);
		p129val = p129val.substr(0,10);
		p1291val = p1291val.substr(11,17);
		$("#contp1-09").val(p109val).prop("selected",true);
		$("#contp1-13").val(p113val).prop("selected",true);
		$("#contp1-16").val(p116val).prop("selected",true);
		$("#contp1-19").val(p119val).prop("selected",true);
		$("#contp1-22").val(p122val).prop("selected",true);
		$("#contp1-02").val(p102val);
		$("#contp1-03").val(p103val);
		$("#contp1-14").val(p114val);
		$("#contp1-14-1").val(p1141val);
		$("#contp1-26").val(p126val);
		$("#contp1-26-1").val(p1261val);
		$("#contp1-27").val(p127val);
		$("#contp1-27-1").val(p1271val);
		$("#contp1-28").val(p128val);
		$("#contp1-28-1").val(p1281val);
		$("#contp1-29").val(p129val);
		$("#contp1-29-1").val(p1291val);
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
	
	
	var k = 1;
	var str = undefined;
	var element = $(".imagebx");
	var firstElement = undefined;
	element.each(function() {
		console.dir(k + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".imagebx")[0].innerText;
			firstElement = $(".imagebx")[0];
			return;
		}
		if (str == $(this).text()) {
			k++;
			console.dir('--> ' + k + $(this).text());
			$(this).remove();
		} else {
			$(firstElement).attr('rowspan', k);
			k = 1;
			str = $(this).text();
			firstElement = $(this);
		}
	});
	// 마지막꺼까지 반영
	$(firstElement).attr('rowspan', k);

	
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
		chkcalT();
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
		chkcalA();
	}
	
	
	function calculateR() {
		var $infoarr = $(".CHKsrm");
		var $Aarr = $(".RMday");
		var $Barr = $(".RMtime");
		var $Carr = $(".sRMd");
		var $Darr = $(".sRMt");
		var $Earr = $(".sRMcharge");
		var RMfee = 0;
		for (var i = 0; i < $infoarr.length; i++) {
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
		calculateG();
	});
	
	$(".m141").change(function(){
		var idxm14 = $(".m141 option").index($(".m141 option:selected"));
		$(".m142").prop('selectedIndex',idxm14);
		$(".m143").prop('selectedIndex',idxm14);
		calculateG();
	});

	$(".m151").change(function(){
		var idxm15 = $(".m151 option").index($(".m151 option:selected"));
		$(".m152").prop('selectedIndex',idxm15);
		$(".m153").prop('selectedIndex',idxm15);
		calculateG();
	});

	$(".m161").change(function(){
		var idxm16 = $(".m161 option").index($(".m161 option:selected"));
		$(".m162").prop('selectedIndex',idxm16);
		$(".m163").prop('selectedIndex',idxm16);
		calculateG();
	});

	$(".m171").change(function(){
		var idxm17 = $(".m171 option").index($(".m171 option:selected"));
		$(".m172").prop('selectedIndex',idxm17);
		$(".m173").prop('selectedIndex',idxm17);
		calculateG();
	});

	$(".m181").change(function(){
		var idxm18 = $(".m181 option").index($(".m181 option:selected"));
		$(".m182").prop('selectedIndex',idxm18);
		$(".m183").prop('selectedIndex',idxm18);
		calculateG();
	});

	$(".t131").change(function(){
 		var idxm13 = $(".t131 option").index($(".t131 option:selected"));
		$(".t132").prop('selectedIndex',idxm13);
		$(".t133").prop('selectedIndex',idxm13);
		calculateG();
	});
	
	$(".t141").change(function(){
		var idxm14 = $(".t141 option").index($(".t141 option:selected"));
		$(".t142").prop('selectedIndex',idxm14);
		$(".t143").prop('selectedIndex',idxm14);
		calculateG();
	});

	$(".t151").change(function(){
		var idxm15 = $(".t151 option").index($(".t151 option:selected"));
		$(".t152").prop('selectedIndex',idxm15);
		$(".t153").prop('selectedIndex',idxm15);
		calculateG();
	});

	$(".t161").change(function(){
		var idxm16 = $(".t161 option").index($(".t161 option:selected"));
		$(".t162").prop('selectedIndex',idxm16);
		$(".t163").prop('selectedIndex',idxm16);
		calculateG();
	});

	$(".t171").change(function(){
		var idxm17 = $(".t171 option").index($(".t171 option:selected"));
		$(".t172").prop('selectedIndex',idxm17);
		$(".t173").prop('selectedIndex',idxm17);
		calculateG();
	});

	$(".t181").change(function(){
		var idxm18 = $(".t181 option").index($(".t181 option:selected"));
		$(".t182").prop('selectedIndex',idxm18);
		$(".t183").prop('selectedIndex',idxm18);
		calculateG();
	});


	$(".MB, .MA, .CHKrest").change(function() {
		calculateM();
		chkcalM();
	});
	
	$(".SB, .SA, .CHKstore").change(function() {
		calculateS();
		chkcalS();
	});
	
	$(".CHKroom, .sRMd , .sRMt").change(function() {
		calculateR();
		chkcalR();
		chkRoomchange();
	});
	
	$(".Eday, .Etime").change(function() {
		chkEtcchange();
		calculateE();
		chkcalE();
	});

	$(".sED, .sEE, .sEF, .CHKe").change(function() {
		chkEtcchange();
		chkcalE8();
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
	
	$("#contp1-26,#contp1-29,#contp1-26-1,#contp1-29-1").change(function(){
		SetDT();
		calculateR();
		chkcalR();
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
	var contDay3 = $("#contp1-29").val();
	var contDay2 = $("#contp1-26").val();
	$("#contp1-02").val(contDay2);
	$("#contp1-03").val(contDay3);
	contDay3 = $("#contp1-29").val()+" "+$("#contp1-29-1").val();
	contDay2 = $("#contp1-26").val()+" "+$("#contp1-26-1").val();
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
	function tab05active(){
		$('.tab-pane').removeClass('active');
		$('#tab05').addClass('active');
	}
	function tab06active(){
		$('.tab-pane').removeClass('active');
		$('#tab06').addClass('active');
	}
	function tab07active(){
		$('.tab-pane').removeClass('active');
		$('#tab07').addClass('active');
	}
	function tab08active(){
		$('.tab-pane').removeClass('active');
		$('#tab08').addClass('active');
	}
	function tab09active(){
		$('.tab-pane').removeClass('active');
		$('#tab09').addClass('active');
	}
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function chkcalM() {
		var $Aarr = $(".CHKrest");
		var $Barr = $(".MB");
		var chksum = 0;
		for (var i = 0; i < $Barr.length; i++) {
			if($($Aarr[i]).is(":checked")==true){
			var b1 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			chksum = chksum + b1;
			}
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
		var $Aarr = $(".CHKstore");
		var $Barr = $(".SB");
		var chksum = 0;
		for (var i = 0; i < $Barr.length; i++) {
			if($($Aarr[i]).is(":checked")==true){
			var b1 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			chksum = chksum + b1;
			}
		}
		$('#storegrandtotal').val(numberWithCommas(chksum));
	}
	
	function chkallS() {
		var $Sarr = $(".CHKstore");
		for (var i = 0; i < $Sarr.length; i++) {
			$($Sarr[i]).prop("checked",true);			
		}
		chkcalS();
	}

	function chkunS() {
		var $Sarr = $(".CHKstore");
		for (var i = 0; i < $Sarr.length; i++) {
			$($Sarr[i]).prop("checked",false);
		}
		chkcalS();
	}

	function chkallM() {
		var $Marr = $(".CHKrest");
		for (var i = 0; i < $Marr.length; i++) {
			$($Marr[i]).prop("checked",true);			
		}
		chkcalM();
	}

	function chkunM() {
		var $Marr = $(".CHKrest");
		for (var i = 0; i < $Marr.length; i++) {
			$($Marr[i]).prop("checked",false);
		}
		chkcalM();
	}
	
	function chkallmod() {
		var $Marr = $(".CHKmod");
		for (var i = 0; i < $Marr.length; i++) {
			$($Marr[i]).prop("checked",true);			
		}
		chkcalG();
	}

	function chkunmod() {
		var $Marr = $(".CHKmod");
		for (var i = 0; i < $Marr.length; i++) {
			$($Marr[i]).prop("checked",false);
		}
		chkcalG();
	}

	function chkalltrd() {
		var $Marr = $(".CHKtrd");
		for (var i = 0; i < $Marr.length; i++) {
			$($Marr[i]).prop("checked",true);			
		}
		chkcalG();
	}

	function chkuntrd() {
		var $Marr = $(".CHKtrd");
		for (var i = 0; i < $Marr.length; i++) {
			$($Marr[i]).prop("checked",false);
		}
		chkcalG();
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

	
	function chkcalE8() {
		var $infoarr = $(".CHKe");
		var $Aarr = $(".sEA");
		var $Barr = $(".sEB");
		var $Carr = $(".sEC");
		var $Darr = $(".sED");
		var $Earr = $(".sEE");
		var $Farr = $(".sEF");
		var $Garr = $(".sEG");
		for (var i = 0; i < $infoarr.length; i++) {
			if($($infoarr[i]).is(":checked")==true){
			var chksum = 0;	
			var b1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var b2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var b3 = Number($Carr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var c1 = Number($Darr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var c2 = Number($Earr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var c3 = Number($Farr[i].value.replace(/[\D\s\._\-]+/g, ""));
			chksum = (b1*c1)+(b2*c2)+(b3*c3);
			$Garr[i].innerText = numberWithCommas(chksum);
		}
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
		var from = year+'-'+month+'-'+date;
		var frtm = hours+':00:00';
		let today2 = new Date();
		today2.setDate(today2.getDate() + 2);
		let year2 = today2.getFullYear(); // 년도
		let month2 = today2.getMonth() + 1;  // 월
		if(month2 < 10) month2 = '0'+month2;
		let date2 = today2.getDate();  // 날짜
		if(date2 < 10) date2 = '0'+date2;
		let hours2 = today2.getHours(); // 시
		if(hours2 < 10) hours2 = '0'+hours2;
		let minutes2 = today2.getMinutes();  // 분
		let seconds2 = today2.getSeconds();  // 초
		var to = year2+'-'+month2+'-'+date2
		var totm = hours2+':00:00';
		$('#contp1-26').val(from);
		$('#contp1-26-1').val(frtm);
		$('#contp1-29').val(to);				
		$('#contp1-29-1').val(totm);
		$('#contp1-02').val(from);
		$('#contp1-03').val(to);
	}
	
	function chkRoomchange(){
		var $infoarr = $(".CHKroom");
		var $sinfoarr = $(".CHKsrm");
		var $FRinfoarr = $(".FRMID");
		for (var i = 0; i < $infoarr.length; i++) {
			if($($infoarr[i]).is(":checked")==true){
			$($sinfoarr[i]).attr("checked",true);
			$($sinfoarr[i]).parent().parent().show();
			$("#frid").val($FRinfoarr[i].value);
			$("#rmchk").val("OK");
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
	
	function chkEtcchange(){
		var $infoarr = $(".CHKe");
		var $sinfoarr = $(".sCHKe");
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
	
		
	function fn_checkFroom(){
		$("#rmchk").val("OK");
		}

	function fn_addyujok(){
		var CONid = $("#contid").val();
		if (CONid != ""){
		var froomid = $('#frid').val();
		var contp1addyujok ={};
		contp1addyujok.CONTRACT_ID = Number(CONid);
		contp1addyujok.FROOM_ID = froomid;
		contp1addyujok.RELATION_CODE = $("#contp1-31").val();
		contp1addyujok.RELATION_TITLE = $("#contp1-31 option:selected").text();
		contp1addyujok.SANGJU_NAMEs = $("#contp1-32").val();
		if(contp1addyujok.RELATION_CODE == ""){
			alert("유족 관계를 선택해 주세요.");
			$("#contp1-31").focus();
			return;
		}
		else if(contp1addyujok.SANGJU_NAMEs == ""){
			alert("유족 성명을 입력해 주세요.");
			$("#contp1-32").focus();
			return;
		}
		console.log(contp1addyujok);
		$.ajax({
			url : "${path}/cont/insertYujok.do",  
			data : contp1addyujok,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
		alert("저장성공");
		var innerHtml = "";
		innerHtml += '<tr> <td></td>';
		innerHtml += '<td>'+$("#contp1-31 option:checked").text()+' </td>';
		innerHtml += '<td>'+$("#contp1-32").val()+'</td>';
		innerHtml += '<td><button onclick="fn_delyujok('+data.yjid+')">삭제</button></td>';
		innerHtml += "</tr>";
		$("#basicTable > tbody > tr[class=yujoklist]:last").after(innerHtml);
		$("#contp1-31").val("");
		$("#contp1-32").val("");
		});
		}
		else
			{
			alert("계약기본사항을 먼저 저장해 주세요!!");
			}
	}	

function fn_delyujok(sangjuid){
	var CONid = $("#contid").val();
	if (CONid != ""){
	var froomid = $('#frid').val();
	var contp1addyujok ={};
	contp1addyujok.CONT_SANGJU_ID = sangjuid; 
	console.log(contp1addyujok);
	$.ajax({
		url : "${path}/cont/updateYujok.do",  
		data : contp1addyujok,  
		method : "POST",  
		dataType : "json"  
	})
	.done(function(data) {
	alert("저장성공");
	var trHtml = $(this).parent().parent();
	trHtml.remove();
	});
	}
	else
		{
		alert("계약기본사항을 먼저 저장해 주세요!!");
		}
}


	
//Page4 Reload 장의용품
function reload4page(){
	
}

//Page6 Reload 식당물품
function reload6page(){
	
}

//Page7 Reload 매점물품
function reload7page(){
	
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


$("#contp1-01").change(function(){
	var contno = $("#contp1-01").val();
	var url = "${path}/cont/detail/"+contno;
	console.log(url);
	fnSetPage(url);
})



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
	
$('.jumin').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this);
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 6) {
            $text.val($text.val() + '-');
        }
    }
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
});


function jumin_check(){
	var juminNo = $("#contp1-08").val();
    var yy     = juminNo.substr(0,2);
    var mm     = juminNo.substr(2,2);
    var dd     = juminNo.substr(4,2);
    var gen    = juminNo.substr(7,1);
    if (yy < "00" || yy > "99" || mm < "01" || mm > "12" || dd < "01" || dd > "31") {
    	     alert("주민등록번호 앞자리를 다시 입력하세요.");
    	     $("#contp1-08").focus();
    	     return false;
    	      }
    if (gen < "1" || gen > "4") {
        alert("주민등록번호 뒷자리를 다시 입력하세요.");
        $("#contp1-08").focus();
        return false;
         }
	var s1 = juminNo.substr(0,6);
	var s2 = juminNo.substr(7,7);
	if (!isSSN(s1, s2)) {
	     alert("입력한 주민등록번호를 검토한 후, 다시 입력하세요.");
	     $("#contp1-08").val("");
	     $("#contp1-08").focus();
	     return false;
	     }
	 else{
	 }
	if (gen == '1'||gen =='3'){
		$("#contp1-09").val('1').prop("selected",true);
	} else {
		$("#contp1-09").val('2').prop("selected",true);
	}
	var ddate  = $("#contp1-14").val();
	var age2 = new Date().getFullYear();
	if (gen == '1'||gen == '2')
	{
		var age1 = '19'+yy;
	}
	else
	{
		var age1 = '20'+yy;
	}
	var age = age2 - age1;
	if (age > 0 ){
		$("#contp1-15").val(age);	
	}
}


function jumin_check2(){
	var juminNo = $("#contp1-21").val();
    var yy     = juminNo.substr(0,2);
    var mm     = juminNo.substr(2,2);
    var dd     = juminNo.substr(4,2);
    var gen    = juminNo.substr(7,1);
    if (yy < "00" || yy > "99" || mm < "01" || mm > "12" || dd < "01" || dd > "31") {
    	     alert("주민등록번호 앞자리를 다시 입력하세요.");
    	     $("#contp1-21").focus();
    	     return false;
    	      }
    if (gen < "1" || gen > "4") {
        alert("주민등록번호 뒷자리를 다시 입력하세요.");
        $("#contp1-21").focus();
        return false;
         }
	var s1 = juminNo.substr(0,6);
	var s2 = juminNo.substr(7,7);
	if (!isSSN(s1, s2)) {
	     alert("입력한 주민등록번호를 검토한 후, 다시 입력하세요.");
	     $("#contp1-21").val("");
	     $("#contp1-21").focus();
	     return false;
	     }
	 else{
	 }
}

function isSSN(s1, s2) {
    n = 2;
    sum = 0;
    for (i=0; i<s1.length; i++){
    	sum += Number(s1.substr(i, 1)) * n++;
    	console.log(sum);
    }
    for (i=0; i<s2.length-1; i++) {
   sum += Number(s2.substr(i, 1)) * n++;
   if (n == 10) n = 2;
   console.log(sum);
    }
    c = 11 - sum % 11;
    if (c == 11) c = 1;
    if (c == 10) c = 0;
    if (c != Number(s2.substr(6, 1))) return false;
    else return true;
  }  

$("#contp1-08, #contp1-14").change(function(){
	jumin_check();
});

$("#contp1-21").change(function(){
	jumin_check2();
});

function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
            document.getElementById('contp1-10').value = fullRoadAddr;
            document.getElementById('contp1-12').focus();
        }
	}).open({
		autoClose:true	
	});
}

function execDaumPostcode2() {
	new daum.Postcode({
		oncomplete: function(data) {
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
            document.getElementById('contp1-23').value = fullRoadAddr;
            document.getElementById('contp1-25').focus();
        }
	}).open({
		autoClose:true	
	});
}


	$(document).ready(function(){
		calculateM();
		chkcalM();
		calculateS();
		chkcalS();
		calculateT();
		chkcalT();
		calculateR();
		chkcalR();
		selectMT();
		calculateG();
		chkcalG();
		calculateA();
		chkcalA();
		Setdate();
		chkRoomchange();
		chkFtablechange();
		chkAltarchange();
		chkEtcchange();
		SetDT();
		setComboP1();
	})

	


</script>