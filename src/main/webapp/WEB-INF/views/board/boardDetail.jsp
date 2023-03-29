<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container">


		<div class="container" id="elementaryForm">
			<div class="card shadow mb-4">

				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<div class="col-sm-4 d-flex align-items-center">
						<h6 class="m-0 font-weight-bold">${vo.schoolName }</h6>
					</div>
				</div>
				<div class="card-body">
					<form action="userUpdate.do" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-xl-12 col-md-6 mb-4">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold  text-uppercase mb-1">제목</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">${vo.title }</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-calendar fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>


						</div>

						<div class="row">
							<div class="col-xl-6 col-md-6 mb-4">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold  text-uppercase mb-1">작성일</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">${vo.indate }</div>
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
												<div class="text-xs font-weight-bold  text-uppercase mb-1">작성자</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">${vo.userName }</div>
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
							<div class="col-xl-12 col-md-6 mb-4">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold  text-uppercase mb-1">내용</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">${vo.content }</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-calendar fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<input type="button" value="뒤로가기" onclick="history.back();" />
						
					</form>


				</div>

			</div>

		</div>





	</div>
</body>

</html>