<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">

	
	<form action="${contextPath}/board/update" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		<div class="form-group">
		  <label for="groupName"><b>그룹명:</b></label>
		  <input type="text" class="form-control" id="groupName" name="groupName">
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
		  <input type="number" class="form-control" id="capacity" name="capacity" min="2" max="100" step="1" placeholder="최소 2명, 최대 100명" onchange="validateCapacity()">
		</div>
	  
		<div class="form-group">
		  <label for="startDate"><b>시작일:</b></label>
		  <input type="date" class="form-control" id="startDate" name="startDate">
		</div>  
	
		<div class="form-group">
		  <label for="details"><b>상세내용:</b></label>
		  <textarea class="form-control" id="details" rows="5" name="details"></textarea>
		</div>
		
		<div class="form-group">
			<label for="author"><b>작성자:</b></label>
			<input type="text" class="form-control" id="author" name="author" value="<sec:authentication property="principal.username"/>" readonly>
		</div>
		
		<div style="text-align: right;">
			<button class="btn btn-primary modBoard" type="submit">수정</button>
			<a href="${contextPath}" class="btn btn-secondary">취소</a>
		</div>
		
		<input type="hidden" id="isStarted" name="isStarted" value="N">
		<input type="hidden" id="currentParticipants" name="currentParticipants" value=1>
		
	</form>	
	

</div>




<%@ include file="../layout/footer.jsp" %>
