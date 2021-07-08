<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div>
<table class="table table-bordered nowrap" id="roomTable">
				<thead>
					<tr>
						<th scope="col" width="200" align="center">호실명</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a href="javascript:fnSetRoomdetail('${path}/goods/doslist3/${row.FROOM_ID}?BCD_TITLE=${row.FROOM_TITLE}')">${row.FROOM_TITLE}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
</div>
<script>

</script>
