<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div>
    <table class="table  table-bordered nowrap " id="goodslist">
        <thead>
            <tr>
              <th scope="col" width="100" align="center">대분류명</th>
              <th scope="col" width="150" align="center">중분류명</th>
              <th scope="col" width="350" align="center">품명</th>
              <th scope="col" width="100" align="center">사용여부</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="row" items="${listgoods02}" varStatus="status">
            <tr>
              <td class="first">식당용품</td>
              <td class="first">${row.CAT_02_TITLE}</td>
              <td <c:if test="${status.first}">class="active"</c:if>><a href="javascript:fn_Reload04('${path}/goods/detail02/${row.GOODS_ID}')">${row.GOODS_TITLE}</a></td>
              <td <c:if test="${status.first}">class="active"</c:if>><c:if test="${row.GOODS_USE_YN eq 'Y'}">사용</c:if><c:if test="${row.GOODS_USE_YN eq 'N'}">미사용</c:if></td>
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
