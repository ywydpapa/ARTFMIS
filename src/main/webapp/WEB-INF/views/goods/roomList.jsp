<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div>
<table class="table table-bordered nowrap" id="roomTable">
				<thead>
					<tr>
						<th scope="col" width="200" align="center">호실명</th>
						<th scope="col" width="100" align="center">수용인원</th>
						<th scope="col" width="100" align="center">임시호실명</th>
						<th scope="col" width="100" align="center">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a href="javascript:fnSetRoomdetail('${path}/goods/detailRoom/${row.FROOM_ID}')">${row.FROOM_TITLE}</a></td>
							<td>${row.FROOM_MAX_PERS}</td>
							<td>${row.FROOM_ALIS}</td>
							<td><c:if test="${row.FROOM_USE_YN eq 'Y'}">사용</c:if><c:if test="${row.FROOM_USE_YN eq 'N'}">미사용</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
</div>
<script>

</script>
