<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
  <div class="jumbotron">
    <h1>작성 페이지</h1>
  </div>

  <div class="form-group">
    <label for="group-name">그룹명:</label>
    <input type="text" class="form-control" id="group-name">
  </div>

  <div class="form-group">
    <label for="category">카테고리:</label>
    <input type="text" class="form-control" id="category">
  </div>

  <div class="form-group">
    <label>온/오프라인:</label>
    <div class="form-check">
      <input type="radio" class="form-check-input" id="online" name="location" value="online">
      <label class="form-check-label" for="online">온라인</label>
    </div>
    <div class="form-check">
      <input type="radio" class="form-check-input" id="offline" name="location" value="offline">
      <label class="form-check-label" for="offline">오프라인</label>
    </div>
  </div>

  <div class="form-group">
    <label for="capacity">모집인원:</label>
    <input type="text" class="form-control" id="capacity">
  </div>

  <div class="form-group">
    <label for="details">상세내용:</label>
    <textarea class="form-control" id="details" rows="5"></textarea>
  </div>
</div>

<%@ include file="../layout/footer.jsp" %>
