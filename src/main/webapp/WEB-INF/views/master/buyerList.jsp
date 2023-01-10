<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>


<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.lang.Deprecated" %>
<%
	//오늘 날짜 구하기
	Date nowDate = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	
	//한달 후 날짜 구하기
	Date addMonth = new Date();
    
    int getNowMM = nowDate.getMonth();
    
    addMonth.setMonth(getNowMM + 1);
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>바이어목록</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<style type="text/css">
	.filterText {
		text-align: center;
		
	}
	.leftFilterDiv {
		border-right-style: groove;
	}
	.scrollBox {
		border : solid; color:red;
		width : 100%;
		height: 30%;
	}
	.listHover:hover {
		background-color: #D3D3D3;
		cursor: pointer;
	}
	
	.table .trtr:hover {
	 	font-weight: bold;
	 	background-color: #c7c9c2;
 	}
 	
 	th, td {
 		padding: 10px;
 	}
 	
 
 	#registerBtn {
 		margin-left: 80px;
 	}
 	
 	.primaryBtn {
		background-color: white !important;
		border-color: #1d5c83 !important;
		color: #1d5c83 !important;
 	}
 	
 	.primaryBtn:hover {
 		background-color: #1d5c83 !important;
 		color: white !important;
 	}
 	
</style>


</head>
<body>

<my:side_bar active=""></my:side_bar>
<div class="container-sm mt-4" style="width: 77vw; margin-left: 20%;">
	<div class="row d-flex">
		
		<!-- *좌측* 검색 조건 설명란 -->
		<div class="col-sm-2 leftFilterDiv mt-2">
			<div class="mb-5">
				<p class="filterText">전체 검색</p>
			</div>
			<div class="mb-5">
				<p class="filterText">조건 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex.바이어코드 / 바이어명 등등... ) -->
			</div>
		</div><!-- 좌측 조건 설명 div 끝 -->
		
		<!-- *우측* 검색 필터 -->
		<div class="col-sm-10 mt-1">
			<form action="" method=""><!-- form get? post?  -->		
				<!-- 검색필터 1st row : 전체 검색. -->
				<div class="row d-flex">
					<div class="col-sm-6 mb-4">
						<div class="input-group">
							<input name="keyword" value="" class="form-control" type="Search" placeholder="전체검색" aria-label="Search">
			        		<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
				</div><!-- 1st row 끝 -->
				<!-- 검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
				<div class="row d-flex">
					<div class="col-sm-3 mb-4">
						<div class="input-group" >
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions1" placeholder="바이어코드">
							<datalist id="datalistOptions1">
								<c:forEach items="${buyer }" var="buyer">
									<option value="${buyer.buyerCode }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions2" placeholder="바이어명">
							<datalist id="datalistOptions2">
								<c:forEach items="${buyer }" var="buyer">
									<option value="${buyer.buyerName }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>	
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions3" placeholder="국가">
							<datalist id="datalistOptions3">
								<c:forEach items="${country }" var="country">
									<option value="${country }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
				</div><!-- 2nd row 끝 -->

				<div class="row mt-4">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<div style="text-align: justify;">
							<button class="btn btn-outline-primary primaryBtn" type="submit">선택 조건 검색</button>
						</div>
					</div>
				</div>
			</form>	
		</div><!-- 우측 검색 조건 div 끝 -->
	</div><!-- 좌측 + 우측 전체를 감싸는 d-flex 끝-->
	
	<hr>
	<div class="d-flex">
	<h4>바이어목록</h4>
	<div class="col-sm-9"></div>
	<c:url value="/master/buyerRegister" var="registerLink"></c:url>
		<button id="registerBtn" class="btn btn-outline-primary primaryBtn" onclick="window.open('${registerLink}','바이어정보','width=500,height=500,left=400,top=300,location=no,status=no,scrollbars=yes');">바이어등록</button>
	</div>
	<!-- 리스트 -->
	<table class="table table-hover container">
		<thead>
			<tr>
				<th>바이어코드</th>
				<th>바이어명</th>
				<th>주소</th>
				<th>국가</th>
				<th>사업자번호</th>
				<th>연락처</th>
				<th>선적비용부담</th>
				<th>담당자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${buyerList }" var="buyer">
			<c:url value="/master/buyerModify" var="getLink">
					<c:param name="code" value="${buyer.buyerCode }"></c:param>
				</c:url>
				<tr onclick="window.open('${getLink}','바이어정보','width=500,height=500,left=400,top=300,location=no,status=no,scrollbars=yes');" class="trtr">
<%-- 				<tr onclick="location.href='${getLink}'" class="trtr"> --%>
					<td style="width: 100px;">${buyer.buyerCode }</td>
					<td style="width: 150px;">${buyer.buyerName }</td>
					<td style="width: 400px;">${buyer.address }</td>
					<td>${buyer.country }</td>
					<td style="width: 150px;">${buyer.businessNumber }</td>
					<td style="width: 150px;">${buyer.phone }</td>
					<td style="width: 150px;">${buyer.deliveryCompany }</td>
					<td>${buyer.manager }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
	
</body>
</html>