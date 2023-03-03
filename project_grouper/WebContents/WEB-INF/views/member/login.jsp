<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
  <div class="jumbotron">
    <h2>회원 로그인</h2>
  </div>
  <form action="${contextPath}/member/login" method="post">
    <div class="form-group">
      <label>아이디 :</label>
      <input type="text" name="loginId" class="form-control" value="${loginId}">
    </div>
    <div class="form-group">
      <label>비밀번호 :</label>
      <input type="password" name="loginPwd" class="form-control">
    </div>

    <!-- 로그인 실패시 보일 메세지 -->
    <c:if test="${not empty errorMessage}">
      <div class="alert alert-danger">
        <strong>${errorMessage}</strong>
      </div>
    </c:if>

    <div class="form-check">
      <input type="checkbox" class="form-check-input" name="remember-me" id="remember-me">
      <label class="form-check-label" for="remember-me">로그인 상태 유지</label>
    </div>
    <button class="btn btn-primary">로그인</button>

    <!-- csrf 토큰 -->
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  </form>
</div>

<%@ include file="../layout/footer.jsp" %>
