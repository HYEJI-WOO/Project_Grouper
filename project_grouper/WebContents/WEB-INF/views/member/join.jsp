<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<style>
    .email-inputs {
        display: flex;
        align-items: center;
    }
    .email-inputs input,
    .email-inputs select {
        flex: 1;
    }
</style>

<div class="container">
    <div class="jumbotron">
        <h1>회원가입</h1>
    </div>
    <form action="${contextPath}/member/join" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <h5>아이디</h5>
        <div class="form-group">
            <input type="text" name="memberId" class="form-control col-md-6" placeholder="아이디">
        </div>
        <h5>비밀번호</h5>
        <div class="form-group">
            <input type="password" name="password" class="form-control col-md-6" placeholder="비밀번호">
        </div>
        <h5>비밀번호 확인</h5>
        <div class="form-group">
            <input type="password" name="pwdCheck" class="form-control col-md-6" placeholder="비밀번호 확인">
        </div>
        <h5>이름</h5>
        <div class="form-group">
            <input type="text" name="name" class="form-control col-md-6" placeholder="이름">
        </div>
        <h5>이메일</h5>
		<div class="form-group">
		    <input type="email" name="email" class="form-control col-md-6" placeholder="이메일">
		</div>
        <h5>휴대전화</h5>
        <div class="form-group">
            <input type="text" name="phone" class="form-control col-md-6" placeholder="휴대전화">
        </div>
		<div class="form-group">
		    <h4>생년월일</h4>
		    <div style="margin-top: 10px;">
		        <select class="form-control" id="year" name="year" style="display: inline-block; width:150px; height:40px;font-size:16px;" required>
		            <option value="">년</option>
		            <c:forEach var="year" begin="1920" end="2023">
		                <option value="${year}">${year}</option>
		            </c:forEach>             
		        </select>
		        <select class="form-control" id="month" name="month" style="display: inline-block; width:120px; height:40px;font-size:16px;" required>
		            <option value="">월</option>
		            <c:forEach var="month" begin="1" end="12">
		                <c:choose>
		                    <c:when test="${month lt 10 }">
		                        <option value="0${month}">0${month}</option>
		                    </c:when>
		                    <c:otherwise>
		                        <option value="${month}">${month}</option>
		                    </c:otherwise>
		                </c:choose>
		            </c:forEach>    
		        </select>
		        <select class="form-control" id="day" name="day" style="display: inline-block; width:120px; height:40px;font-size:16px;" required>
		            <option value="">일</option>
		            <c:forEach var="day" begin="1" end="31">
		                <c:choose>
		                    <c:when test="${day lt 10 }">
		                        <option value="0${day}">0${day}</option>
		                    </c:when>
		                    <c:otherwise>
		                        <option value="${day}">${day}</option>
		                    </c:otherwise>
		                </c:choose>
		            </c:forEach>    
		        </select>
		    </div>
		</div>

		<h5>거주지역</h5>
		<div class="form-group">
		  <select name="address" class="form-control col-md-6">
		    <option value="">선택하세요</option>
		    <option value="서울">서울</option>
		    <option value="경기">경기</option>
		    <option value="인천">인천</option>
		    <option value="강원">강원</option>
		    <option value="충북">충북</option>
		    <option value="충남">충남</option>
		    <option value="대전">대전</option>
		    <option value="경북">경북</option>
		    <option value="경남">경남</option>
		    <option value="부산">부산</option>
		    <option value="울산">울산</option>
		    <option value="대구">대구</option>
		    <option value="전북">전북</option>
		    <option value="전남">전남</option>
		    <option value="광주">광주</option>
		    <option value="제주">제주</option>
		  </select>
		</div>
		
		<h5>성별</h5>
		<div class="form-group">
		  <div class="form-check">
		    <input class="form-check-input" type="radio" name="gender" id="male" value="남자" checked>
		    <label class="form-check-label" for="male">
		      남자
		    </label>
		  </div>
		  <div class="form-check">
		    <input class="form-check-input" type="radio" name="gender" id="female" value="여자">
		    <label class="form-check-label" for="female">
		      여자
		    </label>
		  </div>
		</div>
		
		<button class="btn btn-primary">회원가입</button>
	</form>
</div>


<%@ include file="../layout/footer.jsp" %>