<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<table class="table table-bordered table-hover">
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
			href="javascript:void(0);" onclick="chkallS();">V</a>/<a
			href="javascript:void(0);" onclick="chkunS();">X</a>)
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
			<th>초도주문수량</th>
			<th>초도주문금액</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="row" items="${doslist3}">
			<tr>
				<td style="vertical-align: middle; text-align: center"
					class="second2">${row.CAT_TITLE}</td>
				<td style="vertical-align: middle; text-align: center"><input
					type="checkbox" class="CHKstore form-control" /></td>
				<td style="vertical-align: middle"><input type="hidden"
					class="FRID" value="${frid}"><input type="hidden"
					class="SGID" value="${row.GOODS_ID}">${row.GOODS_TITLE}</td>
				<td>${row.GOODS_UNIT}</td>
				<td style="text-align: right; vertical-align: middle"><fmt:formatNumber
						value="${row.GOODS_NET_PRICE}" pattern="#,###" /></td>
				<td style="text-align: right; vertical-align: middle" class="infoS"><fmt:formatNumber
						value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
				<td style="text-align: right; vertical-align: middle"><input
					class="from-control SA" oninput="calculateS()"
					style="border: none; text-align: right;" type="number" min="0"
					max="100"
					value="<c:if test="${row.STORE_GOODS_INIT_QTY eq null }">1</c:if><c:if test="${row.STORE_GOODS_INIT_QTY ne null }">${row.STORE_GOODS_INIT_QTY}</c:if>"
					required></td>
				<td class="SB" style="text-align: right; vertical-align: middle"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<table class="table  table-bordered nowrap">
	<tr>
		<td style="border-right: none"></td>
		<td style="text-align: right; border-left: none"><span>선택된
				주문 총액 :</span><input type="text" id="storegrandtotal"
			style="text-align: right; border: none;" readonly></td>
	</tr>
</table>
<div class="btn_wr text-right mt-3">
	<button class="btn btn-md btn-primary" onClick="fn_contInsertP7()">등록</button>
</div>