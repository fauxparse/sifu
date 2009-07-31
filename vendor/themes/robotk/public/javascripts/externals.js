$(document).ready(function() {
  $('#external li a[rel*=external]').click(function() {
    var clicked = $(this);
    if ($(this).hasClass('active')) {
      $(this).removeClass('active');
      close_sidebar('easeOutBounce');
    } else {
      if ((l = parseInt($('#container').css('left'))) > 0) {
        $('#external li a').removeClass('active');
        close_sidebar('easeOutCubic', function() {
          $(clicked).click();
        });
      } else {
        $(this).addClass('active');
        $('body').animate({ backgroundPosition:'(-704px 0px)' }, 700, 'easeOutBounce');
        $('#container').animate({ left:'+=320px' }, 700, 'easeOutBounce', function() {
          
        });
      }
    }
    return false;
  });
  
  $('#external a.twitter[rel*=external]').click(function() { display_feed_summary('twitter', 'http://localhost:3000/feeds/twitter'); });
  $('#external a.last-fm[rel*=external]').click(function() { display_feed_summary('twitter', 'http://localhost:3000/feeds/last-fm'); });
});

function close_sidebar(easing, callback) {
  var l = parseInt($('#container').css('left'));
  $('body').animate({ backgroundPosition:'(-1024px 0px)' }, 700, easing);
  $('#container').animate({ left:'-=' + l + 'px' }, 700, easing, callback);
}

function display_feed_summary(feed_name, feed_uri) {
  $('#external .feed').remove();
  $('#external').append('<div class="feed" id="' + feed_name + '-feed" style="display: none;"></div>');
  $.ajax({
    url:feed_uri,
    type:'get',
    dataType:'json',
    success:function(data) {
      console.log(data);
      var s = '<ol>';
      for (i in data) {
        s += '<li><a class="title" href="' + data[i].link + '">' + data[i].title + '</a>';
        s += '<span class="description">' + data[i].description + '</span>';
        s += '<span class="date">' + data[i].date + '</span></li>';
      }
      s += '</ol>';
      $('#' + feed_name + '-feed').html(s).fadeIn();
    },
    error:function(x, s, e) {
      console.log(s);
      console.log(e);
    }
  });
  return true;
}
