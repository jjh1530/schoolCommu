<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <link rel="stylesheet" href="/resources/css/style.css">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn ">
      <h4>Please sign in</h4>
    </div>

    <!-- Login Form -->
    <form action="/login" method="post"> <!-- SecurityConfigration으로 -->
      <input type="text" id="username" class="fadeIn " name="username" placeholder="login">
      <input type="text" id="password" class="fadeIn " name="password" placeholder="password">
      <input type="submit" class="fadeIn " value="Log In">
    </form>
    <input type="button" class="fadeIn" onClick="location.href='/oauth2/authorization/google'" value="구글로그인">
    <input type="button" class="fadeIn " value="페이스북로그인">
    <input type="button" class="fadeIn " value="네이버로그인">

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="fadeIn" href="/joinForm">회원가입</a>
    </div>

  </div>

</body>
</html>

