$(function() {

  $('#apply-modal').on('hidden.bs.modal', function(e) {
    $(this).find('form')[0].reset();
  });
  
  $('input').prop('disabled', true);
  
  let offlineInput = $('#offline-input');
  if (b.offlineLocation === null) {
    offlineInput.hide();
  }
});