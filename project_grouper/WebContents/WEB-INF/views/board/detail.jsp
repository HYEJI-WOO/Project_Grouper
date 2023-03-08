<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/detail.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/board.css">

<div class="container">
    <div class="jumbotron">
        <h1>상세</h1>
    </div>
    
    <form action="${contextPath}/board/update" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

		<div class="col form-group">
		    <h3 style="font-size: 1.5rem;">
		        &lt;${b.category == 'travel' ? '여행' 
		        : (b.category == 'sports' ? '운동/등산' 
		        : (b.category == 'study' ? '공부/독서' 
		        : (b.category == 'volunteer' ? '봉사활동' 
		        : (b.category == 'other' ? '기타' : b.category))))}&gt; - 
		        <span style="font-size: 1rem; color: ${b.location == 'online' ? 'blue' : 'red'};"><b>${b.location == 'online' ? '온라인' : '오프라인'}</b></span>
		    </h3>
		</div>
		
		<div class="form-group" style="padding-left: 20px;">
		    <label for="groupName"><b>그룹명:</b></label>
		    <input type="text" id="groupName" name="groupName" value="${b.groupName}">
		</div>
		
		<div class="form-group" style="padding-left: 20px;">
            <label for="author"><b>작성자:</b></label>
            <input type="text" id="author" name="author" value="${b.author}" readonly>
        </div>
				
		<div class="form-group" style="padding-left: 20px;">
		    <label for="capacity"><b>그룹인원:</b></label>
		    <input type="text" id="capacity" name="capacity" value="${b.currentParticipants}/${b.capacity}" min="2" max="100" step="1" onchange="validateCapacity()">
		</div>
		
		<div id="offline-input" class="form-group" ${b.location == "offline" ? "" : "style='display:none;'"} style="padding-left: 20px;">
		    <label for="offlineLocation"><b>오프라인 장소:</b></label>
		    <input type="text" id="offlineLocation" name="offlineLocation" value="${b.offlineLocation}">
		</div>
		
		<div class="form-group" style="padding-left: 20px;">
		    <label for="startDate"><b>시작일:</b></label>
		    <input type="date" id="startDate" name="startDate" value="${b.startDate}">
		</div>

		<div class="form-group" style="padding-left: 20px;">
		  <label for="details"><b>상세내용:</b></label>
		  <div id="details" class="details" name="details">${b.details}</div>
		</div>

		<input type="hidden" id="isStarted" name="isStarted" value="N">
		<input type="hidden" id="currentParticipants" name="currentParticipants" value=1>
		
	</form>
	
	<div class="form-group" style="display: flex; justify-content: space-between; align-items: center;">
	    <a href="${contextPath}?page=${param.page}" class="btn btn-info">목록</a>

	    <c:if test="${b.author == pageContext.request.userPrincipal.name}">
	        <div>
	            <a href="${contextPath}/board/update/${b.bno}" class="btn btn-warning modBoard">수정</a>
	            <form action="${contextPath}/board/delete/${b.bno}" method="post" style="display: inline;">
	                <button class="btn btn-danger delBoard" type="submit">삭제</button>
	                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
	            </form>
	        </div>
	    </c:if>
	</div>
	
	<input type="hidden" name="page" value="${param.page}">
		
	<div>
		<sec:authorize access="isAuthenticated()">
			<c:if test="${b.author != pageContext.request.userPrincipal.name}">
				<button type="button" class="btn btn-success apply-button" data-toggle="modal" data-target="#apply-modal">
					가입신청
				</button>
			</c:if>
		</sec:authorize>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="apply-modal" tabindex="-1" role="dialog" aria-labelledby="apply-modal-label" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="apply-modal-label">가입신청서</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="name-input">이름</label>
            <input type="text" class="form-control" id="name-input" required>
          </div>

          <div class="form-group">
            <label for="dob-input">생년월일</label>
            <br>
            <div class="row">
              <div class="col">
                <input type="text" class="form-control" id="year-input" placeholder="YYYY" pattern="[0-9]{4}" required>
              </div>
              <div class="col">
                <input type="text" class="form-control" id="month-input" placeholder="MM" pattern="[0-9]{1,2}" required>
              </div>
              <div class="col">
                <input type="text" class="form-control" id="day-input" placeholder="DD" pattern="[0-9]{1,2}" required>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <label for="gender-input">성별</label>
            <select class="form-control" id="gender-input" required>
              <option value="">-- 선택 --</option>
              <option value="M">남성</option>
              <option value="F">여성</option>
            </select>
          </div>
          
          <div class="form-group">
            <label for="phone-input">휴대전화</label>
            <input type="tel" class="form-control" id="phone-input" required>
          </div>
          
          <div class="form-group">
            <label for="promise-input">각오</label>
            <textarea class="form-control" id="promise-input" rows="3" required></textarea>
          </div>
        </form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">제출</button>
      </div>
      
    </div>
  </div>
</div>

<%@ include file="../layout/footer.jsp" %>
