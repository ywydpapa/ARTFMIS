<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">등록물품조회</div>
			</div>
		</div>
	</div>
</div>
<div>
	<table class="table table-bordered table-hover" id="goodsTable">
	<thead>
	<tr>
      <th>대분류</th>
      <th>중분류</th>
      <th>품명</th>
      <th>사용여부</th>
    </tr> 
    </thead>
    <tbody>
    <c:forEach var="row" items="${list}">
    <tr>
      <td style="vertical-align:middle;text-align:center">${row.CAT_01_TITLE}</td>
      <td style="vertical-align:middle;text-align:center">${row.CAT_02_TITLE}</td>
      <td style="vertical-align:middle"><a
						href="javascript:fnSetPage('${path}/goods/detail01/${row.GOODS_ID}')">${row.GOODS_TITLE}</a></td>
      <td style="vertical-align:middle;text-align:center">${row.GOODS_USE_YN}</td>
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
