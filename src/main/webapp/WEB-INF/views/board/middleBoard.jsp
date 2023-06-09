<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pages" value="${totalPages}" />
<c:set var="currentPage" value="${currentPage +1 }" />
<c:set var="startPage" value="${currentPage - 5}" />
<c:set var="endPage" value="${currentPage + 5}" />

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
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container">



		<div class="row">
			<div class="btn-group btn-group-lg">
					<c:if test="${user.elementarySchool !=null && user.elementarySchool != '' }">
					<button type="button" class="btn btn-dark" onClick="location.href='/elementaryBoard'">${user.elementarySchool }</button>
				</c:if>
				<c:if test="${user.middleSchool !=null && user.middleSchool != ''}">
					<button type="button" class="btn btn-dark" onClick="location.href='/middleBoard'">${user.middleSchool }</button>
				</c:if>
				<c:if test="${user.highSchool !=null && user.highSchool != ''}">
					<button type="button" class="btn btn-dark" onClick="location.href='/highBoard'">${user.highSchool }</button>
				</c:if>
			</div>
			
		</div>
		<hr>
		<div class="container" id="middleForm">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<div class="col-sm-4 d-flex align-items-center">
						<h6 class="m-0 font-weight-bold">중학교 정보</h6>
					</div>
					<div class="col-sm-8">
						<form class="d-flex" action="/middleBoard" method="get">
							<input type="text" name="keyword" class="form-control">
							<button type="submit" class="btn btn-dark" style="width: 70px; margin-left: 10px;">검색</button>
							<c:if test="${user!=null }">
								<button type="button" class="btn btn-sm btn-success" style="width: 100px; margin-left: 10px;" onClick="location='/middleBoardWriteForm'">글작성</button>
							</c:if>
							
						</form>
					</div>
				</div>
				<div class="card-body">
					<form action="userUpdate.do" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-xl-6 col-md-6 mb-4">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold  text-uppercase mb-1">중학교 명</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">${middle.schoolName}</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-calendar fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Earnings (Monthly) Card Example -->
							<div class="col-xl-6 col-md-6 mb-4">
								<div class="card border-left-success shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold  text-uppercase mb-1">설립년도</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">${middle.schoolCreate }</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold  text-uppercase mb-1">타입</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">${middle.type}</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-calendar fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Earnings (Monthly) Card Example -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-success shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold  text-uppercase mb-1">운영상태</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">${middle.state }</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-md-6 mb-4">
								<div class="card border-left-success shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold  text-uppercase mb-1">주소</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">${middle.address }</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row justify-content-between align-items-center">
							<div id="middleMap" style="width: 100%; height: 400px;"></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41afd082520c188fdc9fe31ba85a94eb">
								
							</script>

						</div>

					</form>


				</div>

			</div>
			<!-- Blog entry -->
			<c:forEach var="list" items="${middleList}" varStatus="loop">
				<div class="w3-card-4 w3-margin w3-white">
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
			<%-- 페이지 링크 --%>
			<div id="paginationBox" class="text-center">
				<ul class="pagination" style="justify-content: center;">
					<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
						<c:choose>
							<c:when test="${i == currentPage}">
								<li class="page-link"><a href="#">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-link"><a href="/middleBoard?keyword=${keyword}&page=${i-1}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</div>





	</div>
</body>
<script>
	var markerPosition = new kakao.maps.LatLng("${middle.latitude}",
			"${middle.longitude}");
	var marker = {
		position : markerPosition
	};

	var staticMapContainer = document.getElementById('middleMap'), // 이미지 지도를 표시할 div  
	staticMapOption = {
		center : new kakao.maps.LatLng("${middle.latitude}",
				"${middle.longitude}"), // 이미지 지도의 중심좌표
		level : 3, // 이미지 지도의 확대 레벨
		marker : marker
	// 이미지 지도에 표시할 마커 
	};

	//이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer,
			staticMapOption);
</script>



</html>