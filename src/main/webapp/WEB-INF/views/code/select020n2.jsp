<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
				<c:forEach varStatus="status" var="row2" items="${select020n}">
				<option value="${row2.CAT_ID}">${row2.CAT_TITLE}</option>
				</c:forEach>
				
