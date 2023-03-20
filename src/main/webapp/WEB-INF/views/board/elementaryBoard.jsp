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
			
			<c:if test="${user!=null }">
				<button type="button" class="btn btn-sm btn-success" style="margin-left: 50px;" onClick="location='/elementaryBoardWriteForm'">글작성</button>
			</c:if>
		</div>
		<div class="container" id="elementaryForm">
			<div class="card shadow mb-4">
				<form action="/elementaryBoard" method="get">
					<input type="text" name="keyword"> 
					<button type="submit">검색</button>
				</form>
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold">초등학교 정보 ${totalPages }</h6>
				</div>
				<div class="card-body">
					<form action="userUpdate.do" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-xl-6 col-md-6 mb-4">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold  text-uppercase mb-1">초등학교 명</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">${elementary.schoolName}</div>
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
												<div class="h5 mb-0 font-weight-bold text-gray-800">${elementary.schoolCreate }</div>
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
												<div class="h5 mb-0 font-weight-bold text-gray-800">${elementary.type}</div>
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
												<div class="h5 mb-0 font-weight-bold text-gray-800">${elementary.state }</div>
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
												<div class="h5 mb-0 font-weight-bold text-gray-800">${elementary.address }</div>
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
							<div id="elementaryMap" style="width: 100%; height: 400px;"></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41afd082520c188fdc9fe31ba85a94eb">
								
							</script>

						</div>

					</form>


				</div>

			</div>
			<table class="table card-table">
				<tbody class="table-border-bottom-0">
					<c:forEach var="list" items="${elementaryList}" varStatus="loop">

						<form id="likeForm" name="likeForm" class="form-horizontal" method="post"></form>
						<div class="row" style="border: 2px outset rgba(0, 0, 0);">
							<div class="col-md-6 col-sm-6 col-xs-12">
								<div class="well-left">
									<div class="single-well">
										<img src="resources/image/rest2.jpg" alt="img" style="width: 50%" />
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<div class="well-middle">
									<div class="single-well">

										<h4 class="sec-head">제목 : ${list.title}</h4>
										<li><i class="bi bi-check"></i>등록 일자 : ${list.indate}<br /></li> <br>
										<pre style="overflow: scroll; height: 150px;">${list.content}</pre>
									</div>
								</div>
								<button type="button" class="btn btn-primary" onclick="">상세보기</button>
							</div>
						</div>
						<br>

					</c:forEach>

				</tbody>
			</table>
			<%-- 페이지 링크 --%>
			<ul class="pagination">
				<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
					<c:choose>
						<c:when test="${i == currentPage}">
							<li class="active"><a href="#">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/elementaryBoard?keyword=${keyword}&page=${i-1}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>





	</div>
</body>
<script>
	var markerPosition = new kakao.maps.LatLng("${elementary.latitude}",
			"${elementary.longitude}");
	var marker = {
		position : markerPosition
	};

	var staticMapContainer = document.getElementById('elementaryMap'), // 이미지 지도를 표시할 div  
	staticMapOption = {
		center : new kakao.maps.LatLng("${elementary.latitude}",
				"${elementary.longitude}"), // 이미지 지도의 중심좌표
		level : 3, // 이미지 지도의 확대 레벨
		marker : marker
	// 이미지 지도에 표시할 마커 
	};

	//이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer,
			staticMapOption);
</script>



</html>