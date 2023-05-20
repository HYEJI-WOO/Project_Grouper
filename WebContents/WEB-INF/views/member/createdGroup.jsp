<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<style>
  table {
    border-collapse: collapse;
    width: 100%;
    margin: 10px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
  }
  table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
  }
  table th,
  table td {
    padding: 12px 15px;
  }
  table tbody tr {
    border-bottom: 1px solid #dddddd;
  }
  table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
  }
  table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
  }
</style>

<div class="container">
	<div class="jumbotron">
		<h1>내가 만든 그룹</h1>
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
	<table>
	  <thead>
	    <tr>
	      <th>그룹 이름</th>
	      <th>그룹 카테고리</th>
	      <th>그룹 시작 날짜</th>
	      <th>온/오프라인</th>
	      <th>인원</th>
	      <th>상세</th>
	      <th>대기인원</th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:forEach var="group" items="${groupInfo}">
	      <tr>
	        <td><a href="${contextPath}/board/detail?bno=${group.bno}&page=1">${group.groupName}</a></td>
	        <td>${group.category}</td>
	        <td>${group.startDate}</td>
	        <td>${group.location}</td>
			<c:if test="${group.currentParticipants == group.capacity}">
			   <td style="color: red; font-weight: bold;">${group.currentParticipants}/${group.capacity}</td>
			</c:if>
			<c:if test="${group.currentParticipants != 1 and group.currentParticipants != group.capacity }">
			   <td style="color: blue; font-weight: bold;">${group.currentParticipants}/${group.capacity}</td>
			</c:if>
			<c:if test="${group.currentParticipants == 1 }">
			   <td style="color: black; font-weight: bold;">${group.currentParticipants}/${group.capacity}</td>
			</c:if>
		

	        <td><button onclick="toggleTable(this)">확인</button></td>
	        <c:set var="count" value="0" />
	        <c:forEach var="member" items="${memberInfo}">
	          <c:if test="${member.bno == group.bno and member.approve == 'N'}">
	            <c:set var="count" value="${count + 1}" />
	          </c:if>
	        </c:forEach>
	        <td colspan="6">${count}명</td>
	      </tr>

	      
	      
	      <tr class="member-table" style="display:none;">
	        <td colspan="7">
	          <table>
	            
	              <c:forEach var="member" items="${memberInfo}">
	                <c:if test="${member.bno == group.bno}">
						<thead>
				              <tr>
				                <th>이름</th>
				                <th>연락처</th>
				                <th>가입 의사</th>
				                <th>상태</th>
				                <th>승인확인</th>
				                <th>승인거절</th>
				              </tr>
			            </thead>	
			            <tbody>                
	                  <tr>
	                    <td>${member.name}</td>
	                    
	                    <c:if test="${member.approve eq 'N'}">
		                    <td>가입 승인후 확인 가능합니다.</td>
	                    </c:if>
	                    <c:if test="${member.approve ne 'N'}">
	                    	<td>${member.phone}</td>
	                    </c:if>
	                    
	                    
	                    <td><textarea rows="2" cols="20" readonly>${member.promise}</textarea></td>
	                    <td>${member.approve}</td>
	                    <c:if test="${member.approve eq 'N'}">
		                    <td><button class="joinEnd" data-memberid="${member.memberId}" data-bno="${group.bno}">가입승인</button></td>
		                    <td><button class="reject" data-memberid="${member.memberId}" data-bno="${group.bno}">승인거절</button></td>
	                    </c:if>
	                    <c:if test="${member.approve ne 'N'}">
		                    <td>승인완료</td>
	                    </c:if>
	                    
	                    
	                    
	                  </tr>
	                  </tbody>
	                  </c:if>
	              </c:forEach>
	            
	          </table>
	        </td>
	      </tr>
	      
	    </c:forEach> 
	  </tbody>
	</table>
	</div>
	</div>
</div>

<%@ include file="../layout/footer2.jsp" %>

<script>
  function toggleTable(btn) {
    const row = btn.parentNode.parentNode.nextElementSibling;
    row.style.display = row.style.display === 'none' ? 'table-row' : 'none';
  }

  $(function() {
	  $(document).on('click', '.joinEnd', function() {
	    var memberId = $(this).data('memberid');
	    var bno = $(this).data('bno');

	    var data = {
	      memberId: memberId,
	      bno: bno
	    };

	    var csrfToken = $("meta[name='_csrf']").attr("content");
	    var csrfHeader = $("meta[name='_csrf_header']").attr("content");

	    if (confirm("가입을 승인하시겠습니까?")) {
	      $.ajax({
	        type: "POST",
	        url: "${contextPath}/board/joinEnd",
	        data: data,
	        beforeSend: function(xhr) {
	          xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success: function(response) {
	          alert('승인이 완료되었습니다. 연락처로 그룹원들에게 연락할 수 있습니다.')  
	          location.reload();
	        },
	        error: function(xhr, status, error) {
	        }
	      });
	    }
	  });
	});
  
  $(function() {
	  $(document).on('click', '.reject', function() {
	    var memberId = $(this).data('memberid');
	    var bno = $(this).data('bno');

	    var data = {
	      memberId: memberId,
	      bno: bno
	    };

	    var csrfToken = $("meta[name='_csrf']").attr("content");
	    var csrfHeader = $("meta[name='_csrf_header']").attr("content");

	    if (confirm("가입을 거절하시겠습니까?")) {
	      $.ajax({
	        type: "POST",
	        url: "${contextPath}/board/reject",
	        data: data,
	        beforeSend: function(xhr) {
	          xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success: function(response) {
	          alert('가입이 거절되었습니다.')  
	          location.reload();
	        },
	        error: function(xhr, status, error) {
	        }
	      });
	    }
	  });
	});
  

</script>