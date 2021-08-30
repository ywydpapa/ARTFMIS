<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<style>
  .listrooms {
        width: 100%;
        height: 100%;
        padding : 20px;
        background: white;
      }
        .detailroom {
        width: 100%;
        height: 100%;
        padding : 20px;
        background: white;
      }
.h-container:after{ clear: both; display: block; content: '' }
.h-container .item {
	float: left;
	width: 15%;
	height: 100%;
	text-align: center;
	border-right: 1px solid #ddd;
}
.h-container .item.cont {
	float: left;
	width: 78%;
	border-right: none;
	text-align: center;
}
</style>
<div class="listrooms">
<div class="page-header2">
</div>
	<table class="table  table-bordered nowrap"
		style="width: 50%;">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<td>정산규칙설정</td>
			<td>시설물/제물상/제단 정산규칙 설정</td>
		</tr>
</table>
<hr>
	<div class="h-container">
					<div class="item">
			<table class="table  table-bordered nowrap"
							id="roomTable">
				<thead>
					<tr>
						<th scope="col" width="200" align="center">구분</th>
					</tr>
				</thead>
				<tbody>
					<tr><td><a href="javascript:fnSetRoomdetail('${path}/goods/setlistRule/1')">시설물</a></td></tr>
					<tr><td><a href="javascript:fnSetRoomdetail('${path}/goods/setlistRule/2')">제물상</a></td></tr>
					<tr><td><a href="javascript:fnSetRoomdetail('${path}/goods/setlistRule/3')">제단</a></td></tr>
				</tbody>
			</table>
		</div>
		<div class="item cont">
		<div id="detailroom" class="detailroom">
		
		</div>
		</div>
	</div>

			</div>
<script>


function fnSetRoomlist(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#roomTable").empty();
		$("#roomTable").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}



function fnSetRoomdetail(url, data){
	<!-- $.LoadingOverlay("show", true); -->
	    $("#detailroom").empty();
		$("#detailroom").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
}


function tableListLoad(url){
	$.ajax({
		type: "GET",
		url : url,
		dataType : "html",
		success : function(html){
			$("#roomTable").empty();
			$("#roomTable").append(html);		
			tableDetailLoad();
		},
		error : function(xhr){
			console.log(xhr);
		}
	});
}

function tableDetailLoad(){
	if ($("#roomTable > tbody > tr > td > a").length > 0){
		var tempArr = $("#roomTable > tbody > tr > td > a").eq(0).attr('href').split('/');
		var num = tempArr[tempArr.length - 1].replace(')','').replace('"','').replace('\'','');
		console.log(num);
		var url ="${path}/goods/setlistRule/"+num;	
		$.ajax({
			type: "GET",
			url : url,
			dataType : "html",
			success : function(html){
				$("#detailroom").empty();
				$("#detailroom").append(html);
			},
			error : function(xhr){
				console.log(xhr);
			}
		});
	} else {
		return false;
	}
}

$(document).ready(function(){
	tableDetailLoad();
});

</script>
