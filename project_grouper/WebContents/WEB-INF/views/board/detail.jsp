<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/detail.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/board.css">

<style>
  .form-border {
    border: 1px solid #ccc;
    padding: 20px;
    border-radius: 5px;
  }
  
  .gohome {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
}
</style>

<div class="container">
    <div class="jumbotron">
        <h1>상세</h1>
    </div>
    
    <form action="${contextPath}/board/update" method="post" class="form-border">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        
        <input type="hidden" name="bno" value="${b.bno}">

		<div class="col form-group">
		    <h3 style="font-size: 1.5rem;">
		        &lt;${b.category == 'travel' ? '여행' 
		        : (b.category == 'sports' ? '운동/등산' 
		        : (b.category == 'study' ? '공부/독서' 
		        : (b.category == 'volunteer' ? '봉사활동' 
		        : (b.category == 'other' ? '기타' : b.category))))}&gt; - 
		        <span style="font-size: 1rem; color: ${b.location == 'online' ? 'red' : 'blue'};"><b>${b.location == 'online' ? '온라인' : '오프라인'}</b></span>
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
		
		<div id="region-input" class="form-group" ${b.location == "offline" ? "" : "style='display:none;'"} style="padding-left: 20px;">
		  	<label for="region"><b>지역:</b></label>
		  	<input type="text" id="region" name="region" value="${b.region}">
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
		
		<div style="text-align: right;">
		  <sec:authorize access="isAuthenticated()">
		    <c:if test="${b.author != pageContext.request.userPrincipal.name}">
		      <button type="button" class="btn btn-success apply-button">
		        가입신청
		      </button>
		    </c:if>
		  </sec:authorize>
		</div>
	

		<input type="hidden" id="isStarted" name="isStarted" value="N">
		<input type="hidden" id="currentParticipants" name="currentParticipants" value=1>
		
	</form>
	<br>
	<br>
	<br>
	
	<div class="form-group" style="display: flex; justify-content: space-between; align-items: center;">
	    <a href="${contextPath}?page=${param.page}" class="btn btn-info gohome" style="margin: 0 auto;">목록</a>
	
	    <c:if test="${b.author == pageContext.request.userPrincipal.name}">
	        <div>
	            <button class="btn btn-warning updateBoard">수정</button>
	            <form action="${contextPath}/board/delete/${b.bno}" method="post" style="display: inline;">
	                <button class="btn btn-danger delBoard" type="submit">삭제</button>
	                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
	            </form>
	        </div>
	    </c:if>
	</div>
	<input type="hidden" name="page" value="${param.page}">
	
	<br>
	<br>
	<br>
	
	<div class="form-group">
	  <label for="comment">댓글 달기:</label>
	  <textarea class="form-control" id="comment" name="comment" rows="3"></textarea>
	  <button type="submit" class="btn btn-primary mt-2" style="float: right;">등록</button>
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
            <input type="text" class="form-control" id="name-input" disabled>
          </div>

          <div class="form-group">
            <label for="dob-input">생년월일</label>
            <br>
            <div class="row">
              <div class="col">
                <input type="text" class="form-control" id="year-input" placeholder="YYYY" pattern="[0-9]{4}" disabled>
              </div>
              <div class="col">
                <input type="text" class="form-control" id="month-input" placeholder="MM" pattern="[0-9]{1,2}" disabled>
              </div>
              <div class="col">
                <input type="text" class="form-control" id="day-input" placeholder="DD" pattern="[0-9]{1,2}" disabled>
              </div>
            </div>
          </div>
          
		<div class="form-group">
		  <label for="gender-input">성별</label>
		  <input type="text" class="form-control" id="gender-input" disabled>
		</div>

          
          <div class="form-group">
            <label for="phone-input">휴대전화</label>
            <input type="tel" class="form-control" id="phone-input" disabled>
          </div>
          
          <div class="form-group">
            <label for="promise-input">각오</label>
            <textarea class="form-control" id="promise-input" rows="3" required></textarea>
          </div>
        </form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="submit-btn">제출</button>
      </div>
      
    </div>
  </div>
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
$(function(){
	$('.updateBoard').on('click',function(){
		$('<form/>').attr('method','get')
		.attr('action','${contextPath}/board/update')
		.append('<input type="hidden" value="${b.bno}" name="bno">')
		.appendTo('body')
		.submit();
	})	
})

$(function() {
  // 가입신청 버튼 클릭 시
  $('.apply-button').on('click', function() {
    // AJAX 요청 보내기
    $.ajax({
      type: "GET",
      url: "${contextPath}/board/myInfo",
      success: function(data) {
        $('#name-input').val(data.name);
        $('#year-input').val(data.year);
        $('#month-input').val(data.month);
        $('#day-input').val(data.day);
        $('#gender-input').val(data.gender);
        $('#gender-input').val(data.gender);
        $('#phone-input').val(data.phone);

        // 모달창 띄우기
        $('#apply-modal').modal('show');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        // 요청 실패 시 처리할 코드
        alert('a');
      }
    });
  });
});

//제출 버튼을 클릭하면 실행되는 함수
$('#submit-btn').click(function() {
  // 데이터를 수집
  var name = $('#name-input').val();
  var year = $('#year-input').val();
  var month = $('#month-input').val();
  var day = $('#day-input').val();
  var gender = $('#gender-input').val();
  var phone = $('#phone-input').val();
  var promise = $('#promise-input').val();
  
  // AJAX 호출 수행
  $.ajax({
    url: 'submit.php', // 전송할 페이지 URL
    method: 'POST', // 전송 방식
    data: {
      name: name,
      year: year,
      month: month,
      day: day,
      gender: gender,
      phone: phone,
      promise: promise
    }, // 전송할 데이터
    success: function(response) {
      // 전송이 성공했을 때 실행되는 콜백 함수
      console.log(response);
    },
    error: function(error) {
      // 전송이 실패했을 때 실행되는 콜백 함수
      console.log(error);
    }
  });
});




</script>