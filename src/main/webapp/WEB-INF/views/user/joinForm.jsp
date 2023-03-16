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
				<form method="post" action="join">
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
					<div class="bg-light rounded h-100 p-4">
						<div class="col-sm-11" style="display: inline-block;">
							<input type="text" class="form-control" id="elementarySchool" name="elementarySchool" placeholder="초등학교명을 입력하세요">
						</div>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
						  검색
						</button> 
					</div>

					<input type="submit" class="btn btn-primary" value="회원가입">
				</form>
			</div>
		</div>
	</div>



<!-- The Modal -->
  <div class="modal" id="myModal">
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
				<input type="text" class="form-control" id="schoolName" name="schoolName" placeholder="학교명을 입력하세요">
			</div>
			<button type="button" class="btn btn-success" onclick="test();">검색</button>
        </div>
         <div id="schoolList" style="background-color: white; overflow: scroll; height:500px; padding:10px;">
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
<script>
function test() {
	var schoolName = $("#schoolName").val();
	if (schoolName == "" || schoolName == null) {
		alert("학교를 입력해주세요.");
		$("#schoolName").focus();
		return false;
	}
	$.ajax({
		url : "/schoolSelect",
		type : "post",
		data : "schoolName=" + schoolName ,
		success : function(result) {
			 var bList="<table class='table table-hover'>";
		  	 bList+="<thead>";
		  	 bList+="<tr>";
		  	 bList+="<th>학교이름</th>";
		  	 bList+="<th>주소</th>";
		  	 bList+="</tr>";
		  	 bList+="</thead>";
		  	 bList+="<tbody>";
		  	$.each(result.documents,function(index, obj){
		  		var schoolName = obj.schoolName;
		  	    var address = obj.address;
		        bList+="<tr>";
		        bList+="<td>"+schoolName+"</td>";
		        bList+="<td>"+address+"</td>";
		        bList+="</tr>";
		    }); 
		  	 bList+="</tbody>";
		  	 bList+="</table>";
		  	 $("#schoolList ").html(bList);
		},
		error : function() {
			alert("error");
		}
	});
}
</script>
</html>
