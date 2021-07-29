<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<table class="table table-striped table-bordered nowrap" id="listTable">
				<thead>
					<tr>
						<th scope="col" width="10%" style="text-align:center">구분</th>
						<th scope="col" width="15%" style="text-align:center">운영시작시간</th>
						<th scope="col" width="15%" style="text-align:center">운영종료시간</th>
						<th scope="col" width="30%" style="text-align:center">문구설명</th>
						<th scope="col" width="20%" style="text-align:center">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a href="javascript:fnSetupdetail('${path}/setup/timedetail/${row.SETUP_ID}')">${row.SETUP_TITLE}</a></td>
							<td>${row.START_TIME}</td>
							<td>${row.END_TIME}</td>
							<td>${row.SETUP_DESC}</td>
							<td><c:if test="${row.USE_YN eq 'Y'}">사용</c:if><c:if test="${row.USE_YN eq 'N'}">미사용</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
</table>