<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">

	
	<form class="updateBoardForm" action="${contextPath}/board/update" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		<input type="hidden" name="bno" value="${b.bno}">
		<input type="text" name="groupName" class="form-control" value="${b.groupName}">
		<textarea rows="10" name="details" class="form-control">${b.details}</textarea>
		
		<div style="text-align: right;">
			<button class="btn btn-primary modBoard" type="submit">수정</button>
			<a href="${contextPath}" class="btn btn-secondary">취소</a>
		</div>
		
		
	</form>	
	

</div>




<%@ include file="../layout/footer.jsp" %>
