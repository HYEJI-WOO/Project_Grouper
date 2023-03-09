<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="layout/header.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/index.css">

<style>
.card-footer {
    border-top: 2px solid #d2d6d5; 
}

.card {
    border: 2px solid #d2d6d5; 
}

a {
  font-size: 1.2rem;
  font-weight: bold;
}

</style>

<div class="container">
    <h1>전체(${p.totalCount})</h1>
    <sec:authorize access="isAuthenticated()"> <!-- 권한이 있는 경우  -->
        <sec:authorize access="hasAnyRole('ROLE_ASSOCIATE_MEMBER')">
            <a href="${contextPath}/board/write" class="btn btn-primary">작성</a>
        </sec:authorize>
    </sec:authorize>

	<div class="row row-cols-1 row-cols-md-3 g-4" style="padding: 20px;">
	    <c:forEach items="${list}" var="item">
	        <div class="col mb-4">
	            <div class="card h-200">
	                <div class="card-body">
	                    <h5 class="card-title">
	                        <span class="badge badge-${item.location}">
	                            <c:if test="${item.location eq 'online'}">
	                                <b>온라인</b>
	                            </c:if>
	                            <c:if test="${item.location eq 'offline'}">
	                                <b>오프라인</b>(${item.region})
	                            </c:if>
	                        </span>
	                        <br>
	                        <a href="${contextPath}/board/detail?bno=${item.bno}&page=${cri.page}">
	                            ${item.groupName}
	                        </a>
	                    </h5>
	                    <p class="card-text">${item.currentParticipants}/${item.capacity}</p>
	                </div>
	                <div class="card-footer">
	                    작성자: ${item.author}<br>
	                    시작일: ${item.startDate}
	                </div>
	            </div>
	            <br><br>
	        </div>
	    </c:forEach>
	</div>    
	<ul class="pagination justify-content-center">
		<c:if test="${p.prev}">
			<li class="page-item">
				<a class="page-link" href="?page=${p.startPage-1}">이전페이지</a>
			</li>
		</c:if>
		<c:forEach begin="${p.startPage}" end="${p.endPage}" var="pageNum">
			<li class="page-item ${cri.page == pageNum ? 'active' : ''}">
				<a class="page-link" href="?page=${pageNum}">${pageNum}</a>
			</li>
		</c:forEach>
		<c:if test="${p.next}">
			<li class="page-item">
				<a class="page-link" href="?page=${p.endPage+1}">다음페이지</a>
			</li>
		</c:if>
	</ul>
    
</div>
	

<%@ include file="layout/footer.jsp" %>
