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
		        : (b.category == 'game' ? '게임'
		        : (b.category == 'hobby' ? '취미'
		        : (b.category == 'music' ? '음악'
		        : (b.category == 'read' ? '독서'
		        : (b.category == 'social' ? '사교'
		        : (b.category == 'sports' ? '운동' 
		        : (b.category == 'study' ? '공부' 
		        : (b.category == 'volunteer' ? '봉사' 
		        : (b.category == 'other' ? '기타' : b.category)))))))))}&gt; - 
		        <span style="font-size: 1rem; color: ${b.location == 'online' ? 'red' : 'blue'};"><b>${b.location == 'online' ? '온라인' : '오프라인'}</b></span>
		    </h3>
		</div>
		
		<div class="form-group" style="padding-left: 20px;">
		    <label for="groupName"><b>그룹명:</b></label>
		    <input type="text" id="groupName" name="groupName" value="${b.groupName}" disabled>
		</div>
		
		<div class="form-group" style="padding-left: 20px;">
            <label for="author"><b>작성자:</b></label>
            <input type="text" id="author" name="author" value="${b.author}" disabled>
        </div>
				
		<div class="form-group" style="padding-left: 20px;">
		    <label for="capacity"><b>그룹인원:</b></label>
		    <input type="text" id="capacity" name="capacity" value="${b.currentParticipants}/${b.capacity}" min="2" max="100" step="1" onchange="validateCapacity()" disabled>
		</div>
		
		<div id="region-input" class="form-group" ${b.location == "offline" ? "" : "style='display:none;'"} style="padding-left: 20px;">
		  	<label for="region"><b>지역:</b></label>
		  	<input type="text" id="region" name="region" value="${b.region}" disabled>
		</div>
		
		<div id="offline-input" class="form-group" ${b.location == "offline" ? "" : "style='display:none;'"} style="padding-left: 20px;">
		    <label for="offlineLocation"><b>오프라인 장소:</b></label>
		    <input type="text" id="offlineLocation" name="offlineLocation" value="${b.offlineLocation}" disabled>
		</div>
		
		
		<div class="form-group" style="padding-left: 20px;">
		    <label for="startDate"><b>시작일:</b></label>
		    <input type="date" id="startDate" name="startDate" value="${b.startDate}" disabled>
		</div>

		<div class="form-group" style="padding-left: 20px;">
		  <label for="details"><b>상세내용:</b></label>
		  <div id="details" class="details" name="details">${b.details}</div>
		</div>
		
		<div style="text-align: right;">
		  <sec:authorize access="isAuthenticated()">
		    <c:if test="${b.author != pageContext.request.userPrincipal.name and b.currentParticipants != b.capacity}">
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
		<c:if test="${not empty param.keyword}">
		    <c:set var="keywordParam" value="&amp;searchType=${param.searchType}&amp;keyword=${param.keyword}" />
		</c:if>
		<c:if test="${empty param.keyword}">
		    <c:set var="keywordParam" value="" />
		</c:if>
		
		<c:if test="${not empty param.category}">
		    <c:if test="${not empty param.location}">
		        <c:if test="${not empty param.region}">
		            <a href="${contextPath}/location=${param.location}/category=${param.category}/region=${param.region}?page=${param.page}${keywordParam}" class="btn btn-info gohome" style="margin: 0 auto;">목록</a>
		        </c:if>
		        <c:if test="${empty param.region}">
		            <a href="${contextPath}/location=${param.location}/category=${param.category}/region=?page=${param.page}${keywordParam}" class="btn btn-info gohome" style="margin: 0 auto;">목록</a>
		        </c:if>
		    </c:if>
		    <c:if test="${empty param.location}">
		        <c:if test="${not empty param.region}">
		            <a href="${contextPath}/location=/category=${param.category}/region=${param.region}?page=${param.page}${keywordParam}" class="btn btn-info gohome" style="margin: 0 auto;">목록</a>
		        </c:if>
		        <c:if test="${empty param.region}">
		            <a href="${contextPath}/location=/category=${param.category}/region=?page=${param.page}${keywordParam}" class="btn btn-info gohome" style="margin: 0 auto;">목록</a>    
		        </c:if>
		    </c:if>
		</c:if>
		<c:if test="${empty param.category}">
		    <c:if test="${not empty param.location}">
		        <c:if test="${not empty param.region}">
		            <a href="${contextPath}/location=${param.location}/category=/region=${param.region}?page=${param.page}${keywordParam}" class="btn btn-info gohome" style="margin: 0 auto;">목록</a>
		        </c:if>
		        <c:if test="${empty param.region}">
		            <a href="${contextPath}/location=${param.location}?page=${param.page}${keywordParam}" class="btn btn-info gohome" style="margin: 0 auto;">목록</a>
		        </c:if>
		    </c:if>
		    <c:if test="${empty param.location}">
		        <c:if test="${not empty param.region}">
		            <a href="${contextPath}/region=${param.region}?page=${param.page}${keywordParam}" class="btn btn-info gohome" style="margin: 0 auto;">목록</a>
		        </c:if>
		        <c:if test="${empty param.region}">
		            <a href="${contextPath}?page=${param.page}${keywordParam}" class="btn btn-info gohome" style="margin: 0 auto;">목록</a>    
		        </c:if>
		    </c:if>
		</c:if>
		
		<div style="margin-left: auto;">
		    <c:if test="${b.author == pageContext.request.userPrincipal.name}">
		        <div>
		            <button class="btn btn-warning updateBoard">수정</button>
		            <c:if test="${b.currentParticipants == 1}">
		                <button class="btn btn-danger delBoard">삭제</button>
		            </c:if>
		        </div>
		    </c:if>
		</div>

	</div>
	
	<input type="hidden" name="checkId" value="${pageContext.request.userPrincipal.name}">
	
	<input type="hidden" name="page" value="${param.page}">
	
	<br>
	<br>
	<br>
	
<c:if test="${not empty pageContext.request.userPrincipal}">
	<div class="replyForm">
		<table class="table">
			<tr>
				<th colspan="2">
					<ul class="d-flex justify-content-between">
						<li>댓글을 작성해주세요</li>
						<li class="form-inline">작성자 : <input type="text" class="reply_writer form-control ml-2" value="${pageContext.request.userPrincipal.name}" readonly="readonly"></li>
					</ul>
				</th>
			</tr>
			<tr>
				<td class="col-1 text-center"><b>내용</b></td>
				<td>
					<textarea rows="5" class="form-control reply_content"></textarea>
				</td>
			</tr>
			<tr class="text-right">
				<td colspan="2"><button class="btn btn-light reply_write">댓글등록</button></td>
			</tr>
		</table>
	</div>
</c:if>

	
<div class="replyList">
  <div class="card">
    <div class="card-header bg-dark text-white">댓글 목록</div>
    <ul class="list-group list-group-flush">
      <c:forEach var="r" items="${replies}">
        <li class="list-group-item">
          <div class="row">
            <div class="col-md-2">
              <strong>${r.writer}</strong>
            </div>
            <div class="col-md-8 r_content">
              ${r.content}
            </div>
            <div class="col-md-2 text-right">
              <small><fmt:formatDate value="${r.replyDate}" pattern="yyyy-MM-dd HH:mm:ss"/></small>
              <c:if test="${r.writer == pageContext.request.userPrincipal.name}">
				  <button type="button" class="btn btn-danger deleteReplyBtn" data-rno="${r.rno}">삭제</button>
              </c:if>
            </div>
          </div>
        </li>
      </c:forEach>
      <c:if test="${empty replies}">
        <li class="list-group-item">등록된 댓글이 없습니다.</li>
      </c:if>
    </ul>
  </div>
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
      	  <div class="form-group">
            <label for="memberId-input">아이디</label>
            <input type="text" class="form-control memberId" id="memberId-input" name="memberId" disabled>
          </div>
      
          <div class="form-group">
            <label for="name-input">이름</label>
            <input type="text" class="form-control" id="name-input" name="name" disabled>
          </div>

          <div class="form-group">
            <label for="dob-input">생년월일</label>
            <br>
            <div class="row">
              <div class="col">
                <input type="text" class="form-control" id="year-input" name="year" disabled>
              </div>
              <div class="col">
                <input type="text" class="form-control" id="month-input" name="month" disabled>
              </div>
              <div class="col">
                <input type="text" class="form-control" id="day-input" name="day" disabled>
              </div>
            </div>
          </div>
          
		<div class="form-group">
		  <label for="gender-input">성별</label>
		  <input type="text" class="form-control" id="gender-input" name="gender" disabled>
		</div>

          
		<div class="form-group">
		  <label for="phone-input">휴대전화</label>
		  <input type="tel" class="form-control" id="phone-input" name="phone" disabled>
		  <div>
			<small id="phone-help" class="form-text text-muted" style="font-size: 0.75em;">
			   가입이 완료된 후에는 해당 번호를 통해 그룹 대표가 연락할 예정입니다.
			</small>
		  </div>
		</div>
          
          <div class="form-group">
            <label for="promise-input">각오</label>
            <textarea class="form-control promise" id="promise-input" rows="3" name="promise" required></textarea>
          </div>
          
		<div class="form-group form-check">
		  <input type="checkbox" class="form-check-input" id="agree-check" required>
		  <label class="form-check-label" for="agree-check">개인정보 수집 및 이용에 동의합니다.</label>
		</div>
		
		<div class="alert alert-warning" role="alert">
		   가입 취소는 승인 전에만 가능합니다. 가입 승인이 된 후 가입 취소를 원하시는 경우, 그룹 대표에게 개인적으로 연락해주시기 바랍니다.
		</div>	
		
		<input type="hidden" value="${b.author}">	
		
        <input type="hidden" class="form-control author" name="author" value="${b.author}">
		
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button id="submit-button" type="submit" class="btn btn-primary">제출</button>
      </div>
      
    </div>
  </div>
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
$(function() {
	$('.updateBoard').on('click', function() {
		  $('<form/>').attr('method', 'get')
		    .attr('action', '${contextPath}/board/update')
		    .append('<input type="hidden" value="${b.bno}" name="bno">')
		    .append('<input type="hidden" value="${param.page}" name="page">')
		    .appendTo('body')
		    .submit();
		});



	  $('.delBoard').on('click', function(event) {
	    event.preventDefault();
	    if (confirm("정말 삭제하시겠습니까?")) {
	      $('<form/>').attr('method', 'post')
	        .attr('action', '${contextPath}/board/delete/${b.bno}')
	        .append('<input type="hidden" name="_csrf" value="${_csrf.token}">')
	        .appendTo('body')
	        .submit();
	    }
	  });
	});



$(function() {
	
	var csrfToken = $("meta[name='_csrf']").attr("content");
	  var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	  // 가입신청 버튼 클릭 시
	  $('.apply-button').on('click', function() {
	    var bno = ${b.bno};
	    var memberId = $('[name="checkId"]').val();
	    console.log(bno)
	    console.log(memberId)

	    // AJAX 요청 보내기
	    $.ajax({
	      type: "GET",
	      url: "${contextPath}/board/myInfo",
	      data: {
	        'bno': bno,
	        'memberId': memberId
	      },

	      beforeSend: function(xhr) {
	        xhr.setRequestHeader(csrfHeader, csrfToken);
	      },
	      success: function(data) {
	        if (data === "duplicated") {
	          alert("이미 가입신청된 그룹입니다.");
	        } else {
	          $('#memberId-input').val(data.memberId);  
	          $('#name-input').val(data.name);
	          $('#year-input').val(data.year);
	          $('#month-input').val(data.month);
	          $('#day-input').val(data.day);
	          $('#gender-input').val(data.gender);
	          $('#gender-input').val(data.gender);
	          $('#phone-input').val(data.phone);

	          // 모달창 띄우기
	          $('#apply-modal').modal('show');
	        }
	      },
	      error: function(jqXHR, textStatus, errorThrown) {
	        // 요청 실패 시 처리할 코드
	        alert('a');
	      }
	    });
	  });
	});


$(function() {
	
	var csrfToken = $("meta[name='_csrf']").attr("content");
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	  // 제출 버튼 클릭 시
	  $('#submit-button').on('click', function() {
	    // 폼 데이터 가져오기
	    var bno = ${b.bno};
	    var memberId = $('.memberId').val(); 
	    var promise = $('.promise').val();
	    var author = $('.author').val();
	 
	 if(promise.trim() === '') {
		 alert('각오를 입력해주세요.');
		 return false;
	 }
	 
	 if(!$('#agree-check').is(':checked')) {
		alert('개인정보 수집 및 이용에 동의해주세요.')
		 return false;
	 }
	 
	    // AJAX 요청 보내기
	    $.ajax({
	      type: "POST",
	      url: "${contextPath}/board/apply",
	      data: {
	    	    'bno': bno,
	    	    'memberId': memberId,
	    	    'promise': promise,
	    	    'author' : author
	    	},

	      beforeSend: function(xhr) {
	          xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	      success: function(data) {
	        // 요청 성공 시 처리할 코드
	        alert('가입신청이 완료되었습니다.');
	        $('#apply-modal').modal('hide');
	        window.location.replace("${contextPath}/board/joinedGroup");
	      },
	      error: function(jqXHR, textStatus, errorThrown) {
	        // 요청 실패 시 처리할 코드
	        alert('가입신청이 실패하였습니다.');
	      }
	    });
	  });
	});


$(function() {
	  // CSRF 토큰 가져오기
	  var csrfToken = $("meta[name='_csrf']").attr("content");
	  var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	  
	  $('.reply_write').on('click', function() {
	    var writer = $('.reply_writer').val();
	    var content = $('.reply_content').val();
	    var urlParams = new URLSearchParams(window.location.search);
	    var bno = urlParams.get('bno');
	    
	    // 유효성 검사
	    if (!content) {
	      alert('내용을 입력해주세요.');
	      return;
	    }
	    // AJAX 요청 보내기
	    $.ajax({
	      type: 'POST',
	      url: '${contextPath}/board/replyWrite',
	      data: {
	        'bno': bno,
	        'writer': writer,
	        'content': content
	      },
	      beforeSend: function(xhr) {
	          // CSRF 토큰 설정
	          xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	      success: function(result) {
	        // 성공 시 처리할 코드
	        alert('댓글이 등록되었습니다.');
	        // 등록된 댓글 화면에 보여주기
	        location.reload();
	      },
	      error: function(jqXHR, textStatus, errorThrown) {
	        // 요청 실패 시 처리할 코드
	        alert('댓글 등록에 실패했습니다. 다시 시도해주세요.');
	      }
	    });
	  });
	});



$(function() {
	  $(document).on('click', '.deleteReplyBtn', function() {
	    var rno = $(this).data('rno');
	    var csrfToken = $("meta[name='_csrf']").attr("content");
	    var csrfHeader = $("meta[name='_csrf_header']").attr("content");

	    if (confirm("댓글을 삭제하시겠습니까?")) {
	      $.ajax({
	        type: 'POST',
	        url: '${contextPath}/board/delReply',
	        data: { rno: rno },
	        beforeSend: function(xhr) {
	          xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success: function() {
	          location.reload();
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	        }
	      });
	    }
	  });
	});


</script>