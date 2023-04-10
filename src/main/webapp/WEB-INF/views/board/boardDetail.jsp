<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal.user }" />
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
					<div class="panel-body">
						<div class="panel panel-default">
							<div class="bg-light rounded h-100 p-4">
								<!--로그인 한 경우  -->
								<c:if test="${user != null }">
									<form id="replyForm" name="replyForm" class="form-horizontal" method="post">
									<input type="text" name="boardIdx" id="boardIdx" value="${vo.idx}">
									<input type="text" name="writer" id="writer" value="${vo.userName}">
									
										<div class="form-group">
											<div class="col-sm-10">
												<textarea class="form-control" id="content" name="content" placeholder="댓글을 입력하세요" rows="5"></textarea>
											</div>
										</div>
										<div style="text-align: center;">
											<input type="button" value="댓글등록" class='btn btn-primary' onclick="replyInsert()" />
										</div>
									</form>
								</c:if>
								<c:if test="${user == null }">
									<h4>댓글은 로그인 후 이용하실 수 있습니다.</h4>
								</c:if>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">댓글 리스트</div>
						<ul id="reply-box" class="list-group">
						<c:forEach var="reply" items="${reply}">
							<li id="reply-${reply.rno }" class="list-group-item d-flex justify-content-between">
								<div>${reply.content }</div>
								<div class="d-flex ">
									<div class="font-italic">${reply.writer }&nbsp;</div>
									<c:if test="${reply.writer eq principal.user.username}">
										<button onClick="index.replyDelete(${board.idx}, ${reply.rno })" class="badge">삭제</button>
									</c:if>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function replyInsert() {
		var content = $("#content").val();
		if (content == "") {
			alert("댓글을 입력해주세요.");
			$("#content").focus();
			return false;
		}
	
		document.replyForm.action = "/replyWrite";
		document.replyForm.submit();
	}
</script>

</html>