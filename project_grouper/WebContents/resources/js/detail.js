$(function(){
  let pageForm = $('<form/>');
  let pageTag = $('[name="page"]');
	
  $('.list').on('click', function(){
    pageForm.attr('method', 'get')
      .attr('action', `${contextPath}`)
      .append(pageTag)
      .appendTo('body')
      .submit();
  });

  $('#apply-modal').on('hidden.bs.modal', function (e) {
    $(this).find('form')[0].reset();
  });
});


