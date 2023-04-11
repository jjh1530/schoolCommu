<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pages" value="${totalPages}" />
<c:set var="currentPage" value="${currentPage + 1}" />
<c:set var="startPage" value="${currentPage - 5}" />
<c:set var="endPage" value="${currentPage + 4}" />

<c:if test="${startPage < 1}">
	<c:set var="startPage" value="1" />
	<c:set var="endPage" value="10" />
</c:if>

<c:if test="${endPage > pages}">
	<c:set var="endPage" value="${pages}" />
	<c:set var="startPage" value="${pages - 9}" />
</c:if>

<c:if test="${startPage < 1}">
	<c:set var="startPage" value="1" />
</c:if>

<style>
.pagination li.active {
	background-color: black;
	color: #fff;
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/adminHeader.jsp"></jsp:include>
	<div class="container" id="schoolForm">
		<div class="card shadow mb-4">

			<!-- Card Header - Dropdown -->
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<div class="col-sm-4 d-flex align-items-center">
					<h6 class="m-0 font-weight-bold">학교 정보</h6>
				</div>
				<div class="col-sm-8">
					<form class="d-flex" action="/admin" method="get">
						<input type="text" name="keyword" class="form-control">
						<button type="submit" class="btn btn-dark" style="width: 70px; margin-left: 10px;">검색</button>
					</form>
				</div>
			</div>
			<table class="table table-bordered text-center">
				<thead>
					<tr>
						<th>프렌차이즈명</th>
						<th>지점</th>
						<th>주소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="school" items="${school}" varStatus="loop">
						<tr>
							<td>${school.schoolName}</td>
							<td>${school.schoolType}</td>
							<td>${school.address}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- END BLOG ENTRIES -->
			<div id="paginationBox" class="text-center">
				<ul class="pagination" style="justify-content: center;">
					<c:if test="${currentPage > 1}">
						<li class="page-link"><a href="/admin?keyword=${keyword}&page=${currentPage - 2}"> Previous </a></li>
					</c:if>
					<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
						<c:choose>
							<c:when test="${i == currentPage}">
								<li class="page-link active"><a href="#">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-link"><a href="/admin?keyword=${keyword}&page=${i-1}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${currentPage < pages}">
						<li class="page-link"><a href="/admin?keyword=${keyword}&page=${currentPage}"> Next </a></li>
					</c:if>
				</ul>
			</div>
		</div>
</body>
</html>