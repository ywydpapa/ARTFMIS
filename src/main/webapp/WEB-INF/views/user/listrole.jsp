<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<table class="table table-striped table-hover" id="listTable">
				<thead>
					<tr>
						<th class="table-info" style="text-align:center">로그인아이디</th>
						<th class="table-info" style="text-align:center">이름</th>
						<th class="table-info" style="text-align:center">권한</th>
						<th class="table-info" style="text-align:center">부서</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a href="javascript:fnSetupdetail('${path}/user/detailRole/${row.USER_ID}')">${row.USER_LOGINID}</a></td>
							<td>${row.USER_NAMK}</td>
							<td>${row.USER_RANK}</td>
							<td>${row.BCD_TITLE}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>