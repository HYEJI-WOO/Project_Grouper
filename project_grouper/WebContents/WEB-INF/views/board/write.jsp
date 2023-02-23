<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
	  <h1>작성 페이지</h1>
	</div>
	
	<div class="form-group">
	  <label for="group-name">그룹명:</label>
	  <input type="text" class="form-control" id="group-name">
	</div>
	
	<div class="form-group">
	<label for="category">카테고리:</label>
		<select id="fruit" class="form-control" name="fruit">
			<option value="">--선택하세요--</option>
			<option value="sports">운동/등산</option>
			<option value="travel">여행</option>
			<option value="study">공부/독서</option>
			<option value="volunteer">봉사활동</option>
			<option value="other">기타</option>
		</select>    
	</div>

	<div class="form-group">
	  <label>온/오프라인:</label>
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
	  <label for="offline-location">오프라인 장소:</label>
	  <input type="text" class="form-control" id="offline-location" name="offline_location">
	</div>

	<div class="form-group">
	  <label for="capacity">모집인원:</label>
	  <input type="text" class="form-control" id="capacity">
	</div>
  
	<div class="form-group">
	  <label for="start_date">시작일:</label>
	  <input type="date" class="form-control" id="start_date">
	</div>  

	<div class="form-group">
	  <label for="details">상세내용:</label>
	  <textarea class="form-control" id="details" rows="5"></textarea>
	</div>
	
	<div class="form-group">
		<label for="details">작성자:</label>
		<input type="text" class="form-control" value="id" readonly>
	</div>
	
	<div style="text-align: right;">
		<button type="submit" class="btn btn-primary">작성</button>
		<button type="button" class="btn btn-secondary">취소</button>
	</div>
  
</div>

<%@ include file="../layout/footer.jsp" %>
<script>
  // 오프라인 라디오 버튼이 선택되었을 때, 추가 정보 입력 필드를 표시합니다.
  const offlineRadio = document.getElementById('offline');
  const offlineInput = document.getElementById('offline-input');
  
  offlineRadio.addEventListener('click', () => {
    if (offlineRadio.checked) {
      offlineInput.style.display = 'block';
    } else {
      offlineInput.style.display = 'none';
    }
  });

  // 온라인 라디오 버튼이 선택되었을 때, 추가 정보 입력 필드를 숨깁니다.
  const onlineRadio = document.getElementById('online');
  
  onlineRadio.addEventListener('click', () => {
    offlineInput.style.display = 'none';
  });
</script>