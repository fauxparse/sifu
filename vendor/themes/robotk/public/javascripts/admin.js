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

var Admin = {
  width: 720,
  
  bind_links:function() {
    $('a[rel*=admin]').unbind('click.admin').bind('click.admin', function() {
      Admin.open(this);
      return false;
    });
  },
  
  open:function(link) {
    $('#footer, #bio:visible').fadeOut();
    $('#admin').fadeIn();
    $('#admin-inner').load(link.href, function() {
      
    });
    $('body').animate({ backgroundPosition:'(-512px 0px)' }, 500, 'easeOutBounce');
    $('#container').animate({ left:Admin.width - 208 + 'px' }, 500, 'easeOutBounce');
  },
  
  close:function() {
    $('#admin').fadeOut();
    $('#footer').fadeIn();
    $('body').animate({ backgroundPosition:'(-1024px 0px)' }, 500, 'easeOutBounce');
    $('#container').animate({ left:'0px' }, 500, 'easeOutBounce');
  }
};

$(document).ready(Admin.bind_links);
$(document).ajaxSuccess(Admin.bind_links);
