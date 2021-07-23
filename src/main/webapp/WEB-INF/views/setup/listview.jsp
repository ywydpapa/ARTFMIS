<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.listrooms {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

.detailaltar {
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
	width: 40%;
	height: 100%;
	text-align: center;
	border-right: 1px solid #ddd;
}

.h-container .item.cont {
	float: left;
	width: 58%;
	border-right: none;
	text-align: center;
}
</style>
<div class="listcategory">
		<table class="table table-bordered nowrap"
		style="width: 50%;">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<td>구분</td>
			<td><select name="setup_cat" id="setup_cat"
				class="form-control form-control-sm">
				<c:forEach var ="row" items="${clist}">
				<option value="${row.BCD_ID}">${row.BCD_TITLE}</option>				
				</c:forEach>
			</select></td>
		</tr>
</table>
<hr>
	<div class="h-container">
		<div class="item">
			<table class="table table-striped table-bordered nowrap"
				id="listTable">
				<thead>
					<tr>
						<th scope="col" width="100" align="center">문구구분</th>
						<th scope="col" width="200" align="center">문구내용</th>
						<th scope="col" width="100" align="center">문구설명</th>
						<th scope="col" width="100" align="center">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a href="javascript:fnSetdetail('${path}/setup/detail/${row.SETUP_ID}')">${row.SETUP_TITLE}</a></td>
							<td><input type="text" value="${SETUP_CONTENTS}"></td>
							<td><input type="text" value="${SETUP_DESC}"></td>
							<td><c:if test="${row.USE_YN eq 'Y'}">사용</c:if><c:if test="${row.USE_YN eq 'N'}">미사용</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
		<div class="item cont">
			<div id="detailTable" class="detailTable"></div>
		</div>
	</div>
</div>
<script>
	
$(document).ready(function() {
	
	
	
});
	


</script>
