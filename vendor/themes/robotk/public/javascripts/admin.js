$(document).keypress(function(e) {
  if (e.which == 172) { // ⌥L
    var login_form = $('#login-form');
    if (login_form.length > 0) {
      var l = parseInt(login_form.css('left')) > 0 ? 0 : 100;
      login_form.animate({ left:l + '%' }, 'easeOut', function() {
        if (l == 0) $(this).find(':input:visible')[0].focus();
      });
    }
    return false;
  }
});
