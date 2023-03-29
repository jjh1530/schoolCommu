<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 현재 페이지 --%>
<c:set var="currentPage" value="${param.page - 0 - 1}" />
<%-- 한 페이지에 보여줄 게시글 개수 --%>
<c:set var="perPage" value="10" />
<%-- 전체 항목 수 --%>
<c:set var="total" value="${(total != null) ? total : 0}" />
<%-- 전체 페이지 수 --%>
<c:set var="totalPage" value="${(total > 0) ? Math.ceil(total / perPage) : 1}" />
<%-- 표시할 첫 번째 페이지와 마지막 페이지 계산 --%>
<c:set var="startPage" value="${((currentPage / 5) * 5) + 1}" />
<c:set var="endPage" value="${(startPage + 4 < totalPage) ? startPage + 4 : totalPage}" />


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<body>



	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="w3-content" style="max-width: 1400px">

		<!-- Grid -->
		<div class="w3-row">

			<!-- Blog entries -->
			<%-- 페이지 링크 --%>
			<form class="d-flex" action="/" method="get">
				<input type="text" name="keyword" class="form-control">
				<button type="submit" class="btn btn-dark" style="width: 70px; margin-left: 10px;">검색</button>
			</form>

			<div id="paginationBox" class="text-center">
				<div class="pagination justify-content-center">
					<ul class="pagination">
						<c:if test="${currentPage > 0}">
							<li class="page-item"><a class="page-link" href="?page=${(currentPage-4 >= 1) ? currentPage-4 : 1}">이전</a></li>
						</c:if>
						<c:forEach begin="${startPage}" end="${endPage}" step="1" var="pageNum">
							<c:choose>
								<c:when test="${pageNum == currentPage + 1}">
									<li class="page-item active"><a class="page-link" href="?page=${pageNum}">${pageNum}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="?page=${pageNum}">${pageNum}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
							<c:if test="${currentPage < totalPage - 1}">
    <li class="page-item"><a class="page-link" href="?page=${(currentPage + 5 > totalPage - 1) ? totalPage - 1 : currentPage + 5}">다음</a></li>
</c:if>
					</ul>
				</div>
			</div>
			<div class="w3-col l8 s12" style="overflow-y: scroll; height: 1000px;">
				<!-- Blog entry -->
				<c:forEach var="list" items="${elementaryList}" varStatus="loop">
					<div class="w3-card-4 w3-margin w3-white">
						<img src="/resources/image/rest2.jpg" alt="Nature" style="width: 50%">
						<div class="w3-container">
							<h3>
								<b>${list.title} </b>
							</h3>
							<h5>
								Title description, <span class="w3-opacity">${list.indate }</span>
							</h5>
						</div>

						<div class="w3-container">
							<p>${list.content }</p>
							<div class="w3-row">
								<div class="w3-col m8 s12">
									<p>
										<button class="w3-button w3-padding-large w3-white w3-border">
											<b>READ MORE »</b>
										</button>
									</p>
								</div>
								<div class="w3-col m4 w3-hide-small">
									<p>
										<span class="w3-padding-large w3-right"><b>Comments  </b> <span class="w3-tag">0</span></span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<hr>
				<!-- END BLOG ENTRIES -->
			</div>

			<!-- Introduction menu -->
			<div class="w3-col l4">
				<!-- About Card -->
				<div class="w3-card w3-margin w3-margin-top">
					<img src="/resources/image/rest2.jpg" style="width: 100%">
					<div class="w3-container w3-white">
						<h4>
							<b>${user.name }</b>
						</h4>
						<p>${user.elementarySchool }</p>
						<p>${user.middleSchool }</p>
						<p>${user.highSchool }</p>
					</div>
				</div>
				<hr>

				<!-- END Introduction Menu -->
			</div>

			<!-- END GRID -->
		</div>
		<br>

		<!-- END w3-content -->
	</div>
</body>


</html>