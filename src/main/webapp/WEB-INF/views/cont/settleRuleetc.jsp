<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!--정산규칙등록-->
<div class="cnt_wr">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
				<table class="table  table-bordered nowrap">
				<tr>
				<td><input id="frid" type="hidden" value = "${frid}"><span>기타항목 정산설정</span></td>
				</tr>
				</table>
				</div>
				<div class="table-responsive">
					<table id = "DOS01" class="table  table-bordered nowrap">
						<colgroup>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
						</colgroup>				
							<tr style="text-align:center;">
								<th>항목명</th>
								<th>표시명</th>
								<th>부과방법</th>
								<th>부과여부</th>
								<th>시설사용료포함여부</th>
							</tr>
						<tbody>	
							<tr style="text-align:center;">
								<td>기타사항<input type="hidden" class="FID" value="1"/></td>
								<td><input type="text" class="VName form-control" value=""/></td>
								<td>
								<select class="form-control form-control-sm STYP">
										<option value="TIME" <c:if test ="${row.SETL_TITLE eq 'TIME'}">selected</c:if> >시간당사용료부과</option>
										<option value="COUNT" <c:if test ="${row.SETL_TITLE eq 'COUNT'}">selected</c:if> >회당부과</option>
								</select>
								</td>
								<td>
								<select class="form-control form-control-sm UYN">
										<option value="Y" <c:if test ="${row.SETL_USE_YN eq 'Y'}">selected</c:if> >부과</option>
										<option value="N" <c:if test ="${row.SETL_USE_YN eq 'N'}">selected</c:if> >미부과</option>
								</select>
								</td>
								<td>
								<select class="form-control form-control-sm UYN">
										<option value="Y" <c:if test ="${row.SETL_USE_YN eq 'Y'}">selected</c:if> >포함</option>
										<option value="N" <c:if test ="${row.SETL_USE_YN eq 'N'}">selected</c:if> >미포함</option>
								</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

	<script>
	
	$(".STYP, .UYN").change(function() {
		fn_Srulesett();
	});
	
	function fn_Srulesett(){
		var $Aarr =  $(".FID");
		var $Barr =  $(".STYP");
		var $Carr =  $(".UYN");
		for (var i=0; i<$Aarr.length; i++){
		var sruledata = {};
		sruledata.SETL_FROOM_ID = $Aarr[i].value;
		sruledata.SETL_TITLE = $Barr[i].value;
		sruledata.SETL_USE_YN = $Carr[i].value;
		console.log(sruledata);
		$.ajax({
			url : "${path}/cont/insertSrule.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
			data : sruledata, // HTTP 요청과 함께 서버로 보낼 데이터 
			method : "POST", // HTTP 요청 메소드(GET, POST 등) 
			dataType : "json" // 서버에서 보내줄 데이터의 타입 
		})
		.done(function(data) {
		});
  	}
	}
	
	$(".first").each(function() {
		  var rows = $(".first:contains('" + $(this).text() + "')");
		  if (rows.length > 1) {
		    rows.eq(0).attr("rowspan", rows.length);
		    rows.not(":eq(0)").remove();
		  }
		});
	
	$(".CHK").change(function(){
	});
	
	$( document ).ready(function() {
	});
	</script>
