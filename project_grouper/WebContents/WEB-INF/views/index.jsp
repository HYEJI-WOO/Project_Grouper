<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="layout/header.jsp" %>

<div class="container">
    <h1>전체(${list.size()})</h1>
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
                            <a href="${contextPath}/board/detail?bno=${item.bno}">
                                ${item.groupName}
                            </a>
                        </h5>
                        <p class="card-text">${item.currentParticipants}/${item.capacity}</p>
                    </div>
                    <div class="card-footer">
                        작성자: ${item.author}, 시작일: ${item.startDate}
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <style>
        .card-footer {
            margin-top: 1rem; /* 원하는 만큼의 간격 설정 */
        }
    </style>
</div>
	

<%@ include file="layout/footer.jsp" %>
