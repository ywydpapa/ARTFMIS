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
					호실등록
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->

<!--호실등록-->
<div class="cnt_wr">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table class="table table-sm bst02">
						<colgroup>
							<col width="15%" />
							<col width="35%"/>
							<col width="15%"/>
							<col width="35%"/>
						</colgroup>				
						<tbody>
							<tr>
								<th scope="row">시설구분</th>
								<td>
									<select name="roomType" id="roomType" class="form-control form-control-sm">
										<option value="">선택</option>			
										<option value="20010">분향실</option>			
										<option value="20011">시설1</option>			
										<option value="20100">시설2</option>			
										<option value="21003">기타</option>							
									</select>
								</td>
								<th scope="row">수용인원수</th>
								<td>
									<input name="roomCap" style = "text-align:right;" class="form-control form-control-sm" type="number" required/>
								</td>
								
							</tr>
							<tr>
								<th scope="row">호실명</th>
								<td>
									<input type="text" class="form-control form-control-sm" id="roomTitle" name="roomTitle" placeholder="호실명을 입력하세요">
								</td>
								<th scope="row">일일사용료</th>
								<td>
									<input type="number" style = "text-align:right;" class="form-control form-control-sm" name="priceDay"/>
								</td>
							</tr>
							<tr>
								<th scope="row">호실타입</th>
								<td>
									<select name="roomType2" id="roomType2" class="form-control form-control-sm">
										<option value="">선택</option>			
										<option value="30010">MVG</option>			
										<option value="30011">VIP</option>			
										<option value="30100">특실</option>			
										<option value="31003">일반실</option>							
									</select>
								</td>
								<th scope="row">시간당사용료</th>
								<td>
									<input type="number" style = "text-align:right;" class="form-control form-control-sm" name="priceHour"/>
								</td>
							</tr>
							<tr>
								<th scope="row">면적(m<sup>2</sup>)</th>
								<td>
									<input type="number" class="form-control form-control-sm" id="roomSize" name="roomSize">
								</td>
								<th scope="row">환경부담금</th>
								<td>
									<input type="number" class="form-control form-control-sm" name="chargeClean"/>
								</td>
							</tr>
							<tr>
								<th scope="row">평수</th>
								<td>
								<input type="number" style = "text-align:right;" class="form-control form-control-sm" name="pyungSize">
								</td>
								<th scope="row">사용여부</th>
								<td>
									<select name="useYn" id="useYn" class="form-control form-control-sm">
										<option value="">선택</option>			
										<option value="30010">예</option>			
										<option value="30011">아니오</option>			
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">컴퓨터이름</th>
								<td>
									<input type="text" class="form-control form-control-sm" id="pcTitle" name="pcTitle" placeholder="">
								</td>
								<th scope="row">정렬순서</th>
								<td>
									<input type="number" style = "text-align:right;" class="form-control form-control-sm" id="orderNo" name="orderNo" placeholder="">
								</td>
							</tr>
							<tr>
								<th scope="row">임시호실명</th>
								<td>
									<input type="text" class="form-control form-control-sm" id="temproomTitle" name="temproomTitle" placeholder="">
								</td>
								<th scope="row">임시호실사용여부</th>
								<td>
									<select name="imsiYn" id="imsiYn" class="form-control form-control-sm">
										<option value="">선택</option>			
										<option value="30010">예</option>			
										<option value="30011">아니오</option>			
									</select>
								</td>
							</tr>
							
							<tr>
								<th scope="row">내용</th>
								<td colspan="3">
									<textarea name="schedDesc" id="schedDesc" rows="8" class="form-control"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-primary" onClick="fn_SaveSched()">저장</button>
				<button class="btn btn-md btn-inverse" >취소</button>
			</div>
		</div>
	</div>
</div>
<!--//일정등록-->

	<script>
		function fn_Saveroom() {
			var roomData = {};
			roomData.schedFrom 		= $("#schedSdate").val(); 
			roomData.schedTo 		= $("#schedEdate").val();
			roomData.schedTitle 	= $("#schedTitle").val();
			roomData.schedPlace		= $("#schedPlace").val();
			roomData.userNo 		= $("#userNo").val();
			roomData.custNo 		= $("#custNo").val();
			roomData.soppNo 		= $("#soppNo").val();
			roomData.schedDesc 		= $("#schedDesc").val();
			roomData.schedType 		= $("#schedType").val();
			console.log(roomData);
			
			$.ajax({ url: "${path}/goods/roomwrite.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
						data: roomData , // HTTP 요청과 함께 서버로 보낼 데이터 
						method: "POST", // HTTP 요청 메소드(GET, POST 등) 
						dataType: "json" // 서버에서 보내줄 데이터의 타입 
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
							fnSetPage('${path}/goods/roomlist.do');
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
					.fail(function(xhr, status, errorThrown) { 
						alert("통신 실패");
					});
			}

	</script>
