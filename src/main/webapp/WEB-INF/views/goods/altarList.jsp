<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div>
<table class="table table-bordered nowrap" id="roomTable">
				<thead>
					<tr>
						<th scope="col" width="100" align="center">제단구분</th>
						<th scope="col" width="200" align="center">제단명</th>
						<th scope="col" width="100" align="center">금액</th>
						<th scope="col" width="100" align="center">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td class="first"><c:if test="${row.ALTAR_CAT eq '102'}">제단</c:if><c:if test="${row.ALTAR_CAT eq '103'}">헌화</c:if> </td>
							<td><a href="javascript:fnSetAltardetail('${path}/goods/detailAltar/${row.ALTAR_ID}')">${row.ALTAR_TITLE}</a></td>
							<td style="text-align: right"><fmt:formatNumber value="${row.ALTAR_AMOUNT}" pattern="#,###" /></td>
							<td><c:if test="${row.ALTAR_USE_YN eq 'Y'}">사용</c:if><c:if test="${row.ALTAR_USE_YN eq 'N'}">미사용</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
</table>
</div>
<script>
$(".first").each(function() {
	  var rows = $(".first:contains('" + $(this).text() + "')");
	  if (rows.length > 1) {
	    rows.eq(0).attr("rowspan", rows.length);
	    rows.not(":eq(0)").remove();
	  }
	});
</script>
