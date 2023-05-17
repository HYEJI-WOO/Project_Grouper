<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<style>
		body {
			font-family: 'Nanum Gothic', sans-serif;
		}
		.con {
			max-width: 500px;
			margin: 0 auto;
			padding: 50px;
			background-color: #FFFFFF;
			border-radius: 10px;
			text-align: center;
		}
		h1 {
			color: black;
			font-weight: bold;
			font-size: 2.0rem;
			margin-bottom: 50px;
		}
		input[type="text"], input[type="password"] {
		  display: block;
		  width: 90%;
		  padding: 10px;
		  margin: 0 auto 20px auto; /* 수평 중앙 정렬을 위해 margin 값을 수정합니다. */
		  border-radius: 5px;
		  border: 1px solid #EAEAEA;
		  font-size: 1.2rem;
		  color: #444444;
		  text-align: center; /* 입력 요소를 가운데 정렬합니다. */
		}
		
		input[type="text"]:focus, input[type="password"]:focus {
		  outline: none;
		}


		button {
		  background-color: #01DFD7; /* 배경을 흰색으로 설정합니다. */
		  color: #FFFFFF;
		  width: 90%;
		  padding: 10px;
		  border: 1px solid white; /* 테두리를 회색으로 설정합니다. */
		  border-radius: 5px;
		  font-size: 1.2rem;
		  cursor: pointer;
		  transition: background-color 0.3s ease-in-out;
		}

		a.join {
		  background-color: white; /* 배경을 흰색으로 설정합니다. */
		  color: #bd6abc;
		  width: 90%;
		  padding: 10px;
		  border: 1px solid #bd6abc; /* 테두리를 회색으로 설정합니다. */
		  border-radius: 5px;
		  font-size: 1.2rem;
		  cursor: pointer;
		  transition: background-color 0.3s ease-in-out;
		}

	</style>  

<div class="container con">
    <h1 style="margin-top: 20%;">로그인</h1>
  <form action="${contextPath}/member/login" method="post">
    <div class="form-group">
      <label>아이디 :</label>
      <input type="text" name="loginId" class="form-control" value="${loginId}">
    </div>
    <div class="form-group">
      <label>비밀번호 :</label>
      <input type="password" name="loginPwd" class="form-control">
    </div><br>

    <!-- 로그인 실패시 보일 메세지 -->
    <c:if test="${not empty errorMessage}">
      <div class="alert alert-danger">
        <strong>${errorMessage}</strong>
      </div>
    </c:if>

    <div class="form-check">
      <input type="checkbox" class="form-check-input" name="remember-me" id="remember-me">
      <label class="form-check-label" for="remember-me">로그인 상태 유지</label>
    </div><br>
    <button>로그인</button>

    <!-- csrf 토큰 -->
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  </form>
</div>

<%@ include file="../layout/footer.jsp" %>
