<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<script>
function fn_codeInsert01() {
	var codeData = {};
	codeData.CAT_ID 			= $("#code01id").val();
	codeData.CAT_TITLE 			= $("#code01Title").val();
	codeData.CAT_REMARK			= $("#code01Desc").val();
	codeData.CAT_USE_YN			= $("#code01_useYn").val();
	console.log(codeData);
	$.ajax({ url: "${path}/code/update01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
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
	
</script>
<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					기초코드 수정
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
			<div class="tab-content tabs m-t-20">
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
										<th scope="row">코드</th>
											<td>
												<input name="code01id" id ="code01id" value="${dto.CAT_ID}" class="form-control form-control-sm" readonly>
											</td>
										</tr>
										<tr>
										
										<th scope="row">코드명</th>
											<td>
												<input name="code01Title" id ="code01Title" value="${dto.CAT_TITLE}" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">코드설명</th>
											<td>
												<input name="code01Desc" id ="code01Desc" value="${dto.CAT_REMARK}" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">사용여부</th>
											<td>
												<select id="code01_useYn" class="form-control">
												<option value="Y">예</option>
												<option value="N">아니오</option>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
								</form>
								<br>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left" onClick="javascript:fnSetPage('${path}/code/write.do')">목록</button>
								<button class="btn btn-md btn-primary" value="수정" id="btnUpdate" onClick= "fn_codeInsert01()">수정</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Row end -->
</div>

                                                