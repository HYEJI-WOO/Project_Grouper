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
		<h1>내가 가입한 그룹</h1>
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

<table class="group-table">
  <thead>
    <tr>
      <th>그룹 이름</th>
      <th>그룹 카테고리</th>
      <th>그룹 시작 날짜</th>
      <th>온/오프라인</th>
      <th>그룹 대표</th>
      <th>승인 여부</th>
      <th>가입 취소</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach var="group" items="${groupInfo}">
	  <tr>
	    <td><a href="${contextPath}/board/detail?bno=${group.bno}&page=1">${group.groupName}</a></td>
	    <td>${group.category}</td>
	    <td>${group.startDate}</td>
	    <td>${group.location}</td>
	    <td>${group.author}</td>
	    <td>${group.approve}</td>
	    <td>
	      <c:if test="${group.approve == 'N'}">
	        <button type="button" class="cancel-join-btn" data-bno="${group.bno}" data-memberid="${group.memberId }">가입 취소</button>
	      </c:if>
	      <c:if test="${group.approve != 'N'}">
	        <span>그룹 대표에게 개인적으로 연락해주세요</span>
	      </c:if>
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
$(document).ready(function() {
	  $(".cancel-join-btn").click(function() {
	    var bno = $(this).data("bno");
	    var memberId = $(this).data("memberid");

	    if (confirm("정말 가입을 취소하시겠습니까?")) {
	      $.ajax({
	        type: "POST",
	        url: "${contextPath}/board/cancelJoinGroup",
	        data: {
	          bno: bno,
	          memberId: memberId,
	          _csrf: $("input:hidden[name=_csrf]").val()
	        },
	        success: function(data) {
	          alert('가입이 취소되었습니다.')
	          location.reload();
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	          // 취소 실패 시 처리할 코드
	        }
	      });
	    }
	  });
	});

</script>
