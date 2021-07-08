<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
			<colgroup>
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
			</colgroup>
			<thead>
				<tr>
					<th>코드명</th>
					<th>비고사항</th>
					<th>정렬순서</th>
					<th>사용여부</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach varStatus="status" var="row2" items="${listbcode}">
					<tr>
						<td>
						<input id="CAT0${status.index}" type="hidden" value="${row2.BCD_ID}">
						<input id="CAT1${status.index}" type="text" style="width:100%;hight:100%;border:0;" value="${row2.BCD_TITLE}"></td>
						<td><input id="CAT2${status.index}" type="text" style="width:100%;hight:100%;border:0;" value="${row2.BCD_REMARK}"></td>
						<td><input id="CAT3${status.index}" type="text" style="width:100%;hight:100%;border:0;" value="${row2.BCD_ORDER}"></td>
						<td>
						<select id="CAT4${status.index}" name="YN" class="form-control">
						<option value = "Y"<c:if test="${row2.BCD_USE_YN eq 'Y'}">selected</c:if>>사용</option>
						<option value = "N"<c:if test="${row2.BCD_USE_YN eq 'N'}">selected</c:if>>미사용</option>
						</select>
						</td>
					</tr>
				</c:forEach>
			</tbody>
<script>
$('input[type=text]').change(function() {
	var keyid = $(this).attr('id');
	keyid = keyid.substr(4); 
	var catkey = "CAT0"+keyid;
	var catkey1 = "CAT1"+keyid;
	var catkey2 = "CAT2"+keyid;
	var catkey3 = "CAT3"+keyid;
	var catkey4 = "CAT4"+keyid;
	var keyvar0= $("#"+catkey).val();
	var keyvar1= $("#"+catkey1).val();
	var keyvar2= $("#"+catkey2).val();
	var keyvar3= $("#"+catkey3).val();
	var keyvar4= $("#"+catkey4).val();
	var codeData = {};
	codeData.BCD_ID 	= $("#"+catkey).val();
	codeData.BCD_TITLE 	= $("#"+catkey1).val();
	codeData.BCD_REMARK 	= $("#"+catkey2).val();
	codeData.BCD_ORDER 	= $("#"+catkey3).val();
	codeData.BCD_USE_YN 	= $("#"+catkey4).val();
	console.log(codeData);
	$.ajax({ url: "${path}/code/updatebCode.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
});


$('select').change(function(){
	var keyid = $(this).attr('id');
	keyid = keyid.substr(4); 
	var catkey = "CAT0"+keyid;
	var catkey1 = "CAT1"+keyid;
	var catkey2 = "CAT2"+keyid;
	var catkey3 = "CAT3"+keyid;
	var catkey4 = "CAT4"+keyid;
	var keyvar0= $("#"+catkey).val();
	var keyvar1= $("#"+catkey1).val();
	var keyvar2= $("#"+catkey2).val();
	var keyvar3= $("#"+catkey3).val();
	var keyvar4= $("#"+catkey4).val();
	var codeData = {};
	codeData.BCD_ID 	= $("#"+catkey).val();
	codeData.BCD_TITLE 	= $("#"+catkey1).val();
	codeData.BCD_REMARK 	= $("#"+catkey2).val();
	codeData.BCD_ORDER 	= $("#"+catkey3).val();
	codeData.BCD_USE_YN 	= $("#"+catkey4).val();
	console.log(codeData);
	$.ajax({ url: "${path}/code/updatebCode.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
});

</script>