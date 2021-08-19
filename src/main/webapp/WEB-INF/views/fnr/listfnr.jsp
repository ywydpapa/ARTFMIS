<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<table class="table table-striped table-bordered nowrap" id="listTable">
				<thead>
					<tr>
						<th scope="col" width="25%" style="text-align:center">장례식장명</th>
						<th scope="col" width="25%" style="text-align:center">라이센스</th>
						<th scope="col" width="25%" style="text-align:center">사용자수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a href="javascript:fnSetupdetail('${path}/fnr/detail/${row.FNR_ID}')">${row.FNR_NAMEK}</a></td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>