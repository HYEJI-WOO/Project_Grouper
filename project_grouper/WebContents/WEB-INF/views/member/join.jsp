<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
		<h1>회원가입</h1>
	</div>
	<form action="${contextPath}/member/join" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<h5>아이디</h5>
		<div class="form-group">
			<input type="text" name="memberId" class="form-control" placeholder="아이디">
		</div>
		<h5>비밀번호</h5>
		<div class="form-group">
			<input type="password" name="password" class="form-control" placeholder="비밀번호">
		</div>
		<h5>비밀번호 확인</h5>
		<div class="form-group">
			<input type="password" name="pwdCheck" class="form-control" placeholder="비밀번호 확인">
		</div>
		<h5>이름</h5>
		<div class="form-group">
			<input type="text" name="name" class="form-control" placeholder="이름">
		</div>
		<h5>이메일</h5>
		<div class="form-group">
			<input type="text" name="email" class="form-control" placeholder="이메일">
		</div>
		<h5>휴대전화</h5>
		<div class="form-group">
			<input type="text" name="phone" class="form-control" placeholder="휴대전화">
		</div>
		<h5>생년월일</h5>
		<div class="form-group">
			<input type="text" name="birth" class="form-control" placeholder="생년월일">
		</div>
		<h5>거주지역</h5>
		<div class="form-group">
			<input type="text" name="address" class="form-control" placeholder="거주지역">
		</div>
		<h5>성별</h5>
		<div class="form-group">
			<input type="text" name="gender" class="form-control" placeholder="성별">
		</div>
		
		<button class="btn btn-primary">회원가입</button>
	</form>
</div>

<%@ include file="../layout/footer.jsp" %>
