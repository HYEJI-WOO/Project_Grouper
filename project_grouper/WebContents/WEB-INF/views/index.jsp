<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="layout/header.jsp" %>

<div class="container">
	<h1>메인</h1>
	<sec:authorize access="isAuthenticated()"><!-- 권한이 있는 경우  -->
		<sec:authorize access="hasAnyRole('ROLE_ASSOCIATE_MEMBER')">
			<a href="${contextPath}/board/write" class="btn btn-primary">작성</a>
		</sec:authorize>
	</sec:authorize>		
</div>
	

<%@ include file="layout/footer.jsp" %>
