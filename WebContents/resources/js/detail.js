$(function() {

  $('#apply-modal').on('hidden.bs.modal', function(e) {
    $(this).find('form')[0].reset();
  });
  
  let offlineInput = $('#offline-input');
  if (b.offlineLocation === null) {
    offlineInput.hide();
  }

	$('#submit-btn').click(function(e) {
	  e.preventDefault(); // 기본 제출 이벤트를 방지합니다.
	  alert('aa')
	  $.ajax({
	    url: 'boardController', // 전송할 URL을 지정합니다.
	    type: 'post', // 전송 방식을 지정합니다.
	    data: $('#apply-form').serialize(), // form 데이터를 직렬화합니다.
	    success: function(response) {
	      // 성공적으로 데이터를 전송했을 경우 실행할 코드를 작성합니다.
	    },
	    error: function(xhr, status, error) {
	      // 전송에 실패했을 경우 실행할 코드를 작성합니다.
	    }
	  });
	});
  
  
});
