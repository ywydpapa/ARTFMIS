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
				<td class="align-middle"><input id="frid" type="hidden" value = "${frid}">시설물 정산설정</td>
				<td class="align-middle"><div class="btn_wr text-right mt-3"><button class="btn btn-md btn-primary " onClick="fn_Sruleupd()">저장</button></div></td>
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
								<th class="align-middle text-center table-info">항목명</th>
								<th class="align-middle text-center table-info">표시명</th>
								<th class="align-middle text-center table-info">부과방법</th>
								<th class="align-middle text-center table-info">부과여부</th>
								<th class="align-middle text-center table-info">시설사용료포함여부</th>							</tr>
						<tbody>
							<c:forEach var="row" items="${rowT}">
							<tr style="text-align:center;">
								<td class="align-middle"><c:if test="${row.SETL_FROOM_ID eq 1}">분향실</c:if>
								<c:if test="${row.SETL_FROOM_ID eq 2}">안치실</c:if>
								<c:if test="${row.SETL_FROOM_ID eq 3}">입관실</c:if>
								<c:if test="${row.SETL_FROOM_ID eq 4}">발인실</c:if>
								<c:if test="${row.SETL_FROOM_ID eq 5}">게스트룸</c:if>
								<c:if test="${row.SETL_FROOM_ID eq 6}">종교시설</c:if>
								<c:if test="${row.SETL_FROOM_ID eq 7}">기타시설</c:if>
								<input type="hidden" class="FID" value="${row.SETL_FROOM_ID}"/></td>
								<td><input type="text" class="VName form-control" value="${row.SETL_REMARK}"/></td>
								<td>
								<select class="form-control form-control-sm STYP">
										<option value="TIME" <c:if test ="${row.SETL_TYPE eq 'TIME'}">selected</c:if> >시간당사용료부과</option>
										<option value="COUNT" <c:if test ="${row.SETL_TYPE eq 'COUNT'}">selected</c:if> >회당부과</option>
								</select>
								</td>
								<td>
								<select class="form-control form-control-sm UYN">
										<option value="Y" <c:if test ="${row.PAY_YN eq 'Y'}">selected</c:if> >부과</option>
										<option value="N" <c:if test ="${row.PAY_YN eq 'N'}">selected</c:if> >미부과</option>
								</select>
								</td>
								<td>
								<select class="form-control form-control-sm INCYN">
										<option value="Y" <c:if test ="${row.INCADD_YN eq 'Y'}">selected</c:if> >포함</option>
										<option value="N" <c:if test ="${row.INCADD_YN eq 'N'}">selected</c:if> >미포함</option>
								</select>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

	<script>
	
	function fn_Srulesett(){
		var $Aarr =  $(".FID");
		var $Barr =  $(".STYP");
		var $Carr =  $(".UYN");
		var $Darr =  $(".INCYN");
		var $Earr =  $(".VNAME");
		for (var i=0; i<$Aarr.length; i++){
		var sruledata = {};
		sruledata.SETL_FROOM_ID = $Aarr[i].value;
		sruledata.SETL_TITLE = "ROOM";
		sruledata.SETL_TYPE = $Barr[i].value;
		sruledata.SETL_REMARK = $Earr[i].value;
		sruledata.PAY_YN = $Carr[i].value;
		sruledata.INCADD_YN = $Darr[i].value;
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
	
	function fn_Sruleupd(){
		var $Aarr =  $(".FID");
		var $Barr =  $(".STYP");
		var $Carr =  $(".UYN");
		var $Darr =  $(".INCYN");
		var $Earr =  $(".VNAME");
		for (var i=0; i<$Aarr.length; i++){
		var sruledata = {};
		sruledata.SETL_FROOM_ID = $Aarr[i].value;
		sruledata.SETL_TITLE = "ROOM";
		sruledata.SETL_TYPE = $Barr[i].value;
		sruledata.SETL_REMARK = $Earr[i].value;
		sruledata.PAY_YN = $Carr[i].value;
		sruledata.INCADD_YN = $Darr[i].value;
		console.log(sruledata);
		if (sruledata.SETL_FROOM_ID !=""){
		$.ajax({
			url : "${path}/cont/updateSrule.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
			data : sruledata, // HTTP 요청과 함께 서버로 보낼 데이터 
			method : "POST", // HTTP 요청 메소드(GET, POST 등) 
			dataType : "json" // 서버에서 보내줄 데이터의 타입 
		})
		.done(function(data) {
		});
		}
		else
			{
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
		alert("저장성공");
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
