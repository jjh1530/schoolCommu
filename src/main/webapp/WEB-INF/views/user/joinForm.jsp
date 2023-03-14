<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container">
		<div class="card shadow mb-4">
			<!-- Card Header - Dropdown -->
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold">회원가입</h6>
			</div>
			<div class="panel-body">
				<form method="post" action="join" >
					<div class="bg-light rounded h-100 p-4">
						<div class="col-sm-12">
							<input type="text" class="form-control" id="username" name="username" placeholder="아이디를 입력하세요">
						</div>
					</div>
					<div class="bg-light rounded h-100 p-4">
						<div class="col-sm-12">
							<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요">
						</div>
					</div>
					<div class="bg-light rounded h-100 p-4">
						<div class="col-sm-12">
							<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
						</div>
					</div>
					<input type="submit" class="btn btn-primary" value="회원가입">
				</form>
			</div>
		</div>
	</div>

</body>
</html>

