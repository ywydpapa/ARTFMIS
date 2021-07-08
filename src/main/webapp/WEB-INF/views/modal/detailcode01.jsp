<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
	<table id="code01Table" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th>코드번호</th>
				<th>코드명</th>
				<th>코드설명</th>
				<th>사용여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr align="center">
					<td><input name="code01Title" id ="code01Title" value="" class="form-control form-control-sm" value="${row.CAT_ID}" readonly></td>
					<td><input name="code01Title" id ="code01Title" value="" class="form-control form-control-sm" value="${row.CAT_TITLE}"></td>
					<td><input name="code01Desc" id ="code01Desc" value="" class="form-control form-control-sm"value="${row.CAT_REMARK}"></td>
					<td>
					<select id="code01_useYn" class="form-control">
						<option value="Y">예</option>
						<option value="N">아니오</option>
					</select>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
</script>

