<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					기초코드 조회
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->
	 	 <!--리스트 table-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="btn_wr text-right">
					<button class="btn btn-sm btn-outline" onClick="javascript:fnSetPage('${path}/code/write.do')"><i class="icofont icofont-pencil-alt-2"></i>등록</button>
				</div>
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table id="codeTable" class="table table-bordered nowrap ">
							<colgroup>
								<col width="10%"/>
								<col width="20%"/>
								<col width="30%"/>
								<col width="20%"/>
								<col width="20%"/>
							</colgroup>							
							<thead>
								<tr>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">코드번호</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">Lv2 코드명</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">Lv2 코드설명</th>
									<th style="vertical-align:middle; text-align: center; background-color:#CED8F6">사용여부</th>
									</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${list02}">
								<tr>
									<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<td><a href="javascript:fnSetPage('${path}/code/detail/${row.CAT_ID}')">${row.CAT_ID}</a></td>							
									<td><a href="javascript:fnSetPage('${path}/code/detail/${row.CAT_ID}')">${row.CAT_TITLE}</a></td>
									<td>${row.CAT_REMARK}</td>
									<td>${row.CAT_USE_YN}</td>
								</tr>
							</c:forEach>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//리스트 table-->
