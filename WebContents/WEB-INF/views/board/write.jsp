<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
	  <h1>그룹만들기</h1>
	</div>
	
	<form action="${contextPath}/board/write" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		<div class="form-group">
		  <label for="groupName"><b>그룹명:</b></label>
		  <input type="text" class="form-control" id="groupName" name="groupName" required>
		</div>
		
		<div class="form-group">
		<label for="category"><b>카테고리:</b></label>
			<select id="category" class="form-control" name="category" required>
				<option value="">--선택하세요--</option>
				<option value="study">공부</option>
				<option value="game">게임</option>
				<option value="sports">운동</option>
				<option value="travel">여행</option>
				<option value="hobby">취미</option>
				<option value="music">음악</option>
				<option value="read">독서</option>
				<option value="social">사교</option>
				<option value="volunteer">봉사</option>
				<option value="other">기타</option>
			</select>    
		</div>
	
		<div class="form-group">
		  <label><b>온/오프라인:</b></label>
		  <div class="form-check">
		    <input type="radio" class="form-check-input" id="online" name="location" value="online" required onclick="document.getElementById('offlineLocation').removeAttribute('required');document.getElementById('region').removeAttribute('required', '');">
		    <label class="form-check-label" for="online">온라인</label>
		  </div>
		  <div class="form-check">
		    <input type="radio" class="form-check-input" id="offline" name="location" value="offline" onclick="document.getElementById('offlineLocation').setAttribute('required', '');document.getElementById('region').setAttribute('required', '');">
		    <label class="form-check-label" for="offline">오프라인</label>
		  </div>
		</div>		
		
		<div id="region-input" class="form-group" style="display: none;">
		  <label for="region"><b>지역:</b></label>
		  <select class="form-control" id="region" name="region">
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
		    <option value="대구">대구</option>
		    <option value="울산">울산</option>
		    <option value="부산">부산</option>
		    <option value="전북">전북</option>
		    <option value="전남">전남</option>
		    <option value="광주">광주</option>
		    <option value="제주">제주</option>
		  </select>
		</div>			
				
		<div id="offline-input" class="form-group" style="display: none;">
		  <label for="offlineLocation"><b>오프라인 장소:</b></label>
		  <input type="text" class="form-control" id="offlineLocation" name="offlineLocation">
		</div>		
	
		<div class="form-group">
		  <label for="capacity"><b>그룹인원:</b> ※ 자신을 포함한 인원 수를 입력해주세요.</label>
		  <input type="number" class="form-control" id="capacity" name="capacity" min="2" max="100" step="1" placeholder="최소 2명, 최대 100명" onchange="validateCapacity()" required>
		</div>
	  
		<div class="form-group">
		  <label for="startDate"><b>시작일:</b></label>
		  <input type="date" class="form-control" id="startDate" name="startDate" required>
		</div>  
	
		<div class="form-group">
		  <label for="details"><b>상세내용:</b></label>
		  <textarea class="form-control" id="details" rows="5" name="details" required></textarea>
		</div>
		
		<div class="form-group">
			<label for="author"><b>작성자:</b></label>
			<input type="text" class="form-control" id="author" name="author" value="<sec:authentication property="principal.username"/>" readonly>
		</div>
		
		<div style="text-align: right;">
			<button class="btn btn-primary" id="submit-btn">작성</button>
			<a href="${contextPath}" class="btn btn-secondary">취소</a>
		</div>
		
		<input type="hidden" id="isStarted" name="isStarted" value="N">
		<input type="hidden" id="currentParticipants" name="currentParticipants" value=1>
		
	</form>
  
</div>

<%@ include file="../layout/footer.jsp" %>

<script>

	const onlineRadio = document.getElementById('online');
	const offlineRadio = document.getElementById('offline');
	const offlineInput = document.getElementById('offline-input');
	const regionInput = document.getElementById('region-input');
	const offlineLocation = document.getElementById('offlineLocation');
	const region = document.getElementById('region');
	
	offlineRadio.addEventListener('click', () => {
	  offlineInput.style.display = 'block';
	  regionInput.style.display = 'block';
	});
	
	onlineRadio.addEventListener('click', () => {
	  offlineInput.style.display = 'none';
	  regionInput.style.display = 'none';
	  offlineLocation.value='';
	  region.value='';
	});

  
	function validateCapacity() {
	  var capacityInput = document.getElementById("capacity");
	  var capacity = capacityInput.value;
	  
	  if (capacity < 2) {
	    capacityInput.value = 2;
	    alert("모집인원은 최소 2명 이상이어야 합니다.");
	  } else if (capacity > 100) {
	    capacityInput.value = 100;
	    alert("모집인원은 최대 100명까지 가능합니다.");
	  }
	}
</script>