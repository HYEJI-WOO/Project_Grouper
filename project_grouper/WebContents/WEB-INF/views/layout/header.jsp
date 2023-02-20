<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<script src="${contextPath}/resources/js/main.js"></script>

</head>
<body>

<nav class="navbar navbar-expand-sm navbar-dark justify-content-between" style="background-color: paleturquoise">
   <a href="${contextPath}"><img src="${contextPath}/resources/images/LOGO.png" alt="LOGO" width="150" /></a>
	
   <ul class="nav nav-pills">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">모집중</a>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="#">온라인</a>
	      <a class="dropdown-item" href="#">오프라인</a>
	    </div>
  	</li>
	<li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">진행중</a>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="#">온라인</a>
	      <a class="dropdown-item" href="#">오프라인</a>
	    </div>
  	</li>	    
  </ul>
  
  <!-- 로그인,로그아웃,회원가입 -->
  <ul class="navbar-nav">
    <li class="nav-item">
    <sec:authorize access="isAnonymous()">
      <a class="nav-link" style="color: black; display: inline-block" href="${contextPath}/member/join">회원가입</a>
      <a class="nav-link" style="color: black; display: inline-block" href="${contextPath}/member/login">로그인</a>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()"><!-- 권한이 있는 경우  -->
		<p>로그인 중 : <sec:authentication property="principal.username"/></p> <!-- 로그인 id-->
		<a href="${contextPath}/member/myPage">나의정보보기</a>
		<form action="${contextPath}/member/logout" method="post"> <!-- 기본값 : /logout -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<button class="btn btn-primary">로그아웃</button>
		</form> 
	</sec:authorize>
    </li>
  </ul>
</nav>