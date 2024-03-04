<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<title>직원관리</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="fs-3">직원관리 - 직원 목록</h1>
			
			<form id="form-products" >
				<input type="hidden" name="page"/>
				<div class="my-3 d-flex justify-content-between">
					<select class="form-control w-25" name="rows" onchange="changeRows()">
						<option value="5" ${param.rows eq 5 ? "selected" : ""}>5개씩 보기</option>
						<option value="10" ${empty param.rows or param.rows eq 10 ? "selected" : ""}>10개씩 보기</option>
						<option value="50" ${param.rows eq 50 ? "selected" : ""}>20개씩 보기</option>
					</select>
					<div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" 
									type="radio" 
									name="sort" 
									value="date" 
									${empty param.sort or param.sort eq "date" ? "checked" : "" }
									onchange="changeSort()">
							<label class="form-check-label">최신순</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" 
									type="radio" 
									name="sort" 
									value="name"
									${param.sort eq "name" ? "checked" : "" }
									onchange="changeSort()">
							<label class="form-check-label">이름순</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" 
									type="radio" 
									name="sort" 
									value="salary"
									${param.sort eq "salary" ? "checked" : "" }
									onchange="changeSort()">
							<label class="form-check-label">연봉순</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" 
									type="radio" 
									name="sort" 
									value="hired"
									${param.sort eq "hired" ? "checked" : "" }
									onchange="changeSort()">
							<label class="form-check-label">입사일순</label>
						</div>
					</div>					
				</div>
				<table class="table">
					<colgroup>
						<col width = "5%">
						<col width = "10">
						<col width = "15%">
						<col width = "20%">
						<col width = "15%">
						<col width = "15%">
						<col width = "20%">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th>이름</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>연봉</th>
							<th>부서번호</th>
							<th>입사일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty emps}">
								<tr>
									<td  colspan="7" class="text-center"> 조회결과가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="emp" items="${emps }">
									<tr>
										<td><input type="checkbox" name="no" value="${emp.no }"></td>
										<td>
											<a href="detail?empNo=${emp.no }&deptNo=${emp.dept.no}">
												${emp.name }
											</a>
										</td>
										<td>${emp.tel}</td>
										<td>${emp.email}</td>
										<td><fmt:formatNumber value="${emp.salary}" /> 원</td>
										<td>${emp.dept.no}</td>
										<td><fmt:formatDate value="${emp.hiredDate}" /></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				
				<div class="row">
					<div class="col-4">
						<div class="row row-cols-lg-auto g-3">
							<div class="col-12">
								<select class="form-select" name="opt">
									<option value="name" ${param.opt eq "name" ? "selected" : ""}>직원명</option>
								</select>
							</div>
							<div class="col-12">
								<input type="text" class="form-control" name="keyword" value="${param.keyword }"/>
							</div>
							<div class="col-12">
								<button type="submit" class="btn btn-outline-secondary">검색</button>
							</div>
						</div>
					</div>
					<div class="col-4">
						<c:if test="${paging.totalRows ne 0 }">
							<nav>
								<ul class="pagination">
									<li class="page-item">
										<a href="list?page=${paging.currentPage - 1}" 
											class="page-link ${paging.first ? 'disabled' : '' }"
											onclick="changePage(${paging.currentPage - 1 }, event)">
											이전
										</a>
									</li>
									<c:forEach var="num" begin="${paging.beginPage }" end="${paging.endPage }">
									<li class="page-item ${paging.currentPage eq num ? "active" : ""}">
										<a href="list?page=${num }" 
											class="page-link" 
											onclick="changePage(${num }, event)">
											${num }
										</a>
									</li>
									</c:forEach>
									<li class="page-item">
										<a href="list?page=${paging.currentPage + 1}" 
											class="page-link ${paging.last ? 'disabled' : '' }"
											onclick="changePage(${paging.currentPage + 1 }, event)">
											다음
										</a>
									</li>
								</ul>
							</nav>
						</c:if>
					</div>
					<div class="col-4">
						<button type="button" class="btn btn-outline-secondary btn-sm" onclick="removeCheckedProducts()">선택삭제</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<div class="text-end">
				<a href="create" class="btn btn-primary">신규 등록</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function changeRows(){
	let form = document.getElementById("form-products").submit();
}

function changeSort(){
	let form = document.getElementById("form-products").submit();
}

function changePage(page, event){
	event.preventDefault();
	document.querySelector("input[name=page]").value = page;
	document.getElementById("form-products").submit();
}

function removeCheckedProducts(){
	let checkedCheckboxes = document.querySelectorAll("input[type=checkbox][name=no]:checked");	// 태그명이 input이고, type 속성값이 checkbox이고, name 속성값이 no이고, 체크상태가 checked인 모든 엘리먼트를 선택한다.
	if(checkedCheckboxes.length == 0){
		alert("체크된 체크박스가 없습니다.");
		return;
	}
	
	// <form> 엘리먼트를 선택한다.
	let form = document.getElementById("form-products");
	
	// <form> 엘리먼트의 action 속성값을 delete로 변경한다.
	// form을 제출하면 localhost/product/delete 요청을 서버로 보내게 된다.
	form.setAttribute("action", "delete");
	form.submit();
}
</script>
</body>
</html>