<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<li class="nav-item"><a class="nav-link" href="/">main</a></li>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon "></span>
		</button>

		<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
			<ul class="navbar-nav">

					<c:if test="${SPRING_SECURITY_CONTEXT.authentication.principal == null}">
					<li class="nav-item"><a class="nav-link" href="/loginForm">로그인</a></li>
					</c:if>
					<c:if test="${SPRING_SECURITY_CONTEXT.authentication.principal != null}">
					<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
					</c:if>
			</ul>
		</div>
	</nav>
	<br />
</body>
</html>