<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal.user }" />

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
<body>



	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<c:if test="${user == null }">
		<img src="/resources/image/hero-bg.png" style="width: 100%">
	</c:if>
	<div class="w3-content" style="max-width: 1400px">

		<c:if test="${user != null }">
			<!-- Grid -->
			<div class="w3-row">


				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<div class="col-sm-2 d-flex align-items-center">
						<h6 class="m-0 font-weight-bold">게시글</h6>
					</div>
					<div class="col-sm-6">
						<form class="d-flex" action="/" method="get">
							<input type="text" name="keyword" class="form-control">
							<button type="submit" class="btn btn-dark" style="width: 70px; margin-left: 10px;">검색</button>
						</form>
					</div>
					<%-- 페이지 링크 --%>


				</div>


				<div class="w3-col l8 s12" style="overflow-y: scroll; height: 1000px;">
					<!-- Blog entry -->
					<c:forEach var="list" items="${elementaryList}" varStatus="loop">
						<div class="w3-card-4 w3-margin w3-white">
							<div class="w3-container">
								<h3>
									<b>${list.title} </b>
								</h3>
								<h5>
									${list.schoolName } <span class="w3-opacity">${list.indate }</span>
								</h5>
							</div>

							<div class="w3-container">
								<p>${list.content }</p>
								<div class="w3-row">
									<div class="w3-col m8 s12">
										<p>
											<button class="w3-button w3-padding-large w3-white w3-border" onclick="location.href='boardDetail?id=${list.id}'">
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
						<div class="w3-container w3-white">
							<h4>
								<b>${user.name }</b>
							</h4>
							<p>${user.role }
							<p>${user.oauth }</p>
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



			<!-- END w3-content -->
	</div>

	<!-- END BLOG ENTRIES -->
	<div id="paginationBox" class="text-center">
		<ul class="pagination" style="justify-content: center;">
			<c:if test="${currentPage > 1}">
				<li class="page-link"><a href="/?keyword=${keyword}&page=${currentPage - 2}"> Previous </a></li>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
				<c:choose>
					<c:when test="${i == currentPage}">
						<li class="page-link active"><a href="#">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-link"><a href="/?keyword=${keyword}&page=${i-1}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentPage < pages}">
				<li class="page-link"><a href="/?keyword=${keyword}&page=${currentPage}"> Next </a></li>
			</c:if>
		</ul>
	</div>
	</c:if>
	</div>

	<div style="background-color: black; color: white">
		<div class="container">
			<div class="container-fluid"></div>
			<div class="container p-5">
				<div class="row">
					<div class="col-lg-12">
						<h5>Test</h5>
						<p>test</p>
					</div>
				</div>
			</div>

			<div class="text-center p-3" style="color: white;">
				<a class="text-light" style="text-decoration: none;" href="http://infometa.kr/"> test</a>
			</div>
		</div>
	</div>
</body>


</html>