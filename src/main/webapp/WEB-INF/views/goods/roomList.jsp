<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div>
<table class="table table-bordered table-hover" id="roomTable">
				<thead>
					<tr>
						<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">호실명</th>
						<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">수용인원</th>
						<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">임시호실명</th>
						<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td style="vertical-align:middle;text-align:center;"><a href="javascript:fnSetRoomdetail('${path}/goods/detailRoom/${row.FROOM_ID}')">${row.FROOM_TITLE}</a></td>
							<td style="vertical-align:middle;text-align:right;">${row.FROOM_MAX_PERS}</td>
							<td style="vertical-align:middle;text-align:center;">${row.FROOM_ALIS}</td>
							<td style="vertical-align:middle;text-align:center;"><c:if test="${row.FROOM_USE_YN eq 'Y'}">사용</c:if><c:if test="${row.FROOM_USE_YN eq 'N'}">미사용</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
</div>
<script>

</script>
