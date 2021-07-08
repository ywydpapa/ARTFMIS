<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div>
<table class="table  table-bordered nowrap"
				id="roomTable">
				<thead>
					<tr>
      <th scope="col" width="150" align="center">구분</th>
<!--       <th scope="col" width="150" align="center">상품명</th> -->
      <th scope="col" width="100" align="center">금액</th>
      <th scope="col" width="100" align="center">단위</th>
      <th scope="col" width="100" align="center">사용여부</th>
					</tr>
				</thead>
				<tbody>
    <c:forEach var="row" items="${list}">
    <tr>
      <td class="first">${row.BCD_TITLE}</td>
      <%-- <td><a href="javascript:fnSetftabledetail('${path}/goods/detailFtable/${row.FTABLE_ID}')">${row.FTABLE_AMOUNT}</a></td> --%>
      <td style="text-align : right"><a href="javascript:fnSetftabledetail('${path}/goods/detailFtable/${row.FTABLE_ID}')"><fmt:formatNumber value="${row.FTABLE_AMOUNT}" pattern="#,###" /></a></td>
      <td style="text-align : right">${row.FTABLE_UNIT}</td>
      <td><c:if test="${row.FTABLE_USE_YN eq 'Y'}">사용</c:if><c:if test="${row.FTABLE_USE_YN eq 'N'}">미사용</c:if></td>
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
