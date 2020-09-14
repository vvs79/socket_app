$(function() {
  $('#new_chat_message').on('ajax:success', function(a,b,c) {
    $(this).find('input[type="text"]').val('');
  });
});
