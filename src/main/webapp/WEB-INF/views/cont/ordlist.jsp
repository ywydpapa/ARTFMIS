<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
			<table class="table table-hover table-bordered">
				<thead>
					<tr class="table-info">
						<th class="align-middle text-center" >주문호실</th>
						<th class="align-middle text-center" >주문구분</th>
						<th class="align-middle text-center" >주문시간</th>
						<th class="align-middle text-center" >확인</th>
						<th class="align-middle text-center" >미확인</th>
						<th class="align-middle text-center" >취소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${ordlist}">
						<tr>
							<td class="align-middle text-center">${row.FROOM_TITLE}</td>
							<td class="align-middle text-center"><a href="javascript:fnSetupdetail('${path}/room/orddetail2/${row.ORDDATE2}?CONTRACT_ID=${row.CONTRACT_ID}')">${row.ORDP}</a></td>
							<td class="align-middle text-center">${row.ORD_DATE}</td>
							<td class="align-middle text-center">${row.CCONFDATE}</td>
							<td class="align-middle text-center <c:if test="${row.CORDDATE ne '0'}">table-danger</c:if>"><c:if test="${row.CORDDATE eq '0'}"></c:if><c:if test="${row.CORDDATE ne '0'}">${row.CORDDATE}</c:if></td>
							<td class="align-middle text-center"<c:if test="${row.CCANCDATE eq '0'}"></c:if><c:if test="${row.CCANCDATE ne '0'}">style="background-color :#F7FE2E;color:#FF0000; font-weight:bolder "</c:if>><c:if test="${row.CCANCDATE ne '0'}">${row.CCANCDATE}</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
