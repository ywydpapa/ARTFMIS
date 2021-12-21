<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
.listgoods {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}
</style>

<div class="listgoods">
	<table class="table table-bordered nowrap" style="width: 100%;">
		<colgroup>
			<col width="20%" />
			<col width="30%" />
			<col width="20%" />
			<col width="30%" />
		</colgroup>
		<tr>
			<td style="vertical-align: middle; text-align: center">대분류</td>
			<td style="vertical-align: middle; text-align: center"><select
				class="form-control" id="selcode01">
					<c:forEach var="row" items="${listsel01}">
						<option value="${row.CAT_ID}">${row.CAT_TITLE}</option>
					</c:forEach>
			</select></td>
			<td style="vertical-align: middle; text-align: center">중분류</td>
			<td style="vertical-align: middle; text-align: center"><select
				class="form-control" id="selcode02">
					<c:forEach var="row" items="${listsel02}" varStatus="status">
						<c:if test="${status.index eq 0 }">
							<option value="${row.CAT_ID}" selected>${row.CAT_TITLE}</option>
						</c:if>
						<c:if test="${status.index ne 0 }">
							<option value="${row.CAT_ID}">${row.CAT_TITLE}</option>
						</c:if>
					</c:forEach>
			</select></td>
		</tr>
	</table>
	<table class="table nowrap">
		<colgroup>
			<col width="40%" />
			<col width="60%" />
		</colgroup>
		<tr>
			<td>
				<div id="listdetail02">
					<table class="table  table-bordered nowrap " id="goodslist">
						<tbody>
							<tr>
								<th scope="col" width="150" align="center">중분류</th>
								<th scope="col" width="400" align="center">품명</th>
								<th scope="col" width="100" align="center">사용여부</th>
							</tr>
							<c:forEach varStatus="stat" var="row" items="${listgoods01}">
								<tr>
									<td rowspan="${stat.count}">${row.CAT_02_TITLE}</td>
									<td><a href="javascript:fn_Reload04('${path}/goods/detail01/${row.GOODS_ID}')">${row.GOODS_TITLE}</a></td>
									<td>${row.GOODS_USE_YN}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</td>
			<td style="padding: 0;">
				<div id="detail02"></div>
			</td>
		</tr>
	</table>
</div>
<script>
	$("#selcode01").change(function() {
		var url = "${path}/code/selectcon02/" + $("#selcode01").val();
		subList(url);
	});

	$("#selcode02").change(
			function() {
				var url = "${path}/goods/listGoods0" + $("#selcode01").val()
						+ "/" + $("#selcode02").val();
				setclear();
				tableListLoad(url);
			});

	function fn_Reload04(url, data) {
		$("#detail02").empty();
		$("#detail02").load(url, data, function() {
			setTimeout(function() {
			}, 500);
		});
	}

	function fn_Reload03(url, data) {
		$("#listdetail02").empty();
		$("#listdetail02").load(url, data, function() {
			setTimeout(function() {
			}, 500);
		});
	}

	function subList(url) {
		$.ajax({
			type : "GET",
			url : url,
			dataType : "html",
			success : function(html) {
				$("#selcode02").empty();
				$("#selcode02").append(html);

				var url = "${path}/goods/listGoods0" + $("#selcode01").val()
						+ "/" + $("#selcode02").val();
				tableListLoad(url);
			},
			error : function(xhr) {
				console.log(xhr);
			}
		});
	}

	function tableListLoad(url) {
		$.ajax({
			type : "GET",
			url : url,
			dataType : "html",
			success : function(html) {
				$("#listdetail02").empty();
				$("#listdetail02").append(html);

				tableDetailLoad();
			},
			error : function(xhr) {
				console.log(xhr);
			}
		});
	}

	function fn_setinsertmode() {
		fn_newform();
		$("#updbtn").hide();
		$("#istbtn").show();
	}

	function fn_setupdatemode() {
		$("#updbtn").show();
		$("#istbtn").hide();
	}

	function tableDetailLoad() {
		if ($("#goodslist > tbody > tr > td > a").length > 0) {
			var tempArr = $("#goodslist > tbody > tr > td > a").eq(0).attr(
					'href').split('/');
			var num = tempArr[tempArr.length - 1].replace(')', '').replace('"',
					'').replace('\'', '');
			var url = "${path}/goods/detail0" + $("#selcode01").val() + "/"
					+ num;
			$.ajax({
				type : "GET",
				url : url,
				dataType : "html",
				success : function(html) {
					$("#detail02").empty();
					$("#detail02").append(html);
				},
				error : function(xhr) {
					console.log(xhr);
				}
			});
		} else {
			return false;
		}
	}

	$(document).keypress(function(e) {
		if (e.keyCode == 13)
			e.preventDefault();
	});

	$(document).ready(
			function() {
				var url = "${path}/goods/listGoods0" + $("#selcode01").val()
						+ "/" + $("#selcode02").val();
				tableListLoad(url);
			});
</script>