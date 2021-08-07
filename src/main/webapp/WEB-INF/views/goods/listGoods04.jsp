<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div>
  <table class="table  table-bordered table-hover" id="goodslist">
  <tbody>
    <tr style="vertical-align:middle;text-align:center;background-color:#E6F8E0 ">
      <th style="vertical-align:middle;text-align:center">대분류</th>
      <th style="vertical-align:middle;text-align:center">중분류</th>
      <th style="vertical-align:middle;text-align:center">품명</th>
      <th style="vertical-align:middle;text-align:center">사용여부</th>
    </tr>
    <c:forEach var="row" items="${listgoods04}">
    <tr>
      <td style="vertical-align:middle;text-align:center" class="first" valign="middle">기타용품</td>
      <td style="vertical-align:middle;text-align:center" class="first" valign="middle">${row.CAT_02_TITLE}</td>
      <td style="vertical-align:middle"><a href="javascript:fn_Reload04('${path}/goods/detail04/${row.GOODS_ID}')">${row.GOODS_TITLE}</a></td>
      <td style="vertical-align:middle;text-align:center"><c:if test="${row.GOODS_USE_YN eq 'Y'}">사용</c:if><c:if test="${row.GOODS_USE_YN eq 'N'}">미사용</c:if></td>
    </tr>
    </c:forEach>
     </tbody>
</table>
</div>
<script>
/* 열병합 */
$(".first").each(function() {
	  var rows = $(".first:contains('" + $(this).text() + "')");
	  if (rows.length > 1) {
	    rows.eq(0).attr("rowspan", rows.length);
	    rows.not(":eq(0)").remove();
	  }
	});

</script>
