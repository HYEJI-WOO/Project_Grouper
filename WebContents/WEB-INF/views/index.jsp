<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/index.css">
<script src="${contextPath}/resources/js/index.js"></script>

<div class="container-fluid">

<div class="row" style="margin-left: 200px;">
	<div style="width: 9%;">
	  
	  <div class="container" style="margin-top: 150px; font-family: 'Noto Sans KR', sans-serif; text-align: center;">
	    <h4 style="margin-bottom: 20px; color: #2c3e50; font-weight: bold;">지역</h4>
	    <div class="list-group">
	      <a href="${contextPath}/location=${location}/category=${category}/region=" class="list-group-item list-group-item-action ${region == null || region == '' ? 'active' : ''}">전체</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=서울" value="서울" class="list-group-item list-group-item-action ${region == '서울' ? 'active' : ''}">서울</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=경기" value="경기" class="list-group-item list-group-item-action ${region == '경기' ? 'active' : ''}">경기</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=인천" value="인천" class="list-group-item list-group-item-action ${region == '인천' ? 'active' : ''}">인천</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=강원" value="강원" class="list-group-item list-group-item-action ${region == '강원' ? 'active' : ''}">강원</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=충북" value="충북" class="list-group-item list-group-item-action ${region == '충북' ? 'active' : ''}">충북</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=충남" value="충남" class="list-group-item list-group-item-action ${region == '충남' ? 'active' : ''}">충남</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=대전" value="대전" class="list-group-item list-group-item-action ${region == '대전' ? 'active' : ''}">대전</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=경북" value="경북" class="list-group-item list-group-item-action ${region == '경북' ? 'active' : ''}">경북</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=경남" value="경남" class="list-group-item list-group-item-action ${region == '경남' ? 'active' : ''}">경남</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=대구" value="대구" class="list-group-item list-group-item-action ${region == '대구' ? 'active' : ''}">대구</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=울산" value="울산" class="list-group-item list-group-item-action ${region == '울산' ? 'active' : ''}">울산</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=부산" value="부산" class="list-group-item list-group-item-action ${region == '부산' ? 'active' : ''}">부산</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=전북" value="전북" class="list-group-item list-group-item-action ${region == '전북' ? 'active' : ''}">전북</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=전남" value="전남" class="list-group-item list-group-item-action ${region == '전남' ? 'active' : ''}">전남</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=광주" value="광주" class="list-group-item list-group-item-action ${region == '광주' ? 'active' : ''}">광주</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=제주" value="제주" class="list-group-item list-group-item-action ${region == '제주' ? 'active' : ''}">제주</a>
	    </div>
	  </div>
	</div>

	<div style="width: 10%;">
	
	  <div class="container" style="margin-top: 150px; font-family: 'Noto Sans KR', sans-serif; text-align: center;">
	    <h4 style="margin-bottom: 20px; color: #2c3e50; font-weight: bold;">온/오프라인</h4>
	    <div class="list-group">
	      <a href="${contextPath}/location=/category=${category}/region=${region}" class="list-group-item list-group-item-action ${location == null || location == '' ? 'active' : ''}">전체</a>
	      <a href="${contextPath}/location=online/category=${category}/region=" value="online" class="list-group-item list-group-item-action ${location == 'online' ? 'active' : ''}">온라인</a>
	      <a href="${contextPath}/location=offline/category=${category}/region=${region}" value="offline" class="list-group-item list-group-item-action ${location == 'offline' ? 'active' : ''}">오프라인</a>
	    </div>
	  </div>
	  
	  <div class="container" style="margin-top: 50px; font-family: 'Noto Sans KR', sans-serif; text-align: center;">
	    <h4 style="margin-bottom: 20px; color: #2c3e50; font-weight: bold;">카테고리</h4>
	    <div class="list-group">
	      <a href="${contextPath}/location=${location}/category=/region=${region}" class="list-group-item list-group-item-action ${category == null || category == '' ? 'active' : ''}">전체</a>
	      <a href="${contextPath}/location=${location}/category=study/region=${region}" class="list-group-item list-group-item-action ${category == 'study' ? 'active' : ''}">공부</a>
	      <a href="${contextPath}/location=${location}/category=game/region=${region}" class="list-group-item list-group-item-action ${category == 'game' ? 'active' : ''}">게임</a>
	      <a href="${contextPath}/location=${location}/category=sports/region=${region}" class="list-group-item list-group-item-action ${category == 'sports' ? 'active' : ''}">운동</a>
	      <a href="${contextPath}/location=${location}/category=travel/region=${region}" class="list-group-item list-group-item-action ${category == 'travel' ? 'active' : ''}">여행</a>
	      <a href="${contextPath}/location=${location}/category=hobby/region=${region}" class="list-group-item list-group-item-action ${category == 'hobby' ? 'active' : ''}">취미</a>
	      <a href="${contextPath}/location=${location}/category=music/region=${region}" class="list-group-item list-group-item-action ${category == 'music' ? 'active' : ''}">음악</a>
	      <a href="${contextPath}/location=${location}/category=read/region=${region}" class="list-group-item list-group-item-action ${category == 'read' ? 'active' : ''}">독서</a>
	      <a href="${contextPath}/location=${location}/category=social/region=${region}" class="list-group-item list-group-item-action ${category == 'social' ? 'active' : ''}">사교</a>
	      <a href="${contextPath}/location=${location}/category=volunteer/region=${region}" class="list-group-item list-group-item-action ${category == 'volunteer' ? 'active' : ''}">봉사</a>
	      <a href="${contextPath}/location=${location}/category=other/region=${region}" class="list-group-item list-group-item-action ${category == 'other' ? 'active' : ''}">기타</a>
	    </div>
	  </div>
	</div>


	<div class="row">
	<div class="px-0">
		<div class="container" style="margin-top: 50px; margin-left: 50px;">
			<div class="d-flex justify-content-end mb-3">
			  <sec:authorize access="isAuthenticated()"> <!-- 권한이 있는 경우  -->
			    <sec:authorize access="hasAnyRole('ROLE_ASSOCIATE_MEMBER')">
			      <a href="${contextPath}/board/write" class="btn btn-secondary click">그룹만들기</a>
			    </sec:authorize>
			  </sec:authorize>
			</div>
			<div class="d-flex justify-content-between align-items-center mb-3">
			    <h1>전체(${p.totalCount})</h1>
			    <form class="form-inline searchForm" style="margin-left: 225px;">
			        <div class="form-group">
			        	<select class="form-control mr-2 location" name="location">
							<option value="">전체</option>
							<option value="online" ${location == 'online' ? 'selected' : ''}>온라인</option>
							<option value="offline" ${location == 'offline' ? 'selected' : ''}>오프라인</option>
						</select>
						<select class="form-control mr-2 region" name="region">
							<option value="">전체</option>
							<option value="서울" ${region == '서울' ? 'selected' : ''}>서울</option>
							<option value="경기" ${region == '경기' ? 'selected' : ''}>경기</option>
							<option value="인천" ${region == '인천' ? 'selected' : ''}>인천</option>
							<option value="강원" ${region == '강원' ? 'selected' : ''}>강원</option>
							<option value="충북" ${region == '충북' ? 'selected' : ''}>충북</option>
							<option value="충남" ${region == '충남' ? 'selected' : ''}>충남</option>
							<option value="대전" ${region == '대전' ? 'selected' : ''}>대전</option>
							<option value="경북" ${region == '경북' ? 'selected' : ''}>경북</option>
							<option value="경남" ${region == '경남' ? 'selected' : ''}>경남</option>
							<option value="대구" ${region == '대구' ? 'selected' : ''}>대구</option>
							<option value="울산" ${region == '울산' ? 'selected' : ''}>울산</option>
							<option value="부산" ${region == '부산' ? 'selected' : ''}>부산</option>
							<option value="전북" ${region == '전북' ? 'selected' : ''}>전북</option>
							<option value="전남" ${region == '전남' ? 'selected' : ''}>전남</option>
							<option value="광주" ${region == '광주' ? 'selected' : ''}>광주</option>
							<option value="제주" ${region == '제주' ? 'selected' : ''}>제주</option>
						</select>
				        <select class="form-control mr-2 category" name="category">
							<option value="">==전체==</option>
							<option value="study" ${category == 'study' ? 'selected' : ''}>공부</option>
							<option value="game" ${category == 'game' ? 'selected' : ''}>게임</option>
							<option value="sports" ${category == 'sports' ? 'selected' : ''}>운동</option>
							<option value="travel" ${category == 'travel' ? 'selected' : ''}>여행</option>
							<option value="hobby" ${category == 'hobby' ? 'selected' : ''}>취미</option>
							<option value="music" ${category == 'music' ? 'selected' : ''}>음악</option>
							<option value="read" ${category == 'read' ? 'selected' : ''}>독서</option>
							<option value="social" ${category == 'social' ? 'selected' : ''}>사교</option>
							<option value="volunteer" ${category == 'volunteer' ? 'selected' : ''}>봉사</option>
							<option value="other" ${category == 'other' ? 'selected' : ''}>기타</option>
						</select>
			            <select class="form-control mr-2 searchType" name="searchType">
			                <option value="N" ${cri.searchType == 'N' ? 'selected' : ''}>제목</option>
			                <option value="D" ${cri.searchType == 'D' ? 'selected' : ''}>내용</option>
			                <option value="A" ${cri.searchType == 'A' ? 'selected' : ''}>작성자</option>
			            </select>
			            <input class="form-control mr-sm-2 keyword" type="search" name="keyword" value="${cri.keyword}" placeholder="검색어를 입력하세요" aria-label="Search">
			            <button class="btn btn-outline-info my-2 my-sm-0" type="submit">검색</button>
			        </div>
			    </form>
			</div>
			
			
				<c:choose>
					<c:when test="${empty list}">
			            <div style="display: flex; justify-content: center; align-items: center; height: 70vh;">
			                <h1>그룹이 존재하지 않습니다.</h1>
			            </div>
					</c:when>
					<c:otherwise>
					<div class="row row-cols-1 row-cols-md-3 g-4" style="padding: 20px;">
					    <c:forEach items="${list}" var="item">
					        <div class="col mb-4">
					         <a class="click" href="${contextPath}/board/detail?bno=${item.bno}&page=${cri.page}${categoryParam}${locationParam}${regionParam}${searchTypeParam}${keywordParam}" style="text-decoration: none; color: inherit;"> 
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
					                        
											<c:if test="${not empty cri.location and not empty cri.category and not empty cri.region}">
											    <c:set var="locationParam" value="&amp;location=${cri.location}" />
											    <c:set var="categoryParam" value="&amp;category=${cri.category}" />
											    <c:set var="regionParam" value="&amp;region=${cri.region}" />
											</c:if>
											<c:if test="${not empty cri.location and not empty cri.category and empty cri.region}">
											    <c:set var="locationParam" value="&amp;location=${cri.location}" />
											    <c:set var="categoryParam" value="&amp;category=${cri.category}" />
											    <c:set var="regionParam" value="" />
											</c:if>
											<c:if test="${not empty cri.location and empty cri.category and not empty cri.region}">
											    <c:set var="locationParam" value="&amp;location=${cri.location}" />
											    <c:set var="categoryParam" value="" />
											    <c:set var="regionParam" value="&amp;region=${cri.region}" />
											</c:if>
											<c:if test="${not empty cri.location and empty cri.category and empty cri.region}">
											    <c:set var="locationParam" value="&amp;location=${cri.location}" />
											    <c:set var="categoryParam" value="" />
											    <c:set var="regionParam" value="" />
											</c:if>
											<c:if test="${empty cri.location and not empty cri.category and not empty cri.region}">
											    <c:set var="locationParam" value="" />
											    <c:set var="categoryParam" value="&amp;category=${cri.category}" />
											    <c:set var="regionParam" value="&amp;region=${cri.region}" />
											</c:if>
											<c:if test="${empty cri.location and not empty cri.category and empty cri.region}">
											    <c:set var="locationParam" value="" />
											    <c:set var="categoryParam" value="&amp;category=${cri.category}" />
											    <c:set var="regionParam" value="" />
											</c:if>
											<c:if test="${empty cri.location and empty cri.category and not empty cri.region}">
											    <c:set var="locationParam" value="" />
											    <c:set var="categoryParam" value="" />
											    <c:set var="regionParam" value="&amp;region=${cri.region}" />
											</c:if>
											<c:if test="${empty cri.location and empty cri.category and empty cri.region}">
											    <c:set var="locationParam" value="" />
											    <c:set var="categoryParam" value="" />
											    <c:set var="regionParam" value="" />
											</c:if>
											<c:if test="${not empty cri.searchType and not empty cri.keyword}">
												<c:set var="searchTypeParam" value="&amp;searchType=${cri.searchType}"/>
												<c:set var="keywordParam" value="&amp;keyword=${cri.keyword}"/>
											</c:if>
											
											<br>
											
											  ${item.groupName}<br><br>
		
					                    </h5>
											<p class="card-text" style="color: ${item.currentParticipants == item.capacity ? 'red' : 'blue'};">
											  <b>${item.currentParticipants}/${item.capacity} ${item.currentParticipants == item.capacity ? '(모집완료)' : ''}</b>
											</p>
				                    
					                </div>
					                <div class="card-footer">
					                    작성자: ${item.author}<br>
					                    시작일: ${item.startDate}
					                </div>
					            </div>
					            </a>
					            <br><br>
					        </div>
					    </c:forEach>
					    </div>		
					</c:otherwise>	
				</c:choose>	
			
			<ul class="pagination justify-content-center">
			  <c:if test="${p.prev}">
			    <li class="page-item">
			      <a class="page-link" href="${p.startPage-1}">이전페이지</a>
			    </li>
			  </c:if>
			  <c:forEach begin="${p.startPage}" end="${p.endPage}" var="pageNum">
			    <li class="page-item ${cri.page == pageNum ? 'active' : ''}">
			      <a class="page-link" href="${pageNum}">${pageNum}</a>
			    </li>
			  </c:forEach>
			  <c:if test="${p.next}">
			    <li class="page-item">
			      <a class="page-link" href="${p.endPage+1}">다음페이지</a>
			    </li>
			  </c:if>
			</ul>
			
		</div>
	</div>
	
	</div>	
</div> 
</div> 
	

<%@ include file="layout/footer.jsp" %>

<script>
$(document).ready(function() {
	  if ($('.location').val() == 'online') {
	    $('.region').val('').prop('disabled', true);
	  }

	  $('.location').on('change', function() {
	    if ($('.location').val() == 'online') {
	      $('.region').val('').prop('disabled', true);
	    } else {
	      $('.region').prop('disabled', false);
	    }
	  });
	});

</script>
