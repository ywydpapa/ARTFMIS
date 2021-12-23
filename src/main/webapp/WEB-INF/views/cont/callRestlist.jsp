<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<table id="MESS01" class="table table-bordered table-hover">
	<colgroup>
		<col width="10%" />
		<col width="5%" />
		<col width="20%" />
		<col width="15%" />
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
		<col width="20%" />
	</colgroup>
	<tr>
		<th colspan="2" style="text-align: center;">분류(<a
			href="javascript:void(0);" onclick="chkallM();">V</a>/<a
			href="javascript:void(0);" onclick="chkunM();">X</a>)
		</th>
		<th colspan="8" style="text-align: center;">상세정보</th>
	</tr>
	<thead style="text-align: center; background-color: #E0E6F8">
		<tr style="text-align: center;">
			<th>종류</th>
			<th>선택</th>
			<th>제품명</th>
			<th>단위</th>
			<th>개당단가</th>
			<th>기본금액</th>
			<th>주문수량</th>
			<th>주문금액</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="row" items="${doslist2}">
			<tr>
				<td style="vertical-align: middle; text-align: center"
					class="restlist">${row.CAT_TITLE}</td>
				<td style="vertical-align: middle; text-align: center"><input
					type="checkbox" class="CHKrest form-control"
					<c:if test="${row.GOODS_INIT_ORDER eq 'Y'}">checked</c:if>
					 /></td>
				<td style="vertical-align: middle"><input type="hidden"
					class="FRID" value="${frid}"><input type="hidden"
					class="RGID" value="${row.GOODS_ID}">${row.GOODS_TITLE}</td>
				<td style="vertical-align: middle">${row.GOODS_UNIT}</td>
				<td style="text-align: right; vertical-align: middle"><fmt:formatNumber
						value="${row.GOODS_NET_PRICE}" pattern="#,###" /></td>
				<td style="text-align: right; vertical-align: middle" class="infoM"><fmt:formatNumber
						value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
				<td style="text-align: right; vertical-align: middle">
					<input class="from-control MA" oninput="calculateM()" style="border: none; text-align: right;" type="text" data-type="number" value="<c:if test="${row.MESSR_GOODS_INIT_QTY eq null }">1</c:if><c:if test="${row.MESSR_GOODS_INIT_QTY ne null }">${row.MESSR_GOODS_INIT_QTY}</c:if>" required>
				</td>
				<td class="MB" style="text-align: right; vertical-align: middle"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script>
$("input[type='text']").each(function(index, item){
	if($(item).data("type") === "number"){
		$(item).attr("maxlength", 6);
		$(item).attr("onKeyup", "this.value = this.value.replace(/[^0-9]/g, '');");
		$(item).attr("style", "width:110px;text-align:right;");
	}
});
</script>