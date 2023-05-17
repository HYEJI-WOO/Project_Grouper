$(function(){
	
	let typeValue = getSearchParam('searchType');
	let keywordValue = getSearchParam('keyword');
	let location = $('.location').val();
	let category = $('.category').val();
	let region = $('.region').val();
  	
  	console.log(location);
	console.log(category);
	console.log(region);
	console.log(typeValue);
	console.log(keywordValue);
	
	$('.searchForm').on('submit', function(e){
	  e.preventDefault(); // 폼 제출 방지
	  
	  let category = $('.searchForm').find('.category').val();
	  let region = $('.searchForm').find('.region').val();
	  let location = $('.searchForm').find('.location').val();
	  let searchType = $('.searchForm').find('.searchType').val();
	  let keyword = $('.searchForm').find('.keyword').val();
	    
	  let url = `${contextPath}/location=${location}/category=${category}/region=${region}?searchType=${searchType}&keyword=${keyword}`;
	  window.location.href = url;
	});


	
	// 페이지 이동
	$('.pagination a').on('click',function(e){
		e.preventDefault();
		let pageForm = $('<form>');
		pageForm.empty();
		pageForm.attr('method','get')
			.attr('action',`${contextPath}/location=${location}/category=${category}/region=${region}`)
			.append(getInputHiddenTag('page',$(this).attr('href')))
		if(typeValue != null && keywordValue != null){
			pageForm.append(getInputHiddenTag('searchType',typeValue))
				.append(getInputHiddenTag('keyword',keywordValue))
		}
		pageForm.appendTo('body')
			.submit();
	});
	
	

});