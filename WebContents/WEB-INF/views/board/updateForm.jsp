<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
  <h3>상세내용 수정</h3>
  <p>※ 상세내용만 수정 가능합니다. 다른 내용을 수정하고 싶으시면 삭제 후 다시 개설해주세요.</p>
  
  <form class="updateBoardForm" action="${contextPath}/board/update" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <input type="hidden" name="bno" value="${b.bno}">
    <input type="hidden" name="page" value="${param.page}">
    
    <textarea rows="10" name="details" class="form-control">${b.details}</textarea>
    
    <div style="text-align: right;">
      <button class="btn btn-primary modBoard" type="submit">수정</button>
      <a href="${contextPath}/board/detail?bno=${b.bno}&page=${param.page}" class="btn btn-secondary click">취소</a>
    </div>
    
  </form>	
  
  
  
</div>


<%@ include file="../layout/footer.jsp" %>

