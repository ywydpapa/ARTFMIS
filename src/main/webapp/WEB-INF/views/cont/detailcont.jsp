<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:parseDate var="STDate" value="${detailCont.START_DATE}" pattern="yyyy-MM-dd"/>
<fmt:parseDate var="ENDate" value="${detailCont.END_DATE}" pattern="yyyy-MM-dd"/>
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
	<div class="c-container">
	<div>
<!--Page-header end 페이지 타이틀 -->
	<div class="cnt_wr">
	<!-- Row start -->
	<div class="row">
		<div class="col-lg-12 col-xl-12">
		<div class="table-responsive">
				<table class="table  table-bordered nowrap">
				<tr>
				<td><input id="frid" type="hidden" value = "${frid}"><input id="contid" type="hidden" value = "${CONTid}">
				<input id="rmchk" type="hidden" value = "OK"></td>
				<td><span>선택된 계약번호 :  </span>${CONTid}</td>
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
												<col width="12%" />
												<col width="12%" />
												<col width="12%" />
												<col width="12%" />
												<col width="12%" />
												<col width="12%" />
											</colgroup>
											<tbody>
												<tr align="center">
													<th rowspan="2">계약조회</th>
													<td>조회호실</td>
													<td><select class="form-control" id="contp1-01" disabled>
															<c:forEach var="listroom" items="${listroom}">
																<option value="${listroom.FROOM_ID}">${listroom.FROOM_TITLE}</option>
															</c:forEach>
													</select></td>
													<td>기간</td>
													<td><input type="date" class="form-control" id="contp1-02" name="contp1-02" value="${STDate}" disabled></td>
													<td><input type="date" class="form-control" id="contp1-03" name="contp1-03" value="${ENDate}" disabled></td>
													<td></td>
												</tr>
												<tr align="center">
													<td>행사업체</td>
													<td><input type="text" class="form-control" id="contp1-04"></td>
													<td></td>													
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr align="center">
													<th rowspan="5">고인</th>
													<td>성명</td>
													<td><input type="text" 
														class="form-control form-control-sm" id="contp1-07"
														name="contp1-07" value="${detailCont.DPERSON_NAME}" >
													</td>
													<td>주민등록번호</td>
													<td><input type="text" size="13" maxlength="15"
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
													<td colspan="2"><input type="text"
														class="form-control form-control-sm" id="contp1-10"
														name="contp1-10" value="${detailCont.DPERSON_ADDR1}" >
													</td>
													<td>본관</td>
													<td><input type="text"
														class="form-control form-control-sm" id="contp1-11"
														name="contp1-11" value=""></td>
														<td></td>
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
													<td><input type="date" class="form-control form-control-sm" id="contp1-14"
														name="contp1-14" value=""><input type="time" class="form-control form-control-sm" id="contp1-14-1"
														name="contp1-14-1" value=""></td>
													<td>나이</td>
													<td><input type="number" style="text-align:right;"
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
													<td><input type="text" size="13" maxlength="15"
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
													<td colspan="2"><input type="text"
														class="form-control form-control-sm" id="contp1-23"
														name="contp1-23" value="${detailCont.SANGJU_ADDR1}">
													</td>
													<td>연락처</td>
													<td><input type="text"
														class="form-control form-control-sm" id="contp1-24"
														name="contp1-24" value="${detailCont.SANGJU_TEL}"></td>
												</tr>
												<tr align="center">
													<td>상세주소</td>
													<td colspan="2"><input type="text"
														class="form-control form-control-sm" id="contp1-25"
														name="contp1-25" value="${detailCont.SANGJU_ADDR2}">
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
													<td><input type="date" class="form-control form-control-sm" id="contp1-27" name="contp1-27" value="">
													<input type="time" class="form-control form-control-sm" id="contp1-27-1" name="contp1-27-1" value="">
													</td>
													<td></td>
													<td></td>
												</tr>
												<tr align="center">
													<td>입관일시</td>
													<td><input type="date" class="form-control" id="contp1-28" name="contp1-28" value="" >
													<input type="time" class="form-control" id="contp1-28-1" name="contp1-28-1" value="" >
													</td>
													<td>발인일시*</td>
													<td><input type="date" class="form-control form-control-sm" id="contp1-29" name="contp1-29" value="">
													<input type="time" class="form-control form-control-sm" id="contp1-29-1" name="contp1-29-1" value="">
													</td>
													<td></td>
													<td></td>
												</tr>
												<tr align="center">
													<td>장지</td>
													<td colspan="3"><input type="text"
														class="form-control form-control-sm" id="contp1-30"
														name="contp1-30" value="${detailCont.JANGJI}" >
													</td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr name="yujoklist" align="center">
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
														name="contp1-31" value="" >
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
							</div>
						</div>
					</div>
					<!--//계약기본등록-->
				</div>
				<div class="tab-pane active" id="tab02" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="room2" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
										<tr>
											<th scope="row">시설사용정보</th>
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
											<th class="text-center">호실명</th>
											<th class="text-center">사용유무</th>
											<th class="text-center">일일사용료</th>
											<th class="text-center">시간당사용료</th>
											<th class="text-center">면적(m<sup>2</sup>)											</th>
											<th class="text-center">평수</th>
											<th class="text-center">수용인원</th>
											<th class="text-center">임시호실명</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="row" items="${contpage2}">
										<tr <c:if test="${row.CHKED eq 'N'}">style="display:none"</c:if>>
											<td>${row.FROOM_TITLE}<input type="hidden" class = "FRMID" value = "${row.FROOM_ID}"></td>
											<td></td>
											<td class = "RMday"style="text-align: right;"><fmt:formatNumber
													value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
											<td class = "RMtime" style="text-align: right;"><fmt:formatNumber
													value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.FROOM_AREA}</td>
											<td style="text-align: right;">${row.FROOM_AREA_KOR}</td>
											<td style="text-align: right;">${row.FROOM_MAX_PERS}</td>
											<td style="text-align: center;">${row.FROOM_ALIS}</td>
											<td style="display:none"><input type="checkbox" 
												class="CHKroom form-control" <c:if test="${row.CHKED eq 'Y'}">checked</c:if>></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</form>
							<br> <br>
							<table class="table table-bordered nowrap"
									id="SltdroomList">
									<colgroup>
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
											<td>${row.FROOM_TITLE}(계약호실)<input type="hidden" class = "sFRMID" value = "${row.FROOM_ID}"></td>
											<td class = "RMday"style="text-align: right;"><fmt:formatNumber
													value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
											<td class = "RMtime" style="text-align: right;"><fmt:formatNumber
													value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
											<td class = "sRMd" style="text-align: right;">${row.DAYS}</td>
											<td class = "sRMt" style="text-align: right;">${row.TIMES}</td>
											<td class = "sRMcharge" style="text-align: right;"><fmt:formatNumber
													value="${row.RCHARGE}" pattern="#,###" /></td>
											<td style="text-align: center; display:none"><input type="checkbox" onclick="doOpenCheck(this);"
												class="CHKsrm form-control" <c:if test="${row.CHKED eq 'Y'}">checked</c:if>></td>										</tr>
									</c:forEach>
										<c:forEach var="row" items="${listEtcroom}">
										<tr>
											<td>${row.FROOM_TITLE}</td>
											<td class = "EA" style="text-align: right;"><fmt:formatNumber value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
											<td class = "EB" style="text-align: right;"><fmt:formatNumber value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;"><input style="text-align: right"class="form-control Eday" type="number" min="0" max="30" value="0"/></td>
											<td style="text-align: right;"><input style="text-align: right"class="form-control Etime" type="number" min="0" max="30" value="0"/></td>
											<td class = "Esum" style="text-align: right;"><fmt:formatNumber value="0" pattern="#,###" /></td>
										</tr>
									</c:forEach>
									
									</tbody>
								</table>
								<div id="addFroom">
								<table class="table table-bordered nowrap">
								<tr>
								<td>삭제</td>
								<td>추가사용호실</td>
								<td>사용일수</td>
								<td>사용시간</td>
								<td>환경부담금일수</td>
								<td>냉장고사용</td>
								<td>일회용품사용</td>
								<td>마른안주사용</td>
								<td>입실유무</td>
								<td></td>
								</tr>
								<tr>
								<td><input type="checkbox"></td>
								<td>
								<select>
								<option value="호실선택"></option>
								</select>
								</td>
								<td><input type="number"></td>
								<td><input type="number"></td>
								<td><input type="number"></td>
								<td>
								<select>
								<option value="Y">예</option>
								<option value="Y">아니오</option>
								</select>
								</td>
								<td>
								<select>
								<option value="Y">예</option>
								<option value="Y">아니오</option>
								</select></td>
								<td>
								<select>
								<option value="Y">예</option>
								<option value="Y">아니오</option>
								</select>
								</td>
								<td>
								<select>
								<option value="Y">예</option>
								<option value="Y">아니오</option>
								</select>
								</td>
								<td><button>추가</button></td>
								</tr>
								</table>
								</div>
						</div>
					</div>
					<div class="btn_wr text-right mt-3">
						<button class="btn btn-md btn-primary" onClick="fn_contUpdateP1()">저장</button>
					</div>
				</div>
				<div class="tab-pane" id="tab03" role="tabpanel">
				</div>
				<div class="tab-pane" id="tab04" role="tabpanel">
				</div>
				<div class="tab-pane" id="tab05" role="tabpanel">
				</div>
				<div class="tab-pane" id="tab06" role="tabpanel">
				</div>
				<div class="tab-pane" id="tab07" role="tabpanel">
				</div>
				<div class="tab-pane" id="tab08" role="tabpanel">
				</div>
				<div class="tab-pane" id="tab09" role="tabpanel">
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
			alert ("호실사용가능여부 조회를 먼저 해야 합니다.");
			return;
			}
		var froomid = $('#frid').val();
		var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    var insDATE = year + "-" + month + "-" + day;
		var CONid = $("#contid").val();
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
		else if(contData.DPERSON_MW==""){
			alert("고인의 성별을 선택해 주세요.");
			$("#contp1-09").focus();
			return;
		}
		else if(contData.DPERSON_AGE==""){
			alert("고인의 연세를 입력해 주세요.");
			$("#contp1-15").focus();
			return;
		}
		else if(contData.DPERSON_JMNO==""){
			alert("고인의 주민번호를 입력해 주세요.");
			$("#contp1-08").focus();
			return;
		}
		else if(contData.DPERSON_ADDR1==""){
			alert("고인의 주소를 입력해 주세요.");
			$("#contp1-10").focus();
			return;
		}
		else if(contData.REGION==""){
			alert("종교를 선택해 주세요.");
			$("#contp1-13").focus();
			return;
		}
		else if(contData.DDATE==""){
			alert("사망일자를 입력해 주세요.");
			$("#contp1-14").focus();
			return;
		}
		else if(contData.DPLACE==""){
			alert("사망장소를 입력해 주세요.");
			$("#contp1-17").focus();
			return;
		}
		else if(contData.DTYPE==""){
			alert("사망구문을 선택해 주세요.");
			$("#contp1-16").focus();
			return;
		}
		else if(contData.SANGJU_NAME==""){
			alert("상주 성함을 입력해 주세요.");
			$("#contp1-20").focus();
			return;
		}
		else if(contData.RELATION==""){
			alert("고인과의 관계를 선택해 주세요.");
			$("#contp1-22").focus();
			return;
		}
		else if(contData.CREMATION_YN==""){
			alert("화장/매장 선택해 주세요.");
			$("#contp1-19").focus();
			return;
		}
		console.dir(contData);
		$.ajax({
			url : "${path}/cont/updateP1.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
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
	
	function fn_contInsertP2() {
		var CONid = $("#contid").val();
		if (CONid != ""){
		var froomid = $('#frid').val();
		var $Chkarr = $(".CHKsrm");
		var $Aarr =  $(".sRMd");
		var $Barr =  $(".sRMt");
		var $Carr =  $(".sRMcharge");
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
		contp2data.DAYS = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
		contp2data.TIMES = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
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
		alert("저장성공");
		});
		}
		else
		{
			alert("계약기본사항을 먼저 저장해 주세요!!");	
		}
		
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
	
	var i = 1;
	var str;
	var element = $(".first");
	var firstElement;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".first")[0].innerText;
			firstElement = $(".first")[0];
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

	
	$(".CHKroom, .sRMd , .sRMt").change(function() {
		chkRoomchange();
		calculateR();
		chkcalR();
	});
	
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
	
	function fn_checkFroom(){
		var froomid = $('#contp1-01').val();
		var sfroomid = $('#frid').val();
		var startDate = $('#contp1-02').val().replace("T", " ");
		var chkRdata = {};
		chkRdata.FROOM_ID = froomid;
		chkRdata.START_DATE = startDate;
		console.log(chkRdata);
		$.ajax({
			url : "${path}/cont/checkFroom.do",  
			data : chkRdata,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
			if (data.code == 10001) {
				alert("사용중 입니다.");
			} else {
				alert("사용가능 합니다.");
				if (froomid != sfroomid)
					{
					if (confirm("해당 호실로 변경하시겠습니까?"))
						{
						$("#contid").val("");
						var idxroom = $("#contp1-01 option").index($("#contp1-01 option:selected"));
						$("#FROOM_SEL > option:eq("+ idxroom +")").attr("selected",true).trigger('change');
						}
					else
						{
						var idxroom2 = $("#FROOM_SEL option").index($("#FROOM_SEL option:selected"));
						var contp01_option = $("#contp1-01 > option");
						for(var i=0; i<contp01_option.length; i++){
							$(contp01_option[i]).prop("selected", false);
						}
						$(contp01_option[idxroom2]).prop("selected", true);
						}
					}
				else
					{
					var idxroom = $("#FROOM_SEL option").index($("#FROOM_SEL option:selected"));
					var $Ckarr = $(".CHKroom");
					$($Ckarr[idxroom]).attr("checked", true).trigger('change');
					}
				$("#rmchk").val("OK");
			}	
		});
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
	
	$("#contp1-26, #contp1-29").change(function(){
		alert("변경");
		$("#contp1-02").val($("#contp1-26").val());
		$("#contp1-03").val($("#contp1-29").val());
	})

	function fn_addyujok(){
			var CONid = $("#contid").val();
			if (CONid != ""){
			var froomid = $('#frid').val();
			var contp1addyujok ={};
			contp1addyujok.CONTRACT_ID = Number(CONid);
			contp1addyujok.FROOM_ID = froomid;
			contp1addyujok.RELATION_CODE = $("#contp1-31").val();
			contp1addyujok.RELATION_TITLE = $("#contp1-31 option:checked").text();
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
			var innerHtml = "";
			innerHtml += '<tr id=sj'+data.yjid+'> <td></td>';
			innerHtml += '<td>'+$("#contp1-31 option:checked").text()+' </td>';
			innerHtml += '<td>'+$("#contp1-32").val()+'</td>';
			innerHtml += '<td><button onclick="fn_delyujok('+data.yjid+')">삭제</button></td>';
			innerHtml += "</tr>";
			$("#basicTable > tbody > tr[name=yujoklist]:last").after(innerHtml);
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
		var trHtml = $("#sj"+sangjuid).remove();
		});
		}
		else
			{
			alert("계약기본사항을 먼저 저장해 주세요!!");
			}
	}	

	$(document).ready(function(){
		setComboP1();
		chkRoomchange();
	});
	
	$(".Eday, .Etime").change(function() {
		chkcalE();
	});
	
	function chkcalE() {
		var $Aarr = $(".EA");
		var $Barr = $(".EB");
		var $Carr = $(".Eday");
		var $Darr = $(".Etime");
		var $Earr = $(".Esum");
		for (var i = 0; i < $Aarr.length; i++) {
			var chksum = 0;	
			var b1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var b2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var c1 = Number($Carr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var c2 = Number($Darr[i].value.replace(/[\D\s\._\-]+/g, ""));
			chksum = (b1*c1)+(b2*c2);
			$Earr[i].innerText = numberWithCommas(chksum);
		}
	}


</script>