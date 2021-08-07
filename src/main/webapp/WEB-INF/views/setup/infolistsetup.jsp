<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<table class="table table-bordered table-hover" id="listTable">
	<thead>
		<tr>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">문구구분</th>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">문구설명</th>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">사용여부</th>
			<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">기본</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="row" items="${list}">
			<tr>
				<td style="vertical-align:middle;text-align:center"><input type="hidden" class="defid" value="${row.SETUP_ID}"><a
					href="javascript:fnSetupdetail('${path}/setup/infodetail/${row.SETUP_ID}')">${row.SETUP_TITLE}</a></td>
				<td style="vertical-align:middle;text-align:center">${row.SETUP_DESC}</td>
				<td style="vertical-align:middle;text-align:center"><c:if test="${row.USE_YN eq 'Y'}">사용</c:if>
					<c:if test="${row.USE_YN eq 'N'}">미사용</c:if></td>
				<td style="vertical-align:middle;text-align:center"><input type="checkbox" class="def form-control"
					onclick="oneCheck(this)"
					<c:if test="${row.SETUP_KEY eq 'Y'}">checked</c:if>></td>
			</tr>
		</c:forEach>
	</tbody>
</table>