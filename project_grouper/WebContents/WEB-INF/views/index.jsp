<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="layout/header.jsp" %>

<div class="container">
    <h1>전체(${p.totalCount})</h1>
    <sec:authorize access="isAuthenticated()"> <!-- 권한이 있는 경우  -->
        <sec:authorize access="hasAnyRole('ROLE_ASSOCIATE_MEMBER')">
            <a href="${contextPath}/board/write" class="btn btn-primary">작성</a>
        </sec:authorize>
    </sec:authorize>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach items="${list}" var="item">
            <div class="col mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">
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
	
<style>
    .card {
        height: 300px; /* 카드 박스 높이 */
        border-radius: 10px; /* 카드 박스 모서리 둥글기 */
        overflow: hidden; /* 카드 내용 넘치는 부분 감춤 */
    }

    .card-body {
        height: 80%; /* 카드 본문 높이 */
    }

    .card-title a {
        font-size: 1.2rem; /* 제목 글씨 크기 */
        font-weight: bold; /* 제목 글씨 두께 */
        color: black; /* 제목 글씨 색상 */
        text-decoration: none; /* 제목 밑줄 제거 */
    }

    .card-text {
        font-size: 1rem; /* 내용 글씨 크기 */
    }

    .card-footer {
        height: 40%; /* 작성자, 시작일 높이 */
        display: flex; /* 작성자, 시작일 가운데 정렬 위해 필요 */
        margin-top: 1rem; /* 원하는 만큼의 간격 설정 */
        justify-content: center; /* 작성자, 시작일 가운데 정렬 */
        align-items: center; /* 작성자, 시작일 가운데 정렬 */
    }
</style>
    
    
</div>
	

<%@ include file="layout/footer.jsp" %>
