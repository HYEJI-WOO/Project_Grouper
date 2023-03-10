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
<script>const contextPath = '${contextPath}';</script>
<script src="${contextPath}/resources/js/main.js"></script>

</head>
<body>

<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #b6faf8; height: 100px">
  <div class="container-fluid d-flex justify-content-center align-items-center h-100">
    <a class="navbar-brand" href="${contextPath}">
      <img src="${contextPath}/resources/images/GROUPER.png" alt="GROUPER" width="200"/>
    </a>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <sec:authorize access="isAnonymous()">
          <a class="nav-link" style="color: black; display: inline-block" href="${contextPath}/member/join">회원가입</a>
          <a class="nav-link" style="color: black; display: inline-block" href="${contextPath}/member/login">로그인</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
          <div class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              <span style="color: black;">★<sec:authentication property="principal.username"/>님★</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
              <sec:authorize access="hasAnyRole('ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')">
                <a class="dropdown-item" href="${contextPath}/member/myPage">나의정보보기</a>
              </sec:authorize>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
                <a class="dropdown-item" href="${contextPath}/member/admin">관리자페이지</a>
              </sec:authorize>
              <div class="dropdown-divider"></div>
              <form class="px-4 py-2" action="${contextPath}/member/logout" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <button class="btn btn-primary">로그아웃</button>
              </form>
            </div>
          </div>
        </sec:authorize>
      </li>
    </ul>
  </div>
</nav>

