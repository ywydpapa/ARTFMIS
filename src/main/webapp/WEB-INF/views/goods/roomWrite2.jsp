<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					호실등록
				</div>
			</div>
		</div>
	</div>
</div>

<div class="cnt_wr">
  
	  <table  align="center" width="800" border="1">
  <tbody>
    <tr>
      <td scope="col" width="200">시설구분</td>
      <td scope="col" width="200"><select><option value='100001' >분향실</option></select></td>
      <td scope="col" width="200">수용인원수</td>
      <td scope="col" width="200">&nbsp;</td>
    </tr>
    <tr>
      <td>호실명</td>
      <td>&nbsp;</td>
      <td>일일사용료</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>호실타입</td>
      <td><select>
		  <option>MVG</option>
		  <option>VIP</option>
		  <option>특실</option>
		  <option>일반실</option>
		  </select></td>
      <td>시간당사용료</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>면적</td>
      <td>&nbsp;</td>
      <td>환경부담금</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>평수</td>
      <td>&nbsp;</td>
      <td>사용유무</td>
      <td><select>
		  <option>예<option>
		  <option>아니오</option>
		  </select></td>
    </tr>
    <tr>
      <td>컴퓨터이름</td>
      <td>&nbsp;</td>
      <td>정렬순서</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>메모</td>
      <td colspan="3"><textarea></textarea></td>
    </tr>
   <tr>
      <td align="center" colspan="2"><button id="saveBtn">저장</button></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>

  </tbody>
</table>

	  <br>
<table align= "center" width="800" border="1">
  <tbody>
    <tr>
      <th scope="col">타입</th>
      <th scope="col">호실</th>
      <th scope="col">면적</th>
      <th scope="col">평수</th>
      <th scope="col">수용인원</th>
      <th scope="col">일일사용료</th>
      <th scope="col">시간사용료</th>
      <th scope="col">환경부담금</th>
      <th scope="col">특이사항</th>
      <th scope="col">임시호실생성유무</th>
      <th scope="col">임시호실명</th>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>
</div> 