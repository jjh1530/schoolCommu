<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
function register() {
	var username = $("#username").val();
	var password = $("#password").val();
	var name = $("#name").val();
	if (username == "") {
		alert("아이디를 입력해주세요.");
		$("#username").focus();
		return false;
	}
	if (password == "") {
		alert("비밀번호를 입력해주세요.");
		$("#password").focus();
		return false;
	}
	if (name == "") {
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return false;
	}
	document.joinForm.action = "/join";
	document.joinForm.submit();
}

function schoolUpdate() {
	var name = $("#name").val();
	if (name == "") {
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return false;
	}
	document.updateForm.action = "/schoolUpdate";
	document.updateForm.submit();
}

	function elementarySearch() {
		var schoolName = $("#elementarySchoolName").val();
		if (schoolName == "" || schoolName == null) {
			alert("학교를 입력해주세요.");
			$("#schoolName").focus();
			return false;
		}
		$.ajax({
			url : "/schoolSelect",
			type : "post",
			data : "schoolName=" + schoolName,
			dataType : "json",
			success : schoolList,
			error : function() {
				alert("error");
			}
		});
		
		function schoolList(result) {
		    var bList = "<table class='table table-hover'>";
		    bList += "<thead>";
		    bList += "<tr>";
		    bList += "<th>학교이름</th>";
		    bList += "<th>주소</th>";
		    bList += "</tr>";
		    bList += "</thead>";
		    bList += "<tbody>";
		    $.each(result, function(index, obj) {
		      var schoolName = obj.schoolName;
		      var address = obj.address;
		      bList += "<tr>";
		      bList += "<td><button class='elemetarySchoolNameBtn' data-schoolName='" + schoolName + "'>" + schoolName + "</button></td>";
		      bList += "<td>" + address + "</td>";
		      bList += "</tr>";
		    });
		    bList += "</tbody>";
		    bList += "</table>";
		    $("#schoolList ").html(bList);

		    $(document).on("click", ".elemetarySchoolNameBtn", function() {
		        var schoolName = $(this).text();
		        console.log(schoolName);
		        $("#elementarySchool").val(schoolName); // elementarySchool 입력 필드에 선택한 학교 이름 넣기
		        $("#elementarySchoolModal").modal("hide"); // 모달 창 닫기
		    });
		  }
	}
	
	function middleSearch() {
		var schoolName = $("#middleSchoolName").val();
		if (schoolName == "" || schoolName == null) {
			alert("학교를 입력해주세요.");
			$("#schoolName").focus();
			return false;
		}
		$.ajax({
			url : "/schoolSelect",
			type : "post",
			data : "schoolName=" + schoolName,
			dataType : "json",
			success : schoolList,
			error : function() {
				alert("error");
			}
		});
		
		function schoolList(result) {
		    var bList = "<table class='table table-hover'>";
		    bList += "<thead>";
		    bList += "<tr>";
		    bList += "<th>학교이름</th>";
		    bList += "<th>주소</th>";
		    bList += "</tr>";
		    bList += "</thead>";
		    bList += "<tbody>";
		    $.each(result, function(index, obj) {
		      var schoolName = obj.schoolName;
		      var address = obj.address;
		      bList += "<tr>";
		      bList += "<td><button class='middleSchoolNameBtn' data-schoolName='" + schoolName + "'>" + schoolName + "</button></td>";
		      bList += "<td>" + address + "</td>";
		      bList += "</tr>";
		    });
		    bList += "</tbody>";
		    bList += "</table>";
		    $("#schoolList ").html(bList);

		    $(document).on("click", ".middleSchoolNameBtn", function() {
		        var schoolName = $(this).text();
		        console.log(schoolName);
		        $("#middleSchool").val(schoolName); // middleSchool 입력 필드에 선택한 학교 이름 넣기
		        $("#middleSchoolModal").modal("hide"); // 모달 창 닫기
		    });
		  }
	}
	
	function highSearch() {
		var schoolName = $("#highSchoolName").val();
		if (schoolName == "" || schoolName == null) {
			alert("학교를 입력해주세요.");
			$("#schoolName").focus();
			return false;
		}
		$.ajax({
			url : "/schoolSelect",
			type : "post",
			data : "schoolName=" + schoolName,
			dataType : "json",
			success : schoolList,
			error : function() {
				alert("error");
			}
		});
		
		function schoolList(result) {
		    var bList = "<table class='table table-hover'>";
		    bList += "<thead>";
		    bList += "<tr>";
		    bList += "<th>학교이름</th>";
		    bList += "<th>주소</th>";
		    bList += "</tr>";
		    bList += "</thead>";
		    bList += "<tbody>";
		    $.each(result, function(index, obj) {
		      var schoolName = obj.schoolName;
		      var address = obj.address;
		      bList += "<tr>";
		      bList += "<td><button class='highSchoolNameBtn' data-schoolName='" + schoolName + "'>" + schoolName + "</button></td>";
		      bList += "<td>" + address + "</td>";
		      bList += "</tr>";
		    });
		    bList += "</tbody>";
		    bList += "</table>";
		    $("#schoolList ").html(bList);

		    $(document).on("click", ".highSchoolNameBtn", function() {
		        var schoolName = $(this).text();
		        console.log(schoolName);
		        $("#highSchool").val(schoolName); // highSchool 입력 필드에 선택한 학교 이름 넣기
		        $("#highSchoolModal").modal("hide"); // 모달 창 닫기
		    });
		  }
	}
	
</script>
