<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	<div class="container">
		<h2>게시글 작성</h2>
		<div class="panel panel-default">
			<div class="panel-body">
				<form id="boardWriteForm" name="boardWriteForm" class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="bg-light rounded h-100 p-4">
						<div class="form-group">
							<label class="control-label col-sm-2" for="title">제목 :</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="content">내용 :</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="content" name="content" placeholder="내용을 입력하세요" rows="5"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="writer">작성자 :</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="writer" name="writer" readonly="readonly" value="${user.name}" >
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="writer">초등학교 :</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="schoolName" name="schoolName" readonly="readonly" value="${user.elementarySchool}" >
							</div>
						</div>
						<div style="text-align: center;">
							<input type="button" value="등록" onclick="boardInsert();" class='btn btn-primary' /> <input type="button" value="리스트" onclick="location.href='/'" class='btn btn-success' />
						</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

<script>
	function boardInsert() {
		var title = $("#title").val();
		var content = $("#content").val();
		if (title == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		if (content == "") {
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
		}
		document.boardWriteForm.action = "/boardWrite";
		document.boardWriteForm.submit();
	}
</script>