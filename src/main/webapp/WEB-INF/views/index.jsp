<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pages" value="${totalPages}" />
<c:set var="currentPage" value="${currentPage +1 }" />
<c:set var="startPage" value="${currentPage - 5}" />
<c:set var="endPage" value="${currentPage + 5}" />

<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal.user }" />
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
				<ul class="pagination" style="justify-content: center;">
					<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
						<c:choose>
							<c:when test="${i == currentPage}">
								<li class="page-link"><a href="#">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-link"><a href="/?keyword=${keyword}&page=${i-1}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
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