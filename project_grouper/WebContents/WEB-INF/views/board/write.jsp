<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
	  <h1>작성 페이지</h1>
	</div>
	
	<form action="${contextPath}/board/write" method="post">
		<div class="form-group">
		  <label for="groupName"><b>그룹명:</b></label>
		  <input type="text" class="form-control" id="groupName">
		</div>
		
		<div class="form-group">
		<label for="category"><b>카테고리:</b></label>
			<select id="category" class="form-control" name="category">
				<option value="">--선택하세요--</option>
				<option value="sports">운동/등산</option>
				<option value="travel">여행</option>
				<option value="study">공부/독서</option>
				<option value="volunteer">봉사활동</option>
				<option value="other">기타</option>
			</select>    
		</div>
	
		<div class="form-group">
		  <label><b>온/오프라인:</b></label>
		  <div class="form-check">
		    <input type="radio" class="form-check-input" id="online" name="location" value="online">
		    <label class="form-check-label" for="online">온라인</label>
		  </div>
		  <div class="form-check">
		    <input type="radio" class="form-check-input" id="offline" name="location" value="offline">
		    <label class="form-check-label" for="offline">오프라인</label>
		  </div>
		</div>
		
		<div id="offline-input" class="form-group" style="display: none;">
		  <label for="offlineLocation"><b>오프라인 장소:</b></label>
		  <input type="text" class="form-control" id="offlineLocation" name="offlineLocation">
		</div>
	
		<div class="form-group">
		  <label for="capacity"><b>그룹인원:</b> ※ 자신을 포함한 인원 수를 입력해주세요.</label>
		  <input type="number" class="form-control" id="capacity" min="2" max="100" step="1" placeholder="최소 2명, 최대 100명" onchange="validateCapacity()">
		</div>
	  
		<div class="form-group">
		  <label for="startDate"><b>시작일:</b></label>
		  <input type="date" class="form-control" id="startDate">
		</div>  
	
		<div class="form-group">
		  <label for="details"><b>상세내용:</b></label>
		  <textarea class="form-control" id="details" rows="5"></textarea>
		</div>
		
		<div class="form-group">
			<label for="author"><b>작성자:</b></label>
			<input type="text" class="form-control" id="author" value="<sec:authentication property="principal.username"/>" readonly>
		</div>
		
		<div style="text-align: right;">
			<button class="btn btn-primary">작성</button>
			<a href="${contextPath}" class="btn btn-secondary">취소</a>
		</div>
	</form>
  
</div>

<%@ include file="../layout/footer.jsp" %>
<script>

  const offlineRadio = document.getElementById('offline');
  const offlineInput = document.getElementById('offline-input');
  
  offlineRadio.addEventListener('click', () => {
    if (offlineRadio.checked) {
      offlineInput.style.display = 'block';
    } else {
      offlineInput.style.display = 'none';
    }
  });

  const onlineRadio = document.getElementById('online');
  
  onlineRadio.addEventListener('click', () => {
    offlineInput.style.display = 'none';
  });
  
 /* */
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