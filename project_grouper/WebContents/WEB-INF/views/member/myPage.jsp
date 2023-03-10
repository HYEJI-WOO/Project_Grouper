<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
  <h1>멤버</h1>
  <div class="form-group">
    <label for="memberId">아이디:</label>
    <input type="text" class="form-control" id="memberId" value="${memberInfo.memberId}" disabled>
  </div>
  <div class="form-group">
    <label for="name">이름:</label>
    <input type="text" class="form-control" id="name" value="${memberInfo.name}" disabled>
  </div>
  <div class="form-group">
    <label for="email">이메일:</label>
    <input type="email" class="form-control" id="email" value="${memberInfo.email}" disabled>
  </div>
  <div class="form-group">
    <label for="phone">전화번호:</label>
    <input type="text" class="form-control" id="phone" value="${memberInfo.phone}" disabled>
  </div>
  <div class="form-group">
    <label for="address">주소:</label>
    <input type="text" class="form-control" id="address" value="${memberInfo.address}" disabled>
  </div>
  <div class="form-group">
    <label for="gender">성별:</label>
    <input type="text" class="form-control" id="gender" value="${memberInfo.gender}" disabled>
  </div>
</div>

<%@ include file="../layout/footer.jsp" %>
