<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div>
<table class="table table-bordered table-hover"
				id="roomTable">
				<thead>
					<tr>
						<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">제단구분</th>
						<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">제단명</th>
						<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">금액</th>
						<th style="vertical-align:middle;text-align:center;background-color:#E6F8E0">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td style="vertical-align:middle;text-align:center;background-color:#E6F8E0" class="first"><c:if test="${row.ALTAR_CAT eq '102'}">제단</c:if><c:if test="${row.ALTAR_CAT eq '103'}">헌화</c:if> </td>
							<td style="vertical-align:middle;text-align:center"><a href="javascript:fnSetAltardetail('${path}/goods/detailAltar/${row.ALTAR_ID}')">${row.ALTAR_TITLE}</a></td>
							<td style="vertical-align:middle;text-align:right"><fmt:formatNumber value="${row.ALTAR_AMOUNT}" pattern="#,###" /></td>
							<td style="vertical-align:middle;text-align:center"><c:if test="${row.ALTAR_USE_YN eq 'Y'}">사용</c:if><c:if test="${row.ALTAR_USE_YN eq 'N'}">미사용</c:if></td>
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
