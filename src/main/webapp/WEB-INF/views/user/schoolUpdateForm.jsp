<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/js/joinForm.jsp"></jsp:include>
	<div class="container">
		<div class="card shadow mb-4">
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold">학교정보 등록</h6>
			</div>
			<div class="panel-body">
				<form id="updateForm" name="updateForm" method="post" >
					<input type="hidden" id="id" name="id"value="${user.id}">
					<div class="bg-light rounded h-100 p-4">
						<div class="col-sm-11" style="display: inline-block;">
							<input type="text" class="form-control" id="elementarySchool" name="elementarySchool" value="${user.elementarySchool }" placeholder="초등학교" readonly="true">
						</div>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#elementarySchoolModal">검색</button>
					</div>
					<div class="bg-light rounded h-100 p-4">
						<div class="col-sm-11" style="display: inline-block;">
							<input type="text" class="form-control" id="middleSchool" name="middleSchool" value="${user.middleSchool }" placeholder="중학교" readonly="true">
						</div>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#middleSchoolModal">검색</button>
					</div>
					<div class="bg-light rounded h-100 p-4">
						<div class="col-sm-11" style="display: inline-block;">
							<input type="text" class="form-control" id="highSchool" name="highSchool" value="${user.highSchool }" placeholder="고등학교" readonly="true">
						</div>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#highSchoolModal">검색</button>
					</div>
			</div>

			<input type="button" class="btn btn-dark" onclick="schoolUpdate();"  value="학교등록">
			</form>
		</div>
	</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="elementarySchoolModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">초등학교 검색</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="col-sm-10" style="display: inline-block;">
						<input type="text" class="form-control" id="elementarySchoolName" name="elementarySchoolName" placeholder="학교명을 입력하세요">
					</div>
					<button type="button" class="btn btn-success" onclick="elementarySearch();">검색</button>
					<div id="schoolList" style="background-color: white; overflow: scroll; height: 500px; padding: 10px;">
				</div>
				

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="middleSchoolModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">중학교 검색</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="col-sm-10" style="display: inline-block;">
						<input type="text" class="form-control" id="middleSchoolName" name="middleSchoolName" placeholder="학교명을 입력하세요">
					</div>
					<button type="button" class="btn btn-success" onclick="middleSearch();">검색</button>
					<div id="schoolList" style="background-color: white; overflow: scroll; height: 500px; padding: 10px;">
				</div>
				

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="highSchoolModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">고등학교 검색</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="col-sm-10" style="display: inline-block;">
						<input type="text" class="form-control" id="highSchoolName" name="highSchoolName" placeholder="학교명을 입력하세요">
					</div>
					<button type="button" class="btn btn-success" onclick="highSearch();">검색</button>
					<div id="schoolList" style="background-color: white; overflow: scroll; height: 500px; padding: 10px;">
				</div>
				

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
<script>
</script>
</html>
