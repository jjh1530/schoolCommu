<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="btn-group btn-group-lg">
				<c:if test="${user.elementarySchool !=null && user.elementarySchool != '' }">
					<button type="button" class="btn btn-dark" onClick="elementaryInfo()">${user.elementarySchool }</button>
				</c:if>
				<c:if test="${user.middleSchool !=null && user.middleSchool != ''}">
					<button type="button" class="btn btn-dark" onClick="middleInfo()">${user.middleSchool }</button>
				</c:if>
				<c:if test="${user.highSchool !=null && user.highSchool != ''}">
					<button type="button" class="btn btn-dark" onClick="highInfo()">${user.highSchool }</button>
				</c:if>
				<c:if test="${user.elementarySchool ==null || user.elementarySchool == '' &&
							user.middleSchool ==null || user.middleSchool == '' &&
							user.highSchool ==null || user.highSchool == ''}">
						등록된 정보가 없습니다.
						</c:if>
			</div>

			<c:if test="${user!=null }">
			<button type="button" class="btn btn-sm btn-success" style="margin-left: 50px;" onClick="location='/elementaryBoardWriteForm'">글작성</button>
			</c:if>
		</div>
		<div class="card shadow mb-4" id="elementaryForm">
			<!-- Card Header - Dropdown -->
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold">초등학교 정보</h6>
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



		<div class="card shadow mb-4" id="middleForm">
			<!-- Card Header - Dropdown -->
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold">중학교 정보</h6>
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



		<div class="card shadow mb-4" id="highForm">
			<!-- Card Header - Dropdown -->
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold">고등학교 정보</h6>
			</div>
			<div class="card-body">
				<form action="userUpdate.do" method="post" enctype="multipart/form-data">
					<div class="row">
						<div class="col-xl-6 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold  text-uppercase mb-1">고등학교 명</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${high.schoolName}</div>
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
											<div class="h5 mb-0 font-weight-bold text-gray-800">${high.schoolCreate }</div>
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
											<div class="h5 mb-0 font-weight-bold text-gray-800">${high.type}</div>
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
											<div class="h5 mb-0 font-weight-bold text-gray-800">${high.state }</div>
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
											<div class="h5 mb-0 font-weight-bold text-gray-800">${high.address }</div>
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
						<div id="highMap" style="width: 100%; height: 400px;"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41afd082520c188fdc9fe31ba85a94eb">
							
						</script>




					</div>

				</form>
			</div>
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

<script>
	var markerPosition = new kakao.maps.LatLng("${high.latitude}",
			"${high.longitude}");
	var marker = {
		position : markerPosition
	};

	var staticMapContainer = document.getElementById('highMap'), // 이미지 지도를 표시할 div  
	staticMapOption = {
		center : new kakao.maps.LatLng("${high.latitude}", "${high.longitude}"), // 이미지 지도의 중심좌표
		level : 3, // 이미지 지도의 확대 레벨
		marker : marker
	// 이미지 지도에 표시할 마커 
	};

	//이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer,
			staticMapOption);
</script>

<script>
	$(document).ready(function() {
		$("#elementaryForm").css("display", "none");
		$("#middleForm").css("display", "none");
		$("#highForm").css("display", "none");
	});

	function elementaryInfo() {
		$("#elementaryForm").css("display", "block");
		$("#middleForm").css("display", "none");
		$("#highForm").css("display", "none");
	}

	function middleInfo() {
		$("#elementaryForm").css("display", "none");
		$("#middleForm").css("display", "block");
		$("#highForm").css("display", "none");

	}
	function highInfo() {
		$("#elementaryForm").css("display", "none");
		$("#middleForm").css("display", "none");
		$("#highForm").css("display", "block");

	}
</script>
</html>