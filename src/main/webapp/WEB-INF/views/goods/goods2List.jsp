<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					등록물품조회
				</div>
			</div>
		</div>
	</div>
</div>
<div>
<table class="table  table-bordered nowrap " id="goodsTable" align= "center" width="800" border="1">
  <tbody>
    <tr>
      <th scope="col" width="150" align="center">대분류명</th>
      <th scope="col" width="150" align="center">중분류명</th>
      <th scope="col" width="400" align="center">품명</th>
      <th scope="col" width="100" align="center">사용여부</th>
    </tr>
    <c:forEach var="row" items="${list}">
    <tr>
      <td>${row.CAT_01_TITLE}</td>
      <td>${row.CAT_02_TITLE}</td>
      <td><a href="javascript:fnSetPage('${path}/goods/detail02/${row.GOODS_ID}')">${row.GOODS_TITLE}</td>
      <td>${row.GOODS_USE_YN}</td>
    </tr>
    </c:forEach>
     </tbody>
</table>
</div>
<script>
function fnSetPage(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#main_container").empty();
	    $("#carouselExampleIndicators").remove();
		$("#main_container").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}
$(document).ready(function(){
	 $("#goodsTable").DataTable();
	 });
</script>
