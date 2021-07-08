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
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr align="center">
					<td>${row.CAT_ID}</td>
					<td><a href="javascript:fnSetCode01Data('${row.CAT_ID}','${row.CAT_TITLE}');">${row.CAT_TITLE}</a></td>
					<td>${row.CAT_REMARK}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
</script>

