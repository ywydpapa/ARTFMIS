<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<script>
function fn_codeInsert01() {
	var codeData = {};
	codeData.CAT_TITLE 			= $("#code01Title").val();
	codeData.CAT_REMARK			= $("#code01Desc").val();
	codeData.CAT_USE_YN			= $("#code01_useYn").val();
	console.log(codeData);
	$.ajax({ url: "${path}/code/insert01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					fnSetPage('${path}/code/write.do');
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("값을 확인해 주십시오!");
			});
	}
	
function fn_codeInsert02() {
	var codeData = {};
	codeData.CAT_01 			= $("#code21").val();
	codeData.CAT_TITLE 			= $("#code02Title").val();
	codeData.CAT_REMARK 			= $("#code02Desc").val();
	codeData.CAT_USE_YN 			= $("#code02useYn").val();
	console.log(codeData);
	$.ajax({ url: "${path}/code/insert02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					var code=$("#code21").val();
					var url="${path}/code/listcon02/"+code;
					fn_Reload01(url);
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("입력값을 확인해 주십시오.");
			});
	}
	
</script>
<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					기초코드 작성
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
			<!-- Nav tabs -->
			<ul class="nav nav-tabs  tabs" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#tab01" role="tab">Level01 코드</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#tab02" role="tab">Level02 코드</a>
				</li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content tabs m-t-20">
				<div class="tab-pane active" id="tab01" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="form1" method="post">
								<table class="table table-sm bst02">
									<colgroup>
										<col width="25%" />
										<col width="75%"/>
									</colgroup>				
									<tbody>
										<tr>
										<th scope="row">코드명 01</th>
											<td>
												<input name="code01Title" id ="code01Title" value="" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">코드설명</th>
											<td>
												<input name="code01Desc" id ="code01Desc" value="" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">사용여부</th>
											<td>
												<select id="code01_useYn" class="form-control">
												<option value="Y">사용</option>
												<option value="N">미사용</option>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
								</form>
								<br>
							
							
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left" onClick="javascript:fnSetPage('${path}/code/write.do')">목록</button>
								<button class="btn btn-md btn-primary" value="수정" id="btnUpdate" onClick= "fn_codeInsert01()">등록</button>
							</div>
							<br>
							<hr>
							<br>
							<table class="table table-sm bst02">
									<colgroup>
										<col width="15%"/>
										<col width="25%"/>
										<col width="50%"/>
										<col width="20%"/>
									</colgroup>				
									<tbody>
										<tr>
										<th scope="row">코드</th>
											<td>코드명</td>
											<td>코드설명</td>
											<td>사용여부</td>
										</tr>
										<c:forEach var="row" items="${list01}">
										<tr>	
											<td>${row.CAT_ID}</td>
											<td><a href="javascript:fnSetPage('${path}/code/detail01/${row.CAT_ID}')">${row.CAT_TITLE}</a></td>
											<td>${row.CAT_REMARK}</td>
											<td>${row.CAT_USE_YN}</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							
						</div>	
					</div>
				</div>
				<div class="tab-pane " id="tab02" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name = "form2" method="post" onsubmit="return false;">
								<table id="codetable01" class="table table-sm bst02">
									<colgroup>
										<col width="25%" />
										<col width="75%"/>
									</colgroup>				
									<tbody>
										<tr>
										<th scope="row">상위코드01</th>
											<td>
												<select id="code21" class="form-control">
												<option value="">선택하세요</option>
												<c:forEach var="list1" items ="${list01}">
												<option value="${list1.CAT_ID}">${list1.CAT_TITLE}</option>
												</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="row">코드명</th>
											<td>
												<input name="code02Title" id ="code02Title" value="" class="form-control form-control-sm" required>
											</td>
										</tr>
										<tr>
											<th scope="row">코드설명</th>
											<td>
												<input name="code02Desc" id ="code02Desc" value="" class="form-control form-control-sm" required>
											</td>
										</tr>
										<tr>
											<th scope="row">코드사용여부</th>
											<td>
											<select id="code02useYn" class="form-control">
												<option value="Y">사용</option>
												<option value="N">미사용</option>
												</select>	
											</td>
										</tr>
									</tbody>
								</table>
							</form>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left" onClick="javascript:fnSetPage('${path}/code/write.do')">목록</button>
								<button class="btn btn-md btn-primary" value="수정" id="btnUpdate" onClick= "fn_codeInsert02()" >등록</button>
							</div>
							

						</div>	
							<br>
							<table id="codetable02" class="table table-sm bst02">
									<colgroup>
										<col width="15%"/>
										<col width="25%"/>
										<col width="50%"/>
										<col width="10%"/>
										<col width="10%"/>
									</colgroup>				
									<tbody>
										<tr>
										<th scope="row">코드</th>
											<td>코드명</td>
											<td>코드설명</td>
											<td>상위코드</td>
											<td>사용여부</td>
										</tr>
										<c:forEach var="row2" items="${list02}">
										<tr>	
											<td>${row2.CAT_ID}</td>
											<td><a href="javascript:fnSetPage('${path}/code/detail02/${row2.CAT_ID}')">${row2.CAT_TITLE}</a>
											</td>
											<td>${row2.CAT_REMARK}</td>
											<td>${row2.TITLE01}</td>
											<td>${row2.CAT_USE_YN}</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
						
					</div>
				</div>
				
						</div>	
					</div>
				</div>
			</div>
		
	<!-- Row end -->

<script>
$("#code21").change(function(){
	var code=$("#code21").val();
	var url="${path}/code/listcon02/"+code;
	fn_Reload01(url);
});
$("#code32").change(function(){
	var code=$("#code32").val();
	var url="${path}/code/listcon03/"+code;
	fn_Reload02(url);
});

function fn_Reload01(url, data){
	$("#codetable02").empty();
	$("#codetable02").load(url, data, function(){
		setTimeout(function(){
		}, 500);
});
}

function fn_Reload02(url, data){
	$("#codetable03").empty();
	$("#codetable03").load(url, data, function(){
		setTimeout(function(){
		}, 500);
});
}
</script>

                                                