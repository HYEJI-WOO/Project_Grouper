<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div class="container">
	<div class="jumbotron">
		<h1>개인정보수정</h1>
	</div>
   <div class="row">
    <div class="col-sm-3" style="margin-top: 3%;">
    <h1>MyPage</h1>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link" href="${contextPath}/member/myPage">개인정보수정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${contextPath}/board/joinedGroup">내가 가입한 그룹</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${contextPath}/board/createdGroup">내가 만든 그룹</a>
        </li>        
      </ul>
    </div>  
    
   <div class="col-sm-9" style="margin-top: 8.7%;">
  <form id="viewForm" class="container" action="${contextPath}/member/modMember" method="post">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	  
	  <div class="form-group">
		  <div class="row">
		    <div class="col-sm-2">
		      <h5><b>아이디</b></h5>
		    </div>	  
	    <div class="col-sm-10">
	    	<input type="hidden" name="memberId" value="${memberInfo.memberId}">
	    	<input type="text" class="form-control" id="memberId"  value="${memberInfo.memberId}" disabled>
	 	</div>
	  </div>
	  </div>
	  <div class="form-group">
	  		  <div class="row">
		    <div class="col-sm-2">
		      <h5><b>이름</b></h5>
		    </div>	  
		    <div class="col-sm-10">
	    <input type="text" class="form-control" id="name" value="${memberInfo.name}" disabled>
	  </div>
	  </div>
	  </div>
	  <div class="form-group">
	  		  <div class="row">
		    <div class="col-sm-2">
		      <h5><b>이메일</b></h5>
		    </div>	  
		    <div class="col-sm-10">
		  <input type="email" class="form-control" id="email" name="email" value="${memberInfo.email}" pattern="^[a-zA-Z0-9+-.]+@[a-zA-Z0-9-]+(.[a-zA-Z0-9-]+)*.[a-zA-Z]{2,6}$" title="EX) example@example.com">
		</div>
		</div>
		</div>
	  <div class="form-group">
	  		  <div class="row">
		    <div class="col-sm-2">
		      <h5><b>휴대폰 번호</b></h5>
		    </div>	  
		    <div class="col-sm-10">
		  <input type="text" class="form-control" id="phone" name="phone" value="${memberInfo.phone}" pattern="^01([0|1]{1})([0-9]{4})([0-9]{4})$" title="EX) 01012345678">
		</div>
		</div>
		</div>

 		
		<div class="form-group">
		  <div class="row">
		    <div class="col-sm-2">
		      <h5><b>생년월일</b></h5>
		    </div>
		    <div class="col-sm-10">
		      <div class="row">
		        <div class="col-sm-4">
			<select class="form-control" id="year" name="year" disabled required>
				  <option value="${memberInfo.year}" hidden>${memberInfo.year}</option>
				  <c:forEach var="year" begin="1920" end="2023">
				    <option value="${year}">${year}</option>
				  </c:forEach>			
			</select>
			</div>
			<div class="col-sm-4">
			<select class="form-control" id="month" name="month" disabled required>
				<option value="${memberInfo.month}" hidden>${memberInfo.month}</option>
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
			</div>
			<div class="col-sm-4">
			<select class="form-control" id="day" name="day" disabled required>
				<option value="${memberInfo.day}" hidden>${memberInfo.day}</option>
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
		</div>
		</div>
		</div>
			  
	  
		<div class="form-group">
		  <div class="row">
		    <div class="col-sm-2">
		      <h5><b>거주지역</b></h5>
		    </div>
		    <div class="col-sm-10">
		    <select name="address" class="form-control" name="address" required>
		        <option value="">선택하세요</option>
		        <option value="서울" ${memberInfo.address == "서울" ? "selected" : ""}>서울</option>
		        <option value="경기" ${memberInfo.address == "경기" ? "selected" : ""}>경기</option>
		        <option value="인천" ${memberInfo.address == "인천" ? "selected" : ""}>인천</option>
		        <option value="강원" ${memberInfo.address == "강원" ? "selected" : ""}>강원</option>
		        <option value="충북" ${memberInfo.address == "충북" ? "selected" : ""}>충북</option>
		        <option value="충남" ${memberInfo.address == "충남" ? "selected" : ""}>충남</option>
		        <option value="대전" ${memberInfo.address == "대전" ? "selected" : ""}>대전</option>
		        <option value="경북" ${memberInfo.address == "경북" ? "selected" : ""}>경북</option>
		        <option value="경남" ${memberInfo.address == "경남" ? "selected" : ""}>경남</option>
		        <option value="부산" ${memberInfo.address == "부산" ? "selected" : ""}>부산</option>
		        <option value="울산" ${memberInfo.address == "울산" ? "selected" : ""}>울산</option>
		        <option value="대구" ${memberInfo.address == "대구" ? "selected" : ""}>대구</option>
		        <option value="전북" ${memberInfo.address == "전북" ? "selected" : ""}>전북</option>
		        <option value="전남" ${memberInfo.address == "전남" ? "selected" : ""}>전남</option>
		        <option value="광주" ${memberInfo.address == "광주" ? "selected" : ""}>광주</option>
		        <option value="제주" ${memberInfo.address == "제주" ? "selected" : ""}>제주</option>
		    </select>
		    </div>
		    </div>
		    
		</div>

		<div class="form-group">
		  <div class="row">
		    <div class="col-sm-2">
		      <h5><b>성별</b></h5>
		    </div>
		    <div class="col-sm-10">
	    <input type="text" class="form-control" id="gender" value="${memberInfo.gender}" disabled>
	  </div>
	  </div>
	  </div>
	  

		<div>
			<button type="button" class="btn btn-info float-right toModForm">수정하기</button>
		</div>
<div class="viewMode">
    <button type="button" class="btn btn-secondary float-right backViewMode" style="margin-left: 5px;">취소</button>
    <input type="submit" class="btn btn-primary float-right" value="수정">
</div>

  
	  
  </form>
  </div>
</div>
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
$(function() {
	$('.viewMode').hide();
	$('.modAddr').hide();
	$('input[name="email"],input[name="phone"],select[name="address"]').prop("disabled", true);
	
	let viewForm = $('#viewForm');
	
	let emailObj = $('input[name="email"]');
	let phoneObj = $('input[name="phone"]');
	let addressObj = $('select[name="address"]');
	
	let emailVal = emailObj.val();
	let phoneVal = phoneObj.val();
	let addressVal = addressObj.val(); 
	
	// 수정모드
	$('.toModForm').on('click', function(){
		$('input[name="email"],input[name="phone"],select[name="address"]').prop("disabled", false);
		$('.originAddr').hide();
		$('.modAddr').show();
		$('.toModForm').hide();
		$('.viewMode').show();
	});
	
	
	// 뷰모드
	$('.backViewMode').on('click', function(){
		$('input[name="email"],input[name="phone"],select[name="address"]').prop("disabled", true);
		$('.viewMode').hide();
		$('.toModForm').show();
		$('.modAddr').hide();
		$('.originAddr').show();
		emailObj.val(emailVal);
		addressObj.val(addressVal);
		phoneObj.val(phoneVal);
	});
	
});
</script>