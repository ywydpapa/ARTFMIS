<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
			<colgroup>
				<col width="25%" />
				<col width="25%" />
			</colgroup>
			<thead>
				<tr>
					<th>구분</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach varStatus="status" var="row" items="${listbcode}">
					<tr>
						<td>
						<a href="javascript:fnSetRoomdetail('${path}/cont/settleRuledetail/${row.BCD_ID}?BCD_TITLE=${row.BCD_TITLE}')">${row.BCD_TITLE}</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
<script>

</script>