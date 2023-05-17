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

<div class="container" >
        <h2 style="text-align: center; margin-top: 5%;"><b>회원가입</b></h2>


    <form action="${contextPath}/member/join" method="post" onsubmit="return checked()">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        
	<div class="col-sm-9" style="margin-top: 5%; margin-left: 10%;">
		<hr style="border-top: 2px solid grey;">
		<div class="form-group">
			<div class="row">
				<div class="col-sm-3">
					<h4>아이디</h4>
				</div>
				<div class="col-sm-6">
			<input type="text" class="form-control" name="memberId" id="memberId" maxlength="12" onkeyup="check_id()" pattern="[a-zA-Z0-9]{4,12}" title="4~12자의 영문 대소문자, 숫자만 입력하세요"   style="font-size:20px;" required>
			</div>
			<div class="col-sm-1">
			<input type="button" class="form-control checkId" style="width:100px; height:43px; background-color: white; color: #bd6abc; border: 1px solid #bd6abc;" value="중복확인">
			</div>
			<input type="hidden" id="idDuplication" name="idDuplication" value=""/>
			<span id="id_check_msg" style="text-align: center; display: block; margin: 0 auto;"></span>
		</div>
		</div>
        
		<div class="form-group">
			<div class="row">
				<div class="col-sm-3">
	    			<h4>비밀번호</h4>
	    		</div>
	    		<div class="col-sm-6">
            <input type="password" class="form-control" id="password" name="password" onkeyup="check_pwd()" maxlength="16" pattern="[a-zA-Z0-9!~^]{4,16}" title="4~16자의 영문 대소문자, 숫자, 특수문자(!~^)만 입력하세요." style="font-size:20px;" required>
        </div>
        </div>
        </div>
        
		<div class="form-group">
			<div class="row">
				<div class="col-sm-3">
					<h4>비밀번호 확인</h4>
				</div>
				<div class="col-sm-6">
            <input type="password" class="form-control" id="pwdCheck" name="pwdCheck" onkeyup="check_pwd()" maxlength="16" style="font-size:20px;" required> 
            <span id="pwd_check_msg" style="text-align: center; display: block; margin: 0 auto;"></span>
        </div>
        </div>
        </div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-3">
					<h4>이름</h4>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="name" value="" pattern="[가-힣]{2,17}" title="EX) 홍길동" style="font-size:20px;" required> 
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-3">
					<h4>이메일</h4>
				</div>
				<div class="col-sm-6">
					<input type="email" class="form-control" name="email" value="" pattern="[A-Za-z0-9_]*[@]{1}[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}" title="EX) example@example.com" style="font-size:20px;" required>
				</div>
			</div> 
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-3">
					<h4>휴대폰 번호</h4>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="phone" value="" pattern="^01([0|1]{1})([0-9]{4})([0-9]{4})$" title="EX) 01012345678" style="font-size:20px;" placeholder="'-'없이 작성해주세요." required> 
				</div>		
			</div>
		</div>	
<div class="form-group">
			<div class="row">
				<div class="col-sm-3">
					<h4>생년월일</h4>
				</div>
				<div class="col-sm-2">
					<select class="form-control" id="year" name="year" style="font-size:20px;" required>
						  <option value="">년</option>
						  <c:forEach var="year" begin="1920" end="2023">
						    <option value="${year}">${year}</option>
						  </c:forEach>			
					</select>
				</div>
				<div class="col-sm-2">
					<select class="form-control" id="month" name="month" style="font-size:20px;" required>
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
				</div>
				<div class="col-sm-2">
					<select class="form-control" id="day" name="day" style="font-size:20px;" required>
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
		</div>

		<div class="form-group">
			<div class="row">
				<div class="col-sm-3">
					<h4>거주지역</h4>
				</div>
				<div class="col-sm-6">
		  <select name="address" class="form-control" style="font-size:20px;" required>
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
		</div>
		</div>
		
		
		<div class="form-group">
			<div class="row">
				<div class="col-sm-3">
					<h4>성별</h4>
				</div>
				<div class="col-sm-6">
					<select class="form-control" name="gender" class="form-control" style="font-size:20px;" required>
						<option value="남자">남자</option>
						<option value="여자">여자</option>
					</select>
				</div>
			</div>
		</div>
		</div>
	<div class="form-group" align="center"> 
		<input type="submit" class="form-control" style="width:100px; height:43px; display:inline; background-color: #bd6abc; color: #FFFFFF; border: 1px solid white;" value="회원가입"> 
		<input type="reset" class="reset form-control" style="width:100px; height:43px; display:inline; background-color: white; color: #bd6abc; border: 1px solid #bd6abc;" value="다시 입력"> 
	</div> 
	</form>
</div>


<%@ include file="../layout/footer.jsp" %>

<script>

$(function() {
	$('.checkId').on('click', function(){
	var userId = document.getElementById('memberId').value;
	var idReg = /^[A-za-z0-9]{4,12}$/g;
	if(userId != '' && idReg.test(userId) ) {
		$.ajax({
			type : 'get',
			url : `${contextPath}/member/idCheck`,
			data : {id : userId},
			success : function(result) {
				if(result == 1 && userId.length > 3) {
					document.getElementById('id_check_msg').innerHTML = "<font color=red>이미 사용중인 아이디입니다.</font>";
					document.getElementById('idDuplication').value = "idUncheck";
				} else if(result == 0 && userId.length > 3) {
					document.getElementById('id_check_msg').innerHTML = "<font color=blue>사용할 수 있는 아이디입니다.</font>";
					document.getElementById('idDuplication').value = "idChecked";
				} else if(!idReg.test(userId.val())) {
					alert('오류')
				}else {
					alert('네 자리 이상 작성해주세요. ');
					document.getElementById('idDuplication').value = "idUncheck";
				} 
			},
			error : function() {
				alert('중복확인 실패')
			}
		})
		} else if(!idReg.test(userId)){
			document.getElementById('id_check_msg').innerHTML = "<font color=red>4~12자의 영문 대소문자, 숫자만 입력하세요.</font>";
			document.getElementById('idDuplication').value = "idUncheck";
			
		} else {
			alert('아이디를 입력하세요')
			document.getElementById('id_check_msg').innerHTML = "";
			document.getElementById('idDuplication').value = "idUncheck";
		} 
		 
	})
})

function check_pwd(){  //비밀번호 확인 
    var pwd = document.getElementById('password').value; 
    var pwd_check = document.getElementById('pwdCheck').value; 
 
    if (pwd!=pwd_check) { 
      document.getElementById('pwd_check_msg').innerHTML = "<font color=red>비밀번호가 일치하지 않습니다.</font>"; 
    } 
    else { 
        document.getElementById('pwd_check_msg').innerHTML = "<font color=blue>비밀번호가 일치합니다.</font>"; 
    } 
    
    if (pwd_check=="") { 
      document.getElementById('pwd_check_msg').innerHTML = ""; 
    } 
 }
 
function check_id(){  //아이디 중복 확인 
    var id = document.getElementById('memberId').value;  
    
    if (id=="") { 
      document.getElementById('idDuplication').value = ""; 
    }
    
	$("#memberId").on("propertychange change keyup paste input", function(){
		document.getElementById('idDuplication').value = "idUncheck";
		document.getElementById('id_check_msg').innerHTML = "";
	});     
	     
}

function checked(){  //form 유효성 검사 

	var pwd = document.getElementById('password'); 
	var pwd_check = document.getElementById('pwdCheck'); 

	if(document.getElementById('idDuplication').value == "idUncheck" || document.getElementById('idDuplication').value == "") {
		alert("아이디 중복체크를 해주세요.")
		return false;
	}

	if (pwd.value != pwd_check.value) {  //비밀번호 확인 
	  alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요."); 
	  pwd_check.focus(); 
	  return false; 
	}  

	else { 
	  return true; 
	}

	}
$(function(){
	
	$('.reset').on('click', function(){
		document.getElementById('id_check_msg').innerHTML = "";
		document.getElementById('pwd_check_msg').innerHTML = ""; 
	})
})	
</script>