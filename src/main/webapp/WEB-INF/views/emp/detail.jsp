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
<title>직원 상세 페이지</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="fs-3">직원관리 - 직원 상세정보</h1>
			
			<div class="row">
				<table class="table">
					<tr>
						<th>이름</th>
						<td colspan="3">${emp.name }</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td><fmt:formatDate value="${emp.createdDate}" pattern="yyyy-MM-dd"/></td>
						<th>수정일</th>
						<td><fmt:formatDate value="${emp.updatedDate}" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${emp.tel}</td>
						<th>이메일</th>
						<td>${emp.email}</td>
					</tr>
					<tr>
						<th>입사일</th>
						<td><fmt:formatDate value="${emp.hiredDate}" /></td>
						<th>부서</th>
						<td>${dept.name }</td>
					</tr>
					<tr>
						<th>연봉</th>
						<td colspan="3"><fmt:formatNumber value="${emp.salary}" /> 원</td>
					</tr>
				</table>
				<div class="text-end">
					<a href="" class="btn btn-primary">수정</a>
					<a href="" class="btn btn-danger">삭제</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>