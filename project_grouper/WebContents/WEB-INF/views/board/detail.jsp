<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
		<h1>상세</h1>
	</div>
	
	<div class="card">
		<div class="card-header">
			<div>
				<span class="badge badge-primary">번호 ${b.bno}</span>
				<span class="badge badge-info">${b.author}</span>
				<span class="ml-4">${b.groupName}</span>
			</div>
		</div>
		<div class="card-body" style="white-space:pre-line; min-height:350px">
			${b.details}
		</div>
		
		<div class="card-footer" style="display: flex; justify-content: space-between; align-items: center;">
		    <a href="${contextPath}" class="btn btn-info">목록</a>
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
		
	</div>
	
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

<script>
  $('#apply-modal').on('hidden.bs.modal', function (e) {
    $(this).find('form')[0].reset();
  });

</script>

