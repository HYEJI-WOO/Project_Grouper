<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
		<h1>멤버</h1>
		${memberInfo.memberId}<br>
		${memberInfo.name}<br>
		${memberInfo.email}<br>
		${memberInfo.phone}<br>
		${memberInfo.address}<br>
		${memberInfo.gender}<br>
	</div>

</div>

<%@ include file="../layout/footer.jsp" %>
