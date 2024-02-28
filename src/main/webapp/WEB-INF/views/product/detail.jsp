<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<title>상품 상세 페이지</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="fs-3">상품관리 - 상품 상세정보</h1>
			
			<div class="row">
				<div class="col-5"></div>			
				<div class="col-7">
					<table class="table">
						<tr>
							<th>이름</th>
							<td colspan="3">갤럭시 S24</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td>2024-01-01</td>
							<th>수정일</th>
							<td>2024-02-02</td>
						</tr>
						<tr>
							<th>재고수량</th>
							<td>3,000 개</td>
							<th>상태</th>
							<td>판매중</td>
						</tr>
						<tr>
							<th>판매가격</th>
							<td colspan="3">1,100,000 원</td>
						</tr>
						<tr>
							<th>설명</th>
							<td colspan="3">갤럭시 S24 출시</td>
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
</div>
</body>
</html>